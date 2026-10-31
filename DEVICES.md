# Devices and Tools

Fields marked **TBD** get filled in from the TV (Settings → System → About) or from `adb shell getprop` during the first session.

## TV 1: Hisense Tornado 2.0 (first target)

| Field | Value |
|---|---|
| Size | 55" |
| Exact model number | TBD |
| OS / home screen | Google TV, **Apps-only mode on**. It still shows ads and slows down. |
| Android version / security patch | TBD (`ro.build.version.release`, `ro.build.version.security_patch`) |
| Firmware / build | TBD (`ro.build.fingerprint`) |
| RAM / storage | TBD (`/proc/meminfo`, `df -h /data`) |
| Current state | Lags a little; low risk, available now |
| IP address on Wi-Fi | 192.168.1.9 (not reserved in the router yet) |
| Developer options / USB debugging | On. adb was waiting for the user to accept the prompt on the TV (2026-10-31). |

## TV 2: Haier (later)

| Field | Value |
|---|---|
| Size | 55" |
| Exact model number | TBD |
| OS / home screen | Probably Google TV; Apps-only mode was probably turned on after the latest update. Confirm. |
| Android version / firmware | TBD |
| RAM / storage | TBD |
| Current state | **Very slow and laggy.** Should gain the most. |
| IP address | TBD |

## How the TVs are used

Applies to both TVs; note any differences per TV here.

- **Network:** Wi-Fi, same network as this PC, so ADB over Wi-Fi works
- **Streaming apps:** exact list TBD from the package dump (e.g. YouTube, Netflix, Prime Video, Hotstar)
- **Jellyfin client:** watches the Jellyfin server that runs on this PC
- **HDMI inputs:** a set-top box and/or other devices. Keep the input switcher, the TV tuner/source services and HDMI-CEC working.
- Also check during setup: Chromecast / Google Cast, voice search on the remote, Bluetooth remote pairing

## This PC

| Field | Value |
|---|---|
| OS | Windows 11 Home (build 26200) |
| Shells | PowerShell 5.1, Git Bash |
| Claude Code | 2.1.310 |
| Python | 3.12 (`python`), 3.13 (`py`) |
| Node | 24.11 |
| Git | 2.51 |
| winget | 1.29 |
| **adb** | **Not installed yet.** See the checklist. |
| scrcpy | Not installed (optional: mirrors the TV screen to the PC, handy for screenshots) |
| Media server | Jellyfin and related apps run on this PC |
