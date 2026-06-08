# XP kept by player (in %)
scoreboard players set #xp_left levels 100

# Percentage of lost xp that is dropped (in %)
scoreboard players set #xp_dropped levels 0


# Percentage of items dropped, rounded down.
# Utleast 1 item is dropped, unless set to 0.
# If item has count 1 this value becomes the base for the random chance of it being dropped.
scoreboard players set #items_dropped levels 100

# Item and xp lifetime (in minutes).
# How long before they despawn.
scoreboard players set #lifetime levels 5

# Show players settings for this datapack on theirs first join
scoreboard players set #show_fjoin levels 0

# Show settings
function bki:settings
