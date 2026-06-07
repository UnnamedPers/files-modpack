# Main function

# Reset for the future
advancement revoke @s only bki:player_death

# Remove everything that has a curse
clear @s *[enchantments~[{enchantments: "vanishing_curse"}]]


# Drop xp
# All the XP is dropped and percentage that remains at the place of death depends on the adjustable value (see load or reset function)
function bki:xp_calculations

# Items before doing something with them to know what is missing after
function bki:get_list_before

# Clear items with: components:{"minecraft:custom_data":{always_drop:1b}}
clear @s *[minecraft:custom_data~{always_drop:1b}]

# Items left after previous operation
function bki:get_list_after

# Subtract the lists to know what items have to be summon
# Before - after
# Make copy of list after as it will be deleted during the recursion and is necessary later
data modify storage bki:bki items.after_copy set from storage bki:bki items.after
# Execute if list not empty
execute if data storage bki:bki items.after_copy[0] run function bki:recursive/sl_b-a

# Remove from future checking items with this tag
data remove storage bki:bki items.after[{components:{"minecraft:custom_data":{never_drop:1b}}}]


# Make copy of list after as it will be deleted during the recursion and is necessary later
data modify storage bki:bki safe.list_copy set from storage bki:bki safe.list
# Execute if list not empty
execute if data storage bki:bki items.after[0] run function bki:recursive/sl_a-safe

# Summon items that were already cleared
execute if data storage bki:bki items.before[0] run function bki:recursive/summon_cleared

# Now we are left with the list items.after which contains items which dropped amount is based on #items_dropped value (see load or reset function)
# The last step is to clear them from the inventory and summon the items
execute if data storage bki:bki items.after[0] run function bki:recursive/drop_rest

# Clean up the data
data remove storage bki:bki drop
data remove storage bki:bki operation
data remove storage bki:bki items
data remove storage bki:bki safe.list_copy
