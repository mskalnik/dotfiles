from libqtile import bar, widget
from libqtile.config import Screen

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    font="JetBrains mono",
                    fontsize=16,
                ),
                widget.Prompt(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Spacer(),
                widget.PulseVolume(
                    fmt="vol: {}",
                    font="JetBrains mono",
                    fontsize=16,
                ),
                widget.Systray(),
                widget.CheckUpdates(
                    display_format="{updates} update found!",
                    distro="Arch",
                    font="JetBrains mono",
                    fontsize=16,
                    update_interval=60,
                ),
                widget.Clock(
                    font="JetBrains mono",
                    fontsize=16,
                    format="%Y-%m-%d %R",
                ),
                widget.QuickExit(
                    countdown_format='[{}]',
                    default_text='[X]',
                    font="JetBrains mono",
                    fontsize=16,
                ),
            ],
            30,
            margin=[8,8,0,8],
        ),
        wallpaper='~/.config/qtile/background.jpg',
        wallpaper_mode='fill',
    ),
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    font="JetBrains mono",
                    fontsize=16,
                ),
                widget.Prompt(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
            ],
            30,
            margin=[8,8,0,8],
        ),
        wallpaper='~/.config/qtile/background.jpg',
        wallpaper_mode='fill',
    ),
]
