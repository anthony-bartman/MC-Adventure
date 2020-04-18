#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will run the adventure for the team
#--------------------------------------
#Black Team
#Unrelated to Progress NUMS

#-- Spawns custom mobs, turns them off after they can teleport to main island
execute at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] run function skyisland:adv/skyisland_mobs
#-- Secrets on Map (TEST THIS!)
execute at @e[type=minecraft:armor_stand,tag=blackTeamtrap,limit=1] if entity @s[distance=..5] run function skyisland:adv/secrets/trapdoor

#-- Make everyone teleport back home during adventure... CHANGE LATER
execute at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] as @a[team=!blackTeam,tag=player,distance=..150] run function skyisland:adv/tp_homeskyisland
#Volcano TP
execute at @e[type=minecraft:armor_stand,tag=blackTeamv,limit=1] run function skyisland:teams/black/adv/volc_tp

#============
#ADVENTURE
#Stage 0 - Get Island Ready For Players (Progress Nums: 0)
#Sets up volcano oneway ticket for players to teleport out of jeffrey volcano if they are stuck 
execute if score blackMP mapProgress matches 0 run scoreboard players set blackVolc mapProgress 0
#Add one to the map progress level
execute if score blackMP mapProgress matches 0 run scoreboard players add blackMP mapProgress 1

#Stage 1 -Altar Room (Progress Nums: 1-4)
execute if score blackMP mapProgress matches 1..4 as @e[type=minecraft:armor_stand,tag=blackTeamt,limit=1] at @s if entity @a[tag=player,distance=..8] run function skyisland:teams/black/adv/slime_main
#-------------
#Respawn powercore block
#-------------
execute if score blackMP mapProgress matches 4..31 as @e[type=minecraft:armor_stand,tag=blackTeamt,limit=1] at @s run function skyisland:adv/slime_room/altrespawn

#Stage 2 -Power Room (Progress Nums: 5-10)
execute if score blackMP mapProgress matches 5..10 at @e[type=minecraft:armor_stand,tag=blackTeamb,limit=1] run function skyisland:teams/black/adv/abyssal_main

#Stage 3 -Cloud Boss (Progress Nums 8-0)
execute if score blackMP mapProgress matches 8..9 as @e[type=minecraft:armor_stand,tag=blackTeamc,limit=1] at @s run function skyisland:teams/black/adv/cloud_main
#-------------
#Respawn cloud guardian block
#-------------
execute if score blackMP mapProgress matches 10..31 as @e[type=minecraft:armor_stand,tag=blackTeamc,limit=1] at @s if block ~1 ~ ~1 minecraft:sea_lantern run function skyisland:adv/cloud/respawn












#-------------
#Respawn skyvival key block * Only 3
#-------------
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11..31}] at @e[tag=blackTeamb] if score @e[tag=blackTeamCen,limit=1] skyvivalKeys matches 1..3 if block ~-5 ~1 ~ minecraft:nether_wart_block run scoreboard players set keyEnable check 1 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11..31}] at @e[tag=blackTeamb] if score @e[tag=blackTeamCen,limit=1] skyvivalKeys matches 1..3 if score keyEnable check matches 1 run setblock ~-5 ~1 ~ minecraft:air replace 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11..31}] at @e[tag=blackTeamb] if score @e[tag=blackTeamCen,limit=1] skyvivalKeys matches 1..3 if score keyEnable check matches 1 run function skyisland:skyvivalkeyrespawn
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11..31}] if score skyvivalKeyTimer time matches 315 run scoreboard players add @e[tag=blackTeamCen] skyvivalKeys 1
#Sets the '4th' beacon to the correct spot... so no infinite beacon spawning
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11..29}] if score @e[tag=blackTeamCen,limit=1] skyvivalKeys matches 3 run tellraw @a[team=blackTeam] {"text":"Beat the raid to advance in adventure map...","color":"gray","italic":true}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11..29}] if score @e[tag=blackTeamCen,limit=1] skyvivalKeys matches 3 run scoreboard players add @e[tag=blackTeamCen] skyvivalKeys 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30..31}] if score @e[tag=blackTeamCen,limit=1] skyvivalKeys matches 4 at @e[tag=blackTeama] as @e[tag=blackTeamCen, limit=1] run function skyisland:set_beacon







