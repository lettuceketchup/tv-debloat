# TV Debloat project

Debloating two Android-based TVs (a Hisense Tornado 2.0 on Google TV first, then a Haier) over ADB from this Windows PC. Read README.md for goals and approaches, DEVICES.md for hardware and tools, and CHECKLIST.md for the workflow.

## Rules for working on a TV

- **Reversible only.** Use `pm disable-user --user 0`. Never use `pm uninstall`, never root, never flash firmware, and never factory reset without being asked.
- **Back up first.** Before the first change on a TV, save `pm list packages`, `pm list packages -d` and `pm list packages -3` to `tvs/<tv>/backup-<date>/`.
- **Propose, then act.** Show each batch of packages with a one-line reason per package, and disable them only after the user approves the batch.
- **Never disable:** Google Play Services and Play Store, the system UI, settings, the package installer, input/HDMI/tuner/TV-source services, HDMI-CEC, Bluetooth and remote services, Wi-Fi/network services, the keyboard, or anything the user marks as must-keep. When unsure what a package does, leave it alone and ask.
- **Log everything.** Append each change (package, reason, date, result) to `tvs/<tv>/changes.md`, and keep `tvs/<tv>/disabled.txt` as the one-per-line list to reapply after updates.
- **Verify after each batch:** reboot, then the user runs the CHECKLIST.md verification list.
- Fill in the TBD fields in DEVICES.md as facts are learned.
- Third-party repos (CleanYourTV etc.) are references. Read their package lists and scripts before using any part of them; never run them unread.

## Environment

- Windows 11; use PowerShell or Git Bash. adb comes from `winget install Google.PlatformTools`.
- The TVs are on the same Wi-Fi as this PC: `adb connect <ip>:5555`.
- The Jellyfin server runs on this PC; the TVs' Jellyfin client must keep working.
