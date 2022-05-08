from libqtile.command import lazy
from libqtile.config import Group, Key

from keys import keys, mod

groups = [
    Group(
        "1",
        label="/home",
        spawn=["alacritty -e neofetch", "alacritty -e htop"],
    ),
    Group(
        "2",
        label="/dev",
        spawn=["code", "alacritty"],
    ),
    Group(
        "3",
        label="/net",
        spawn="firefox",
    ),
    Group(
        "4",
        label="/mus",
        spawn="spotify",
    ),
    Group(
        "5",
        label="/com",
        spawn="discord",
    ),
    Group(
        "6",
        label="/tmp",
    ),
]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ],
    )
