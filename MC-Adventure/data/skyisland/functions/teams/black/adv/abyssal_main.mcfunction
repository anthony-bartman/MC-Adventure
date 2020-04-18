#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will run the methods for the abyssal room
#--------------------------------------


#--Unlock the power room (4)
execute if score blackMP mapProgress matches 5 if block ~9 ~1 ~-1 minecraft:sea_lantern run function skyisland:adv/abyssal_room/pow_unlock
#Increment Map Score
execute if score blackMP mapProgress matches 5 if block ~9 ~1 ~-1 minecraft:sea_lantern run scoreboard players set blackMP mapProgress 6

#-- Spawns Mobs in Power room (5)
execute if score blackMP mapProgress matches 6 if entity @a[distance=..3.5,tag=player] run function skyisland:adv/abyssal_room/pow_mobs
#Increment Map Score
execute if score blackMP mapProgress matches 6 if entity @a[distance=..3.5,tag=player] run scoreboard players set blackMP mapProgress 7

#-- Waits for player to leave room to spawn in the cloud city
execute if score blackMP mapProgress matches 7 positioned ~2 ~1 ~6 if entity @a[distance=..2,tag=player] at @e[type=minecraft:armor_stand,tag=blackTeamc,limit=1] run function skyisland:adv/cloud/unlock
#Increment Map Score
execute if score blackMP mapProgress matches 7 positioned ~2 ~1 ~6 if entity @a[distance=..2,tag=player] run scoreboard players set blackMP mapProgress 8

#Cool Particles
execute if score blackMP mapProgress matches 7..10 if entity @a[distance=..6,tag=player] run particle minecraft:happy_villager ~-5 ~1.5 ~ .8 .8 .8 .1 1 force


#Stage 4 Survival Key (Progress Nums: 9-10)
#-- Place Master core in power room (9)
execute if score blackMP mapProgress matches 10 if block ~-5 ~1 ~ minecraft:nether_wart_block run function skyisland:adv/abyssal_room/pow_key
execute if score blackMP mapProgress matches 10 if block ~-5 ~1 ~ minecraft:nether_wart_block run scoreboard players set @s skyAltars 1
execute if score blackMP mapProgress matches 10 if block ~-5 ~1 ~ minecraft:nether_wart_block run tellraw @a[team=blackTeam] [{"selector":"@a[team=blackTeam]","bold":true},{"text":" can now respawn the ","color":"gray","italic":true,"bold":false},{"text":"Cloud Guardian","color":"dark_red","bold":true,"italic":true},{"text":"...","color":"gray","bold":false,"italic":true}]
#Increment Map
execute if score blackMP mapProgress matches 10 if block ~-5 ~1 ~ minecraft:nether_wart_block run scoreboard players set blackMP mapProgress 10




#--Begin a skyAltarsr that will activate nether wart block has been placed (10)
#Adds one to counter, and runs commands based on the skyAltarsr's values
execute if score blackMP mapProgress matches 11 if score @s skyAltars matches 1.. run scoreboard players add @s skyAltars 1
execute if score blackMP mapProgress matches 11 if score @s skyAltars matches 1.. as @s run function skyisland:adv/abyssal_room/pow_timer
#Used for Pillager Raid
execute if score blackMP mapProgress matches 11 if score @s skyAltars matches 315 run scoreboard players set blackTime raidControl 0

#Incremente Map score and allow respawn boss
execute if score blackMP mapProgress matches 11 if score @s skyAltars matches 320 run scoreboard players set blackMP mapProgress 12
#Former Timer used to keep track of number of keys spawned
execute if score blackMP mapProgress matches 12 if score @s skyAltars matches 320 run scoreboard players set @s skyAltars 1





