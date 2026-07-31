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

| Formula        | Version          | Description                                                                                                                                       |
| -------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `atoll`        | `2.3.3`          | Dynamic Island utility<br />https://github.com/Ebullioscopic/Atoll                                                                                |
| `pay-respects` | `nightly`        | Command suggestions, command-not-found and thefuck replacement written in Rust<br />https://codeberg.org/iff/pay-respects                         |
| `localsend-go` | `1.2.7`          | CLI for localsend implemented in Go<br />https://github.com/meowrain/localsend-go                                                                 |
| `imFile` | `2.2.0` | A full-featured download manager.<br />https://github.com/imfile-io/imfile-desktop                                                                |
| `koharu`       | `0.61.2`         | ML-powered manga translator.<br />https://github.com/mayocream/koharu                                                                             |
| `motrix-next`  | `3.9.6`          | Modern Tauri-based download manager for macOS.<br />https://github.com/AnInsomniacy/motrix-next                                                   |
| `pokeget`      | `1.6.7`          | A better rust version of pokeget.<br />https://github.com/talwat/pokeget-rs                                                                       |
| `zagi`         | `0.2.0`          | A better git for z.<br />https://github.com/mattzcarey/zagi                                                                                       |
| `gopeed-web`   | `1.9.3`          | A modern download manager that supports all platforms. Built with Golang and Flutter.<br />https://github.com/GopeedLab/gopeed                    |
| `spotatui`     | `0.36.3-debug.1` | A fully standalone Spotify client for the terminal. Native streaming included, no daemon required.<br />https://github.com/LargeModGames/spotatui |

### Not tracked by daily GitHub Actions

| Formula                        | Version    | Description                                                                                                                                                      |
| ------------------------------ | ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `peaclock`                     | `HEAD`     | A responsive and customizable clock, timer, and stopwatch for the terminal.<br />https://github.com/octobanana/peaclock                                          |
| `evangelion-clock-screensaver` | `1.1.2`    | A digital clock screensaver inspired by the graphical interfaces from Neon Genesis Evengelion.<br />https://github.com/Wandmalfarbe/evangelion-clock-screensaver |
| `dvdts`                        | `HEAD`     | Terminal screensaver similar to dvd bouncing logo; Uses the distro/OS name/custom text instead<br />https://github.com/ameyrk99/dvdts                            |
| `audacity@nightly`             | `nightly`  | Audacity nightly automated builds<br />https://www.audacityteam.org/beta/                                                                                        |
| `background-music@nightly`     | `nightly`  | Background Music nightly automated builds<br />https://github.com/kyleneideck/BackgroundMusic                                                                    |
| `aerospace@nightly`            | `nightly`  | I3-like tiling window manager (nightly build)<br />https://github.com/nikitabobko/AeroSpace                                                                      |
| `raycast@beta`                 | `0.61.0.0` | Launcher and productivity tool (beta channel, auto-updates in-app)<br />https://www.raycast.com/                                                                 |

### Deprecated

| Formula          | Description                                                                                        |
| ---------------- | -------------------------------------------------------------------------------------------------- |
| `theboringnotch` | Use the official tap: `brew install --cask TheBoredTeam/boring-notch/boring-notch --no-quarantine` |
