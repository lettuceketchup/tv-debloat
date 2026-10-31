# TV Debloat

Make two Android-based TVs fast and ad-free again by disabling the ads, sponsored rows, telemetry and preinstalled bloat over ADB from this PC, and swapping in a lightweight home screen where that helps.

Started 2026-10-31, during the October 2026 "debloat your smart TV with an AI agent" trend.

## Goals

1. **No home-screen ads.** No sponsored rows, autoplay trailers or promoted apps on the Google TV home, even in Apps-only mode.
2. **Less lag.** Fewer background services, more free RAM, snappier navigation and app launches.
3. **Keep what's used.** Streaming apps, the Jellyfin client, HDMI inputs (set-top box) and CEC, the Play Store, the remote and voice search must keep working.
4. **Fully reversible.** Disable instead of uninstall, back up the package list before touching anything, and log every change so it can be undone.
5. **Repeatable.** Keep a per-TV list of disabled packages that can be reapplied after a firmware update brings things back.

Out of scope: ads inside apps (YouTube's own player ads can't be removed by disabling system packages; DNS blocking only helps partly), rooting, and flashing custom firmware.

## Order of work

1. **Hisense Tornado 2.0.** Only lags a little and is available now, so it's the low-risk test bed.
2. **Haier.** Slower and laggier, so it gains more, but it's only available later. Reuse what was learned on the Hisense.

## Approaches to choose from

| # | Approach | What it does | Pros | Cons |
|---|---|---|---|---|
| A | **Agent-driven manual ADB** (the [tv-detox](https://github.com/ansub/tv-detox) style) | Claude Code connects over ADB, dumps this TV's real package list, and proposes what to disable. You approve each batch. | Fits the exact model and firmware; you see every change; easiest to undo | Slower; takes more judgement per package |
| B | **[CleanYourTV / tv-vibehack](https://github.com/Gathin23/tv-vibehack)** | Ready-made debloat lists plus a replacement launcher, run over Wi-Fi ADB | Largest community, has a tested-device table, includes a Python ADB client for TVs that block stock adb | Lists were written for other TVs; review them first; only removes system-level ads |
| C | **Launcher swap only** (Projectivy Launcher, FLauncher, or a repo launcher such as [Claude-TV](https://github.com/vishalsingh2972/Claude-TV) or [tv-home](https://github.com/mihirgupta0900/tv-home)) | Replaces the ad-filled home screen and leaves the system alone | Smallest change | Google TV's own home keeps running in the background unless disabled; Google TV gives its setup app Home-button priority |
| D | **Light-touch tweaks** ([Tellyscope](https://github.com/man15h/tellyscope) or plain adb) | Private DNS ad-blocking, shorter animations, cache clearing | Nearly zero risk; good first step | Doesn't remove the ad services |

**Suggested path:** start with D (quick and safe), then A on the Hisense with a launcher from C, and look at B's lists as a reference for what's safe to disable. Decide in the first Claude Code session.

## Files

- [DEVICES.md](DEVICES.md): the TVs, their software, the network, and the tools on this PC
- [CHECKLIST.md](CHECKLIST.md): prep, per-TV run and verification checklists
- [CLAUDE.md](CLAUDE.md): rules for Claude Code sessions in this folder
- `tvs/<tv>/`: created per TV when work starts (package backups, change log, disable list)

## References

- [TechCrunch: People are using AI to make their smart TVs dumb again](https://techcrunch.com/2026/10/19/people-are-using-ai-to-make-their-smart-tvs-dumb-again/)
- [It's FOSS: People Are Using AI to Get Rid of Smart TV Ads](https://itsfoss.com/news/debloat-smart-tv/)
- [TechPP: How I Made My Android TV Faster and Ad-Free Using Claude Code](https://techpp.com/2026/10/18/speed-up-android-tv-claude-code/)
- Other repos: [android-tv-makeover](https://github.com/kulwantnagi/android-tv-makeover), [Glass TV](https://github.com/cocombee/glass-tv)
