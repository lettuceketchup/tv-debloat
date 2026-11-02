# Hisense package notes

Findings from read-only checks on 2026-10-31 (dumpsys package/activity/meminfo, logcat, and the Hisense lists in [tv-vibehack](https://github.com/Gathin23/tv-vibehack/tree/main/examples)). RAM is PSS at about 13 minutes of uptime.

| Package | What it is | RAM | Verdict |
|---|---|---|---|
| `com.hisense.tv.smartsense` | Hisense system hub, always running. Handles the remote's global keys (`GLOBAL_BUTTON`), Filmmaker Mode, app-state tracking, storage scans, a domain provider other Hisense apps read, and a usage logger that builds app-run events for `policy-jrnl-sa.intsmarthub.com` (logs say "usage state is off", so probably not sent) | 10 MB | **Keep.** Load-bearing; tv-vibehack reports disabling the smartsense family sent a Hisense to Android Recovery |
| `com.vt.tv.smartsense.ui` | UI part of smartsense; no exported components | not running | **Keep** (same family, same warning) |
| `com.hisense.tv.smartservice` | Firebase log reporting with ad ID and install-referrer permissions. Starts at boot, then gets killed as idle | 0 (not resident) | **Leave.** Telemetry, but no RAM gain; one HG9 report disabled it fine, other Hisense lists keep it |
| `com.hisense.tv.customerlauncher` | Hisense partner configuration for the Google TV home (favourite and recommended apps) plus a foreground service that watches app switches | 5 MB | **Candidate.** Useless while launcherx is disabled; re-enable it if launcherx comes back |
| `com.google.android.katniss` | Google voice search and Assistant. The `:interactor` process is always running; `:search` starts when an app searches | 41 MB idle, 115 MB at 21 min (`:search` 76 + `:interactor` 39) | **Candidate if voice search is never used.** Biggest gain; disables the remote's Assistant/mic button |
| `com.iqqijni.tv1.keyboard` | Kika keyboard; not an enabled input method (Gboard is the only one) | not running | **Candidate**, tidy-up only (no RAM gain) |
| `com.vt.miracast` | Miracast screen-mirroring receiver (`HsWFDSinkTest`) | not running | **Candidate** if nobody mirrors from a phone or Windows ("Cast" from Android uses Chromecast instead) |
| `com.google.android.apps.mediashell` | Chromecast built-in | 22 MB | **Keep unless casting is never used** |
| `com.hisense.remoteupgrade`, `com.hisense.tv.ota`, `com.vt.tv.usbota` | Firmware updaters | not running | **Leave.** Disabling stops updates that re-enable bloat, but also stops security fixes; user's call |
| `com.hisense.tv.dlna` | DLNA media renderer, persistent, listens on network ports | 6 MB | **Candidate** if nobody "plays to TV" via DLNA (Chromecast is separate, `mediashell`) |
| `com.vt.audio_update_service` | Audio update foreground service, purpose unclear | 4 MB | **Leave** (unsure; other Hisense lists keep it) |
| `com.mediatek.wwtv.tvcenter` | Live TV app; only handler for opening TV inputs; holds HDMI-CEC | 5 MB | **Keep** (needed for HDMI and CEC) |

## Gotchas

- **Persistent apps keep running after disable.** `com.mediatek.partner.airplay` and `com.vt.tv.homekitproxy` are disabled but still started after the reboot, because they are flagged `PERSISTENT`. Disabling them removed the AirPlay input but saved little RAM.
- AdGuard DNS does not block `policy-jrnl-sa.intsmarthub.com` (checked 2026-10-31).
- tv-vibehack notes: wait ~15 s after `pm disable-user` before rebooting, and if a Hisense ever lands on "Can't load Android system", pick **Try again**, never Factory data reset.
- The load average sits around 60–70 even when idle. It's kernel driver threads in uninterruptible sleep (`Keypad_Check`, `CEC`, `AUDIO`, ...), not real CPU load; CPU is ~30–55% busy while YouTube plays. The real constraint is RAM: ~320 MB is swapped to zram.
- Projectivy at 21 min uptime: 74 MB PSS (18 MB of it graphics), 31% janky frames, image loading through Glide.
- **Microphone (checked 2026-10-31):** the TV has a built-in far-field mic (`AUDIO_DEVICE_IN_BUILTIN_MIC`, address "bottom"; `vendor.mtk.voc.mic_status=1`). No "Hey Google" keyphrase model is enrolled and no sound-trigger HAL shows up, so there's no always-on wake word. Last mic use per `appops get <pkg> RECORD_AUDIO`: katniss 21 days ago for 2.9 s, YouTube 33 days ago for 3.3 s, other apps months ago. Consistent with push-to-talk only. Re-check with the same command.
- A second user profile (user 10) exists; all disables are for user 0.
