from libqtile import bar, widget
from libqtile.config import Screen

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.PulseVolume(fmt="vol: {}"),
                widget.Systray(),
                widget.CheckUpdates(
                    display_format="Updates: {updates}",
                    distro="Arch",
                    update_interval=60,
                ),
                widget.Clock(
                    fontsize=14,
                    format="%Y-%m-%d %R",
                ),
                widget.QuickExit(),
            ],
            24,
        ),
        wallpaper='~/.config/qtile/background.jpg',
        wallpaper_mode='fill',
    ),
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.PulseVolume(fmt="vol: {}"),
                widget.Systray(),
                widget.CheckUpdates(
                    display_format="Updates: {updates}",
                    distro="Arch",
                    update_interval=60,
                ),
                widget.Clock(format="%Y-%m-%d %R"),
                widget.QuickExit(),
            ],
            24,
        ),
        wallpaper='~/.config/qtile/background.jpg',
        wallpaper_mode='fill',
    ),
]
