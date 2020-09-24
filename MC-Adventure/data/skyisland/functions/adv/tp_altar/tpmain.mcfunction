#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will teleport players to mainIsland
#--------------------------------------

#check if player has all of these options
recipe give @s *
advancement grant @s through skyisland:survival_key
advancement grant @s through skyisland:t4tools
advancement grant @s through skyisland:v3knowledge

#Scoreboard Enables
execute unless score @s help matches 0 run scoreboard players enable @s help

#Teleportation
effect give @s minecraft:slow_falling 5 1 true
effect give @s minecraft:blindness 3 10 true
effect give @s minecraft:slowness 3 10 true
gamemode adventure @s

#Teleport players to mainIsland spot to be randomized
teleport @s 0 256 0 facing ~ ~256 ~
#Randomly teleport players to 
execute positioned 0 256 0 run spreadplayers ~ ~ 200 200 true @s




