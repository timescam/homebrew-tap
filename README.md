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

## Available Packages

| Formula        | Version  | Description                                                                                                                                       |
| -------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `pay-respects` | `0.7.12` | Command suggestions, command-not-found and thefuck replacement written in Rust<br />https://codeberg.org/iff/pay-respects                         |
| `localsend-go` | `1.2.7` | CLI for localsend implemented in Go<br />https://github.com/meowrain/localsend-go                                                                 |
| `imFile` | `1.1.2` | A full-featured download manager.<br />https://github.com/imfile-io/imfile-desktop                                                                |
| `pokeget` | `1.6.7` | A better rust version of pokeget.<br />https://github.com/talwat/pokeget-rs                                                                       |
| `zagi` | `0.1.7` | A better git for z.<br />https://github.com/mattzcarey/zagi                                                                                       |
| `gopeed-web` | `1.9.1` | A modern download manager that supports all platforms. Built with Golang and Flutter.<br />https://github.com/GopeedLab/gopeed                    |
| `spotatui` | `0.36.1` | A fully standalone Spotify client for the terminal. Native streaming included, no daemon required.<br />https://github.com/LargeModGames/spotatui |

### Not tracked by daily GitHub Actions

| Formula                        | Version   | Description                                                                                                                                                      |
| ------------------------------ | --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `peaclock`                     | `HEAD`    | A responsive and customizable clock, timer, and stopwatch for the terminal.<br />https://github.com/octobanana/peaclock                                          |
| `evangelion-clock-screensaver` | `1.1.2`   | A digital clock screensaver inspired by the graphical interfaces from Neon Genesis Evengelion.<br />https://github.com/Wandmalfarbe/evangelion-clock-screensaver |
| `dvdts`                        | `HEAD`    | Terminal screensaver similar to dvd bouncing logo; Uses the distro/OS name/custom text instead<br />https://github.com/ameyrk99/dvdts                            |
| `audacity@nightly`             | `nightly` | Audacity nightly automated builds<br />https://www.audacityteam.org/beta/                                                                                        |

### Deprecated

| Formula          | Description                                                                                        |
| ---------------- | -------------------------------------------------------------------------------------------------- |
| `theboringnotch` | Use the official tap: `brew install --cask TheBoredTeam/boring-notch/boring-notch --no-quarantine` |
