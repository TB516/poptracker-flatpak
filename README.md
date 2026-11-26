# PopTracker Flatpak

An unofficial Flatpak package for [PopTracker](https://github.com/black-sliver/PopTracker)
on x86_64 Linux. PopTracker tracks the items and locations in game
randomizers, and can follow your progress live from an Archipelago server.

## Install

Build and install it for your user from this folder:

```sh
./scripts/build-flatpak install
```

You need Flatpak Builder and the freedesktop 26.08 runtime first. See
[Building](docs/building.md). Then launch PopTracker from your app menu or
with `flatpak run io.github.black_sliver.PopTracker`.

## Using it

- **Add a tracker pack:** copy the pack's `.zip` into
  `~/.var/app/io.github.black_sliver.PopTracker/PopTracker/packs/`, then
  restart PopTracker and pick it from **Load Pack**. Dragging a pack onto the
  window doesn't work in this package yet.
- **Connect to Archipelago:** click the **AP** button and enter the server as
  `host:port`, for example `archipelago.gg:12345`, without `https://`.

## What it can access

PopTracker runs sandboxed. It can use the network and your display, and it can
read your Downloads folder to load packs. Its settings, saved tracker
progress and installed packs all live under
`~/.var/app/io.github.black_sliver.PopTracker/`.

## Uninstall

```sh
flatpak uninstall --delete-data io.github.black_sliver.PopTracker
```

Without `--delete-data`, your packs and settings stay in
`~/.var/app/io.github.black_sliver.PopTracker/`.
