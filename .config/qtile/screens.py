from libqtile import bar, widget
from libqtile.config import Screen

time_format = "%Y-%m-%d %R"
volume_format = "vol: {}"

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
                widget.PulseVolume(fmt=volume_format),
                widget.Systray(),
                widget.Clock(format=time_format),
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
                widget.PulseVolume(fmt=volume_format),
                widget.Systray(),
                widget.Clock(format=time_format),
                widget.QuickExit(),
            ],
            24,
        ),
        wallpaper='~/.config/qtile/background.jpg',
        wallpaper_mode='fill',
    ),
]
