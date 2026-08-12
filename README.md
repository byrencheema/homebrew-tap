# byrencheema/tap

A Homebrew tap.

```sh
brew install --cask byrencheema/tap/airstats
```

| Cask | What it is | Source |
| --- | --- | --- |
| `airstats` | A menu bar system monitor for macOS | [byrencheema/airstats](https://github.com/byrencheema/airstats) |

Homebrew requires third-party taps to be trusted before it will load them. Installing a
cask by its full `user/tap/cask` name records that trust, so the line above is enough. If
Homebrew asks first, the explicit form is:

```sh
brew trust --cask byrencheema/tap/airstats
```

## Releasing

`Scripts/release.sh` in the app repo produces the `.dmg` and the GitHub release. Once the
asset is uploaded, point the cask at it:

```sh
shasum -a 256 dist/AirStats.dmg
```

Then set `version` and `sha256` in `Casks/a/airstats.rb` and commit. The download URL
carries the version in its path, so the tag is the only thing that moves; the asset
filename stays `AirStats.dmg` because the app repo and the site both link
`releases/latest/download/AirStats.dmg`.

Check the change before pushing it:

```sh
brew audit --cask --online byrencheema/tap/airstats
brew install --cask byrencheema/tap/airstats
brew uninstall --cask --zap airstats
```

`--zap` deletes real settings, so run it on a machine you are willing to reset.

## Submitting a cask upstream

`brew audit` takes `--new` as well, which adds the rules homebrew-cask applies to a
submission rather than the ones a tap has to satisfy. Today `airstats` fails exactly one
of them:

```
GitHub repository not notable enough (<30 forks, <30 watchers and <75 stars)
```

That gate is the only thing standing between this cask and the default tap, and 75 stars
is the reachable one of the three. `Casks/a/` mirrors the layout of homebrew-cask itself,
so a cask that clears it moves upstream without being rewritten.
