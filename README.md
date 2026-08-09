# byrencheema/tap

A Homebrew tap.

```sh
brew install --cask byrencheema/tap/airstats
```

| Cask | What it is | Source |
| --- | --- | --- |
| `airstats` | A menu bar system monitor for macOS | [byrencheema/airstat](https://github.com/byrencheema/airstat) |

## Releasing

`Scripts/release.sh` in the app repo produces the `.dmg` and the GitHub release. Once
the asset is uploaded, point the cask at it:

```sh
shasum -a 256 dist/AirStats.dmg
```

Then set `version` and `sha256` in `Casks/a/airstats.rb` and commit. The download URL
carries the version in its path, so the tag is the only thing that moves; the asset
filename stays `AirStats.dmg` because the app repo and the site both link
`releases/latest/download/AirStats.dmg`.

Check the change before pushing it:

```sh
brew audit --cask --online --new byrencheema/tap/airstats
brew install --cask byrencheema/tap/airstats
brew uninstall --cask --zap airstats
```

`Casks/a/` mirrors the layout of homebrew-cask itself, so a cask that becomes notable
enough to submit upstream moves without being rewritten.
