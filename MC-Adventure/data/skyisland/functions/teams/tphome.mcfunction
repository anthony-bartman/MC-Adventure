#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will teleport players home from mainisland
#--------------------------------------

#Cool Particle Effects
particle minecraft:happy_villager ~ ~-1 ~ .1 .1 .1 .1 1 force
particle minecraft:end_rod ~ ~2 ~ .01 .01 .01 .1 1 force

#TP from MAIN TO ISLAND
execute if score loopSpeed lobbySettings matches 0 run function skyisland:adv/tp_altar/tphome0
execute if score loopSpeed lobbySettings matches 1 run function skyisland:adv/tp_altar/tphome1
execute if score loopSpeed lobbySettings matches 2 run function skyisland:adv/tp_altar/tphome2
execute if score loopSpeed lobbySettings matches 3 run function skyisland:adv/tp_altar/tphome3
