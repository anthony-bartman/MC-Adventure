#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will run the adventure for the team
#--------------------------------------
#Green Team

#Help Menu
# ++ ALL METHODS WITH HELP ONLY WORK FOR BLACK TEAM!
execute as @s[scores={help=1..1499}] run function skyisland:trigger/main_adv

#-- Spawns custom mobs, turns them off after they can teleport to main island
execute at @e[type=minecraft:armor_stand,tag=greenTeamCen,limit=1] run function skyisland:adv/skyisland_mobs
#-- Secrets on Map
execute at @e[type=minecraft:armor_stand,tag=greenTeamtrap,limit=1] if entity @s[distance=..5] run function skyisland:adv/secrets/trapdoor
#INVENTORY CHECKER TO REPLACE ITEM TAGS
execute at @e[type=minecraft:armor_stand,tag=greenTeami,limit=1] if entity @s[distance=..5] as @e[type=item,tag=,distance=..3] run function skyisland:adv/inventory

#-- Make everyone teleport back home during adventure
execute at @e[type=minecraft:armor_stand,tag=greenTeamCen,limit=1] as @a[team=!greenTeam,tag=player,distance=..60] run function skyisland:adv/tp_homeskyisland
#Volcano TP
execute at @e[type=minecraft:armor_stand,tag=greenTeamv,limit=1] run function skyisland:teams/green/adv/volc_tp

#============
#ADVENTURE
#Stage 0 - Get Island Ready For Players (Progress Nums: 0)
#Sets up volcano oneway ticket for players to teleport out of jeffrey volcano if they are stuck 
execute if score greenMP mapProgress matches 0 run scoreboard players set greenVolc mapProgress 0
#Add one to the map progress level
execute if score greenMP mapProgress matches 0 run scoreboard players add greenMP mapProgress 1

#Stage 1 -Altar Room (Progress Nums: 1-4)
execute if score greenMP mapProgress matches 1..4 as @e[type=minecraft:armor_stand,tag=greenTeamt,limit=1] at @s if entity @a[tag=player,distance=..8] run function skyisland:teams/green/adv/slime_main
#-------------
#Respawn powercore block
#-------------
execute if score greenMP mapProgress matches 4.. as @e[type=minecraft:armor_stand,tag=greenTeamt,limit=1] at @s run function skyisland:adv/slime_room/altrespawn

#Stage 2 -Power Room (Progress Nums: 5-11)
execute if score greenMP mapProgress matches 5..12 as @e[type=minecraft:armor_stand,tag=greenTeamb,limit=1] at @s run function skyisland:teams/green/adv/abyssal_main

#Stage 3 -Cloud Boss (Progress Nums 8-9)
execute if score greenMP mapProgress matches 8..9 as @e[type=minecraft:armor_stand,tag=greenTeamc,limit=1] at @s run function skyisland:teams/green/adv/cloud_main
#-------------
#Respawn cloud guardian block
#-------------
execute if score greenMP mapProgress matches 10.. as @e[type=minecraft:armor_stand,tag=greenTeamc,limit=1] at @s if block ~1 ~ ~1 minecraft:sea_lantern run function skyisland:adv/cloud/respawn
#-------------
#Respawn skyvival key block * Only 3
#-------------
execute if score greenMP mapProgress matches 13.. if score greenSkyKeys skyAltars matches 1..3 as @e[type=minecraft:armor_stand,tag=greenTeamb,limit=1] at @s if block ~-5 ~1 ~ minecraft:nether_wart_block run function skyisland:adv/abyssal_room/skyvivalkeyrespawn
execute if score greenMP mapProgress matches 13.. if score skyKeyRespawn skyAltars matches 2 at @e[type=minecraft:armor_stand,tag=greenTeamb,limit=1] if block ~-5 ~1 ~ minecraft:nether_wart_block run scoreboard players add greenSkyKeys skyAltars 1
execute if score greenMP mapProgress matches 13.. if score skyKeyRespawn skyAltars matches 2 at @e[type=minecraft:armor_stand,tag=greenTeamb,limit=1] run setblock ~-5 ~1 ~ minecraft:air
#Progression
execute if score greenMP mapProgress matches 13.. if score skyKeyRespawn skyAltars matches 2 run scoreboard players set skyKeyRespawn skyAltars 0
#After 3 beacons spawned
execute if score greenMP mapProgress matches 13.. if score greenSkyKeys skyAltars matches 4 run tellraw @s {"text":"Beat the raid to advance in adventure map...","color":"gray","italic":true}
execute if score greenMP mapProgress matches 13.. if score greenSkyKeys skyAltars matches 4 run scoreboard players set greenSkyKeys skyAltars 5
execute if score greenMP mapProgress matches 13.. if score greenSkyKeys skyAltars matches 5 at @e[type=minecraft:armor_stand,tag=greenTeama,limit=1] run function skyisland:adv/abyssal_room/set_beacon
execute if score greenMP mapProgress matches 13.. if score greenSkyKeys skyAltars matches 5 run scoreboard players reset greenSkyKeys skyAltars

#Stage 5 Pillager Raid (Progress Nums: 11-27)
#Raid Setup
execute if score greenMP mapProgress matches 13 if score loopSpeed lobbySettings matches 0 if score greenTime raidControl matches 0.. run function skyisland:teams/green/adv/raid/setup0
execute if score greenMP mapProgress matches 13 if score loopSpeed lobbySettings matches 1 if score greenTime raidControl matches 0.. run function skyisland:teams/green/adv/raid/setup1
execute if score greenMP mapProgress matches 13 if score loopSpeed lobbySettings matches 2 if score greenTime raidControl matches 0.. run function skyisland:teams/green/adv/raid/setup2
execute if score greenMP mapProgress matches 13 if score loopSpeed lobbySettings matches 3 if score greenTime raidControl matches 0.. run function skyisland:teams/green/adv/raid/setup3
execute if score greenMP mapProgress matches 13 if score greenTime raidControl matches 0 run scoreboard players add greenMP mapProgress 1
#Raid
execute if score greenMP mapProgress matches 14..29 run function skyisland:teams/green/adv/raid_main
#Makes sure players cannot leave map during raid
execute if score greenMP mapProgress matches 12..29 at @s as @s[y=0,dy=100] run function skyisland:teams/green/tp_safe

#Stage 6 TP altar (Progress Nums: 28-30)
#--Checks if altar is setup correctly (20)
execute if score greenMP mapProgress matches 30.. as @e[type=minecraft:armor_stand,tag=greenTeama,limit=1] at @s if entity @a[tag=player,distance=..12] run function skyisland:teams/green/adv/teleport_main