#Stage 5 Pillager Raid (Progress Nums: 11-27)
#Give players bad_omen lvl4 effect after 8 minutes 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 4500 run tellraw @a[team=blackTeam] {"text":"\nSomething is coming\n","color":"gray","bold":false,"italic":true}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 7500 run tellraw @a[team=blackTeam] {"text":"\nWas that a raid horn sound?\n","color":"gray","bold":false,"italic":true}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 9400 run tellraw @a[team=blackTeam] [{"text":"\nIs that...\n","color":"gray","bold":false,"italic":true},{"text":"PILLAGERS, EVOKERS, RAVAGERS!\n","color":"red","bold":true,"italic":false},{"text":"Oh My!\n\nThe Raid has BEGUN!\n","color":"gray","bold":false,"italic":true}]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 9400 at @e[tag=blackTeamCen] unless entity @e[tag=villager0,distance=..90] run function skyisland:black/get_jerry
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 9600.. at @e[tag=blackTeamCen] run effect give @a[team=blackTeam] minecraft:bad_omen 1000000 3 true 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 9600.. at @e[tag=blackTeamCen] run teleport @a[team=blackTeam] ~5 ~-4 ~22
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=blackTeama,limit=1] raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=blackTeamh] raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=blackTeamCen] raidControl 0
#Add one to map progress, once bad omen effect gets applied
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1

#--Initiates Final Raid (13-15) that based on how many villagers survive, they will get a good item
# Wave #1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=12}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=12}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run function skyisland:black/get_jerry
execute if entity @e[tag=blackTeamCen,scores={mapProgress=12}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=12}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] run playsound minecraft:event.raid.horn master @a[team=blackTeam] ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 1 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"You Ready Bro?","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set @e[tag=blackTeama,limit=1] raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
# Wave #2
execute if entity @e[tag=blackTeamCen,scores={mapProgress=14}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=14}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run function skyisland:black/get_jerry
execute if entity @e[tag=blackTeamCen,scores={mapProgress=14}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=14}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] as @a[team=blackTeam] run playsound minecraft:event.raid.horn master @s ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 2 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"These pillagers suck so bad bruh xD","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set @e[tag=blackTeama,limit=1] raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
# Wave #3
execute if entity @e[tag=blackTeamCen,scores={mapProgress=16}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=16}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run function skyisland:black/get_jerry
execute if entity @e[tag=blackTeamCen,scores={mapProgress=16}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=16}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] as @a[team=blackTeam] run playsound minecraft:event.raid.horn master @s ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
#Determine total count of mobs left in wav
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 3 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"Is this even a challenge!","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set @e[tag=blackTeama,limit=1] raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
# Wave #4
execute if entity @e[tag=blackTeamCen,scores={mapProgress=18}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=18}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run function skyisland:black/get_jerry
execute if entity @e[tag=blackTeamCen,scores={mapProgress=18}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=18}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] as @a[team=blackTeam] run playsound minecraft:event.raid.horn master @s ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 4 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"If you died already... oh boy","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set @e[tag=blackTeama,limit=1] raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
# Wave #5
execute if entity @e[tag=blackTeamCen,scores={mapProgress=20}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=20}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run function skyisland:black/get_jerry
execute if entity @e[tag=blackTeamCen,scores={mapProgress=20}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=20}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] as @a[team=blackTeam] run playsound minecraft:event.raid.horn master @s ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 5 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"Pfft, that one was a lil too easy","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set @e[tag=blackTeama,limit=1] raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
# Wave #6
execute if entity @e[tag=blackTeamCen,scores={mapProgress=22}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=22}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run function skyisland:black/get_jerry
execute if entity @e[tag=blackTeamCen,scores={mapProgress=22}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=22}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] as @a[team=blackTeam] run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 6 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"Alright, here comes a hard wave","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set @e[tag=blackTeama,limit=1] raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
# Wave #7
execute if entity @e[tag=blackTeamCen,scores={mapProgress=24}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=24}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run function skyisland:black/get_jerry
execute if entity @e[tag=blackTeamCen,scores={mapProgress=24}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=24}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] as @a[team=blackTeam] run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 7 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"Next wave is impossible... xD","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set @e[tag=blackTeama,limit=1] raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
# Wave #8
execute if entity @e[tag=blackTeamCen,scores={mapProgress=26}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=26}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run function skyisland:black/get_jerry
execute if entity @e[tag=blackTeamCen,scores={mapProgress=26}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=26}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] as @a[team=blackTeam] run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set @e[tag=blackTeama,limit=1] raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
# Finish up wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=28}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=28}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run function skyisland:black/get_jerry
execute if entity @e[tag=blackTeamCen,scores={mapProgress=28}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=28}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] if score @e[tag=blackTeama,limit=1] raidControl matches 0..5 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 at @e[tag=blackTeamCen] as @a[team=blackTeam] run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] if score @e[tag=blackTeama,limit=1] raidControl matches 6 run scoreboard players add @e[tag=blackTeama,limit=1] raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] if score @e[tag=blackTeama,limit=1] raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 8 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"Not bad bro... xD","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set @e[tag=blackTeama,limit=1] raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1


