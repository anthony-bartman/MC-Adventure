#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will run the main for the setting up the teleport altar to mainIsland
#--------------------------------------

#Reset scoreboard 
execute if score blackMP mapProgress matches 30 run scoreboard players set @s skyAltars 0
#Checking of blocks
execute if score blackMP mapProgress matches 30 run function skyisland:adv/tp_altar/tp_setup
execute if score blackMP mapProgress matches 30 if score @s skyAltars matches 5 run setblock ~ ~16 ~ minecraft:black_stained_glass replace
execute if score blackMP mapProgress matches 30 if score @s skyAltars matches 5 run setblock ~ ~6 ~ minecraft:black_stained_glass replace
execute if score blackMP mapProgress matches 30 if score @s skyAltars matches 5 run scoreboard players set blackMP mapProgress 31


#-------------------------
# MAIN ISLAND THINGS
#-------------------------  DOING THIS in populate_map
# #Summon tp from main to island armorstand
# execute if score blackMP mapProgress matches 31 run summon minecraft:armor_stand -211 166 38 {Tags:["blackTeamMainTp"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
# execute if score blackMP mapProgress matches 31 positioned -211 166 38 run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:black_concrete
# execute if score blackMP mapProgress matches 31 positioned -211 166 38 run setblock ~ ~-1 ~ minecraft:sea_lantern
execute if score blackMP mapProgress matches 31 run tellraw @a[team=blackTeam] [{"text":"Teleport Altar Generated at  ","color":"gray"},{"text":"Main Island","color":"gold","bold":true},{"text":" for \n  -> ","color":"gray","bold":false},{"selector":"@a[team=blackTeam]","bold":true}]

#-------------------------
# SKY ISLAND THINGS
#-------------------------
#Set players into surival
execute if score blackMP mapProgress matches 31 run gamemode survival @a[team=blackTeam]
#Cleans Scoreboard up
execute if score blackMP mapProgress matches 31 run scoreboard players reset @s skyAltars
execute if score blackMP mapProgress matches 31 run scoreboard players reset blackSkyKeys skyAltars
execute if score blackMP mapProgress matches 31 run scoreboard players reset blackVolc mapProgress
#Teleport altar on island
execute if score blackMP mapProgress matches 31 run fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 minecraft:diamond_ore replace
execute if score blackMP mapProgress matches 31 run setblock ~ ~-2 ~ minecraft:emerald_block replace
#Other Adventure Parameters
execute if score blackMP mapProgress matches 31 run advancement grant @a[team=blackTeam] only mainisland:root
execute if score blackMP mapProgress matches 31 run advancement grant @a[team=blackTeam] through skyisland:survival_key
execute if score blackMP mapProgress matches 31 run advancement grant @a[team=blackTeam] through skyisland:t4tools
execute if score blackMP mapProgress matches 31 run advancement grant @a[team=blackTeam] through skyisland:v3knowledge
execute if score blackMP mapProgress matches 31 run advancement grant @a[team=blackTeam] through skyisland:v3trade
#Recipes
#------------- 
execute if score blackMP mapProgress matches 31 run recipe give @a[team=blackTeam] *

#Kill all Armor Stands Except Center and Altar
execute if score blackMP mapProgress matches 31 run kill @e[type=minecraft:armor_stand,tag=blackTeamt,limit=1]
execute if score blackMP mapProgress matches 31 run kill @e[type=minecraft:armor_stand,tag=blackTeamb,limit=1]
execute if score blackMP mapProgress matches 31 run kill @e[type=minecraft:armor_stand,tag=blackTeamc,limit=1]
execute if score blackMP mapProgress matches 31 run kill @e[type=minecraft:armor_stand,tag=blackTeamv,limit=1]
execute if score blackMP mapProgress matches 31 run kill @e[type=minecraft:armor_stand,tag=blackTeamh,limit=1]
execute if score blackMP mapProgress matches 31 run kill @e[type=minecraft:armor_stand,tag=blackTeamtrap,limit=1]
execute if score blackMP mapProgress matches 31 run kill @e[type=minecraft:armor_stand,tag=blackTeami,limit=1]

#KILL VILLAGERS/ GIve them new ones???
execute if score blackMP mapProgress matches 31 at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] run kill @e[distance=..100,type=villager,tag=!]
execute if score blackMP mapProgress matches 31 at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] run kill @e[distance=..100,type=parrot,tag=!]
execute if score blackMP mapProgress matches 31 at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] run function skyisland:adv/villagers/get_larry

#Update Map Progress
execute if score blackMP mapProgress matches 31 run scoreboard players set blackMP mapProgress 32

