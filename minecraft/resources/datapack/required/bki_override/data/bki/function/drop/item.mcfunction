# Change from original file: Removed item spread
# Summon and clear singular slot

$summon item ~ ~ ~ {Age:$(age)s,Item:$(item)}
# Normally after Age:6000 ticks (5 minutes) the item is destroyed
# Starting with age -6000 gives it 10 minutes before it disapeares

# Clear the item from the inventory
# This part doesn't do anything for already cleared items so it can be also used for just summoning
$item modify entity @s $(type).$(Slot) {\
    "function": "minecraft:set_count",\
    "count": {\
        "type": "minecraft:score",\
        "target": {\
            "type": "minecraft:fixed",\
            "name": "#item_count"\
        },\
        "score": "levels",\
        "scale": -1\
    },\
    "add": true,\
    "conditions": []\
}