#Stage 6 TP altar (Progress Nums: 28-30)
#--Checks if altar is setup correctly (20)
#Reset scoreboard 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30..32}] run scoreboard players set @e[tag=blackTeama,limit=1] TPaltar 0
#Checking of blocks
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] as @e[tag=blackTeama,limit=1] run function skyisland:tp_setup
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] if score @e[tag=blackTeama,limit=1] TPaltar matches 5 run setblock ~ ~16 ~ minecraft:black_stained_glass replace
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] if score @e[tag=blackTeama,limit=1] TPaltar matches 5 run setblock ~ ~6 ~ minecraft:black_stained_glass replace
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] if score @e[tag=blackTeama,limit=1] TPaltar matches 5 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1

#--Sets All players on team to survival mode (21)
execute if entity @e[tag=blackTeamCen,scores={mapProgress=31}] run scoreboard players set @a[team=blackTeam] survivalOn 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=31}] at @e[tag=blackTeama] run fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 minecraft:diamond_ore replace
execute if entity @e[tag=blackTeamCen,scores={mapProgress=31}] at @e[tag=blackTeama] run setblock ~ ~-2 ~ minecraft:emerald_block replace
execute if entity @e[tag=blackTeamCen,scores={mapProgress=31}] at @e[tag=blackTeama] run advancement grant @a[team=blackTeam] only mainisland:root
execute if entity @e[tag=blackTeamCen,scores={mapProgress=31}] run kill @e[tag=blackTeamv]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=31}] run recipe give @a[team=blackTeam] *
execute if entity @e[tag=blackTeamCen,scores={mapProgress=31}] run advancement grant @a[team=blackTeam] through skyisland:survival_key
execute if entity @e[tag=blackTeamCen,scores={mapProgress=31}] run advancement grant @a[team=blackTeam] through skyisland:t4tools
execute if entity @e[tag=blackTeamCen,scores={mapProgress=31}] run advancement grant @a[team=blackTeam] through skyisland:v3knowledge
#Get Boss Counter Ready
execute if entity @e[tag=blackTeamCen,scores={mapProgress=31}] run scoreboard players set blackTeamAltars bossAltarCount 0
#Summon tp from main to island armorstand
execute if entity @e[tag=blackTeamCen,scores={mapProgress=31}] if score @a[team=blackTeam,limit=1] survivalOn matches 1 run summon minecraft:armor_stand -211 166 38 {Tags:["blackTeamMainTp"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=31}] if score @a[team=blackTeam,limit=1] survivalOn matches 1 at @e[tag=blackTeamMainTp] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:black_concrete
execute if entity @e[tag=blackTeamCen,scores={mapProgress=31}] if score @a[team=blackTeam,limit=1] survivalOn matches 1 at @e[tag=blackTeamMainTp] run setblock ~ ~-1 ~ minecraft:sea_lantern
execute if entity @e[tag=blackTeamCen,scores={mapProgress=31}] as @a[team=blackTeam,scores={survivalOn=1},limit=1] run tellraw @s [{"text":"Teleport Altar Generated at  ","color":"white"},{"text":"Main Island","color":"gold","bold":true},{"text":" for \n-> ","color":"white","bold":false},{"selector":"@a[team=blackTeam]","bold":true}]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=31}] run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
