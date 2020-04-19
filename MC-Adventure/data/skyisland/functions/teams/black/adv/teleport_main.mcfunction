#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will run the main for the teleport altar to mainIsland
#--------------------------------------

#Reset scoreboard 
execute if score blackMP mapProgress matches 30 run scoreboard players set @s skyAltars 0
#Checking of blocks
execute if score blackMP mapProgress matches 30 run function skyisland:adv/tp_altar/tp_setup
execute if score blackMP mapProgress matches 30 if score @s skyAltars matches 5 run setblock ~ ~16 ~ minecraft:black_stained_glass replace
execute if score blackMP mapProgress matches 30 if score @s skyAltars matches 5 run setblock ~ ~6 ~ minecraft:black_stained_glass replace
execute if score blackMP mapProgress matches 30 if score @s skyAltars matches 5 run scoreboard players add blackMP mapProgress 1


#--Sets All players on team to survival mode (21)
execute if score blackMP mapProgress matches 31 run scoreboard players reset @s skyAltars

execute if score blackMP mapProgress matches 31 run setblock ~1 ~-1 ~1 minecraft:iron_block replace
execute if score blackMP mapProgress matches 31 run setblock ~1 ~-1 ~-1 minecraft:iron_block replace
execute if score blackMP mapProgress matches 31 run setblock ~-1 ~-1 ~1 minecraft:iron_block replace
execute if score blackMP mapProgress matches 31 run setblock ~-1 ~-1 ~-1 minecraft:iron_block replace
execute if score blackMP mapProgress matches 31 run fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 minecraft:diamond_ore replace
execute if score blackMP mapProgress matches 31 run setblock ~ ~-2 ~ minecraft:emerald_block replace
#Other Adventure Parameters
execute if score blackMP mapProgress matches 31 run advancement grant @a[team=blackTeam] only mainisland:root
execute if score blackMP mapProgress matches 31 run advancement grant @a[team=blackTeam] through skyisland:survival_key
execute if score blackMP mapProgress matches 31 run advancement grant @a[team=blackTeam] through skyisland:t4tools
execute if score blackMP mapProgress matches 31 run advancement grant @a[team=blackTeam] through skyisland:v3knowledge
execute if score blackMP mapProgress matches 31 run advancement grant @a[team=blackTeam] through skyisland:v3trade
execute if score blackMP mapProgress matches 31 run recipe give @a[team=blackTeam] *

#What to do with Armor Stands, and Villagers on island, and scoreboards
#execute if score blackMP mapProgress matches 31 run kill @e[tag=blackTeamv]
execute if score blackMP mapProgress matches 31 run scoreboard players reset blackSkyKeys skyAltars


#Get Boss Counter Ready
#execute if score blackMP mapProgress matches 31 run scoreboard players set blackTeamAltars bossAltarCount 0
#Summon tp from main to island armorstand
execute if score blackMP mapProgress matches 31 run summon minecraft:armor_stand -211 166 38 {Tags:["blackTeamMainTp"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score blackMP mapProgress matches 31 positioned -211 166 38 run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:black_concrete
execute if score blackMP mapProgress matches 31 positioned -211 166 38 run setblock ~ ~-1 ~ minecraft:sea_lantern
execute if score blackMP mapProgress matches 31 as @a[team=blackTeam] run tellraw @s [{"text":"Teleport Altar Generated at  ","color":"white"},{"text":"Main Island","color":"gold","bold":true},{"text":" for \n-> ","color":"white","bold":false},{"selector":"@a[team=blackTeam]","bold":true}]
execute if score blackMP mapProgress matches 31 run scoreboard players add blackMP mapProgress 1



