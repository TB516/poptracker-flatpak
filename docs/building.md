# Building the Flatpak

The manifest builds PopTracker from its official, checksum-pinned
`full-source` release. The freedesktop runtime only ships the SDL3 versions
of SDL_image and SDL_ttf, so the manifest builds the SDL2 versions PopTracker
needs. The runtime already includes `zenity` and `which`, which PopTracker
uses for its popups, such as the Archipelago login. Its popup library only
opens them when `DISPLAY` is set, so the app gets the X11 socket instead of
`fallback-x11`.

PopTracker is built with `WITHOUT_UPDATE_CHECK`, which removes its own updater
and the "check for updates?" prompt, since Flatpak handles updates.

PopTracker reads `XDG_CONFIG_DIR` rather than `XDG_CONFIG_HOME`, and otherwise
writes to `~/.config`, which the sandbox can't reach. `poptracker-launcher.sh`
points it at the app's own config folder. `--persist=PopTracker` keeps its
`~/PopTracker` packs folder inside the app's data folder.

The host needs Flatpak, Flatpak Builder, and the per-user
`org.freedesktop.Platform//26.08` and `org.freedesktop.Sdk//26.08`. The build
script does not install or update those dependencies.

```sh
./scripts/build-flatpak build
```

This writes `build-flatpak/io.github.black_sliver.PopTracker.flatpak`. To
build and install for your user, then launch:

```sh
./scripts/build-flatpak install
./scripts/build-flatpak run
```

The `run` command forwards additional arguments to PopTracker. Build output
and cache stay in `build-flatpak/`.
