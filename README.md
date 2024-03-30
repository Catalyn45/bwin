# bwin

Making windows a little less horrible.

1. Install `PSReadLine`, `OhMyPosh`, `posh-git` and `ZLocation`. put `atomic.omp.json` in `$env:POSH_THEMES_PATH/atomic.omp.json`.

2. Put `Microsoft.PowerShell_profile.ps1` into the `$PROFILE` folder.

3. Run `terminal.ahk` to open the terminal with `ctrl+alt+t`.

4. Init the `VirtualDesktopAccessor` submodule and cd to it. go to `dll` folder and
run `cargo build --release`. After that just run the `virt_desktops.ahk`, now you can
cavigate through virtual desktops with `alt + <number>`.