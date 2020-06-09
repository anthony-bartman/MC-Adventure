#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will run the main for the setting up the teleport altar to mainIsland
#--------------------------------------

#Reset scoreboard 
execute if score greenMP mapProgress matches 30 run scoreboard players set @s skyAltars 0
#Checking of blocks
execute if score greenMP mapProgress matches 30 run function skyisland:adv/tp_altar/tp_setup
execute if score greenMP mapProgress matches 30 if score @s skyAltars matches 5 run setblock ~ ~16 ~ minecraft:lime_stained_glass replace
execute if score greenMP mapProgress matches 30 if score @s skyAltars matches 5 run setblock ~ ~6 ~ minecraft:lime_stained_glass replace
execute if score greenMP mapProgress matches 30 if score @s skyAltars matches 5 run scoreboard players set greenMP mapProgress 31


#-------------------------
# MAIN ISLAND THINGS
#------------------------- DO THIS in populate_map
# #Summon tp from main to island armorstand
# execute if score greenMP mapProgress matches 31 run summon minecraft:armor_stand 190 130 65 {Tags:["greenTeamMainTp"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
# execute if score greenMP mapProgress matches 31 positioned 190 130 65 run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:lime_concrete
# execute if score greenMP mapProgress matches 31 positioned 190 130 65 run setblock ~ ~-1 ~ minecraft:sea_lantern
execute if score greenMP mapProgress matches 31 run tellraw @a[team=greenTeam] [{"text":"Teleport Altar Generated at  ","color":"gray"},{"text":"Main Island","color":"gold","bold":true},{"text":" for \n  -> ","color":"gray","bold":false},{"selector":"@a[team=greenTeam]","bold":true}]

#-------------------------
# SKY ISLAND THINGS
#-------------------------
#Set players into surival
execute if score greenMP mapProgress matches 31 run gamemode survival @a[team=greenTeam]
#Cleans Scoreboard up
execute if score greenMP mapProgress matches 31 run scoreboard players reset @s skyAltars
execute if score greenMP mapProgress matches 31 run scoreboard players reset greenSkyKeys skyAltars
execute if score greenMP mapProgress matches 31 run scoreboard players reset greenVolc mapProgress
#Teleport altar on island
execute if score greenMP mapProgress matches 31 run fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 minecraft:diamond_ore replace
execute if score greenMP mapProgress matches 31 run setblock ~ ~-2 ~ minecraft:emerald_block replace
#Other Adventure Parameters
execute if score greenMP mapProgress matches 31 run advancement grant @a[team=greenTeam] only mainisland:root
execute if score greenMP mapProgress matches 31 run advancement grant @a[team=greenTeam] through skyisland:survival_key
execute if score greenMP mapProgress matches 31 run advancement grant @a[team=greenTeam] through skyisland:t4tools
execute if score greenMP mapProgress matches 31 run advancement grant @a[team=greenTeam] through skyisland:v3knowledge
execute if score greenMP mapProgress matches 31 run advancement grant @a[team=greenTeam] through skyisland:v3trade
#Recipes
#------------- 
execute if score greenMP mapProgress matches 31 run recipe give @a[team=greenTeam] *

#Kill all Armor Stands Except Center and Altar
execute if score greenMP mapProgress matches 31 run kill @e[type=minecraft:armor_stand,tag=greenTeamt,limit=1]
execute if score greenMP mapProgress matches 31 run kill @e[type=minecraft:armor_stand,tag=greenTeamb,limit=1]
execute if score greenMP mapProgress matches 31 run kill @e[type=minecraft:armor_stand,tag=greenTeamc,limit=1]
execute if score greenMP mapProgress matches 31 run kill @e[type=minecraft:armor_stand,tag=greenTeamv,limit=1]
execute if score greenMP mapProgress matches 31 run kill @e[type=minecraft:armor_stand,tag=greenTeamh,limit=1]
execute if score greenMP mapProgress matches 31 run kill @e[type=minecraft:armor_stand,tag=greenTeamtrap,limit=1]
execute if score greenMP mapProgress matches 31 run kill @e[type=minecraft:armor_stand,tag=greenTeami,limit=1]

#KILL VILLAGERS/ GIve them new ones???
execute if score greenMP mapProgress matches 31 at @e[type=minecraft:armor_stand,tag=greenTeamCen,limit=1] run kill @e[distance=..100,type=villager,tag=!]
execute if score greenMP mapProgress matches 31 at @e[type=minecraft:armor_stand,tag=greenTeamCen,limit=1] run kill @e[distance=..100,type=parrot,tag=!]
execute if score greenMP mapProgress matches 31 at @e[type=minecraft:armor_stand,tag=greenTeamCen,limit=1] run function skyisland:adv/villagers/get_larry

#Update Map Progress
execute if score greenMP mapProgress matches 31 run scoreboard players set greenMP mapProgress 32

