# Haier change log

| Date | Change | Reason | Result |
|---|---|---|---|
| 2026-11-02 | Backed up package lists to `backup-2026-11-02/` (`packages-all.txt` includes APK paths) | Before first change | 128 packages, 9 third-party, 5 already disabled (`com.cltv.fast`, talkback, play.games, calendar sync, `ru.haier.evo`) |
| 2026-11-02 | Animation scales (window, transition, animator) 1.0/1.0/unset → 0.5 | Snappier UI | Applied. Undo: set back to 1.0 |
| 2026-11-02 | Private DNS: hostname `dns.adguard-dns.com` (was unset) | Block ad/tracking domains | Applied. Undo: `settings put global private_dns_mode off` |
| 2026-11-02 | Batch 1: disabled `tv.anoki.acr.controller` | Anoki ACR: identifies on-screen content (incl. HDMI) for ad targeting; ~48 MB always running | disabled-user |
| 2026-11-02 | Batch 1: disabled `android.autoinstalls.config.haier.hanyang` | Pushes sponsored app installs | disabled-user |
| 2026-11-02 | Batch 1: disabled `fusion.android.tv.demo` | RetailDisplay store demo | disabled-user |
| 2026-11-02 | Batch 1: disabled `com.google.android.backdrop` | Ambient screensaver with recommendations | disabled-user |
| 2026-11-02 | Batch 1: disabled `com.google.android.feedback` | Feedback/crash reporting | disabled-user |
| 2026-11-02 | Batch 1: disabled `com.android.printspooler` | Printing, unused on TV | disabled-user |
| 2026-11-02 | Batch 1: disabled `com.haier.apps` | Shortcut to Okko (Russian streaming service), unused | disabled-user |
| 2026-11-02 | Verification after quick tweaks and batch 1 | User check | All working; casting not tested |
| 2026-11-02 | Batch 2: disabled `com.haierubic.usmartdevice` | Haier smart-home (IoT) service, unused, always running | disabled-user |
| 2026-11-02 | Batch 2: disabled `com.cutralview.sharetv` | Haier screen-share app, unused (Chromecast covers casting) | disabled-user |
| 2026-11-02 | Batch 2: disabled `com.google.android.apps.nbu.smartconnect.tv` | Google data-saver/connectivity app, unused | disabled-user |
| 2026-11-02 | Installed Projectivy Launcher 4.72 (`com.spocky.projengmenu`, from Play Store, by user), user enabled its accessibility service; `cmd package set-home-activity com.spocky.projengmenu/.ui.home.MainActivity` | Ad-free replacement home screen | Installed, set as home |
| 2026-11-02 | Batch 3: disabled `com.google.android.tvlauncher` | Stock Android TV home with sponsored rows; ~197 MB; relaunch loop seen in usage stats | disabled-user. Undo: `pm enable com.google.android.tvlauncher` |
| 2026-11-02 | Batch 3: disabled `com.google.android.leanbacklauncher.partnercustomizer` | Haier's settings for the stock launcher; not needed without it | disabled-user |
| 2026-11-02 | Background restricted `com.netflix.ninja` (`cmd appops set com.netflix.ninja RUN_ANY_IN_BACKGROUND ignore`) | Stop background jobs/services when not open | Applied. Undo: same command with `allow` |
| 2026-11-02 | Background restricted `com.amazon.amazonvideo.livingroom` (`cmd appops set com.amazon.amazonvideo.livingroom RUN_ANY_IN_BACKGROUND ignore`) | Stop background jobs/services when not open | Applied. Undo: same command with `allow` |
| 2026-11-02 | Background restricted `in.startv.hotstar` (`cmd appops set in.startv.hotstar RUN_ANY_IN_BACKGROUND ignore`) | Stop background jobs/services when not open | Applied. Undo: same command with `allow` |
| 2026-11-02 | Background restricted `com.graymatrix.did` (`cmd appops set com.graymatrix.did RUN_ANY_IN_BACKGROUND ignore`) | Stop background jobs/services when not open | Applied. Undo: same command with `allow` |
| 2026-11-02 | Background restricted `com.sonyliv` (`cmd appops set com.sonyliv RUN_ANY_IN_BACKGROUND ignore`) | Stop background jobs/services when not open | Applied. Undo: same command with `allow` |
| 2026-11-02 | Background restricted `com.crunchyroll.crunchyroid` (`cmd appops set com.crunchyroll.crunchyroid RUN_ANY_IN_BACKGROUND ignore`) | Stop background jobs/services when not open | Applied. Undo: same command with `allow` |
| 2026-11-02 | Background restricted `com.google.android.youtube.tv` (`cmd appops set com.google.android.youtube.tv RUN_ANY_IN_BACKGROUND ignore`) | Stop background jobs/services when not open | Applied. Undo: same command with `allow` |
| 2026-11-02 | Background restricted `com.google.android.youtube.tvmusic` (`cmd appops set com.google.android.youtube.tvmusic RUN_ANY_IN_BACKGROUND ignore`) | Stop background jobs/services when not open | Applied. Undo: same command with `allow` |
| 2026-11-02 | Background restricted `com.spotify.tv.android` (`cmd appops set com.spotify.tv.android RUN_ANY_IN_BACKGROUND ignore`) | Stop background jobs/services when not open | Applied. Undo: same command with `allow` |
| 2026-11-02 | Background restricted `org.jellyfin.androidtv` (`cmd appops set org.jellyfin.androidtv RUN_ANY_IN_BACKGROUND ignore`) | Stop background jobs/services when not open | Applied. Undo: same command with `allow` |
| 2026-11-02 | Background restricted `org.videolan.vlc` (`cmd appops set org.videolan.vlc RUN_ANY_IN_BACKGROUND ignore`) | Stop background jobs/services when not open | Applied. Undo: same command with `allow` |
| 2026-11-02 | Tried to disable streaming apps' boot receivers with `pm disable <pkg>/<receiver>` (Netflix, Prime, Hotstar, Zee5, SonyLIV, YouTube recs, Spotify, VLC) | Stop apps starting at boot | **Failed**: `SecurityException: Shell cannot change component state` (needs root). Nothing changed |
| 2026-11-02 | Batch 4: disabled `com.google.android.tvrecommendations` | Collects app recommendations/ad signals for the stock launcher, which is disabled; ~19 MB always running | disabled-user. Re-enable if the stock launcher comes back |
| 2026-11-02 | Disabled `com.haier.launcher.haiermatrix` | Haier/Zeasn launcher shown in Projectivy app list; user had disabled it in Settings before and it came back (state "enabled", no app update since 2026-08-21, so something on the TV re-enabled it; suspect `com.zeasn.deviceportal.asdprovider.haier8688.bluetooth`) | disabled-user |
