# Checklists

## One-time PC setup

- [ ] Install ADB: `winget install Google.PlatformTools` (restart the terminal afterwards so `adb` is on PATH)
- [ ] Optional: `winget install Genymobile.scrcpy` for screen mirroring and screenshots
- [ ] Reserve each TV's IP address in the router (DHCP reservation)
- [ ] Pick a starting approach (see README)

## Per TV: before touching anything

- [ ] Settings → System → About → click **Build** 7 times to unlock Developer options
- [ ] Turn on **USB debugging** (and **Network/Wireless debugging** if the TV has it)
- [ ] `adb connect <TV_IP>:5555`, then accept the prompt on the TV (tick "Always allow")
- [ ] Fill in the TBD fields in DEVICES.md from `getprop`, meminfo and storage
- [ ] **Baseline:** note free RAM, home-screen load time, app-launch time and the ads seen (take a photo or scrcpy screenshot)
- [ ] **Back up** all packages, disabled packages and third-party packages into `tvs/<tv>/backup-<date>/`
- [ ] Write down the apps that must keep working: streaming apps, Jellyfin, inputs, Play Store, Cast, voice

## Per TV: the run

- [ ] Start with the light tweaks: Private DNS ad-blocking and 0.5x animation scales
- [ ] Group the candidate packages: ads/recommendations, telemetry, OEM bloat, unused preinstalled apps, and **do not touch**
- [ ] Disable in small batches with `pm disable-user --user 0`, never `uninstall`
- [ ] After each batch, reboot and run the verification list below
- [ ] Log each batch (package, reason, result) in `tvs/<tv>/changes.md`
- [ ] Optional: install and set a lightweight launcher, and deal with the Google TV Home-button priority

## Verification after each batch

- [ ] TV boots to a usable home screen
- [ ] The remote works, including Home, Back, voice and volume
- [ ] Switching HDMI inputs works and the set-top box picture shows; CEC still works
- [ ] Every streaming app opens and plays
- [ ] Jellyfin connects to the PC server and plays
- [ ] Play Store opens and updates apps
- [ ] Casting from a phone works (if used)
- [ ] Settings, Wi-Fi and picture/sound settings open
- [ ] Ads are gone and lag is better (compare with the baseline)

## Upkeep

- [ ] After every firmware update, check whether disabled packages came back and reapply `tvs/<tv>/disabled.txt`
- [ ] Haier TV: repeat the whole flow, reusing the Hisense findings

## Undo

- Re-enable one package: `adb shell pm enable <package>`
- Re-enable everything that was disabled: loop over `tvs/<tv>/disabled.txt`
- Last resort: factory reset (all changes are user-level, so a reset removes them)
