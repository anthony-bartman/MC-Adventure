#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will teleport players to mainIsland
#--------------------------------------

#TP to Main
execute if score loopSpeed lobbySettings matches 0 run function skyisland:adv/tp_altar/teleport0
execute if score loopSpeed lobbySettings matches 1 run function skyisland:adv/tp_altar/teleport1
execute if score loopSpeed lobbySettings matches 2 run function skyisland:adv/tp_altar/teleport2
execute if score loopSpeed lobbySettings matches 3 run function skyisland:adv/tp_altar/teleport3

#Makes Tp Altar unbreakable
execute if entity @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:iron_block
execute if entity @s run fill ~ ~ ~ ~ ~ ~ minecraft:beacon
execute if entity @s run kill @e[type=item,distance=..2.5]
