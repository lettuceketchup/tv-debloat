# Hisense change log

| Date | Change | Reason | Result |
|---|---|---|---|
| 2026-10-31 | Backed up package lists to `backup-2026-10-31/` | Before first change | 140 packages, 16 third-party, 0 disabled |
| 2026-10-31 | Animation scales (window, transition, animator) 1.0 → 0.5 | Snappier UI | Applied. Undo: set back to 1.0 |
| 2026-10-31 | Private DNS: hostname `dns.adguard-dns.com` (was off) | Block ad/tracking domains | Applied. Undo: `settings put global private_dns_mode off` |
| 2026-10-31 | Batch 1: disabled `android.autoinstalls.config.google.gtvpai` | Pushes sponsored app installs | disabled-user |
| 2026-10-31 | Batch 1: disabled `com.hisense.storemode` | Retail store demo mode | disabled-user |
| 2026-10-31 | Batch 1: disabled `fusion.android.tv.demo` | RetailDisplay store demo | disabled-user |
| 2026-10-31 | Batch 1: disabled `com.google.android.feedback` | Feedback/crash reporting | disabled-user |
| 2026-10-31 | Batch 1: disabled `com.google.android.play.games` | Play Games, unused | disabled-user |
| 2026-10-31 | Batch 1: disabled `com.android.printspooler` | Printing, unused on TV | disabled-user |
| 2026-10-31 | Batch 1: disabled `com.google.android.apps.tv.dreamx` | Ambient Mode screensaver with recommendations | disabled-user |
| 2026-10-31 | Batch 2: disabled `com.mediatek.partner.airplay` | AirPlay, unused, always running | disabled-user |
| 2026-10-31 | Batch 2: disabled `com.mediatek.AirplayAPK` | AirPlay, unused | disabled-user; its AirPlay entry is gone from the Inputs pane (HDMI and tuner inputs unaffected) |
| 2026-10-31 | Batch 2: disabled `com.vt.tv.homekitproxy` | HomeKit bridge, unused, always running | disabled-user |
| 2026-10-31 | Batch 2: disabled `com.hisense.alexa` | Alexa, unused | disabled-user |
| 2026-10-31 | Batch 2: disabled `com.hisense.hibrowser` | Hisense browser, unused | disabled-user |
| 2026-10-31 | Batch 2: disabled `com.google.android.marvin.talkback` | TalkBack, unused | disabled-user |
| 2026-10-31 | Verification after batches 1 and 2 | User check | Works as before; home-screen ads still there; lag maybe slightly better (needs more use) |
| 2026-10-31 | Batch 3: disabled `com.google.android.videos` | Google TV movies/shop app; supplies the autoplay trailer previews on the home screen | disabled-user |
| 2026-10-31 | Verification after batch 3 | User check | Nothing broken; home-screen ads still there |
| 2026-10-31 | Installed Projectivy Launcher 4.72 (`com.spocky.projengmenu`, from Play Store, by user), enabled its accessibility service, `cmd package set-home-activity` to it | Ad-free replacement home screen | Installed |
| 2026-10-31 | Batch 4: disabled `com.google.android.apps.tv.launcherx` | Google TV home screen; serves the sponsored banner even in Apps-only mode | disabled-user. Boots into Projectivy. Home (adb-injected) goes to `setupwraith` RecoveryActivity for a few seconds, then Projectivy. Undo: `pm enable com.google.android.apps.tv.launcherx` |
| 2026-10-31 | Verification after batch 4 | User check | Projectivy works with a basic setup. Open: Inputs row sits at the top; wallpaper loads slowly |
