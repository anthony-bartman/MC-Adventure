#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will pregenerate and summon specific armor stands around the map and whatnot
#--------------------------------------

say Add a bunch of teleporting commands here xD \n in the "populate_map" function

#BUGS
# ++ Determine where/how to spawn in tp pads back to homeisland

#Sets up MainIsland, Dungeons, and Ocean Island
# execute if score loopSpeed lobbySettings matches 0 as @s run function mainisland:setup/main0
# execute if score loopSpeed lobbySettings matches 1 as @s run function mainisland:setup/main1
# execute if score loopSpeed lobbySettings matches 2 as @s run function mainisland:setup/main2
# execute if score loopSpeed lobbySettings matches 3 as @s run function mainisland:setup/main3

# execute if score loopSpeed lobbySettings matches 0 as @s run function oceanisland:setup/main0
# execute if score loopSpeed lobbySettings matches 1 as @s run function oceanisland:setup/main1
# execute if score loopSpeed lobbySettings matches 2 as @s run function oceanisland:setup/main2
# execute if score loopSpeed lobbySettings matches 3 as @s run function oceanisland:setup/main3

# execute if score loopSpeed lobbySettings matches 0 as @s run function dungeonisland:setup/main0
# execute if score loopSpeed lobbySettings matches 1 as @s run function dungeonisland:setup/main1
# execute if score loopSpeed lobbySettings matches 2 as @s run function dungeonisland:setup/main2
# execute if score loopSpeed lobbySettings matches 3 as @s run function dungeonisland:setup/main3


#Remove Unused Scoreboards
execute if score kitsEnabled lobbySettings matches 0 run scoreboard objectives remove chooseKit
#Resets Leader's Timer score
gamemode adventure @s
scoreboard players reset @s[scores={intro=5}] intro
scoreboard players set LP lobbySettings 2

