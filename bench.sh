#!/usr/bin/env bash
# Benchmark a TV over adb: boot time, idle memory, app launch times, home-screen jank.
# Usage: ./bench.sh <ip:port> <tv> <label> [--no-reboot]
# Writes tvs/<tv>/bench/<date>-<label>.txt. Launches apps and reboots the TV, so don't run it while someone is watching.
set -u
S=$1 TV=$2 LABEL=$3 REBOOT=${4:-}
OUT="$(dirname "$0")/tvs/$TV/bench/$(date +%F)-$LABEL.txt"
mkdir -p "$(dirname "$OUT")"
a() { adb -s "$S" shell "$@" | tr -d '\r'; }
log() { echo "$*" | tee -a "$OUT"; }
HOME_PKG=$(a cmd package resolve-activity --brief -a android.intent.action.MAIN -c android.intent.category.HOME | tail -1 | cut -d/ -f1)
APPS="com.google.android.youtube.tv/com.google.android.apps.youtube.tv.activity.ShellActivity
com.netflix.ninja/.MainActivity
com.amazon.amazonvideo.livingroom/com.amazon.ignition.IgnitionActivity
in.startv.hotstar/com.hotstar.MainActivity
org.jellyfin.androidtv/.ui.startup.StartupActivity
com.android.tv.settings/.MainSettings
com.android.vending/com.google.android.finsky.tvmainactivity.TvMainActivity"

: > "$OUT"
log "# $TV / $LABEL / $(date '+%F %T') / home=$HOME_PKG"

if [ "$REBOOT" != --no-reboot ]; then
  adb -s "$S" reboot; t0=$(date +%s); sleep 10
  # ponytail: polls once a second, so boot times are +-1 s
  until [ "$(adb -s "$S" shell getprop sys.boot_completed 2>/dev/null | tr -d '\r')" = 1 ]; do
    adb connect "$S" >/dev/null 2>&1; sleep 1; done
  up=$(a cat /proc/uptime | cut -d' ' -f1)
  log "boot: kernel uptime at boot_completed ${up}s; wall clock from reboot command $(( $(date +%s) - t0 ))s"
  until a dumpsys activity activities | grep -m1 mResumedActivity | grep -q "$HOME_PKG"; do sleep 1; done
  log "boot: home screen resumed $(( $(date +%s) - t0 ))s after reboot command"
  log "memory right after boot: $(a grep MemAvailable /proc/meminfo | tr -s ' ')"
  sleep 120
fi

log "memory idle: $(a grep MemAvailable /proc/meminfo | tr -s ' ')"
log "top processes by PSS:"
a dumpsys meminfo | sed -n '/Total PSS by process/,/Total PSS by OOM/p' | sed -n '2,13p' | tee -a "$OUT"

log "app launch ms (cold after force-stop / warm from home):"
for c in $APPS; do
  p=${c%%/*}
  a am force-stop "$p"; sleep 2
  cold=$(a am start -W -n "$c" | grep TotalTime | cut -d' ' -f2); sleep 6
  a input keyevent KEYCODE_HOME; sleep 3
  # TotalTime is 0 when an existing task is just brought to front; WaitTime still measures it
  warm=$(a am start -W -n "$c" | grep WaitTime | cut -d' ' -f2); sleep 3
  a input keyevent KEYCODE_HOME; sleep 3
  log "  $p cold=${cold:-?} warm=${warm:-?}"
done

log "home-screen jank (40 d-pad moves on $HOME_PKG):"
a input keyevent KEYCODE_HOME; sleep 4
a dumpsys gfxinfo "$HOME_PKG" reset >/dev/null
for i in $(seq 1 4); do
  for k in RIGHT RIGHT RIGHT RIGHT DOWN LEFT LEFT LEFT LEFT UP; do a input keyevent "KEYCODE_DPAD_$k"; done
done
a dumpsys gfxinfo "$HOME_PKG" | grep -E "Total frames rendered|Janky frames|(50|90|95|99)th percentile" | head -6 | tee -a "$OUT"
a input keyevent KEYCODE_HOME
log "done: $OUT"
