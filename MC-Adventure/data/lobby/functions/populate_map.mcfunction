#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will pregenerate and summon specific armor stands around the map and whatnot
#--------------------------------------

say Add a bunch of teleporting commands here xD \\n in the "populate_map" function
#Sets up old Main island altar and whatnot...
# execute as @s run function mainisland:island_setup

#Remove Unused Scoreboards
execute if score kitsEnabled lobbySettings matches 0 run scoreboard objectives remove chooseKit
#Resets Leader's Timer score
gamemode adventure @s
scoreboard players reset @s intro
scoreboard players set LP lobbySettings 2

