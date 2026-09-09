# Homebrew Tap

> A collection of Homebrew formulae without official Homebrew support.

Unless otherwise specified, all formulae are automatically updated w/ daily GitHub Actions.

## How to Install

Add this tap to your Homebrew:

```sh
brew tap timescam/tap
```

Then install the formula:

```sh
brew install timescam/tap/{formula}
```

Or install the cask:

```sh
brew install --cask timescam/tap/{cask}
```

## Available Packages

| Formula | Description |
| ------- | ----------- |
| `atoll` | Dynamic Island utility<br />https://github.com/Ebullioscopic/Atoll |
| `pay-respects` | Command suggestions, command-not-found and thefuck replacement written in Rust<br />https://codeberg.org/iff/pay-respects |
| `localsend-go` | CLI for localsend implemented in Go<br />https://github.com/meowrain/localsend-go |
| `imFile` | A full-featured download manager.<br />https://github.com/imfile-io/imfile-desktop |
| `motrix-next` | Modern Tauri-based download manager for macOS.<br />https://github.com/AnInsomniacy/motrix-next |
| `musicbrainz-picard@3` | Music tagger (v3.x pre-releases, conflicts with musicbrainz-picard).<br />https://picard.musicbrainz.org/ |
| `pokeget` | A better rust version of pokeget.<br />https://github.com/talwat/pokeget-rs |
| `zagi` | A better git for z.<br />https://github.com/mattzcarey/zagi |
| `gopeed-web` | A modern download manager that supports all platforms. Built with Golang and Flutter.<br />https://github.com/GopeedLab/gopeed |
| `spotatui` | A fully standalone Spotify client for the terminal. Native streaming included, no daemon required.<br />https://github.com/LargeModGames/spotatui |
| `music-lyric-app` | NetEase Cloud and QQ Music lyrics tool<br />https://github.com/jitwxs/163MusicLyrics |

### Not tracked by daily GitHub Actions

| Formula                        | Version    | Description                                                                                                                                                      |
| ------------------------------ | ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `peaclock`                     | `HEAD`     | A responsive and customizable clock, timer, and stopwatch for the terminal.<br />https://github.com/octobanana/peaclock                                          |
| `evangelion-clock-screensaver` | `1.1.2`    | A digital clock screensaver inspired by the graphical interfaces from Neon Genesis Evengelion.<br />https://github.com/Wandmalfarbe/evangelion-clock-screensaver |
| `dvdts`                        | `HEAD`     | Terminal screensaver similar to dvd bouncing logo; Uses the distro/OS name/custom text instead<br />https://github.com/ameyrk99/dvdts                            |
| `audacity@nightly`             | `nightly`  | Audacity nightly automated builds<br />https://www.audacityteam.org/beta/                                                                                        |
| `background-music@nightly`     | `nightly`  | Background Music nightly automated builds<br />https://github.com/kyleneideck/BackgroundMusic                                                                    |
| `aerospace@nightly`            | `nightly`  | I3-like tiling window manager (nightly build)<br />https://github.com/nikitabobko/AeroSpace                                                                      |
| `boring-notch@nightly`          | `nightly`  | Notch overlay: media, calendar, HUD (nightly build)<br />https://github.com/TheBoredTeam/boring.notch                                                            |

### Deprecated

| Formula          | Description                                                                                        |
| ---------------- | -------------------------------------------------------------------------------------------------- |
| `theboringnotch` | Use the official tap: `brew install --cask TheBoredTeam/boring-notch/boring-notch --no-quarantine` |
| `raycast@beta`   | v2 is no longer in beta; use the official tap: `brew install --cask raycast`                         |
| `koharu`         | Now in Homebrew Cask: `brew install --cask koharu`                                                  |
