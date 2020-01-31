#This file will iterate through all skyisland functions

#Bugs 
#NEED TO IMPLEMENT SP TEAMS
#Kill All armor stands and villagers and parrot after players can tp away,except armor stand 'a'
##MAKE "tpTIMER" UNIQUE FOR EACH TEAM, cause probably players will go on tp altar multiple times
#Maybe add a custom zelda sound, when they find the trapdoor thing

#Inventory checker to replace items
execute at @a run function skyisland:inventory

#Outside of each teams island
#If you fall off...tp ocean island - NOT IMPLEMENTED YET
execute at @a if entity @a[y=0,dy=9,team=!] as @a[y=0,dy=9,team=!] run function skyisland:tp_ocean

#Trigger command to help players get out of the a hole
scoreboard players enable @a[gamemode=adventure] help
execute as @a[scores={help=1..},limit=1] run function skyisland:trigger_help/trigger_main


#---------
#Black Team 
#---------
#Unrelated to Progress NUMS
#==================
# Possible BUG
#Need to limit this to each island, not the entire map, MIGHT need to fix, or leave the same
#===================
#-- Spawns custom mobs, turns them off after they can teleport to main island
execute if entity @e[tag=blackTeamCen,scores={mapProgress=0..29}] at @e[tag=blackTeamCen] run function skyisland:skyisland_mobs
#If players finds hidden coal entrance
execute if entity @e[tag=blackTeamCen,scores={mapProgress=0..29}] at @e[tag=blackTeamtrap] unless block ~ ~ ~ minecraft:coal_block run setblock ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] replace
execute if entity @e[tag=blackTeamCen,scores={mapProgress=0..29}] at @e[tag=blackTeamtrap] if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run summon firework_rocket ~ ~2 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[I;10288939,4718585,16725712],FadeColors:[I;16777215]}]}}}}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=0..29}] at @e[tag=blackTeamtrap] if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run kill @e[tag=blackTeamtrap]
#-- If Player falls offs island
execute at @a run teleport @a[y=0,dy=9,team=blackTeam] @e[tag=blackTeamh,limit=1]

#Stage 0 - Get Island Ready For Players (Progress Nums: 0)
#Sets volcano one=way-ticket for players to 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=0}] run scoreboard players set @a[team=blackTeam] particles 0
#Add one to the map progress level
execute if entity @e[tag=blackTeamCen,scores={mapProgress=0}] run scoreboard players add @e[tag=blackTeamCen] mapProgress 1

#Stage 1 -Altar Room (Progress Nums: 1-3)
#--Checks if player is in range of the altar armorstand (1)
execute if entity @e[tag=blackTeamCen,scores={mapProgress=1}] at @e[tag=blackTeamt] if entity @a[distance=..3,team=blackTeam] run function skyisland:altenter
execute if entity @e[tag=blackTeamCen,scores={mapProgress=1}] at @e[tag=blackTeamt] if entity @a[distance=..3,team=blackTeam] run scoreboard players add @e[tag=blackTeamCen] mapProgress 1

#--Check for altar slime blocks (2)
#Reset scoreboard 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=2..3}] run scoreboard players set @e[tag=blackTeamt] slimeCounter 0
#Particle Effects above altar
execute if entity @e[tag=blackTeamCen,scores={mapProgress=2}] at @e[tag=blackTeamt] if entity @a[team=blackTeam,distance=..8] run summon minecraft:area_effect_cloud ~ ~2 ~ {Particle:witchMagic,WaitTime:10}
#Checks for 4 slimeblocks
execute if entity @e[tag=blackTeamCen,scores={mapProgress=2}] at @e[tag=blackTeamt] if block ~2 ~ ~ minecraft:slime_block run scoreboard players add @e[tag=blackTeamt] slimeCounter 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=2}] at @e[tag=blackTeamt] if block ~-2 ~ ~ minecraft:slime_block run scoreboard players add @e[tag=blackTeamt] slimeCounter 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=2}] at @e[tag=blackTeamt] if block ~ ~ ~2 minecraft:slime_block run scoreboard players add @e[tag=blackTeamt] slimeCounter 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=2}] at @e[tag=blackTeamt] if block ~ ~ ~-2 minecraft:slime_block run scoreboard players add @e[tag=blackTeamt] slimeCounter 1
#If 4 Slime Blocks
execute if entity @e[tag=blackTeamCen,scores={mapProgress=2}] at @e[tag=blackTeamt] if entity @e[tag=blackTeamt,scores={slimeCounter=4}] run function skyisland:altslime
#Increment Map Score
execute if entity @e[tag=blackTeamCen,scores={mapProgress=2}] if entity @e[tag=blackTeamt,scores={slimeCounter=4}] run scoreboard players add @e[tag=blackTeamCen] mapProgress 1

#--Begin a timer that will activate once 4 slime blocks have been placed (3)
#Adds one to counter, and runs commands based on the timer's values
execute if entity @e[tag=blackTeamCen,scores={mapProgress=3}] if entity @a[team=blackTeam,limit=1] if score alt_timer time matches 1.. run scoreboard players add alt_timer time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=3}] at @e[tag=blackTeamt] if score alt_timer time matches 1.. run function skyisland:alt_timer
#==================
# Possible BUG
#If 2 teams execute the timer at the same time, they might break my program, find a way to still increment the mapProgress if the slimes score is 4
# FIX
#Need a way to allow players to reinitiate the slimeblock ritual for a power core
#===================
#Increment Map Score
execute if entity @e[tag=blackTeamCen,scores={mapProgress=3}] if score alt_timer time matches 320 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Timer has reached 320
execute if entity @e[tag=blackTeamCen,scores={mapProgress=3..4}] if score alt_timer time matches 320 run scoreboard players reset alt_timer time 

#Stage 2 -Power Room (Progress Nums: 4-5)
#--Unlock the power room (4)
execute if entity @e[tag=blackTeamCen,scores={mapProgress=4}] at @e[tag=blackTeamb] if block ~9 ~1 ~-1 minecraft:sea_lantern run function skyisland:pow_unlock
#Increment Map Score
execute if entity @e[tag=blackTeamCen,scores={mapProgress=4}] at @e[tag=blackTeamb] if block ~9 ~1 ~-1 minecraft:sea_lantern run scoreboard players add @e[tag=blackTeamCen] mapProgress 1

#-- Spawns Mobs in Power room (5)
execute if entity @e[tag=blackTeamCen,scores={mapProgress=5}] at @e[tag=blackTeamb] if entity @a[distance=..3.5,team=blackTeam] run function skyisland:pow_mobs
#Increment Map Score
execute if entity @e[tag=blackTeamCen,scores={mapProgress=5}] at @e[tag=blackTeamb] if entity @a[distance=..3.5,team=blackTeam] run scoreboard players add @e[tag=blackTeamCen] mapProgress 1

#Stage 3 -Cloud City (Progress Nums: 6-8)
#-- Unlocks Cloud Area (6)
execute if entity @e[tag=blackTeamCen,scores={mapProgress=6}] at @e[tag=blackTeamb] if entity @a[distance=..1,team=blackTeam] at @e[tag=blackTeamc] run function skyisland:cloud_unlock
execute if entity @e[tag=blackTeamCen,scores={mapProgress=6..9}] at @e[tag=blackTeamb] if entity @a[distance=..6,team=blackTeam] run particle minecraft:happy_villager ~-5 ~1.5 ~ .8 .8 .8 .1 1 force
#Increments Map Score
execute if entity @e[tag=blackTeamCen,scores={mapProgress=6}] at @e[tag=blackTeamb] if entity @a[distance=..1,team=blackTeam] at @e[tag=blackTeamc] run scoreboard players add @e[tag=blackTeamCen] mapProgress 1

#--Spawns in a cloud boss (7)
execute if entity @e[tag=blackTeamCen,scores={mapProgress=7}] at @e[tag=blackTeamc] if entity @a[distance=..3,team=blackTeam] run function skyisland:cloud_boss
#Increments Map Score
execute if entity @e[tag=blackTeamCen,scores={mapProgress=7}] at @e[tag=blackTeamc] if entity @a[distance=..3,team=blackTeam] run scoreboard players add @e[tag=blackTeamCen] mapProgress 1

#-- Updates boss bar for cloud boss (8)
execute if entity @e[tag=blackTeamCen,scores={mapProgress=8}] run bossbar set minecraft:guardian players @a[team=blackTeam] 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=8}] run function skyisland:cloud_bossbar
#Increments Map Score if boss is dead
execute if entity @e[tag=blackTeamCen,scores={mapProgress=8}] unless entity @e[type=minecraft:evoker,tag=guardian,limit=1] run scoreboard players add @e[tag=blackTeamCen] mapProgress 1

#Stage 4 Survival Key (Progress Nums: 9-10)
#-- Place Master core in power room (9)
execute if entity @e[tag=blackTeamCen,scores={mapProgress=9}] at @e[tag=blackTeamb] if block ~-5 ~1 ~ minecraft:nether_wart_block run function skyisland:pow_key
#Increment Map
execute if entity @e[tag=blackTeamCen,scores={mapProgress=9}] at @e[tag=blackTeamb] if block ~-5 ~1 ~ minecraft:nether_wart_block run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#==================
# Possible BUG
#If 2 teams execute the timer at the same time, they might break my program, find a way to still increment the mapProgress if the slimes score is 4
# FIX
#Need a way to allow players to initiate the powerCore ritual for a key of survival, by respawning boss or something
#===================
#--Begin a timer that will activate nether wart block has been placed (10)
#Adds one to counter, and runs commands based on the timer's values
execute if entity @e[tag=blackTeamCen,scores={mapProgress=10}] if entity @a[team=blackTeam,limit=1] if score powTimer time matches 1.. run scoreboard players add powTimer time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=10}] at @e[tag=blackTeamb] if score powTimer time matches 1.. run function skyisland:pow_timer
#Increment Map Score
execute if entity @e[tag=blackTeamCen,scores={mapProgress=10}] if score powTimer time matches 315 run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=10}] if score powTimer time matches 320 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Timer has reached 325
execute if entity @e[tag=blackTeamCen,scores={mapProgress=10..11}] if score powTimer time matches 320 run scoreboard players reset powTimer time

#Stage 5 Pillager Raid (Progress Nums: 11-27)
#Give players bad_omen lvl4 effect after 8 minutes 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 9600.. at @e[tag=blackTeamCen] run effect give @a[team=blackTeam] minecraft:bad_omen 1000000 3 true 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 9600.. run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=blackTeamh] raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=blackTeamCen] raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 9600.. run title @a[distance=..150] title [{"text":"AHH! The","color":"aqua","bold":true},{"text":" Pillagers","color":"dark_red","bold":true},{"text":"!?!?","color":"aqua","bold":true}]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 9600.. run title @a[distance=..150] subtitle [{"text":"It was only a matter of time...!","color":"white"}]
#Add one to map progress, once bad omen effect gets applied
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=11}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1

#--Initiates Final Raid (13-15) that based on how many villagers survive, they will get a good item
# Wave #1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=12}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=12}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=12}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run playsound minecraft:event.raid.horn master @a[team=blackTeam] ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 1 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"You Ready Bro?","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=13}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
# Wave #2
execute if entity @e[tag=blackTeamCen,scores={mapProgress=14}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=14}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=14}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run playsound minecraft:event.raid.horn master @a[team=blackTeam] ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 2 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"These pillagers suck so bad bruh xD","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=15}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
# Wave #3
execute if entity @e[tag=blackTeamCen,scores={mapProgress=16}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=16}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=16}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run playsound minecraft:event.raid.horn master @a[team=blackTeam] ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wav
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 3 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Is this even a challenge!","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=17}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
# Wave #4
execute if entity @e[tag=blackTeamCen,scores={mapProgress=18}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=18}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=18}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run playsound minecraft:event.raid.horn master @a[team=blackTeam] ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 4 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"If you died already... oh boy","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=19}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
# Wave #5
execute if entity @e[tag=blackTeamCen,scores={mapProgress=20}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=20}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=20}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run playsound minecraft:event.raid.horn master @a[team=blackTeam] ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 5 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Pfft, that one was a lil too easy","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=21}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
# Wave #6
execute if entity @e[tag=blackTeamCen,scores={mapProgress=22}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=22}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=22}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=blackTeam] ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 6 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Alright, here comes a hard wave","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=23}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
# Wave #7
execute if entity @e[tag=blackTeamCen,scores={mapProgress=24}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=24}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=24}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=blackTeam] ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 7 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Next wave is impossible... xD","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=25}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
# Wave #8
execute if entity @e[tag=blackTeamCen,scores={mapProgress=26}] if entity @a[team=blackTeam,limit=1] if score @e[tag=blackTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blackTeamCen] time 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=26}] if score @e[tag=blackTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blackTeamCen] time 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=26}] if score @e[tag=blackTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 0..5 at @e[tag=blackTeamCen] run function skyisland:black/raid_max
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[tag=blackTeamh,limit=1]
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 at @e[tag=blackTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=blackTeam] ~ ~ ~ 100
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl -= @e[tag=black_raid] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamCen] raidControl -= @e[tag=blackTeamh] raidControl
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blackTeamh] raidControl = @e[tag=blackTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 8 Complete","color":"red"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Not bad...","color":"aqua"}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blackTeamCen,scores={mapProgress=27}] if score @e[tag=blackTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1

#Stage 6 TP altar (Progress Nums: 28-30)
#--Checks if altar is setup correctly (20)
#Reset scoreboard 
execute if entity @e[tag=blackTeamCen,scores={mapProgress=28..30}] run scoreboard players set altarScore TPaltar 0
#Checking of blocks
execute if entity @e[tag=blackTeamCen,scores={mapProgress=28}] at @e[tag=blackTeama] run function skyisland:tp_setup
execute if entity @e[tag=blackTeamCen,scores={mapProgress=28}] at @e[tag=blackTeama] if score altarScore TPaltar matches 5 run setblock ~ ~16 ~ minecraft:black_stained_glass replace
execute if entity @e[tag=blackTeamCen,scores={mapProgress=28}] at @e[tag=blackTeama] if score altarScore TPaltar matches 5 run setblock ~ ~6 ~ minecraft:black_stained_glass replace
execute if entity @e[tag=blackTeamCen,scores={mapProgress=28}] if score altarScore TPaltar matches 5 run scoreboard players add @e[tag=blackTeamCen] mapProgress 1

#--Sets All players on team to survival mode (21)
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] run scoreboard players set @a[team=blackTeam] survivalOn 1
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] at @e[tag=blackTeama] run fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 minecraft:diamond_ore replace
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] at @e[tag=blackTeama] run setblock ~ ~-2 ~ minecraft:emerald_block replace
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] at @e[tag=blackTeama] run advancement grant @a[team=blackTeam] only mainisland:root
execute if entity @e[tag=blackTeamCen,scores={mapProgress=29}] run scoreboard players add @e[tag=blackTeamCen] mapProgress 1

#--Initiates Altar TP (22)
#Resets score if player leaves altar
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] unless entity @a[distance=..2] if score tpTimer time matches 1.. run title @a[distance=..4] actionbar {"text":"Cancelled Teleportation...","color":"red","bold":true}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] unless entity @a[distance=..2] if score tpTimer time matches 1.. run scoreboard players set tpTimer time 0
#If player stays on altar
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] if score tpTimer time matches 1..5 if entity @a[team=blackTeam,distance=..10] run title @a[distance=..2] title {"text":" "}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] if score tpTimer time matches 1..5 if entity @a[team=blackTeam,distance=..10] run title @a[distance=..2] subtitle {"text":" "}
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] if score tpTimer time matches 1.. if entity @a[team=blackTeam,distance=..10] run particle portal ~ ~ ~ 0 .8 0 .3 8 force
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] if score tpTimer time matches 1.. if entity @a[team=blackTeam,distance=..10] run particle minecraft:end_rod ~ ~2 ~ .01 .01 .01 .1 1 force
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] if score tpTimer time matches 1.. if entity @a[team=blackTeam,distance=..10] run particle minecraft:happy_villager ~ ~2 ~ .1 .1 .1 .1 1 force
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] if score tpTimer time matches 1.. if entity @a[team=blackTeam,distance=..2] run function skyisland:altartp
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] if entity @a[team=blackTeam,distance=..2] run scoreboard players add tpTimer time 1
#Actual Teleportation of Player -- BASED, ONLY CERTAIN TEAMS CAN USE

execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] if score tpTimer time matches 330.. as @a[team=blackTeam,distance=..2] run function skyisland:tpmain

#Makes Tp Altar unbreakable
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] if entity @a[scores={survivalOn=1},distance=..15] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:iron_block
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] if entity @a[scores={survivalOn=1},distance=..15] run fill ~ ~ ~ ~ ~ ~ minecraft:beacon
execute if entity @e[tag=blackTeamCen,scores={mapProgress=30}] at @e[tag=blackTeama] if entity @a[scores={survivalOn=1},distance=..15] run kill @e[type=item,distance=..3.5]

#Sets all players to survival if on aquaTeam
execute at @e[tag=blackTeamCen] run gamemode survival @a[team=blackTeam,scores={survivalOn=1},distance=..60]
execute at @e[tag=blackTeamCen] run gamemode adventure @a[scores={survivalOn=0},distance=..80]
#Volcano TP thing
execute if entity @a[team=blackTeam,scores={particles=0}] at @e[tag=blackTeamv] run tellraw @a[team=blackTeam,distance=..5] ["",{"text":"\n"},{"text":"<Jeffrey>","color":"gray"},{"text":" Hello "},{"selector":"@a[team=blackTeam,distance=..5]","color":"gray"},{"text":"! My name is Jeffrey. To my right is a "},{"text":"one-time-use portal","color":"light_purple","bold":"true"},{"text":" to get out of here if y'all dont have any "},{"text":"diamonds","color":"gold"},{"text":". Bring me some "},{"text":"diamonds ","color":"gold"},{"text":"to trade to unlock more secrets!\n "}]
execute if entity @a[team=blackTeam,scores={particles=0}] at @e[tag=blackTeamv] if entity @a[team=blackTeam,distance=..5] run scoreboard players add @a[team=blackTeam] particles 1
execute if entity @a[team=blackTeam,scores={particles=1}] at @e[tag=blackTeamv] run title @a[distance=..0.75] title {"text":"One Way Ticket Used","color":"","bold":true}
execute if entity @a[team=blackTeam,scores={particles=1}] at @e[tag=blackTeamv] run title @a[distance=..0.75] subtitle {"text":"Bring Jeffrey Diamonds","color":"gold","bold":true}
execute if entity @a[team=blackTeam,scores={particles=1}] at @e[tag=blackTeamv] if entity @a[team=blackTeam,distance=..0.75] run playsound minecraft:item.chorus_fruit.teleport master @a[team=blackTeam,distance=..0.75] ~ ~ ~ 100
execute if entity @a[team=blackTeam,scores={particles=0..1}] at @e[tag=blackTeamv] if entity @a[team=blackTeam,distance=..15] run summon area_effect_cloud ~ ~ ~ {Particle:effect,WaitTime:2}
execute if entity @a[team=blackTeam,scores={particles=1}] at @e[tag=blackTeamv] if entity @a[team=blackTeam,distance=..0.75] run scoreboard players add @a[team=blackTeam] particles 1
execute if entity @a[team=blackTeam,scores={particles=2}] at @e[tag=blackTeamv] run teleport @a[team=blackTeam,distance=..0.75] @e[tag=blackTeamCen,limit=1]
execute if entity @a[team=blackTeam,scores={particles=2}] run scoreboard players reset @a[team=blackTeam] particles

#---------
#Magenta Team 
#---------
#Unrelated to Progress NUMS
#==================
# Possible BUG
#Need to limit this to each island, not the entire map, MIGHT need to fix, or leave the same
#===================
#-- Spawns custom mobs, turns them off after they can teleport to main island
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=0..29}] at @e[tag=magentaTeamCen] run function skyisland:skyisland_mobs
#If players finds hidden coal entrance
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=0..29}] at @e[tag=magentaTeamtrap] unless block ~ ~ ~ minecraft:coal_block run setblock ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] replace
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=0..29}] at @e[tag=magentaTeamtrap] if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run summon firework_rocket ~ ~2 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[I;10288939,4718585,16725712],FadeColors:[I;16777215]}]}}}}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=0..29}] at @e[tag=magentaTeamtrap] if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run kill @e[tag=magentaTeamtrap]
#-- If Player falls offs island
execute at @a run teleport @a[y=0,dy=9,team=magentaTeam] @e[tag=magentaTeamh,limit=1]

#Stage 0 - Get Island Ready For Players (Progress Nums: 0)
#Sets volcano one=way-ticket for players to 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=0}] run scoreboard players set @a[team=magentaTeam] particles 0
#Add one to the map progress level
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=0}] run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1

#Stage 1 -Altar Room (Progress Nums: 1-3)
#--Checks if player is in range of the altar armorstand (1)
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=1}] at @e[tag=magentaTeamt] if entity @a[distance=..3,team=magentaTeam] run function skyisland:altenter
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=1}] at @e[tag=magentaTeamt] if entity @a[distance=..3,team=magentaTeam] run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1

#--Check for altar slime blocks (2)
#Reset scoreboard 
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=2..3}] run scoreboard players set @e[tag=magentaTeamt] slimeCounter 0
#Particle Effects above altar
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=2}] at @e[tag=magentaTeamt] if entity @a[team=magentaTeam,distance=..8] run summon minecraft:area_effect_cloud ~ ~2 ~ {Particle:witchMagic,WaitTime:10}
#Checks for 4 slimeblocks
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=2}] at @e[tag=magentaTeamt] if block ~2 ~ ~ minecraft:slime_block run scoreboard players add @e[tag=magentaTeamt] slimeCounter 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=2}] at @e[tag=magentaTeamt] if block ~-2 ~ ~ minecraft:slime_block run scoreboard players add @e[tag=magentaTeamt] slimeCounter 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=2}] at @e[tag=magentaTeamt] if block ~ ~ ~2 minecraft:slime_block run scoreboard players add @e[tag=magentaTeamt] slimeCounter 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=2}] at @e[tag=magentaTeamt] if block ~ ~ ~-2 minecraft:slime_block run scoreboard players add @e[tag=magentaTeamt] slimeCounter 1
#If 4 Slime Blocks
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=2}] at @e[tag=magentaTeamt] if entity @e[tag=magentaTeamt,scores={slimeCounter=4}] run function skyisland:altslime
#Increment Map Score
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=2}] if entity @e[tag=magentaTeamt,scores={slimeCounter=4}] run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1

#--Begin a timer that will activate once 4 slime blocks have been placed (3)
#Adds one to counter, and runs commands based on the timer's values
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=3}] if entity @a[team=magentaTeam,limit=1] if score alt_timer time matches 1.. run scoreboard players add alt_timer time 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=3}] at @e[tag=magentaTeamt] if score alt_timer time matches 1.. run function skyisland:alt_timer
#==================
# Possible BUG
#If 2 teams execute the timer at the same time, they might break my program, find a way to still increment the mapProgress if the slimes score is 4
# FIX
#Need a way to allow players to reinitiate the slimeblock ritual for a power core
#===================
#Increment Map Score
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=3}] if score alt_timer time matches 320 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
#Timer has reached 320
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=3..4}] if score alt_timer time matches 320 run scoreboard players reset alt_timer time 

#Stage 2 -Power Room (Progress Nums: 4-5)
#--Unlock the power room (4)
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=4}] at @e[tag=magentaTeamb] if block ~9 ~1 ~-1 minecraft:sea_lantern run function skyisland:pow_unlock
#Increment Map Score
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=4}] at @e[tag=magentaTeamb] if block ~9 ~1 ~-1 minecraft:sea_lantern run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1

#-- Spawns Mobs in Power room (5)
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=5}] at @e[tag=magentaTeamb] if entity @a[distance=..3.5,team=magentaTeam] run function skyisland:pow_mobs
#Increment Map Score
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=5}] at @e[tag=magentaTeamb] if entity @a[distance=..3.5,team=magentaTeam] run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1

#Stage 3 -Cloud City (Progress Nums: 6-8)
#-- Unlocks Cloud Area (6)
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=6}] at @e[tag=magentaTeamb] if entity @a[distance=..1,team=magentaTeam] at @e[tag=magentaTeamc] run function skyisland:cloud_unlock
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=6..9}] at @e[tag=magentaTeamb] if entity @a[distance=..6,team=magentaTeam] run particle minecraft:happy_villager ~-5 ~1.5 ~ .8 .8 .8 .1 1 force
#Increments Map Score
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=6}] at @e[tag=magentaTeamb] if entity @a[distance=..1,team=magentaTeam] at @e[tag=magentaTeamc] run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1

#--Spawns in a cloud boss (7)
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=7}] at @e[tag=magentaTeamc] if entity @a[distance=..3,team=magentaTeam] run function skyisland:cloud_boss
#Increments Map Score
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=7}] at @e[tag=magentaTeamc] if entity @a[distance=..3,team=magentaTeam] run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1

#-- Updates boss bar for cloud boss (8)
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=8}] run bossbar set minecraft:guardian players @a[team=magentaTeam] 
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=8}] run function skyisland:cloud_bossbar
#Increments Map Score if boss is dead
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=8}] unless entity @e[type=minecraft:evoker,tag=guardian,limit=1] run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1

#Stage 4 Survival Key (Progress Nums: 9-10)
#-- Place Master core in power room (9)
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=9}] at @e[tag=magentaTeamb] if block ~-5 ~1 ~ minecraft:nether_wart_block run function skyisland:pow_key
#Increment Map
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=9}] at @e[tag=magentaTeamb] if block ~-5 ~1 ~ minecraft:nether_wart_block run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
#==================
# Possible BUG
#If 2 teams execute the timer at the same time, they might break my program, find a way to still increment the mapProgress if the slimes score is 4
# FIX
#Need a way to allow players to initiate the powerCore ritual for a key of survival, by respawning boss or something
#===================
#--Begin a timer that will activate nether wart block has been placed (10)
#Adds one to counter, and runs commands based on the timer's values
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=10}] if entity @a[team=magentaTeam,limit=1] if score powTimer time matches 1.. run scoreboard players add powTimer time 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=10}] at @e[tag=magentaTeamb] if score powTimer time matches 1.. run function skyisland:pow_timer
#Increment Map Score
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=10}] if score powTimer time matches 315 run scoreboard players set @e[tag=magentaTeamCen] time 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=10}] if score powTimer time matches 320 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
#Timer has reached 325
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=10..11}] if score powTimer time matches 320 run scoreboard players reset powTimer time

#Stage 5 Pillager Raid (Progress Nums: 11-27)
#Give players bad_omen lvl4 effect after 8 minutes 
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=11}] if entity @a[team=magentaTeam,limit=1] if score @e[tag=magentaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=magentaTeamCen] time 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=11}] if score @e[tag=magentaTeamCen,limit=1] time matches 9600.. at @e[tag=magentaTeamCen] run effect give @a[team=magentaTeam] minecraft:bad_omen 1000000 3 true 
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=11}] if score @e[tag=magentaTeamCen,limit=1] time matches 9600.. run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=11}] if score @e[tag=magentaTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=magentaTeamh] raidControl 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=11}] if score @e[tag=magentaTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=magentaTeamCen] raidControl 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=11}] if score @e[tag=magentaTeamCen,limit=1] time matches 9600.. run title @a[distance=..150] title [{"text":"AHH! The","color":"aqua","bold":true},{"text":" Pillagers","color":"dark_red","bold":true},{"text":"!?!?","color":"aqua","bold":true}]
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=11}] if score @e[tag=magentaTeamCen,limit=1] time matches 9600.. run title @a[distance=..150] subtitle [{"text":"It was only a matter of time...!","color":"white"}]
#Add one to map progress, once bad omen effect gets applied
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=11}] if score @e[tag=magentaTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=magentaTeamCen] time 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=11}] if score @e[tag=magentaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1

#--Initiates Final Raid (13-15) that based on how many villagers survive, they will get a good item
# Wave #1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=12}] if entity @a[team=magentaTeam,limit=1] if score @e[tag=magentaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=magentaTeamCen] time 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=12}] if score @e[tag=magentaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=magentaTeamCen] time 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=12}] if score @e[tag=magentaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 0..5 at @e[tag=magentaTeamCen] run function skyisland:magenta/raid_max
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run teleport @s @e[tag=magentaTeamh,limit=1]
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run playsound minecraft:event.raid.horn master @a[team=magentaTeam] ~ ~ ~ 100
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl -= @e[tag=magenta_raid] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamCen] raidControl -= @e[tag=magentaTeamh] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl = @e[tag=magentaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=13}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 1 Complete","color":"red"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=13}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"You Ready Bro?","color":"aqua"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=13}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=13}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
# Wave #2
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=14}] if entity @a[team=magentaTeam,limit=1] if score @e[tag=magentaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=magentaTeamCen] time 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=14}] if score @e[tag=magentaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=magentaTeamCen] time 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=14}] if score @e[tag=magentaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 0..5 at @e[tag=magentaTeamCen] run function skyisland:magenta/raid_max
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run teleport @s @e[tag=magentaTeamh,limit=1]
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run playsound minecraft:event.raid.horn master @a[team=magentaTeam] ~ ~ ~ 100
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl -= @e[tag=magenta_raid] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamCen] raidControl -= @e[tag=magentaTeamh] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl = @e[tag=magentaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=15}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 2 Complete","color":"red"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=15}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"These pillagers suck so bad bruh xD","color":"aqua"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=15}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=15}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
# Wave #3
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=16}] if entity @a[team=magentaTeam,limit=1] if score @e[tag=magentaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=magentaTeamCen] time 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=16}] if score @e[tag=magentaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=magentaTeamCen] time 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=16}] if score @e[tag=magentaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 0..5 at @e[tag=magentaTeamCen] run function skyisland:magenta/raid_max
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run teleport @s @e[tag=magentaTeamh,limit=1]
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run playsound minecraft:event.raid.horn master @a[team=magentaTeam] ~ ~ ~ 100
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wav
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl -= @e[tag=magenta_raid] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamCen] raidControl -= @e[tag=magentaTeamh] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl = @e[tag=magentaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=17}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 3 Complete","color":"red"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=17}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Is this even a challenge!","color":"aqua"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=17}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=17}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
# Wave #4
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=18}] if entity @a[team=magentaTeam,limit=1] if score @e[tag=magentaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=magentaTeamCen] time 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=18}] if score @e[tag=magentaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=magentaTeamCen] time 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=18}] if score @e[tag=magentaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 0..5 at @e[tag=magentaTeamCen] run function skyisland:magenta/raid_max
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run teleport @s @e[tag=magentaTeamh,limit=1]
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run playsound minecraft:event.raid.horn master @a[team=magentaTeam] ~ ~ ~ 100
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl -= @e[tag=magenta_raid] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamCen] raidControl -= @e[tag=magentaTeamh] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl = @e[tag=magentaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=19}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 4 Complete","color":"red"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=19}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"If you died already... oh boy","color":"aqua"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=19}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=19}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
# Wave #5
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=20}] if entity @a[team=magentaTeam,limit=1] if score @e[tag=magentaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=magentaTeamCen] time 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=20}] if score @e[tag=magentaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=magentaTeamCen] time 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=20}] if score @e[tag=magentaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 0..5 at @e[tag=magentaTeamCen] run function skyisland:magenta/raid_max
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run teleport @s @e[tag=magentaTeamh,limit=1]
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run playsound minecraft:event.raid.horn master @a[team=magentaTeam] ~ ~ ~ 100
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl -= @e[tag=magenta_raid] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamCen] raidControl -= @e[tag=magentaTeamh] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl = @e[tag=magentaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=21}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 5 Complete","color":"red"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=21}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Pfft, that one was a lil too easy","color":"aqua"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=21}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=21}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
# Wave #6
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=22}] if entity @a[team=magentaTeam,limit=1] if score @e[tag=magentaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=magentaTeamCen] time 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=22}] if score @e[tag=magentaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=magentaTeamCen] time 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=22}] if score @e[tag=magentaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 0..5 at @e[tag=magentaTeamCen] run function skyisland:magenta/raid_max
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run teleport @s @e[tag=magentaTeamh,limit=1]
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=magentaTeam] ~ ~ ~ 100
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl -= @e[tag=magenta_raid] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamCen] raidControl -= @e[tag=magentaTeamh] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl = @e[tag=magentaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=23}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 6 Complete","color":"red"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=23}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Alright, here comes a hard wave","color":"aqua"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=23}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=23}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
# Wave #7
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=24}] if entity @a[team=magentaTeam,limit=1] if score @e[tag=magentaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=magentaTeamCen] time 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=24}] if score @e[tag=magentaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=magentaTeamCen] time 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=24}] if score @e[tag=magentaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 0..5 at @e[tag=magentaTeamCen] run function skyisland:magenta/raid_max
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run teleport @s @e[tag=magentaTeamh,limit=1]
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=magentaTeam] ~ ~ ~ 100
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl -= @e[tag=magenta_raid] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamCen] raidControl -= @e[tag=magentaTeamh] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl = @e[tag=magentaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=25}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 7 Complete","color":"red"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=25}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Next wave is impossible... xD","color":"aqua"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=25}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=25}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
# Wave #8
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=26}] if entity @a[team=magentaTeam,limit=1] if score @e[tag=magentaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=magentaTeamCen] time 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=26}] if score @e[tag=magentaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=magentaTeamCen] time 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=26}] if score @e[tag=magentaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 0..5 at @e[tag=magentaTeamCen] run function skyisland:magenta/raid_max
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 as @e[tag=magenta_raid] run teleport @s @e[tag=magentaTeamh,limit=1]
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 at @e[tag=magentaTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=magentaTeam] ~ ~ ~ 100
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl -= @e[tag=magenta_raid] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamCen] raidControl -= @e[tag=magentaTeamh] raidControl
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=magentaTeamh] raidControl = @e[tag=magentaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=27}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 8 Complete","color":"red"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=27}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Not bad...","color":"aqua"}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=27}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=27}] if score @e[tag=magentaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1

#Stage 6 TP altar (Progress Nums: 28-30)
#--Checks if altar is setup correctly (20)
#Reset scoreboard 
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=28..30}] run scoreboard players set altarScore TPaltar 0
#Checking of blocks
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=28}] at @e[tag=magentaTeama] run function skyisland:tp_setup
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=28}] at @e[tag=magentaTeama] if score altarScore TPaltar matches 5 run setblock ~ ~16 ~ minecraft:magenta_stained_glass replace
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=28}] at @e[tag=magentaTeama] if score altarScore TPaltar matches 5 run setblock ~ ~6 ~ minecraft:magenta_stained_glass replace
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=28}] if score altarScore TPaltar matches 5 run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1

#--Sets All players on team to survival mode (21)
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=29}] run scoreboard players set @a[team=magentaTeam] survivalOn 1
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=29}] at @e[tag=magentaTeama] run fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 minecraft:diamond_ore replace
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=29}] at @e[tag=magentaTeama] run setblock ~ ~-2 ~ minecraft:emerald_block replace
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=29}] at @e[tag=magentaTeama] run advancement grant @a[team=magentaTeam] only mainisland:root
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=29}] run scoreboard players add @e[tag=magentaTeamCen] mapProgress 1

#--Initiates Altar TP (22)
#Resets score if player leaves altar
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=30}] at @e[tag=magentaTeama] unless entity @a[distance=..2] if score tpTimer time matches 1.. run title @a[distance=..4] actionbar {"text":"Cancelled Teleportation...","color":"red","bold":true}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=30}] at @e[tag=magentaTeama] unless entity @a[distance=..2] if score tpTimer time matches 1.. run scoreboard players set tpTimer time 0
#If player stays on altar
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=30}] at @e[tag=magentaTeama] if score tpTimer time matches 1..5 if entity @a[team=magentaTeam,distance=..10] run title @a[distance=..2] title {"text":" "}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=30}] at @e[tag=magentaTeama] if score tpTimer time matches 1..5 if entity @a[team=magentaTeam,distance=..10] run title @a[distance=..2] subtitle {"text":" "}
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=30}] at @e[tag=magentaTeama] if score tpTimer time matches 1.. if entity @a[team=magentaTeam,distance=..10] run particle portal ~ ~ ~ 0 .8 0 .3 8 force
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=30}] at @e[tag=magentaTeama] if score tpTimer time matches 1.. if entity @a[team=magentaTeam,distance=..10] run particle minecraft:end_rod ~ ~2 ~ .01 .01 .01 .1 1 force
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=30}] at @e[tag=magentaTeama] if score tpTimer time matches 1.. if entity @a[team=magentaTeam,distance=..10] run particle minecraft:happy_villager ~ ~2 ~ .1 .1 .1 .1 1 force
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=30}] at @e[tag=magentaTeama] if score tpTimer time matches 1.. if entity @a[team=magentaTeam,distance=..2] run function skyisland:altartp
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=30}] at @e[tag=magentaTeama] if entity @a[team=magentaTeam,distance=..2] run scoreboard players add tpTimer time 1
#Actual Teleportation of Player -- BASED, ONLY CERTAIN TEAMS CAN USE

execute if entity @e[tag=magentaTeamCen,scores={mapProgress=30}] at @e[tag=magentaTeama] if score tpTimer time matches 330.. as @a[team=magentaTeam,distance=..2] run function skyisland:tpmain

#Makes Tp Altar unbreakable
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=30}] at @e[tag=magentaTeama] if entity @a[scores={survivalOn=1},distance=..15] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:iron_block
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=30}] at @e[tag=magentaTeama] if entity @a[scores={survivalOn=1},distance=..15] run fill ~ ~ ~ ~ ~ ~ minecraft:beacon
execute if entity @e[tag=magentaTeamCen,scores={mapProgress=30}] at @e[tag=magentaTeama] if entity @a[scores={survivalOn=1},distance=..15] run kill @e[type=item,distance=..3.5]

#Sets all players to survival if on aquaTeam
execute at @e[tag=magentaTeamCen] run gamemode survival @a[team=magentaTeam,scores={survivalOn=1},distance=..60]
execute at @e[tag=magentaTeamCen] run gamemode adventure @a[scores={survivalOn=0},distance=..80]
#Volcano TP thing
execute if entity @a[team=magentaTeam,scores={particles=0}] at @e[tag=magentaTeamv] run tellraw @a[team=magentaTeam,distance=..5] ["",{"text":"\n"},{"text":"<Jeffrey>","color":"gray"},{"text":" Hello "},{"selector":"@a[team=magentaTeam,distance=..5]","color":"gray"},{"text":"! My name is Jeffrey. To my right is a "},{"text":"one-time-use portal","color":"light_purple","bold":"true"},{"text":" to get out of here if y'all dont have any "},{"text":"diamonds","color":"gold"},{"text":". Bring me some "},{"text":"diamonds ","color":"gold"},{"text":"to trade to unlock more secrets!\n "}]
execute if entity @a[team=magentaTeam,scores={particles=0}] at @e[tag=magentaTeamv] if entity @a[team=magentaTeam,distance=..5] run scoreboard players add @a[team=magentaTeam] particles 1
execute if entity @a[team=magentaTeam,scores={particles=1}] at @e[tag=magentaTeamv] run title @a[distance=..0.75] title {"text":"One Way Ticket Used","color":"","bold":true}
execute if entity @a[team=magentaTeam,scores={particles=1}] at @e[tag=magentaTeamv] run title @a[distance=..0.75] subtitle {"text":"Bring Jeffrey Diamonds","color":"gold","bold":true}
execute if entity @a[team=magentaTeam,scores={particles=1}] at @e[tag=magentaTeamv] if entity @a[team=magentaTeam,distance=..0.75] run playsound minecraft:item.chorus_fruit.teleport master @a[team=magentaTeam,distance=..0.75] ~ ~ ~ 100
execute if entity @a[team=magentaTeam,scores={particles=0..1}] at @e[tag=magentaTeamv] if entity @a[team=magentaTeam,distance=..15] run summon area_effect_cloud ~ ~ ~ {Particle:effect,WaitTime:2}
execute if entity @a[team=magentaTeam,scores={particles=1}] at @e[tag=magentaTeamv] if entity @a[team=magentaTeam,distance=..0.75] run scoreboard players add @a[team=magentaTeam] particles 1
execute if entity @a[team=magentaTeam,scores={particles=2}] at @e[tag=magentaTeamv] run teleport @a[team=magentaTeam,distance=..0.75] @e[tag=magentaTeamCen,limit=1]
execute if entity @a[team=magentaTeam,scores={particles=2}] run scoreboard players reset @a[team=magentaTeam] particles

#---------
#Aqua Team 
#---------
#Unrelated to Progress NUMS
#==================
# Possible BUG
#Need to limit this to each island, not the entire map, MIGHT need to fix, or leave the same
#===================
#-- Spawns custom mobs, turns them off after they can teleport to main island
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=0..29}] at @e[tag=aquaTeamCen] run function skyisland:skyisland_mobs
#If players finds hidden coal entrance
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=0..29}] at @e[tag=aquaTeamtrap] unless block ~ ~ ~ minecraft:coal_block run setblock ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] replace
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=0..29}] at @e[tag=aquaTeamtrap] if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run summon firework_rocket ~ ~2 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[I;10288939,4718585,16725712],FadeColors:[I;16777215]}]}}}}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=0..29}] at @e[tag=aquaTeamtrap] if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run kill @e[tag=aquaTeamtrap]
#-- If Player falls offs island
execute at @a run teleport @a[y=0,dy=9,team=aquaTeam] @e[tag=aquaTeamh,limit=1]

#Stage 0 - Get Island Ready For Players (Progress Nums: 0)
#Sets volcano one=way-ticket for players to 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=0}] run scoreboard players set @a[team=aquaTeam] particles 0
#Add one to the map progress level
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=0}] run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1

#Stage 1 -Altar Room (Progress Nums: 1-3)
#--Checks if player is in range of the altar armorstand (1)
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=1}] at @e[tag=aquaTeamt] if entity @a[distance=..3,team=aquaTeam] run function skyisland:altenter
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=1}] at @e[tag=aquaTeamt] if entity @a[distance=..3,team=aquaTeam] run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1

#--Check for altar slime blocks (2)
#Reset scoreboard 
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=2..3}] run scoreboard players set @e[tag=aquaTeamt] slimeCounter 0
#Particle Effects above altar
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=2}] at @e[tag=aquaTeamt] if entity @a[team=aquaTeam,distance=..8] run summon minecraft:area_effect_cloud ~ ~2 ~ {Particle:witchMagic,WaitTime:10}
#Checks for 4 slimeblocks
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=2}] at @e[tag=aquaTeamt] if block ~2 ~ ~ minecraft:slime_block run scoreboard players add @e[tag=aquaTeamt] slimeCounter 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=2}] at @e[tag=aquaTeamt] if block ~-2 ~ ~ minecraft:slime_block run scoreboard players add @e[tag=aquaTeamt] slimeCounter 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=2}] at @e[tag=aquaTeamt] if block ~ ~ ~2 minecraft:slime_block run scoreboard players add @e[tag=aquaTeamt] slimeCounter 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=2}] at @e[tag=aquaTeamt] if block ~ ~ ~-2 minecraft:slime_block run scoreboard players add @e[tag=aquaTeamt] slimeCounter 1
#If 4 Slime Blocks
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=2}] at @e[tag=aquaTeamt] if entity @e[tag=aquaTeamt,scores={slimeCounter=4}] run function skyisland:altslime
#Increment Map Score
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=2}] if entity @e[tag=aquaTeamt,scores={slimeCounter=4}] run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1

#--Begin a timer that will activate once 4 slime blocks have been placed (3)
#Adds one to counter, and runs commands based on the timer's values
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=3}] if entity @a[team=aquaTeam,limit=1] if score alt_timer time matches 1.. run scoreboard players add alt_timer time 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=3}] at @e[tag=aquaTeamt] if score alt_timer time matches 1.. run function skyisland:alt_timer
#==================
# Possible BUG
#If 2 teams execute the timer at the same time, they might break my program, find a way to still increment the mapProgress if the slimes score is 4
# FIX
#Need a way to allow players to reinitiate the slimeblock ritual for a power core
#===================
#Increment Map Score
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=3}] if score alt_timer time matches 320 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
#Timer has reached 320
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=3..4}] if score alt_timer time matches 320 run scoreboard players reset alt_timer time 

#Stage 2 -Power Room (Progress Nums: 4-5)
#--Unlock the power room (4)
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=4}] at @e[tag=aquaTeamb] if block ~9 ~1 ~-1 minecraft:sea_lantern run function skyisland:pow_unlock
#Increment Map Score
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=4}] at @e[tag=aquaTeamb] if block ~9 ~1 ~-1 minecraft:sea_lantern run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1

#-- Spawns Mobs in Power room (5)
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=5}] at @e[tag=aquaTeamb] if entity @a[distance=..3.5,team=aquaTeam] run function skyisland:pow_mobs
#Increment Map Score
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=5}] at @e[tag=aquaTeamb] if entity @a[distance=..3.5,team=aquaTeam] run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1

#Stage 3 -Cloud City (Progress Nums: 6-8)
#-- Unlocks Cloud Area (6)
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=6}] at @e[tag=aquaTeamb] if entity @a[distance=..1,team=aquaTeam] at @e[tag=aquaTeamc] run function skyisland:cloud_unlock
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=6..9}] at @e[tag=aquaTeamb] if entity @a[distance=..6,team=aquaTeam] run particle minecraft:happy_villager ~-5 ~1.5 ~ .8 .8 .8 .1 1 force
#Increments Map Score
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=6}] at @e[tag=aquaTeamb] if entity @a[distance=..1,team=aquaTeam] at @e[tag=aquaTeamc] run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1

#--Spawns in a cloud boss (7)
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=7}] at @e[tag=aquaTeamc] if entity @a[distance=..3,team=aquaTeam] run function skyisland:cloud_boss
#Increments Map Score
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=7}] at @e[tag=aquaTeamc] if entity @a[distance=..3,team=aquaTeam] run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1

#-- Updates boss bar for cloud boss (8)
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=8}] run bossbar set minecraft:guardian players @a[team=aquaTeam] 
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=8}] run function skyisland:cloud_bossbar
#Increments Map Score if boss is dead
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=8}] unless entity @e[type=minecraft:evoker,tag=guardian,limit=1] run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1

#Stage 4 Survival Key (Progress Nums: 9-10)
#-- Place Master core in power room (9)
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=9}] at @e[tag=aquaTeamb] if block ~-5 ~1 ~ minecraft:nether_wart_block run function skyisland:pow_key
#Increment Map
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=9}] at @e[tag=aquaTeamb] if block ~-5 ~1 ~ minecraft:nether_wart_block run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
#==================
# Possible BUG
#If 2 teams execute the timer at the same time, they might break my program, find a way to still increment the mapProgress if the slimes score is 4
# FIX
#Need a way to allow players to initiate the powerCore ritual for a key of survival, by respawning boss or something
#===================
#--Begin a timer that will activate nether wart block has been placed (10)
#Adds one to counter, and runs commands based on the timer's values
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=10}] if entity @a[team=aquaTeam,limit=1] if score powTimer time matches 1.. run scoreboard players add powTimer time 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=10}] at @e[tag=aquaTeamb] if score powTimer time matches 1.. run function skyisland:pow_timer
#Increment Map Score
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=10}] if score powTimer time matches 315 run scoreboard players set @e[tag=aquaTeamCen] time 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=10}] if score powTimer time matches 320 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
#Timer has reached 325
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=10..11}] if score powTimer time matches 320 run scoreboard players reset powTimer time

#Stage 5 Pillager Raid (Progress Nums: 11-27)
#Give players bad_omen lvl4 effect after 8 minutes 
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=11}] if entity @a[team=aquaTeam,limit=1] if score @e[tag=aquaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=aquaTeamCen] time 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=11}] if score @e[tag=aquaTeamCen,limit=1] time matches 9600.. at @e[tag=aquaTeamCen] run effect give @a[team=aquaTeam] minecraft:bad_omen 1000000 3 true 
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=11}] if score @e[tag=aquaTeamCen,limit=1] time matches 9600.. run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=11}] if score @e[tag=aquaTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=aquaTeamh] raidControl 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=11}] if score @e[tag=aquaTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=aquaTeamCen] raidControl 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=11}] if score @e[tag=aquaTeamCen,limit=1] time matches 9600.. run title @a[distance=..150] title [{"text":"AHH! The","color":"aqua","bold":true},{"text":" Pillagers","color":"dark_red","bold":true},{"text":"!?!?","color":"aqua","bold":true}]
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=11}] if score @e[tag=aquaTeamCen,limit=1] time matches 9600.. run title @a[distance=..150] subtitle [{"text":"It was only a matter of time...!","color":"white"}]
#Add one to map progress, once bad omen effect gets applied
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=11}] if score @e[tag=aquaTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=aquaTeamCen] time 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=11}] if score @e[tag=aquaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1

#--Initiates Final Raid (13-15) that based on how many villagers survive, they will get a good item
# Wave #1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=12}] if entity @a[team=aquaTeam,limit=1] if score @e[tag=aquaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=aquaTeamCen] time 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=12}] if score @e[tag=aquaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=aquaTeamCen] time 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=12}] if score @e[tag=aquaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 0..5 at @e[tag=aquaTeamCen] run function skyisland:aqua/raid_max
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run teleport @s @e[tag=aquaTeamh,limit=1]
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run playsound minecraft:event.raid.horn master @a[team=aquaTeam] ~ ~ ~ 100
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl -= @e[tag=aqua_raid] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamCen] raidControl -= @e[tag=aquaTeamh] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl = @e[tag=aquaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=13}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 1 Complete","color":"red"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=13}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"You Ready Bro?","color":"aqua"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=13}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=13}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
# Wave #2
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=14}] if entity @a[team=aquaTeam,limit=1] if score @e[tag=aquaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=aquaTeamCen] time 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=14}] if score @e[tag=aquaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=aquaTeamCen] time 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=14}] if score @e[tag=aquaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 0..5 at @e[tag=aquaTeamCen] run function skyisland:aqua/raid_max
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run teleport @s @e[tag=aquaTeamh,limit=1]
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run playsound minecraft:event.raid.horn master @a[team=aquaTeam] ~ ~ ~ 100
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl -= @e[tag=aqua_raid] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamCen] raidControl -= @e[tag=aquaTeamh] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl = @e[tag=aquaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=15}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 2 Complete","color":"red"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=15}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"These pillagers suck so bad bruh xD","color":"aqua"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=15}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=15}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
# Wave #3
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=16}] if entity @a[team=aquaTeam,limit=1] if score @e[tag=aquaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=aquaTeamCen] time 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=16}] if score @e[tag=aquaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=aquaTeamCen] time 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=16}] if score @e[tag=aquaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 0..5 at @e[tag=aquaTeamCen] run function skyisland:aqua/raid_max
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run teleport @s @e[tag=aquaTeamh,limit=1]
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run playsound minecraft:event.raid.horn master @a[team=aquaTeam] ~ ~ ~ 100
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wav
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl -= @e[tag=aqua_raid] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamCen] raidControl -= @e[tag=aquaTeamh] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl = @e[tag=aquaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=17}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 3 Complete","color":"red"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=17}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Is this even a challenge!","color":"aqua"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=17}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=17}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
# Wave #4
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=18}] if entity @a[team=aquaTeam,limit=1] if score @e[tag=aquaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=aquaTeamCen] time 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=18}] if score @e[tag=aquaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=aquaTeamCen] time 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=18}] if score @e[tag=aquaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 0..5 at @e[tag=aquaTeamCen] run function skyisland:aqua/raid_max
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run teleport @s @e[tag=aquaTeamh,limit=1]
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run playsound minecraft:event.raid.horn master @a[team=aquaTeam] ~ ~ ~ 100
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl -= @e[tag=aqua_raid] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamCen] raidControl -= @e[tag=aquaTeamh] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl = @e[tag=aquaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=19}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 4 Complete","color":"red"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=19}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"If you died already... oh boy","color":"aqua"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=19}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=19}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
# Wave #5
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=20}] if entity @a[team=aquaTeam,limit=1] if score @e[tag=aquaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=aquaTeamCen] time 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=20}] if score @e[tag=aquaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=aquaTeamCen] time 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=20}] if score @e[tag=aquaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 0..5 at @e[tag=aquaTeamCen] run function skyisland:aqua/raid_max
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run teleport @s @e[tag=aquaTeamh,limit=1]
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run playsound minecraft:event.raid.horn master @a[team=aquaTeam] ~ ~ ~ 100
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl -= @e[tag=aqua_raid] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamCen] raidControl -= @e[tag=aquaTeamh] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl = @e[tag=aquaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=21}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 5 Complete","color":"red"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=21}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Pfft, that one was a lil too easy","color":"aqua"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=21}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=21}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
# Wave #6
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=22}] if entity @a[team=aquaTeam,limit=1] if score @e[tag=aquaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=aquaTeamCen] time 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=22}] if score @e[tag=aquaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=aquaTeamCen] time 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=22}] if score @e[tag=aquaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 0..5 at @e[tag=aquaTeamCen] run function skyisland:aqua/raid_max
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run teleport @s @e[tag=aquaTeamh,limit=1]
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=aquaTeam] ~ ~ ~ 100
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl -= @e[tag=aqua_raid] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamCen] raidControl -= @e[tag=aquaTeamh] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl = @e[tag=aquaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=23}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 6 Complete","color":"red"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=23}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Alright, here comes a hard wave","color":"aqua"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=23}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=23}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
# Wave #7
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=24}] if entity @a[team=aquaTeam,limit=1] if score @e[tag=aquaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=aquaTeamCen] time 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=24}] if score @e[tag=aquaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=aquaTeamCen] time 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=24}] if score @e[tag=aquaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 0..5 at @e[tag=aquaTeamCen] run function skyisland:aqua/raid_max
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run teleport @s @e[tag=aquaTeamh,limit=1]
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=aquaTeam] ~ ~ ~ 100
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl -= @e[tag=aqua_raid] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamCen] raidControl -= @e[tag=aquaTeamh] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl = @e[tag=aquaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=25}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 7 Complete","color":"red"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=25}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Next wave is impossible... xD","color":"aqua"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=25}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=25}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
# Wave #8
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=26}] if entity @a[team=aquaTeam,limit=1] if score @e[tag=aquaTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=aquaTeamCen] time 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=26}] if score @e[tag=aquaTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=aquaTeamCen] time 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=26}] if score @e[tag=aquaTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 0..5 at @e[tag=aquaTeamCen] run function skyisland:aqua/raid_max
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 as @e[tag=aqua_raid] run teleport @s @e[tag=aquaTeamh,limit=1]
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 at @e[tag=aquaTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=aquaTeam] ~ ~ ~ 100
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl -= @e[tag=aqua_raid] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamCen] raidControl -= @e[tag=aquaTeamh] raidControl
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=aquaTeamh] raidControl = @e[tag=aquaTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=27}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 8 Complete","color":"red"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=27}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Not bad...","color":"aqua"}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=27}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=27}] if score @e[tag=aquaTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1

#Stage 6 TP altar (Progress Nums: 28-30)
#--Checks if altar is setup correctly (20)
#Reset scoreboard 
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=28..30}] run scoreboard players set altarScore TPaltar 0
#Checking of blocks
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=28}] at @e[tag=aquaTeama] run function skyisland:tp_setup
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=28}] at @e[tag=aquaTeama] if score altarScore TPaltar matches 5 run setblock ~ ~16 ~ minecraft:light_blue_stained_glass replace
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=28}] at @e[tag=aquaTeama] if score altarScore TPaltar matches 5 run setblock ~ ~6 ~ minecraft:light_blue_stained_glass replace
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=28}] if score altarScore TPaltar matches 5 run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1

#--Sets All players on team to survival mode (21)
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=29}] run scoreboard players set @a[team=aquaTeam] survivalOn 1
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=29}] at @e[tag=aquaTeama] run fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 minecraft:diamond_ore replace
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=29}] at @e[tag=aquaTeama] run setblock ~ ~-2 ~ minecraft:emerald_block replace
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=29}] at @e[tag=aquaTeama] run advancement grant @a[team=aquaTeam] only mainisland:root
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=29}] run scoreboard players add @e[tag=aquaTeamCen] mapProgress 1

#--Initiates Altar TP (22)
#Resets score if player leaves altar
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=30}] at @e[tag=aquaTeama] unless entity @a[distance=..2] if score tpTimer time matches 1.. run title @a[distance=..4] actionbar {"text":"Cancelled Teleportation...","color":"red","bold":true}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=30}] at @e[tag=aquaTeama] unless entity @a[distance=..2] if score tpTimer time matches 1.. run scoreboard players set tpTimer time 0
#If player stays on altar
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=30}] at @e[tag=aquaTeama] if score tpTimer time matches 1..5 if entity @a[team=aquaTeam,distance=..10] run title @a[distance=..2] title {"text":" "}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=30}] at @e[tag=aquaTeama] if score tpTimer time matches 1..5 if entity @a[team=aquaTeam,distance=..10] run title @a[distance=..2] subtitle {"text":" "}
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=30}] at @e[tag=aquaTeama] if score tpTimer time matches 1.. if entity @a[team=aquaTeam,distance=..10] run particle portal ~ ~ ~ 0 .8 0 .3 8 force
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=30}] at @e[tag=aquaTeama] if score tpTimer time matches 1.. if entity @a[team=aquaTeam,distance=..10] run particle minecraft:end_rod ~ ~2 ~ .01 .01 .01 .1 1 force
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=30}] at @e[tag=aquaTeama] if score tpTimer time matches 1.. if entity @a[team=aquaTeam,distance=..10] run particle minecraft:happy_villager ~ ~2 ~ .1 .1 .1 .1 1 force
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=30}] at @e[tag=aquaTeama] if score tpTimer time matches 1.. if entity @a[team=aquaTeam,distance=..2] run function skyisland:altartp
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=30}] at @e[tag=aquaTeama] if entity @a[team=aquaTeam,distance=..2] run scoreboard players add tpTimer time 1
#Actual Teleportation of Player -- BASED, ONLY CERTAIN TEAMS CAN USE

execute if entity @e[tag=aquaTeamCen,scores={mapProgress=30}] at @e[tag=aquaTeama] if score tpTimer time matches 330.. as @a[team=aquaTeam,distance=..2] run function skyisland:tpmain

#Makes Tp Altar unbreakable
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=30}] at @e[tag=aquaTeama] if entity @a[scores={survivalOn=1},distance=..15] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:iron_block
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=30}] at @e[tag=aquaTeama] if entity @a[scores={survivalOn=1},distance=..15] run fill ~ ~ ~ ~ ~ ~ minecraft:beacon
execute if entity @e[tag=aquaTeamCen,scores={mapProgress=30}] at @e[tag=aquaTeama] if entity @a[scores={survivalOn=1},distance=..15] run kill @e[type=item,distance=..3.5]

#Sets all players to survival if on aquaTeam
execute at @e[tag=aquaTeamCen] run gamemode survival @a[team=aquaTeam,scores={survivalOn=1},distance=..60]
execute at @e[tag=aquaTeamCen] run gamemode adventure @a[scores={survivalOn=0},distance=..80]
#Volcano TP thing
execute if entity @a[team=aquaTeam,scores={particles=0}] at @e[tag=aquaTeamv] run tellraw @a[team=aquaTeam,distance=..5] ["",{"text":"\n"},{"text":"<Jeffrey>","color":"gray"},{"text":" Hello "},{"selector":"@a[team=aquaTeam,distance=..5]","color":"gray"},{"text":"! My name is Jeffrey. To my right is a "},{"text":"one-time-use portal","color":"light_purple","bold":"true"},{"text":" to get out of here if y'all dont have any "},{"text":"diamonds","color":"gold"},{"text":". Bring me some "},{"text":"diamonds ","color":"gold"},{"text":"to trade to unlock more secrets!\n "}]
execute if entity @a[team=aquaTeam,scores={particles=0}] at @e[tag=aquaTeamv] if entity @a[team=aquaTeam,distance=..5] run scoreboard players add @a[team=aquaTeam] particles 1
execute if entity @a[team=aquaTeam,scores={particles=1}] at @e[tag=aquaTeamv] run title @a[distance=..0.75] title {"text":"One Way Ticket Used","color":"","bold":true}
execute if entity @a[team=aquaTeam,scores={particles=1}] at @e[tag=aquaTeamv] run title @a[distance=..0.75] subtitle {"text":"Bring Jeffrey Diamonds","color":"gold","bold":true}
execute if entity @a[team=aquaTeam,scores={particles=1}] at @e[tag=aquaTeamv] if entity @a[team=aquaTeam,distance=..0.75] run playsound minecraft:item.chorus_fruit.teleport master @a[team=aquaTeam,distance=..0.75] ~ ~ ~ 100
execute if entity @a[team=aquaTeam,scores={particles=0..1}] at @e[tag=aquaTeamv] if entity @a[team=aquaTeam,distance=..15] run summon area_effect_cloud ~ ~ ~ {Particle:effect,WaitTime:2}
execute if entity @a[team=aquaTeam,scores={particles=1}] at @e[tag=aquaTeamv] if entity @a[team=aquaTeam,distance=..0.75] run scoreboard players add @a[team=aquaTeam] particles 1
execute if entity @a[team=aquaTeam,scores={particles=2}] at @e[tag=aquaTeamv] run teleport @a[team=aquaTeam,distance=..0.75] @e[tag=aquaTeamCen,limit=1]
execute if entity @a[team=aquaTeam,scores={particles=2}] run scoreboard players reset @a[team=aquaTeam] particles

#---------
#Red Team 
#---------
#Unrelated to Progress NUMS
#==================
# Possible BUG
#Need to limit this to each island, not the entire map, MIGHT need to fix, or leave the same
#===================
#-- Spawns custom mobs, turns them off after they can teleport to main island
execute if entity @e[tag=redTeamCen,scores={mapProgress=0..29}] at @e[tag=redTeamCen] run function skyisland:skyisland_mobs
#If players finds hidden coal entrance
execute if entity @e[tag=redTeamCen,scores={mapProgress=0..29}] at @e[tag=redTeamtrap] unless block ~ ~ ~ minecraft:coal_block run setblock ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] replace
execute if entity @e[tag=redTeamCen,scores={mapProgress=0..29}] at @e[tag=redTeamtrap] if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run summon firework_rocket ~ ~2 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[I;10288939,4718585,16725712],FadeColors:[I;16777215]}]}}}}
execute if entity @e[tag=redTeamCen,scores={mapProgress=0..29}] at @e[tag=redTeamtrap] if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run kill @e[tag=redTeamtrap]
#-- If Player falls offs island
execute at @a run teleport @a[y=0,dy=9,team=redTeam] @e[tag=redTeamh,limit=1]

#Stage 0 - Get Island Ready For Players (Progress Nums: 0)
#Sets volcano one=way-ticket for players to 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=0}] run scoreboard players set @a[team=redTeam] particles 0
#Add one to the map progress level
execute if entity @e[tag=redTeamCen,scores={mapProgress=0}] run scoreboard players add @e[tag=redTeamCen] mapProgress 1

#Stage 1 -Altar Room (Progress Nums: 1-3)
#--Checks if player is in range of the altar armorstand (1)
execute if entity @e[tag=redTeamCen,scores={mapProgress=1}] at @e[tag=redTeamt] if entity @a[distance=..3,team=redTeam] run function skyisland:altenter
execute if entity @e[tag=redTeamCen,scores={mapProgress=1}] at @e[tag=redTeamt] if entity @a[distance=..3,team=redTeam] run scoreboard players add @e[tag=redTeamCen] mapProgress 1

#--Check for altar slime blocks (2)
#Reset scoreboard 
execute if entity @e[tag=redTeamCen,scores={mapProgress=2..3}] run scoreboard players set @e[tag=redTeamt] slimeCounter 0
#Particle Effects above altar
execute if entity @e[tag=redTeamCen,scores={mapProgress=2}] at @e[tag=redTeamt] if entity @a[team=redTeam,distance=..8] run summon minecraft:area_effect_cloud ~ ~2 ~ {Particle:witchMagic,WaitTime:10}
#Checks for 4 slimeblocks
execute if entity @e[tag=redTeamCen,scores={mapProgress=2}] at @e[tag=redTeamt] if block ~2 ~ ~ minecraft:slime_block run scoreboard players add @e[tag=redTeamt] slimeCounter 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=2}] at @e[tag=redTeamt] if block ~-2 ~ ~ minecraft:slime_block run scoreboard players add @e[tag=redTeamt] slimeCounter 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=2}] at @e[tag=redTeamt] if block ~ ~ ~2 minecraft:slime_block run scoreboard players add @e[tag=redTeamt] slimeCounter 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=2}] at @e[tag=redTeamt] if block ~ ~ ~-2 minecraft:slime_block run scoreboard players add @e[tag=redTeamt] slimeCounter 1
#If 4 Slime Blocks
execute if entity @e[tag=redTeamCen,scores={mapProgress=2}] at @e[tag=redTeamt] if entity @e[tag=redTeamt,scores={slimeCounter=4}] run function skyisland:altslime
#Increment Map Score
execute if entity @e[tag=redTeamCen,scores={mapProgress=2}] if entity @e[tag=redTeamt,scores={slimeCounter=4}] run scoreboard players add @e[tag=redTeamCen] mapProgress 1

#--Begin a timer that will activate once 4 slime blocks have been placed (3)
#Adds one to counter, and runs commands based on the timer's values
execute if entity @e[tag=redTeamCen,scores={mapProgress=3}] if entity @a[team=redTeam,limit=1] if score alt_timer time matches 1.. run scoreboard players add alt_timer time 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=3}] at @e[tag=redTeamt] if score alt_timer time matches 1.. run function skyisland:alt_timer
#==================
# Possible BUG
#If 2 teams execute the timer at the same time, they might break my program, find a way to still increment the mapProgress if the slimes score is 4
# FIX
#Need a way to allow players to reinitiate the slimeblock ritual for a power core
#===================
#Increment Map Score
execute if entity @e[tag=redTeamCen,scores={mapProgress=3}] if score alt_timer time matches 320 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
#Timer has reached 320
execute if entity @e[tag=redTeamCen,scores={mapProgress=3..4}] if score alt_timer time matches 320 run scoreboard players reset alt_timer time 

#Stage 2 -Power Room (Progress Nums: 4-5)
#--Unlock the power room (4)
execute if entity @e[tag=redTeamCen,scores={mapProgress=4}] at @e[tag=redTeamb] if block ~9 ~1 ~-1 minecraft:sea_lantern run function skyisland:pow_unlock
#Increment Map Score
execute if entity @e[tag=redTeamCen,scores={mapProgress=4}] at @e[tag=redTeamb] if block ~9 ~1 ~-1 minecraft:sea_lantern run scoreboard players add @e[tag=redTeamCen] mapProgress 1

#-- Spawns Mobs in Power room (5)
execute if entity @e[tag=redTeamCen,scores={mapProgress=5}] at @e[tag=redTeamb] if entity @a[distance=..3.5,team=redTeam] run function skyisland:pow_mobs
#Increment Map Score
execute if entity @e[tag=redTeamCen,scores={mapProgress=5}] at @e[tag=redTeamb] if entity @a[distance=..3.5,team=redTeam] run scoreboard players add @e[tag=redTeamCen] mapProgress 1

#Stage 3 -Cloud City (Progress Nums: 6-8)
#-- Unlocks Cloud Area (6)
execute if entity @e[tag=redTeamCen,scores={mapProgress=6}] at @e[tag=redTeamb] if entity @a[distance=..1,team=redTeam] at @e[tag=redTeamc] run function skyisland:cloud_unlock
execute if entity @e[tag=redTeamCen,scores={mapProgress=6..9}] at @e[tag=redTeamb] if entity @a[distance=..6,team=redTeam] run particle minecraft:happy_villager ~-5 ~1.5 ~ .8 .8 .8 .1 1 force
#Increments Map Score
execute if entity @e[tag=redTeamCen,scores={mapProgress=6}] at @e[tag=redTeamb] if entity @a[distance=..1,team=redTeam] at @e[tag=redTeamc] run scoreboard players add @e[tag=redTeamCen] mapProgress 1

#--Spawns in a cloud boss (7)
execute if entity @e[tag=redTeamCen,scores={mapProgress=7}] at @e[tag=redTeamc] if entity @a[distance=..3,team=redTeam] run function skyisland:cloud_boss
#Increments Map Score
execute if entity @e[tag=redTeamCen,scores={mapProgress=7}] at @e[tag=redTeamc] if entity @a[distance=..3,team=redTeam] run scoreboard players add @e[tag=redTeamCen] mapProgress 1

#-- Updates boss bar for cloud boss (8)
execute if entity @e[tag=redTeamCen,scores={mapProgress=8}] run bossbar set minecraft:guardian players @a[team=redTeam] 
execute if entity @e[tag=redTeamCen,scores={mapProgress=8}] run function skyisland:cloud_bossbar
#Increments Map Score if boss is dead
execute if entity @e[tag=redTeamCen,scores={mapProgress=8}] unless entity @e[type=minecraft:evoker,tag=guardian,limit=1] run scoreboard players add @e[tag=redTeamCen] mapProgress 1

#Stage 4 Survival Key (Progress Nums: 9-10)
#-- Place Master core in power room (9)
execute if entity @e[tag=redTeamCen,scores={mapProgress=9}] at @e[tag=redTeamb] if block ~-5 ~1 ~ minecraft:nether_wart_block run function skyisland:pow_key
#Increment Map
execute if entity @e[tag=redTeamCen,scores={mapProgress=9}] at @e[tag=redTeamb] if block ~-5 ~1 ~ minecraft:nether_wart_block run scoreboard players add @e[tag=redTeamCen] mapProgress 1
#==================
# Possible BUG
#If 2 teams execute the timer at the same time, they might break my program, find a way to still increment the mapProgress if the slimes score is 4
# FIX
#Need a way to allow players to initiate the powerCore ritual for a key of survival, by respawning boss or something
#===================
#--Begin a timer that will activate nether wart block has been placed (10)
#Adds one to counter, and runs commands based on the timer's values
execute if entity @e[tag=redTeamCen,scores={mapProgress=10}] if entity @a[team=redTeam,limit=1] if score powTimer time matches 1.. run scoreboard players add powTimer time 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=10}] at @e[tag=redTeamb] if score powTimer time matches 1.. run function skyisland:pow_timer
#Increment Map Score
execute if entity @e[tag=redTeamCen,scores={mapProgress=10}] if score powTimer time matches 315 run scoreboard players set @e[tag=redTeamCen] time 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=10}] if score powTimer time matches 320 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
#Timer has reached 325
execute if entity @e[tag=redTeamCen,scores={mapProgress=10..11}] if score powTimer time matches 320 run scoreboard players reset powTimer time

#Stage 5 Pillager Raid (Progress Nums: 11-27)
#Give players bad_omen lvl4 effect after 8 minutes 
execute if entity @e[tag=redTeamCen,scores={mapProgress=11}] if entity @a[team=redTeam,limit=1] if score @e[tag=redTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=redTeamCen] time 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=11}] if score @e[tag=redTeamCen,limit=1] time matches 9600.. at @e[tag=redTeamCen] run effect give @a[team=redTeam] minecraft:bad_omen 1000000 3 true 
execute if entity @e[tag=redTeamCen,scores={mapProgress=11}] if score @e[tag=redTeamCen,limit=1] time matches 9600.. run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=11}] if score @e[tag=redTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=redTeamh] raidControl 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=11}] if score @e[tag=redTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=redTeamCen] raidControl 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=11}] if score @e[tag=redTeamCen,limit=1] time matches 9600.. run title @a[distance=..150] title [{"text":"AHH! The","color":"aqua","bold":true},{"text":" Pillagers","color":"dark_red","bold":true},{"text":"!?!?","color":"aqua","bold":true}]
execute if entity @e[tag=redTeamCen,scores={mapProgress=11}] if score @e[tag=redTeamCen,limit=1] time matches 9600.. run title @a[distance=..150] subtitle [{"text":"It was only a matter of time...!","color":"white"}]
#Add one to map progress, once bad omen effect gets applied
execute if entity @e[tag=redTeamCen,scores={mapProgress=11}] if score @e[tag=redTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=redTeamCen] time 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=11}] if score @e[tag=redTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1

#--Initiates Final Raid (13-15) that based on how many villagers survive, they will get a good item
# Wave #1
execute if entity @e[tag=redTeamCen,scores={mapProgress=12}] if entity @a[team=redTeam,limit=1] if score @e[tag=redTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=redTeamCen] time 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=12}] if score @e[tag=redTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=redTeamCen] time 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=12}] if score @e[tag=redTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 0..5 at @e[tag=redTeamCen] run function skyisland:red/raid_max
execute if entity @e[tag=redTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=redTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run teleport @s @e[tag=redTeamh,limit=1]
execute if entity @e[tag=redTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=redTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run playsound minecraft:event.raid.horn master @a[team=redTeam] ~ ~ ~ 100
execute if entity @e[tag=redTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl -= @e[tag=red_raid] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamCen] raidControl -= @e[tag=redTeamh] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl = @e[tag=redTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=13}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 1 Complete","color":"red"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=13}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"You Ready Bro?","color":"aqua"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=13}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=13}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
# Wave #2
execute if entity @e[tag=redTeamCen,scores={mapProgress=14}] if entity @a[team=redTeam,limit=1] if score @e[tag=redTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=redTeamCen] time 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=14}] if score @e[tag=redTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=redTeamCen] time 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=14}] if score @e[tag=redTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 0..5 at @e[tag=redTeamCen] run function skyisland:red/raid_max
execute if entity @e[tag=redTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=redTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run teleport @s @e[tag=redTeamh,limit=1]
execute if entity @e[tag=redTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=redTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run playsound minecraft:event.raid.horn master @a[team=redTeam] ~ ~ ~ 100
execute if entity @e[tag=redTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl -= @e[tag=red_raid] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamCen] raidControl -= @e[tag=redTeamh] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl = @e[tag=redTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=15}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 2 Complete","color":"red"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=15}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"These pillagers suck so bad bruh xD","color":"aqua"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=15}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=15}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
# Wave #3
execute if entity @e[tag=redTeamCen,scores={mapProgress=16}] if entity @a[team=redTeam,limit=1] if score @e[tag=redTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=redTeamCen] time 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=16}] if score @e[tag=redTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=redTeamCen] time 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=16}] if score @e[tag=redTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 0..5 at @e[tag=redTeamCen] run function skyisland:red/raid_max
execute if entity @e[tag=redTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=redTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run teleport @s @e[tag=redTeamh,limit=1]
execute if entity @e[tag=redTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=redTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run playsound minecraft:event.raid.horn master @a[team=redTeam] ~ ~ ~ 100
execute if entity @e[tag=redTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wav
execute if entity @e[tag=redTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl -= @e[tag=red_raid] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamCen] raidControl -= @e[tag=redTeamh] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl = @e[tag=redTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=17}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 3 Complete","color":"red"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=17}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Is this even a challenge!","color":"aqua"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=17}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=17}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
# Wave #4
execute if entity @e[tag=redTeamCen,scores={mapProgress=18}] if entity @a[team=redTeam,limit=1] if score @e[tag=redTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=redTeamCen] time 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=18}] if score @e[tag=redTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=redTeamCen] time 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=18}] if score @e[tag=redTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 0..5 at @e[tag=redTeamCen] run function skyisland:red/raid_max
execute if entity @e[tag=redTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=redTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run teleport @s @e[tag=redTeamh,limit=1]
execute if entity @e[tag=redTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=redTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run playsound minecraft:event.raid.horn master @a[team=redTeam] ~ ~ ~ 100
execute if entity @e[tag=redTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl -= @e[tag=red_raid] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamCen] raidControl -= @e[tag=redTeamh] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl = @e[tag=redTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=19}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 4 Complete","color":"red"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=19}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"If you died already... oh boy","color":"aqua"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=19}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=19}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
# Wave #5
execute if entity @e[tag=redTeamCen,scores={mapProgress=20}] if entity @a[team=redTeam,limit=1] if score @e[tag=redTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=redTeamCen] time 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=20}] if score @e[tag=redTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=redTeamCen] time 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=20}] if score @e[tag=redTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 0..5 at @e[tag=redTeamCen] run function skyisland:red/raid_max
execute if entity @e[tag=redTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=redTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run teleport @s @e[tag=redTeamh,limit=1]
execute if entity @e[tag=redTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=redTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run playsound minecraft:event.raid.horn master @a[team=redTeam] ~ ~ ~ 100
execute if entity @e[tag=redTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl -= @e[tag=red_raid] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamCen] raidControl -= @e[tag=redTeamh] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl = @e[tag=redTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=21}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 5 Complete","color":"red"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=21}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Pfft, that one was a lil too easy","color":"aqua"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=21}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=21}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
# Wave #6
execute if entity @e[tag=redTeamCen,scores={mapProgress=22}] if entity @a[team=redTeam,limit=1] if score @e[tag=redTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=redTeamCen] time 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=22}] if score @e[tag=redTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=redTeamCen] time 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=22}] if score @e[tag=redTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 0..5 at @e[tag=redTeamCen] run function skyisland:red/raid_max
execute if entity @e[tag=redTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=redTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run teleport @s @e[tag=redTeamh,limit=1]
execute if entity @e[tag=redTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=redTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=redTeam] ~ ~ ~ 100
execute if entity @e[tag=redTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl -= @e[tag=red_raid] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamCen] raidControl -= @e[tag=redTeamh] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl = @e[tag=redTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=23}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 6 Complete","color":"red"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=23}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Alright, here comes a hard wave","color":"aqua"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=23}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=23}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
# Wave #7
execute if entity @e[tag=redTeamCen,scores={mapProgress=24}] if entity @a[team=redTeam,limit=1] if score @e[tag=redTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=redTeamCen] time 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=24}] if score @e[tag=redTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=redTeamCen] time 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=24}] if score @e[tag=redTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 0..5 at @e[tag=redTeamCen] run function skyisland:red/raid_max
execute if entity @e[tag=redTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=redTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run teleport @s @e[tag=redTeamh,limit=1]
execute if entity @e[tag=redTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=redTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=redTeam] ~ ~ ~ 100
execute if entity @e[tag=redTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl -= @e[tag=red_raid] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamCen] raidControl -= @e[tag=redTeamh] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl = @e[tag=redTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=25}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 7 Complete","color":"red"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=25}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Next wave is impossible... xD","color":"aqua"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=25}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=25}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
# Wave #8
execute if entity @e[tag=redTeamCen,scores={mapProgress=26}] if entity @a[team=redTeam,limit=1] if score @e[tag=redTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=redTeamCen] time 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=26}] if score @e[tag=redTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=redTeamCen] time 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=26}] if score @e[tag=redTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 0..5 at @e[tag=redTeamCen] run function skyisland:red/raid_max
execute if entity @e[tag=redTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=redTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 as @e[tag=red_raid] run teleport @s @e[tag=redTeamh,limit=1]
execute if entity @e[tag=redTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=redTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 at @e[tag=redTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=redTeam] ~ ~ ~ 100
execute if entity @e[tag=redTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl -= @e[tag=red_raid] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamCen] raidControl -= @e[tag=redTeamh] raidControl
execute if entity @e[tag=redTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=redTeamh] raidControl = @e[tag=redTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=redTeamCen,scores={mapProgress=27}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 8 Complete","color":"red"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=27}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Not bad...","color":"aqua"}
execute if entity @e[tag=redTeamCen,scores={mapProgress=27}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=redTeamCen,scores={mapProgress=27}] if score @e[tag=redTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=redTeamCen] mapProgress 1

#Stage 6 TP altar (Progress Nums: 28-30)
#--Checks if altar is setup correctly (20)
#Reset scoreboard 
execute if entity @e[tag=redTeamCen,scores={mapProgress=28..30}] run scoreboard players set altarScore TPaltar 0
#Checking of blocks
execute if entity @e[tag=redTeamCen,scores={mapProgress=28}] at @e[tag=redTeama] run function skyisland:tp_setup
execute if entity @e[tag=redTeamCen,scores={mapProgress=28}] at @e[tag=redTeama] if score altarScore TPaltar matches 5 run setblock ~ ~16 ~ minecraft:red_stained_glass replace
execute if entity @e[tag=redTeamCen,scores={mapProgress=28}] at @e[tag=redTeama] if score altarScore TPaltar matches 5 run setblock ~ ~6 ~ minecraft:red_stained_glass replace
execute if entity @e[tag=redTeamCen,scores={mapProgress=28}] if score altarScore TPaltar matches 5 run scoreboard players add @e[tag=redTeamCen] mapProgress 1

#--Sets All players on team to survival mode (21)
execute if entity @e[tag=redTeamCen,scores={mapProgress=29}] run scoreboard players set @a[team=redTeam] survivalOn 1
execute if entity @e[tag=redTeamCen,scores={mapProgress=29}] at @e[tag=redTeama] run fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 minecraft:diamond_ore replace
execute if entity @e[tag=redTeamCen,scores={mapProgress=29}] at @e[tag=redTeama] run setblock ~ ~-2 ~ minecraft:emerald_block replace
execute if entity @e[tag=redTeamCen,scores={mapProgress=29}] at @e[tag=redTeama] run advancement grant @a[team=redTeam] only mainisland:root
execute if entity @e[tag=redTeamCen,scores={mapProgress=29}] run scoreboard players add @e[tag=redTeamCen] mapProgress 1

#--Initiates Altar TP (22)
#Resets score if player leaves altar
execute if entity @e[tag=redTeamCen,scores={mapProgress=30}] at @e[tag=redTeama] unless entity @a[distance=..2] if score tpTimer time matches 1.. run title @a[distance=..4] actionbar {"text":"Cancelled Teleportation...","color":"red","bold":true}
execute if entity @e[tag=redTeamCen,scores={mapProgress=30}] at @e[tag=redTeama] unless entity @a[distance=..2] if score tpTimer time matches 1.. run scoreboard players set tpTimer time 0
#If player stays on altar
execute if entity @e[tag=redTeamCen,scores={mapProgress=30}] at @e[tag=redTeama] if score tpTimer time matches 1..5 if entity @a[team=redTeam,distance=..10] run title @a[distance=..2] title {"text":" "}
execute if entity @e[tag=redTeamCen,scores={mapProgress=30}] at @e[tag=redTeama] if score tpTimer time matches 1..5 if entity @a[team=redTeam,distance=..10] run title @a[distance=..2] subtitle {"text":" "}
execute if entity @e[tag=redTeamCen,scores={mapProgress=30}] at @e[tag=redTeama] if score tpTimer time matches 1.. if entity @a[team=redTeam,distance=..10] run particle portal ~ ~ ~ 0 .8 0 .3 8 force
execute if entity @e[tag=redTeamCen,scores={mapProgress=30}] at @e[tag=redTeama] if score tpTimer time matches 1.. if entity @a[team=redTeam,distance=..10] run particle minecraft:end_rod ~ ~2 ~ .01 .01 .01 .1 1 force
execute if entity @e[tag=redTeamCen,scores={mapProgress=30}] at @e[tag=redTeama] if score tpTimer time matches 1.. if entity @a[team=redTeam,distance=..10] run particle minecraft:happy_villager ~ ~2 ~ .1 .1 .1 .1 1 force
execute if entity @e[tag=redTeamCen,scores={mapProgress=30}] at @e[tag=redTeama] if score tpTimer time matches 1.. if entity @a[team=redTeam,distance=..2] run function skyisland:altartp
execute if entity @e[tag=redTeamCen,scores={mapProgress=30}] at @e[tag=redTeama] if entity @a[team=redTeam,distance=..2] run scoreboard players add tpTimer time 1
#Actual Teleportation of Player -- BASED, ONLY CERTAIN TEAMS CAN USE

execute if entity @e[tag=redTeamCen,scores={mapProgress=30}] at @e[tag=redTeama] if score tpTimer time matches 330.. as @a[team=redTeam,distance=..2] run function skyisland:tpmain

#Makes Tp Altar unbreakable
execute if entity @e[tag=redTeamCen,scores={mapProgress=30}] at @e[tag=redTeama] if entity @a[scores={survivalOn=1},distance=..15] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:iron_block
execute if entity @e[tag=redTeamCen,scores={mapProgress=30}] at @e[tag=redTeama] if entity @a[scores={survivalOn=1},distance=..15] run fill ~ ~ ~ ~ ~ ~ minecraft:beacon
execute if entity @e[tag=redTeamCen,scores={mapProgress=30}] at @e[tag=redTeama] if entity @a[scores={survivalOn=1},distance=..15] run kill @e[type=item,distance=..3.5]

#Sets all players to survival if on redTeam
execute at @e[tag=redTeamCen] run gamemode survival @a[team=redTeam,scores={survivalOn=1},distance=..60]
execute at @e[tag=redTeamCen] run gamemode adventure @a[scores={survivalOn=0},distance=..80]
#Volcano TP thing
execute if entity @a[team=redTeam,scores={particles=0}] at @e[tag=redTeamv] run tellraw @a[team=redTeam,distance=..5] ["",{"text":"\n"},{"text":"<Jeffrey>","color":"gray"},{"text":" Hello "},{"selector":"@a[team=redTeam,distance=..5]","color":"gray"},{"text":"! My name is Jeffrey. To my right is a "},{"text":"one-time-use portal","color":"light_purple","bold":"true"},{"text":" to get out of here if y'all dont have any "},{"text":"diamonds","color":"gold"},{"text":". Bring me some "},{"text":"diamonds ","color":"gold"},{"text":"to trade to unlock more secrets!\n "}]
execute if entity @a[team=redTeam,scores={particles=0}] at @e[tag=redTeamv] if entity @a[team=redTeam,distance=..5] run scoreboard players add @a[team=redTeam] particles 1
execute if entity @a[team=redTeam,scores={particles=1}] at @e[tag=redTeamv] run title @a[distance=..0.75] title {"text":"One Way Ticket Used","color":"","bold":true}
execute if entity @a[team=redTeam,scores={particles=1}] at @e[tag=redTeamv] run title @a[distance=..0.75] subtitle {"text":"Bring Jeffrey Diamonds","color":"gold","bold":true}
execute if entity @a[team=redTeam,scores={particles=1}] at @e[tag=redTeamv] if entity @a[team=redTeam,distance=..0.75] run playsound minecraft:item.chorus_fruit.teleport master @a[team=redTeam,distance=..0.75] ~ ~ ~ 100
execute if entity @a[team=redTeam,scores={particles=0..1}] at @e[tag=redTeamv] if entity @a[team=redTeam,distance=..15] run summon area_effect_cloud ~ ~ ~ {Particle:effect,WaitTime:2}
execute if entity @a[team=redTeam,scores={particles=1}] at @e[tag=redTeamv] if entity @a[team=redTeam,distance=..0.75] run scoreboard players add @a[team=redTeam] particles 1
execute if entity @a[team=redTeam,scores={particles=2}] at @e[tag=redTeamv] run teleport @a[team=redTeam,distance=..0.75] @e[tag=redTeamCen,limit=1]
execute if entity @a[team=redTeam,scores={particles=2}] run scoreboard players reset @a[team=redTeam] particles

#---------
#Yellow Team 
#---------
#Unrelated to Progress NUMS
#==================
# Possible BUG
#Need to limit this to each island, not the entire map, MIGHT need to fix, or leave the same
#===================
#-- Spawns custom mobs, turns them off after they can teleport to main island
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=0..29}] at @e[tag=yellowTeamCen] run function skyisland:skyisland_mobs
#If players finds hidden coal entrance
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=0..29}] at @e[tag=yellowTeamtrap] unless block ~ ~ ~ minecraft:coal_block run setblock ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] replace
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=0..29}] at @e[tag=yellowTeamtrap] if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run summon firework_rocket ~ ~2 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[I;10288939,4718585,16725712],FadeColors:[I;16777215]}]}}}}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=0..29}] at @e[tag=yellowTeamtrap] if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run kill @e[tag=yellowTeamtrap]
#-- If Player falls offs island
execute at @a run teleport @a[y=0,dy=9,team=yellowTeam] @e[tag=yellowTeamh,limit=1]

#Stage 0 - Get Island Ready For Players (Progress Nums: 0)
#Sets volcano one=way-ticket for players to 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=0}] run scoreboard players set @a[team=yellowTeam] particles 0
#Add one to the map progress level
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=0}] run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1

#Stage 1 -Altar Room (Progress Nums: 1-3)
#--Checks if player is in range of the altar armorstand (1)
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=1}] at @e[tag=yellowTeamt] if entity @a[distance=..3,team=yellowTeam] run function skyisland:altenter
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=1}] at @e[tag=yellowTeamt] if entity @a[distance=..3,team=yellowTeam] run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1

#--Check for altar slime blocks (2)
#Reset scoreboard 
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=2..3}] run scoreboard players set @e[tag=yellowTeamt] slimeCounter 0
#Particle Effects above altar
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=2}] at @e[tag=yellowTeamt] if entity @a[team=yellowTeam,distance=..8] run summon minecraft:area_effect_cloud ~ ~2 ~ {Particle:witchMagic,WaitTime:10}
#Checks for 4 slimeblocks
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=2}] at @e[tag=yellowTeamt] if block ~2 ~ ~ minecraft:slime_block run scoreboard players add @e[tag=yellowTeamt] slimeCounter 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=2}] at @e[tag=yellowTeamt] if block ~-2 ~ ~ minecraft:slime_block run scoreboard players add @e[tag=yellowTeamt] slimeCounter 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=2}] at @e[tag=yellowTeamt] if block ~ ~ ~2 minecraft:slime_block run scoreboard players add @e[tag=yellowTeamt] slimeCounter 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=2}] at @e[tag=yellowTeamt] if block ~ ~ ~-2 minecraft:slime_block run scoreboard players add @e[tag=yellowTeamt] slimeCounter 1
#If 4 Slime Blocks
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=2}] at @e[tag=yellowTeamt] if entity @e[tag=yellowTeamt,scores={slimeCounter=4}] run function skyisland:altslime
#Increment Map Score
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=2}] if entity @e[tag=yellowTeamt,scores={slimeCounter=4}] run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1

#--Begin a timer that will activate once 4 slime blocks have been placed (3)
#Adds one to counter, and runs commands based on the timer's values
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=3}] if entity @a[team=yellowTeam,limit=1] if score alt_timer time matches 1.. run scoreboard players add alt_timer time 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=3}] at @e[tag=yellowTeamt] if score alt_timer time matches 1.. run function skyisland:alt_timer
#==================
# Possible BUG
#If 2 teams execute the timer at the same time, they might break my program, find a way to still increment the mapProgress if the slimes score is 4
# FIX
#Need a way to allow players to reinitiate the slimeblock ritual for a power core
#===================
#Increment Map Score
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=3}] if score alt_timer time matches 320 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
#Timer has reached 320
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=3..4}] if score alt_timer time matches 320 run scoreboard players reset alt_timer time 

#Stage 2 -Power Room (Progress Nums: 4-5)
#--Unlock the power room (4)
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=4}] at @e[tag=yellowTeamb] if block ~9 ~1 ~-1 minecraft:sea_lantern run function skyisland:pow_unlock
#Increment Map Score
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=4}] at @e[tag=yellowTeamb] if block ~9 ~1 ~-1 minecraft:sea_lantern run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1

#-- Spawns Mobs in Power room (5)
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=5}] at @e[tag=yellowTeamb] if entity @a[distance=..3.5,team=yellowTeam] run function skyisland:pow_mobs
#Increment Map Score
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=5}] at @e[tag=yellowTeamb] if entity @a[distance=..3.5,team=yellowTeam] run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1

#Stage 3 -Cloud City (Progress Nums: 6-8)
#-- Unlocks Cloud Area (6)
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=6}] at @e[tag=yellowTeamb] if entity @a[distance=..1,team=yellowTeam] at @e[tag=yellowTeamc] run function skyisland:cloud_unlock
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=6..9}] at @e[tag=yellowTeamb] if entity @a[distance=..6,team=yellowTeam] run particle minecraft:happy_villager ~-5 ~1.5 ~ .8 .8 .8 .1 1 force
#Increments Map Score
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=6}] at @e[tag=yellowTeamb] if entity @a[distance=..1,team=yellowTeam] at @e[tag=yellowTeamc] run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1

#--Spawns in a cloud boss (7)
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=7}] at @e[tag=yellowTeamc] if entity @a[distance=..3,team=yellowTeam] run function skyisland:cloud_boss
#Increments Map Score
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=7}] at @e[tag=yellowTeamc] if entity @a[distance=..3,team=yellowTeam] run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1

#-- Updates boss bar for cloud boss (8)
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=8}] run bossbar set minecraft:guardian players @a[team=yellowTeam] 
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=8}] run function skyisland:cloud_bossbar
#Increments Map Score if boss is dead
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=8}] unless entity @e[type=minecraft:evoker,tag=guardian,limit=1] run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1

#Stage 4 Survival Key (Progress Nums: 9-10)
#-- Place Master core in power room (9)
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=9}] at @e[tag=yellowTeamb] if block ~-5 ~1 ~ minecraft:nether_wart_block run function skyisland:pow_key
#Increment Map
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=9}] at @e[tag=yellowTeamb] if block ~-5 ~1 ~ minecraft:nether_wart_block run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
#==================
# Possible BUG
#If 2 teams execute the timer at the same time, they might break my program, find a way to still increment the mapProgress if the slimes score is 4
# FIX
#Need a way to allow players to initiate the powerCore ritual for a key of survival, by respawning boss or something
#===================
#--Begin a timer that will activate nether wart block has been placed (10)
#Adds one to counter, and runs commands based on the timer's values
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=10}] if entity @a[team=yellowTeam,limit=1] if score powTimer time matches 1.. run scoreboard players add powTimer time 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=10}] at @e[tag=yellowTeamb] if score powTimer time matches 1.. run function skyisland:pow_timer
#Increment Map Score
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=10}] if score powTimer time matches 315 run scoreboard players set @e[tag=yellowTeamCen] time 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=10}] if score powTimer time matches 320 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
#Timer has reached 325
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=10..11}] if score powTimer time matches 320 run scoreboard players reset powTimer time

#Stage 5 Pillager Raid (Progress Nums: 11-27)
#Give players bad_omen lvl4 effect after 8 minutes 
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=11}] if entity @a[team=yellowTeam,limit=1] if score @e[tag=yellowTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=yellowTeamCen] time 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=11}] if score @e[tag=yellowTeamCen,limit=1] time matches 9600.. at @e[tag=yellowTeamCen] run effect give @a[team=yellowTeam] minecraft:bad_omen 1000000 3 true 
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=11}] if score @e[tag=yellowTeamCen,limit=1] time matches 9600.. run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=11}] if score @e[tag=yellowTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=yellowTeamh] raidControl 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=11}] if score @e[tag=yellowTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=yellowTeamCen] raidControl 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=11}] if score @e[tag=yellowTeamCen,limit=1] time matches 9600.. run title @a[distance=..150] title [{"text":"AHH! The","color":"aqua","bold":true},{"text":" Pillagers","color":"dark_red","bold":true},{"text":"!?!?","color":"aqua","bold":true}]
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=11}] if score @e[tag=yellowTeamCen,limit=1] time matches 9600.. run title @a[distance=..150] subtitle [{"text":"It was only a matter of time...!","color":"white"}]
#Add one to map progress, once bad omen effect gets applied
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=11}] if score @e[tag=yellowTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=yellowTeamCen] time 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=11}] if score @e[tag=yellowTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1

#--Initiates Final Raid (13-15) that based on how many villagers survive, they will get a good item
# Wave #1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=12}] if entity @a[team=yellowTeam,limit=1] if score @e[tag=yellowTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=yellowTeamCen] time 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=12}] if score @e[tag=yellowTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=yellowTeamCen] time 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=12}] if score @e[tag=yellowTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 0..5 at @e[tag=yellowTeamCen] run function skyisland:yellow/raid_max
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run teleport @s @e[tag=yellowTeamh,limit=1]
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run playsound minecraft:event.raid.horn master @a[team=yellowTeam] ~ ~ ~ 100
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl -= @e[tag=yellow_raid] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamCen] raidControl -= @e[tag=yellowTeamh] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl = @e[tag=yellowTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=13}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 1 Complete","color":"red"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=13}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"You Ready Bro?","color":"aqua"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=13}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=13}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
# Wave #2
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=14}] if entity @a[team=yellowTeam,limit=1] if score @e[tag=yellowTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=yellowTeamCen] time 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=14}] if score @e[tag=yellowTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=yellowTeamCen] time 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=14}] if score @e[tag=yellowTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 0..5 at @e[tag=yellowTeamCen] run function skyisland:yellow/raid_max
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run teleport @s @e[tag=yellowTeamh,limit=1]
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run playsound minecraft:event.raid.horn master @a[team=yellowTeam] ~ ~ ~ 100
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl -= @e[tag=yellow_raid] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamCen] raidControl -= @e[tag=yellowTeamh] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl = @e[tag=yellowTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=15}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 2 Complete","color":"red"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=15}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"These pillagers suck so bad bruh xD","color":"aqua"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=15}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=15}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
# Wave #3
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=16}] if entity @a[team=yellowTeam,limit=1] if score @e[tag=yellowTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=yellowTeamCen] time 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=16}] if score @e[tag=yellowTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=yellowTeamCen] time 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=16}] if score @e[tag=yellowTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 0..5 at @e[tag=yellowTeamCen] run function skyisland:yellow/raid_max
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run teleport @s @e[tag=yellowTeamh,limit=1]
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run playsound minecraft:event.raid.horn master @a[team=yellowTeam] ~ ~ ~ 100
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wav
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl -= @e[tag=yellow_raid] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamCen] raidControl -= @e[tag=yellowTeamh] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl = @e[tag=yellowTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=17}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 3 Complete","color":"red"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=17}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Is this even a challenge!","color":"aqua"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=17}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=17}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
# Wave #4
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=18}] if entity @a[team=yellowTeam,limit=1] if score @e[tag=yellowTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=yellowTeamCen] time 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=18}] if score @e[tag=yellowTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=yellowTeamCen] time 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=18}] if score @e[tag=yellowTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 0..5 at @e[tag=yellowTeamCen] run function skyisland:yellow/raid_max
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run teleport @s @e[tag=yellowTeamh,limit=1]
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run playsound minecraft:event.raid.horn master @a[team=yellowTeam] ~ ~ ~ 100
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl -= @e[tag=yellow_raid] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamCen] raidControl -= @e[tag=yellowTeamh] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl = @e[tag=yellowTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=19}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 4 Complete","color":"red"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=19}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"If you died already... oh boy","color":"aqua"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=19}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=19}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
# Wave #5
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=20}] if entity @a[team=yellowTeam,limit=1] if score @e[tag=yellowTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=yellowTeamCen] time 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=20}] if score @e[tag=yellowTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=yellowTeamCen] time 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=20}] if score @e[tag=yellowTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 0..5 at @e[tag=yellowTeamCen] run function skyisland:yellow/raid_max
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run teleport @s @e[tag=yellowTeamh,limit=1]
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run playsound minecraft:event.raid.horn master @a[team=yellowTeam] ~ ~ ~ 100
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl -= @e[tag=yellow_raid] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamCen] raidControl -= @e[tag=yellowTeamh] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl = @e[tag=yellowTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=21}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 5 Complete","color":"red"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=21}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Pfft, that one was a lil too easy","color":"aqua"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=21}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=21}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
# Wave #6
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=22}] if entity @a[team=yellowTeam,limit=1] if score @e[tag=yellowTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=yellowTeamCen] time 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=22}] if score @e[tag=yellowTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=yellowTeamCen] time 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=22}] if score @e[tag=yellowTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 0..5 at @e[tag=yellowTeamCen] run function skyisland:yellow/raid_max
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run teleport @s @e[tag=yellowTeamh,limit=1]
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=yellowTeam] ~ ~ ~ 100
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl -= @e[tag=yellow_raid] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamCen] raidControl -= @e[tag=yellowTeamh] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl = @e[tag=yellowTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=23}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 6 Complete","color":"red"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=23}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Alright, here comes a hard wave","color":"aqua"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=23}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=23}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
# Wave #7
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=24}] if entity @a[team=yellowTeam,limit=1] if score @e[tag=yellowTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=yellowTeamCen] time 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=24}] if score @e[tag=yellowTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=yellowTeamCen] time 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=24}] if score @e[tag=yellowTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 0..5 at @e[tag=yellowTeamCen] run function skyisland:yellow/raid_max
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run teleport @s @e[tag=yellowTeamh,limit=1]
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=yellowTeam] ~ ~ ~ 100
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl -= @e[tag=yellow_raid] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamCen] raidControl -= @e[tag=yellowTeamh] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl = @e[tag=yellowTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=25}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 7 Complete","color":"red"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=25}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Next wave is impossible... xD","color":"aqua"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=25}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=25}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
# Wave #8
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=26}] if entity @a[team=yellowTeam,limit=1] if score @e[tag=yellowTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=yellowTeamCen] time 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=26}] if score @e[tag=yellowTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=yellowTeamCen] time 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=26}] if score @e[tag=yellowTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 0..5 at @e[tag=yellowTeamCen] run function skyisland:yellow/raid_max
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 as @e[tag=yellow_raid] run teleport @s @e[tag=yellowTeamh,limit=1]
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 at @e[tag=yellowTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=yellowTeam] ~ ~ ~ 100
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl -= @e[tag=yellow_raid] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamCen] raidControl -= @e[tag=yellowTeamh] raidControl
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=yellowTeamh] raidControl = @e[tag=yellowTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=27}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 8 Complete","color":"red"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=27}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Not bad...","color":"aqua"}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=27}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=27}] if score @e[tag=yellowTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1

#Stage 6 TP altar (Progress Nums: 28-30)
#--Checks if altar is setup correctly (20)
#Reset scoreboard 
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=28..30}] run scoreboard players set altarScore TPaltar 0
#Checking of blocks
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=28}] at @e[tag=yellowTeama] run function skyisland:tp_setup
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=28}] at @e[tag=yellowTeama] if score altarScore TPaltar matches 5 run setblock ~ ~16 ~ minecraft:yellow_stained_glass replace
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=28}] at @e[tag=yellowTeama] if score altarScore TPaltar matches 5 run setblock ~ ~6 ~ minecraft:yellow_stained_glass replace
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=28}] if score altarScore TPaltar matches 5 run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1

#--Sets All players on team to survival mode (21)
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=29}] run scoreboard players set @a[team=yellowTeam] survivalOn 1
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=29}] at @e[tag=yellowTeama] run fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 minecraft:diamond_ore replace
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=29}] at @e[tag=yellowTeama] run setblock ~ ~-2 ~ minecraft:emerald_block replace
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=29}] at @e[tag=yellowTeama] run advancement grant @a[team=yellowTeam] only mainisland:root
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=29}] run scoreboard players add @e[tag=yellowTeamCen] mapProgress 1

#--Initiates Altar TP (22)
#Resets score if player leaves altar
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=30}] at @e[tag=yellowTeama] unless entity @a[distance=..2] if score tpTimer time matches 1.. run title @a[distance=..4] actionbar {"text":"Cancelled Teleportation...","color":"red","bold":true}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=30}] at @e[tag=yellowTeama] unless entity @a[distance=..2] if score tpTimer time matches 1.. run scoreboard players set tpTimer time 0
#If player stays on altar
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=30}] at @e[tag=yellowTeama] if score tpTimer time matches 1..5 if entity @a[team=yellowTeam,distance=..10] run title @a[distance=..2] title {"text":" "}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=30}] at @e[tag=yellowTeama] if score tpTimer time matches 1..5 if entity @a[team=yellowTeam,distance=..10] run title @a[distance=..2] subtitle {"text":" "}
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=30}] at @e[tag=yellowTeama] if score tpTimer time matches 1.. if entity @a[team=yellowTeam,distance=..10] run particle portal ~ ~ ~ 0 .8 0 .3 8 force
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=30}] at @e[tag=yellowTeama] if score tpTimer time matches 1.. if entity @a[team=yellowTeam,distance=..10] run particle minecraft:end_rod ~ ~2 ~ .01 .01 .01 .1 1 force
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=30}] at @e[tag=yellowTeama] if score tpTimer time matches 1.. if entity @a[team=yellowTeam,distance=..10] run particle minecraft:happy_villager ~ ~2 ~ .1 .1 .1 .1 1 force
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=30}] at @e[tag=yellowTeama] if score tpTimer time matches 1.. if entity @a[team=yellowTeam,distance=..2] run function skyisland:altartp
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=30}] at @e[tag=yellowTeama] if entity @a[team=yellowTeam,distance=..2] run scoreboard players add tpTimer time 1
#Actual Teleportation of Player -- BASED, ONLY CERTAIN TEAMS CAN USE

execute if entity @e[tag=yellowTeamCen,scores={mapProgress=30}] at @e[tag=yellowTeama] if score tpTimer time matches 330.. as @a[team=yellowTeam,distance=..2] run function skyisland:tpmain

#Makes Tp Altar unbreakable
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=30}] at @e[tag=yellowTeama] if entity @a[scores={survivalOn=1},distance=..15] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:iron_block
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=30}] at @e[tag=yellowTeama] if entity @a[scores={survivalOn=1},distance=..15] run fill ~ ~ ~ ~ ~ ~ minecraft:beacon
execute if entity @e[tag=yellowTeamCen,scores={mapProgress=30}] at @e[tag=yellowTeama] if entity @a[scores={survivalOn=1},distance=..15] run kill @e[type=item,distance=..3.5]

#Sets all players to survival if on yellowTeam
execute at @e[tag=yellowTeamCen] run gamemode survival @a[team=yellowTeam,scores={survivalOn=1},distance=..60]
execute at @e[tag=yellowTeamCen] run gamemode adventure @a[scores={survivalOn=0},distance=..80]
#Volcano TP thing
execute if entity @a[team=yellowTeam,scores={particles=0}] at @e[tag=yellowTeamv] run tellraw @a[team=yellowTeam,distance=..5] ["",{"text":"\n"},{"text":"<Jeffrey>","color":"gray"},{"text":" Hello "},{"selector":"@a[team=yellowTeam,distance=..5]","color":"gray"},{"text":"! My name is Jeffrey. To my right is a "},{"text":"one-time-use portal","color":"light_purple","bold":"true"},{"text":" to get out of here if y'all dont have any "},{"text":"diamonds","color":"gold"},{"text":". Bring me some "},{"text":"diamonds ","color":"gold"},{"text":"to trade to unlock more secrets!\n "}]
execute if entity @a[team=yellowTeam,scores={particles=0}] at @e[tag=yellowTeamv] if entity @a[team=yellowTeam,distance=..5] run scoreboard players add @a[team=yellowTeam] particles 1
execute if entity @a[team=yellowTeam,scores={particles=1}] at @e[tag=yellowTeamv] run title @a[distance=..0.75] title {"text":"One Way Ticket Used","color":"","bold":true}
execute if entity @a[team=yellowTeam,scores={particles=1}] at @e[tag=yellowTeamv] run title @a[distance=..0.75] subtitle {"text":"Bring Jeffrey Diamonds","color":"gold","bold":true}
execute if entity @a[team=yellowTeam,scores={particles=1}] at @e[tag=yellowTeamv] if entity @a[team=yellowTeam,distance=..0.75] run playsound minecraft:item.chorus_fruit.teleport master @a[team=yellowTeam,distance=..0.75] ~ ~ ~ 100
execute if entity @a[team=yellowTeam,scores={particles=0..1}] at @e[tag=yellowTeamv] if entity @a[team=yellowTeam,distance=..15] run summon area_effect_cloud ~ ~ ~ {Particle:effect,WaitTime:2}
execute if entity @a[team=yellowTeam,scores={particles=1}] at @e[tag=yellowTeamv] if entity @a[team=yellowTeam,distance=..0.75] run scoreboard players add @a[team=yellowTeam] particles 1
execute if entity @a[team=yellowTeam,scores={particles=2}] at @e[tag=yellowTeamv] run teleport @a[team=yellowTeam,distance=..0.75] @e[tag=yellowTeamCen,limit=1]
execute if entity @a[team=yellowTeam,scores={particles=2}] run scoreboard players reset @a[team=yellowTeam] particles

#---------
#Blue Team 
#---------
#Unrelated to Progress NUMS
#==================
# Possible BUG
#Need to limit this to each island, not the entire map, MIGHT need to fix, or leave the same
#===================
#-- Spawns custom mobs, turns them off after they can teleport to main island
execute if entity @e[tag=blueTeamCen,scores={mapProgress=0..29}] at @e[tag=blueTeamCen] run function skyisland:skyisland_mobs
#If players finds hidden coal entrance
execute if entity @e[tag=blueTeamCen,scores={mapProgress=0..29}] at @e[tag=blueTeamtrap] unless block ~ ~ ~ minecraft:coal_block run setblock ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] replace
execute if entity @e[tag=blueTeamCen,scores={mapProgress=0..29}] at @e[tag=blueTeamtrap] if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run summon firework_rocket ~ ~2 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[I;10288939,4718585,16725712],FadeColors:[I;16777215]}]}}}}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=0..29}] at @e[tag=blueTeamtrap] if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run kill @e[tag=blueTeamtrap]
#-- If Player falls offs island
execute at @a run teleport @a[y=0,dy=9,team=blueTeam] @e[tag=blueTeamh,limit=1]

#Stage 0 - Get Island Ready For Players (Progress Nums: 0)
#Sets volcano one=way-ticket for players to 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=0}] run scoreboard players set @a[team=blueTeam] particles 0
#Add one to the map progress level
execute if entity @e[tag=blueTeamCen,scores={mapProgress=0}] run scoreboard players add @e[tag=blueTeamCen] mapProgress 1

#Stage 1 -Altar Room (Progress Nums: 1-3)
#--Checks if player is in range of the altar armorstand (1)
execute if entity @e[tag=blueTeamCen,scores={mapProgress=1}] at @e[tag=blueTeamt] if entity @a[distance=..3,team=blueTeam] run function skyisland:altenter
execute if entity @e[tag=blueTeamCen,scores={mapProgress=1}] at @e[tag=blueTeamt] if entity @a[distance=..3,team=blueTeam] run scoreboard players add @e[tag=blueTeamCen] mapProgress 1

#--Check for altar slime blocks (2)
#Reset scoreboard 
execute if entity @e[tag=blueTeamCen,scores={mapProgress=2..3}] run scoreboard players set @e[tag=blueTeamt] slimeCounter 0
#Particle Effects above altar
execute if entity @e[tag=blueTeamCen,scores={mapProgress=2}] at @e[tag=blueTeamt] if entity @a[team=blueTeam,distance=..8] run summon minecraft:area_effect_cloud ~ ~2 ~ {Particle:witchMagic,WaitTime:10}
#Checks for 4 slimeblocks
execute if entity @e[tag=blueTeamCen,scores={mapProgress=2}] at @e[tag=blueTeamt] if block ~2 ~ ~ minecraft:slime_block run scoreboard players add @e[tag=blueTeamt] slimeCounter 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=2}] at @e[tag=blueTeamt] if block ~-2 ~ ~ minecraft:slime_block run scoreboard players add @e[tag=blueTeamt] slimeCounter 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=2}] at @e[tag=blueTeamt] if block ~ ~ ~2 minecraft:slime_block run scoreboard players add @e[tag=blueTeamt] slimeCounter 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=2}] at @e[tag=blueTeamt] if block ~ ~ ~-2 minecraft:slime_block run scoreboard players add @e[tag=blueTeamt] slimeCounter 1
#If 4 Slime Blocks
execute if entity @e[tag=blueTeamCen,scores={mapProgress=2}] at @e[tag=blueTeamt] if entity @e[tag=blueTeamt,scores={slimeCounter=4}] run function skyisland:altslime
#Increment Map Score
execute if entity @e[tag=blueTeamCen,scores={mapProgress=2}] if entity @e[tag=blueTeamt,scores={slimeCounter=4}] run scoreboard players add @e[tag=blueTeamCen] mapProgress 1

#--Begin a timer that will activate once 4 slime blocks have been placed (3)
#Adds one to counter, and runs commands based on the timer's values
execute if entity @e[tag=blueTeamCen,scores={mapProgress=3}] if entity @a[team=blueTeam,limit=1] if score alt_timer time matches 1.. run scoreboard players add alt_timer time 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=3}] at @e[tag=blueTeamt] if score alt_timer time matches 1.. run function skyisland:alt_timer
#==================
# Possible BUG
#If 2 teams execute the timer at the same time, they might break my program, find a way to still increment the mapProgress if the slimes score is 4
# FIX
#Need a way to allow players to reinitiate the slimeblock ritual for a power core
#===================
#Increment Map Score
execute if entity @e[tag=blueTeamCen,scores={mapProgress=3}] if score alt_timer time matches 320 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
#Timer has reached 320
execute if entity @e[tag=blueTeamCen,scores={mapProgress=3..4}] if score alt_timer time matches 320 run scoreboard players reset alt_timer time 

#Stage 2 -Power Room (Progress Nums: 4-5)
#--Unlock the power room (4)
execute if entity @e[tag=blueTeamCen,scores={mapProgress=4}] at @e[tag=blueTeamb] if block ~9 ~1 ~-1 minecraft:sea_lantern run function skyisland:pow_unlock
#Increment Map Score
execute if entity @e[tag=blueTeamCen,scores={mapProgress=4}] at @e[tag=blueTeamb] if block ~9 ~1 ~-1 minecraft:sea_lantern run scoreboard players add @e[tag=blueTeamCen] mapProgress 1

#-- Spawns Mobs in Power room (5)
execute if entity @e[tag=blueTeamCen,scores={mapProgress=5}] at @e[tag=blueTeamb] if entity @a[distance=..3.5,team=blueTeam] run function skyisland:pow_mobs
#Increment Map Score
execute if entity @e[tag=blueTeamCen,scores={mapProgress=5}] at @e[tag=blueTeamb] if entity @a[distance=..3.5,team=blueTeam] run scoreboard players add @e[tag=blueTeamCen] mapProgress 1

#Stage 3 -Cloud City (Progress Nums: 6-8)
#-- Unlocks Cloud Area (6)
execute if entity @e[tag=blueTeamCen,scores={mapProgress=6}] at @e[tag=blueTeamb] if entity @a[distance=..1,team=blueTeam] at @e[tag=blueTeamc] run function skyisland:cloud_unlock
execute if entity @e[tag=blueTeamCen,scores={mapProgress=6..9}] at @e[tag=blueTeamb] if entity @a[distance=..6,team=blueTeam] run particle minecraft:happy_villager ~-5 ~1.5 ~ .8 .8 .8 .1 1 force
#Increments Map Score
execute if entity @e[tag=blueTeamCen,scores={mapProgress=6}] at @e[tag=blueTeamb] if entity @a[distance=..1,team=blueTeam] at @e[tag=blueTeamc] run scoreboard players add @e[tag=blueTeamCen] mapProgress 1

#--Spawns in a cloud boss (7)
execute if entity @e[tag=blueTeamCen,scores={mapProgress=7}] at @e[tag=blueTeamc] if entity @a[distance=..3,team=blueTeam] run function skyisland:cloud_boss
#Increments Map Score
execute if entity @e[tag=blueTeamCen,scores={mapProgress=7}] at @e[tag=blueTeamc] if entity @a[distance=..3,team=blueTeam] run scoreboard players add @e[tag=blueTeamCen] mapProgress 1

#-- Updates boss bar for cloud boss (8)
execute if entity @e[tag=blueTeamCen,scores={mapProgress=8}] run bossbar set minecraft:guardian players @a[team=blueTeam] 
execute if entity @e[tag=blueTeamCen,scores={mapProgress=8}] run function skyisland:cloud_bossbar
#Increments Map Score if boss is dead
execute if entity @e[tag=blueTeamCen,scores={mapProgress=8}] unless entity @e[type=minecraft:evoker,tag=guardian,limit=1] run scoreboard players add @e[tag=blueTeamCen] mapProgress 1

#Stage 4 Survival Key (Progress Nums: 9-10)
#-- Place Master core in power room (9)
execute if entity @e[tag=blueTeamCen,scores={mapProgress=9}] at @e[tag=blueTeamb] if block ~-5 ~1 ~ minecraft:nether_wart_block run function skyisland:pow_key
#Increment Map
execute if entity @e[tag=blueTeamCen,scores={mapProgress=9}] at @e[tag=blueTeamb] if block ~-5 ~1 ~ minecraft:nether_wart_block run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
#==================
# Possible BUG
#If 2 teams execute the timer at the same time, they might break my program, find a way to still increment the mapProgress if the slimes score is 4
# FIX
#Need a way to allow players to initiate the powerCore ritual for a key of survival, by respawning boss or something
#===================
#--Begin a timer that will activate nether wart block has been placed (10)
#Adds one to counter, and runs commands based on the timer's values
execute if entity @e[tag=blueTeamCen,scores={mapProgress=10}] if entity @a[team=blueTeam,limit=1] if score powTimer time matches 1.. run scoreboard players add powTimer time 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=10}] at @e[tag=blueTeamb] if score powTimer time matches 1.. run function skyisland:pow_timer
#Increment Map Score
execute if entity @e[tag=blueTeamCen,scores={mapProgress=10}] if score powTimer time matches 315 run scoreboard players set @e[tag=blueTeamCen] time 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=10}] if score powTimer time matches 320 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
#Timer has reached 325
execute if entity @e[tag=blueTeamCen,scores={mapProgress=10..11}] if score powTimer time matches 320 run scoreboard players reset powTimer time

#Stage 5 Pillager Raid (Progress Nums: 11-27)
#Give players bad_omen lvl4 effect after 8 minutes 
execute if entity @e[tag=blueTeamCen,scores={mapProgress=11}] if entity @a[team=blueTeam,limit=1] if score @e[tag=blueTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blueTeamCen] time 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=11}] if score @e[tag=blueTeamCen,limit=1] time matches 9600.. at @e[tag=blueTeamCen] run effect give @a[team=blueTeam] minecraft:bad_omen 1000000 3 true 
execute if entity @e[tag=blueTeamCen,scores={mapProgress=11}] if score @e[tag=blueTeamCen,limit=1] time matches 9600.. run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=11}] if score @e[tag=blueTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=blueTeamh] raidControl 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=11}] if score @e[tag=blueTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=blueTeamCen] raidControl 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=11}] if score @e[tag=blueTeamCen,limit=1] time matches 9600.. run title @a[distance=..150] title [{"text":"AHH! The","color":"aqua","bold":true},{"text":" Pillagers","color":"dark_red","bold":true},{"text":"!?!?","color":"aqua","bold":true}]
execute if entity @e[tag=blueTeamCen,scores={mapProgress=11}] if score @e[tag=blueTeamCen,limit=1] time matches 9600.. run title @a[distance=..150] subtitle [{"text":"It was only a matter of time...!","color":"white"}]
#Add one to map progress, once bad omen effect gets applied
execute if entity @e[tag=blueTeamCen,scores={mapProgress=11}] if score @e[tag=blueTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=blueTeamCen] time 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=11}] if score @e[tag=blueTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1

#--Initiates Final Raid (13-15) that based on how many villagers survive, they will get a good item
# Wave #1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=12}] if entity @a[team=blueTeam,limit=1] if score @e[tag=blueTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blueTeamCen] time 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=12}] if score @e[tag=blueTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blueTeamCen] time 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=12}] if score @e[tag=blueTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 0..5 at @e[tag=blueTeamCen] run function skyisland:blue/raid_max
execute if entity @e[tag=blueTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blueTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run teleport @s @e[tag=blueTeamh,limit=1]
execute if entity @e[tag=blueTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blueTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run playsound minecraft:event.raid.horn master @a[team=blueTeam] ~ ~ ~ 100
execute if entity @e[tag=blueTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl -= @e[tag=blue_raid] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamCen] raidControl -= @e[tag=blueTeamh] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl = @e[tag=blueTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=13}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 1 Complete","color":"red"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=13}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"You Ready Bro?","color":"aqua"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=13}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=13}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
# Wave #2
execute if entity @e[tag=blueTeamCen,scores={mapProgress=14}] if entity @a[team=blueTeam,limit=1] if score @e[tag=blueTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blueTeamCen] time 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=14}] if score @e[tag=blueTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blueTeamCen] time 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=14}] if score @e[tag=blueTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 0..5 at @e[tag=blueTeamCen] run function skyisland:blue/raid_max
execute if entity @e[tag=blueTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blueTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run teleport @s @e[tag=blueTeamh,limit=1]
execute if entity @e[tag=blueTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blueTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run playsound minecraft:event.raid.horn master @a[team=blueTeam] ~ ~ ~ 100
execute if entity @e[tag=blueTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl -= @e[tag=blue_raid] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamCen] raidControl -= @e[tag=blueTeamh] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl = @e[tag=blueTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=15}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 2 Complete","color":"red"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=15}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"These pillagers suck so bad bruh xD","color":"aqua"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=15}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=15}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
# Wave #3
execute if entity @e[tag=blueTeamCen,scores={mapProgress=16}] if entity @a[team=blueTeam,limit=1] if score @e[tag=blueTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blueTeamCen] time 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=16}] if score @e[tag=blueTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blueTeamCen] time 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=16}] if score @e[tag=blueTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 0..5 at @e[tag=blueTeamCen] run function skyisland:blue/raid_max
execute if entity @e[tag=blueTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blueTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run teleport @s @e[tag=blueTeamh,limit=1]
execute if entity @e[tag=blueTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blueTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run playsound minecraft:event.raid.horn master @a[team=blueTeam] ~ ~ ~ 100
execute if entity @e[tag=blueTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wav
execute if entity @e[tag=blueTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl -= @e[tag=blue_raid] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamCen] raidControl -= @e[tag=blueTeamh] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl = @e[tag=blueTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=17}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 3 Complete","color":"red"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=17}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Is this even a challenge!","color":"aqua"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=17}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=17}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
# Wave #4
execute if entity @e[tag=blueTeamCen,scores={mapProgress=18}] if entity @a[team=blueTeam,limit=1] if score @e[tag=blueTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blueTeamCen] time 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=18}] if score @e[tag=blueTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blueTeamCen] time 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=18}] if score @e[tag=blueTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 0..5 at @e[tag=blueTeamCen] run function skyisland:blue/raid_max
execute if entity @e[tag=blueTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blueTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run teleport @s @e[tag=blueTeamh,limit=1]
execute if entity @e[tag=blueTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blueTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run playsound minecraft:event.raid.horn master @a[team=blueTeam] ~ ~ ~ 100
execute if entity @e[tag=blueTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl -= @e[tag=blue_raid] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamCen] raidControl -= @e[tag=blueTeamh] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl = @e[tag=blueTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=19}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 4 Complete","color":"red"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=19}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"If you died already... oh boy","color":"aqua"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=19}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=19}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
# Wave #5
execute if entity @e[tag=blueTeamCen,scores={mapProgress=20}] if entity @a[team=blueTeam,limit=1] if score @e[tag=blueTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blueTeamCen] time 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=20}] if score @e[tag=blueTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blueTeamCen] time 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=20}] if score @e[tag=blueTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 0..5 at @e[tag=blueTeamCen] run function skyisland:blue/raid_max
execute if entity @e[tag=blueTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blueTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run teleport @s @e[tag=blueTeamh,limit=1]
execute if entity @e[tag=blueTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blueTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run playsound minecraft:event.raid.horn master @a[team=blueTeam] ~ ~ ~ 100
execute if entity @e[tag=blueTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl -= @e[tag=blue_raid] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamCen] raidControl -= @e[tag=blueTeamh] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl = @e[tag=blueTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=21}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 5 Complete","color":"red"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=21}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Pfft, that one was a lil too easy","color":"aqua"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=21}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=21}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
# Wave #6
execute if entity @e[tag=blueTeamCen,scores={mapProgress=22}] if entity @a[team=blueTeam,limit=1] if score @e[tag=blueTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blueTeamCen] time 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=22}] if score @e[tag=blueTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blueTeamCen] time 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=22}] if score @e[tag=blueTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 0..5 at @e[tag=blueTeamCen] run function skyisland:blue/raid_max
execute if entity @e[tag=blueTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blueTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run teleport @s @e[tag=blueTeamh,limit=1]
execute if entity @e[tag=blueTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blueTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=blueTeam] ~ ~ ~ 100
execute if entity @e[tag=blueTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl -= @e[tag=blue_raid] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamCen] raidControl -= @e[tag=blueTeamh] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl = @e[tag=blueTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=23}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 6 Complete","color":"red"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=23}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Alright, here comes a hard wave","color":"aqua"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=23}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=23}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
# Wave #7
execute if entity @e[tag=blueTeamCen,scores={mapProgress=24}] if entity @a[team=blueTeam,limit=1] if score @e[tag=blueTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blueTeamCen] time 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=24}] if score @e[tag=blueTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blueTeamCen] time 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=24}] if score @e[tag=blueTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 0..5 at @e[tag=blueTeamCen] run function skyisland:blue/raid_max
execute if entity @e[tag=blueTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blueTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run teleport @s @e[tag=blueTeamh,limit=1]
execute if entity @e[tag=blueTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blueTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=blueTeam] ~ ~ ~ 100
execute if entity @e[tag=blueTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl -= @e[tag=blue_raid] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamCen] raidControl -= @e[tag=blueTeamh] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl = @e[tag=blueTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=25}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 7 Complete","color":"red"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=25}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Next wave is impossible... xD","color":"aqua"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=25}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=25}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
# Wave #8
execute if entity @e[tag=blueTeamCen,scores={mapProgress=26}] if entity @a[team=blueTeam,limit=1] if score @e[tag=blueTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=blueTeamCen] time 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=26}] if score @e[tag=blueTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=blueTeamCen] time 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=26}] if score @e[tag=blueTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 0..5 at @e[tag=blueTeamCen] run function skyisland:blue/raid_max
execute if entity @e[tag=blueTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=blueTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 as @e[tag=blue_raid] run teleport @s @e[tag=blueTeamh,limit=1]
execute if entity @e[tag=blueTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=blueTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 at @e[tag=blueTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=blueTeam] ~ ~ ~ 100
execute if entity @e[tag=blueTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl -= @e[tag=blue_raid] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamCen] raidControl -= @e[tag=blueTeamh] raidControl
execute if entity @e[tag=blueTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=blueTeamh] raidControl = @e[tag=blueTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=blueTeamCen,scores={mapProgress=27}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 8 Complete","color":"red"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=27}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Not bad...","color":"aqua"}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=27}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=blueTeamCen,scores={mapProgress=27}] if score @e[tag=blueTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1

#Stage 6 TP altar (Progress Nums: 28-30)
#--Checks if altar is setup correctly (20)
#Reset scoreboard 
execute if entity @e[tag=blueTeamCen,scores={mapProgress=28..30}] run scoreboard players set altarScore TPaltar 0
#Checking of blocks
execute if entity @e[tag=blueTeamCen,scores={mapProgress=28}] at @e[tag=blueTeama] run function skyisland:tp_setup
execute if entity @e[tag=blueTeamCen,scores={mapProgress=28}] at @e[tag=blueTeama] if score altarScore TPaltar matches 5 run setblock ~ ~16 ~ minecraft:blue_stained_glass replace
execute if entity @e[tag=blueTeamCen,scores={mapProgress=28}] at @e[tag=blueTeama] if score altarScore TPaltar matches 5 run setblock ~ ~6 ~ minecraft:blue_stained_glass replace
execute if entity @e[tag=blueTeamCen,scores={mapProgress=28}] if score altarScore TPaltar matches 5 run scoreboard players add @e[tag=blueTeamCen] mapProgress 1

#--Sets All players on team to survival mode (21)
execute if entity @e[tag=blueTeamCen,scores={mapProgress=29}] run scoreboard players set @a[team=blueTeam] survivalOn 1
execute if entity @e[tag=blueTeamCen,scores={mapProgress=29}] at @e[tag=blueTeama] run fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 minecraft:diamond_ore replace
execute if entity @e[tag=blueTeamCen,scores={mapProgress=29}] at @e[tag=blueTeama] run setblock ~ ~-2 ~ minecraft:emerald_block replace
execute if entity @e[tag=blueTeamCen,scores={mapProgress=29}] at @e[tag=blueTeama] run advancement grant @a[team=blueTeam] only mainisland:root
execute if entity @e[tag=blueTeamCen,scores={mapProgress=29}] run scoreboard players add @e[tag=blueTeamCen] mapProgress 1

#--Initiates Altar TP (22)
#Resets score if player leaves altar
execute if entity @e[tag=blueTeamCen,scores={mapProgress=30}] at @e[tag=blueTeama] unless entity @a[distance=..2] if score tpTimer time matches 1.. run title @a[distance=..4] actionbar {"text":"Cancelled Teleportation...","color":"red","bold":true}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=30}] at @e[tag=blueTeama] unless entity @a[distance=..2] if score tpTimer time matches 1.. run scoreboard players set tpTimer time 0
#If player stays on altar
execute if entity @e[tag=blueTeamCen,scores={mapProgress=30}] at @e[tag=blueTeama] if score tpTimer time matches 1..5 if entity @a[team=blueTeam,distance=..10] run title @a[distance=..2] title {"text":" "}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=30}] at @e[tag=blueTeama] if score tpTimer time matches 1..5 if entity @a[team=blueTeam,distance=..10] run title @a[distance=..2] subtitle {"text":" "}
execute if entity @e[tag=blueTeamCen,scores={mapProgress=30}] at @e[tag=blueTeama] if score tpTimer time matches 1.. if entity @a[team=blueTeam,distance=..10] run particle portal ~ ~ ~ 0 .8 0 .3 8 force
execute if entity @e[tag=blueTeamCen,scores={mapProgress=30}] at @e[tag=blueTeama] if score tpTimer time matches 1.. if entity @a[team=blueTeam,distance=..10] run particle minecraft:end_rod ~ ~2 ~ .01 .01 .01 .1 1 force
execute if entity @e[tag=blueTeamCen,scores={mapProgress=30}] at @e[tag=blueTeama] if score tpTimer time matches 1.. if entity @a[team=blueTeam,distance=..10] run particle minecraft:happy_villager ~ ~2 ~ .1 .1 .1 .1 1 force
execute if entity @e[tag=blueTeamCen,scores={mapProgress=30}] at @e[tag=blueTeama] if score tpTimer time matches 1.. if entity @a[team=blueTeam,distance=..2] run function skyisland:altartp
execute if entity @e[tag=blueTeamCen,scores={mapProgress=30}] at @e[tag=blueTeama] if entity @a[team=blueTeam,distance=..2] run scoreboard players add tpTimer time 1
#Actual Teleportation of Player -- BASED, ONLY CERTAIN TEAMS CAN USE

execute if entity @e[tag=blueTeamCen,scores={mapProgress=30}] at @e[tag=blueTeama] if score tpTimer time matches 330.. as @a[team=blueTeam,distance=..2] run function skyisland:tpmain

#Makes Tp Altar unbreakable
execute if entity @e[tag=blueTeamCen,scores={mapProgress=30}] at @e[tag=blueTeama] if entity @a[scores={survivalOn=1},distance=..15] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:iron_block
execute if entity @e[tag=blueTeamCen,scores={mapProgress=30}] at @e[tag=blueTeama] if entity @a[scores={survivalOn=1},distance=..15] run fill ~ ~ ~ ~ ~ ~ minecraft:beacon
execute if entity @e[tag=blueTeamCen,scores={mapProgress=30}] at @e[tag=blueTeama] if entity @a[scores={survivalOn=1},distance=..15] run kill @e[type=item,distance=..3.5]

#Sets all players to survival if on blueTeam
execute at @e[tag=blueTeamCen] run gamemode survival @a[team=blueTeam,scores={survivalOn=1},distance=..60]
execute at @e[tag=blueTeamCen] run gamemode adventure @a[scores={survivalOn=0},distance=..80]
#Volcano TP thing
execute if entity @a[team=blueTeam,scores={particles=0}] at @e[tag=blueTeamv] run tellraw @a[team=blueTeam,distance=..5] ["",{"text":"\n"},{"text":"<Jeffrey>","color":"gray"},{"text":" Hello "},{"selector":"@a[team=blueTeam,distance=..5]","color":"gray"},{"text":"! My name is Jeffrey. To my right is a "},{"text":"one-time-use portal","color":"light_purple","bold":"true"},{"text":" to get out of here if y'all dont have any "},{"text":"diamonds","color":"gold"},{"text":". Bring me some "},{"text":"diamonds ","color":"gold"},{"text":"to trade to unlock more secrets!\n "}]
execute if entity @a[team=blueTeam,scores={particles=0}] at @e[tag=blueTeamv] if entity @a[team=blueTeam,distance=..5] run scoreboard players add @a[team=blueTeam] particles 1
execute if entity @a[team=blueTeam,scores={particles=1}] at @e[tag=blueTeamv] run title @a[distance=..0.75] title {"text":"One Way Ticket Used","color":"","bold":true}
execute if entity @a[team=blueTeam,scores={particles=1}] at @e[tag=blueTeamv] run title @a[distance=..0.75] subtitle {"text":"Bring Jeffrey Diamonds","color":"gold","bold":true}
execute if entity @a[team=blueTeam,scores={particles=1}] at @e[tag=blueTeamv] if entity @a[team=blueTeam,distance=..0.75] run playsound minecraft:item.chorus_fruit.teleport master @a[team=blueTeam,distance=..0.75] ~ ~ ~ 100
execute if entity @a[team=blueTeam,scores={particles=0..1}] at @e[tag=blueTeamv] if entity @a[team=blueTeam,distance=..15] run summon area_effect_cloud ~ ~ ~ {Particle:effect,WaitTime:2}
execute if entity @a[team=blueTeam,scores={particles=1}] at @e[tag=blueTeamv] if entity @a[team=blueTeam,distance=..0.75] run scoreboard players add @a[team=blueTeam] particles 1
execute if entity @a[team=blueTeam,scores={particles=2}] at @e[tag=blueTeamv] run teleport @a[team=blueTeam,distance=..0.75] @e[tag=blueTeamCen,limit=1]
execute if entity @a[team=blueTeam,scores={particles=2}] run scoreboard players reset @a[team=blueTeam] particles

#---------
#Green Team 
#---------
#Unrelated to Progress NUMS
#==================
# Possible BUG
#Need to limit this to each island, not the entire map, MIGHT need to fix, or leave the same
#===================
#-- Spawns custom mobs, turns them off after they can teleport to main island
execute if entity @e[tag=greenTeamCen,scores={mapProgress=0..29}] at @e[tag=greenTeamCen] run function skyisland:skyisland_mobs
#If players finds hidden coal entrance
execute if entity @e[tag=greenTeamCen,scores={mapProgress=0..29}] at @e[tag=greenTeamtrap] unless block ~ ~ ~ minecraft:coal_block run setblock ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] replace
execute if entity @e[tag=greenTeamCen,scores={mapProgress=0..29}] at @e[tag=greenTeamtrap] if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run summon firework_rocket ~ ~2 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[I;10288939,4718585,16725712],FadeColors:[I;16777215]}]}}}}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=0..29}] at @e[tag=greenTeamtrap] if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run kill @e[tag=greenTeamtrap]
#-- If Player falls offs island
execute at @a run teleport @a[y=0,dy=9,team=greenTeam] @e[tag=greenTeamh,limit=1]

#Stage 0 - Get Island Ready For Players (Progress Nums: 0)
#Sets volcano one=way-ticket for players to 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=0}] run scoreboard players set @a[team=greenTeam] particles 0
#Add one to the map progress level
execute if entity @e[tag=greenTeamCen,scores={mapProgress=0}] run scoreboard players add @e[tag=greenTeamCen] mapProgress 1

#Stage 1 -Altar Room (Progress Nums: 1-3)
#--Checks if player is in range of the altar armorstand (1)
execute if entity @e[tag=greenTeamCen,scores={mapProgress=1}] at @e[tag=greenTeamt] if entity @a[distance=..3,team=greenTeam] run function skyisland:altenter
execute if entity @e[tag=greenTeamCen,scores={mapProgress=1}] at @e[tag=greenTeamt] if entity @a[distance=..3,team=greenTeam] run scoreboard players add @e[tag=greenTeamCen] mapProgress 1

#--Check for altar slime blocks (2)
#Reset scoreboard 
execute if entity @e[tag=greenTeamCen,scores={mapProgress=2..3}] run scoreboard players set @e[tag=greenTeamt] slimeCounter 0
#Particle Effects above altar
execute if entity @e[tag=greenTeamCen,scores={mapProgress=2}] at @e[tag=greenTeamt] if entity @a[team=greenTeam,distance=..8] run summon minecraft:area_effect_cloud ~ ~2 ~ {Particle:witchMagic,WaitTime:10}
#Checks for 4 slimeblocks
execute if entity @e[tag=greenTeamCen,scores={mapProgress=2}] at @e[tag=greenTeamt] if block ~2 ~ ~ minecraft:slime_block run scoreboard players add @e[tag=greenTeamt] slimeCounter 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=2}] at @e[tag=greenTeamt] if block ~-2 ~ ~ minecraft:slime_block run scoreboard players add @e[tag=greenTeamt] slimeCounter 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=2}] at @e[tag=greenTeamt] if block ~ ~ ~2 minecraft:slime_block run scoreboard players add @e[tag=greenTeamt] slimeCounter 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=2}] at @e[tag=greenTeamt] if block ~ ~ ~-2 minecraft:slime_block run scoreboard players add @e[tag=greenTeamt] slimeCounter 1
#If 4 Slime Blocks
execute if entity @e[tag=greenTeamCen,scores={mapProgress=2}] at @e[tag=greenTeamt] if entity @e[tag=greenTeamt,scores={slimeCounter=4}] run function skyisland:altslime
#Increment Map Score
execute if entity @e[tag=greenTeamCen,scores={mapProgress=2}] if entity @e[tag=greenTeamt,scores={slimeCounter=4}] run scoreboard players add @e[tag=greenTeamCen] mapProgress 1

#--Begin a timer that will activate once 4 slime blocks have been placed (3)
#Adds one to counter, and runs commands based on the timer's values
execute if entity @e[tag=greenTeamCen,scores={mapProgress=3}] if entity @a[team=greenTeam,limit=1] if score alt_timer time matches 1.. run scoreboard players add alt_timer time 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=3}] at @e[tag=greenTeamt] if score alt_timer time matches 1.. run function skyisland:alt_timer
#==================
# Possible BUG
#If 2 teams execute the timer at the same time, they might break my program, find a way to still increment the mapProgress if the slimes score is 4
# FIX
#Need a way to allow players to reinitiate the slimeblock ritual for a power core
#===================
#Increment Map Score
execute if entity @e[tag=greenTeamCen,scores={mapProgress=3}] if score alt_timer time matches 320 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
#Timer has reached 320
execute if entity @e[tag=greenTeamCen,scores={mapProgress=3..4}] if score alt_timer time matches 320 run scoreboard players reset alt_timer time 

#Stage 2 -Power Room (Progress Nums: 4-5)
#--Unlock the power room (4)
execute if entity @e[tag=greenTeamCen,scores={mapProgress=4}] at @e[tag=greenTeamb] if block ~9 ~1 ~-1 minecraft:sea_lantern run function skyisland:pow_unlock
#Increment Map Score
execute if entity @e[tag=greenTeamCen,scores={mapProgress=4}] at @e[tag=greenTeamb] if block ~9 ~1 ~-1 minecraft:sea_lantern run scoreboard players add @e[tag=greenTeamCen] mapProgress 1

#-- Spawns Mobs in Power room (5)
execute if entity @e[tag=greenTeamCen,scores={mapProgress=5}] at @e[tag=greenTeamb] if entity @a[distance=..3.5,team=greenTeam] run function skyisland:pow_mobs
#Increment Map Score
execute if entity @e[tag=greenTeamCen,scores={mapProgress=5}] at @e[tag=greenTeamb] if entity @a[distance=..3.5,team=greenTeam] run scoreboard players add @e[tag=greenTeamCen] mapProgress 1

#Stage 3 -Cloud City (Progress Nums: 6-8)
#-- Unlocks Cloud Area (6)
execute if entity @e[tag=greenTeamCen,scores={mapProgress=6}] at @e[tag=greenTeamb] if entity @a[distance=..1,team=greenTeam] at @e[tag=greenTeamc] run function skyisland:cloud_unlock
execute if entity @e[tag=greenTeamCen,scores={mapProgress=6..9}] at @e[tag=greenTeamb] if entity @a[distance=..6,team=greenTeam] run particle minecraft:happy_villager ~-5 ~1.5 ~ .8 .8 .8 .1 1 force
#Increments Map Score
execute if entity @e[tag=greenTeamCen,scores={mapProgress=6}] at @e[tag=greenTeamb] if entity @a[distance=..1,team=greenTeam] at @e[tag=greenTeamc] run scoreboard players add @e[tag=greenTeamCen] mapProgress 1

#--Spawns in a cloud boss (7)
execute if entity @e[tag=greenTeamCen,scores={mapProgress=7}] at @e[tag=greenTeamc] if entity @a[distance=..3,team=greenTeam] run function skyisland:cloud_boss
#Increments Map Score
execute if entity @e[tag=greenTeamCen,scores={mapProgress=7}] at @e[tag=greenTeamc] if entity @a[distance=..3,team=greenTeam] run scoreboard players add @e[tag=greenTeamCen] mapProgress 1

#-- Updates boss bar for cloud boss (8)
execute if entity @e[tag=greenTeamCen,scores={mapProgress=8}] run bossbar set minecraft:guardian players @a[team=greenTeam] 
execute if entity @e[tag=greenTeamCen,scores={mapProgress=8}] run function skyisland:cloud_bossbar
#Increments Map Score if boss is dead
execute if entity @e[tag=greenTeamCen,scores={mapProgress=8}] unless entity @e[type=minecraft:evoker,tag=guardian,limit=1] run scoreboard players add @e[tag=greenTeamCen] mapProgress 1

#Stage 4 Survival Key (Progress Nums: 9-10)
#-- Place Master core in power room (9)
execute if entity @e[tag=greenTeamCen,scores={mapProgress=9}] at @e[tag=greenTeamb] if block ~-5 ~1 ~ minecraft:nether_wart_block run function skyisland:pow_key
#Increment Map
execute if entity @e[tag=greenTeamCen,scores={mapProgress=9}] at @e[tag=greenTeamb] if block ~-5 ~1 ~ minecraft:nether_wart_block run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
#==================
# Possible BUG
#If 2 teams execute the timer at the same time, they might break my program, find a way to still increment the mapProgress if the slimes score is 4
# FIX
#Need a way to allow players to initiate the powerCore ritual for a key of survival, by respawning boss or something
#===================
#--Begin a timer that will activate nether wart block has been placed (10)
#Adds one to counter, and runs commands based on the timer's values
execute if entity @e[tag=greenTeamCen,scores={mapProgress=10}] if entity @a[team=greenTeam,limit=1] if score powTimer time matches 1.. run scoreboard players add powTimer time 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=10}] at @e[tag=greenTeamb] if score powTimer time matches 1.. run function skyisland:pow_timer
#Increment Map Score
execute if entity @e[tag=greenTeamCen,scores={mapProgress=10}] if score powTimer time matches 315 run scoreboard players set @e[tag=greenTeamCen] time 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=10}] if score powTimer time matches 320 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
#Timer has reached 325
execute if entity @e[tag=greenTeamCen,scores={mapProgress=10..11}] if score powTimer time matches 320 run scoreboard players reset powTimer time

#Stage 5 Pillager Raid (Progress Nums: 11-27)
#Give players bad_omen lvl4 effect after 8 minutes 
execute if entity @e[tag=greenTeamCen,scores={mapProgress=11}] if entity @a[team=greenTeam,limit=1] if score @e[tag=greenTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=greenTeamCen] time 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=11}] if score @e[tag=greenTeamCen,limit=1] time matches 9600.. at @e[tag=greenTeamCen] run effect give @a[team=greenTeam] minecraft:bad_omen 1000000 3 true 
execute if entity @e[tag=greenTeamCen,scores={mapProgress=11}] if score @e[tag=greenTeamCen,limit=1] time matches 9600.. run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=11}] if score @e[tag=greenTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=greenTeamh] raidControl 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=11}] if score @e[tag=greenTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=greenTeamCen] raidControl 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=11}] if score @e[tag=greenTeamCen,limit=1] time matches 9600.. run title @a[distance=..150] title [{"text":"AHH! The","color":"aqua","bold":true},{"text":" Pillagers","color":"dark_red","bold":true},{"text":"!?!?","color":"aqua","bold":true}]
execute if entity @e[tag=greenTeamCen,scores={mapProgress=11}] if score @e[tag=greenTeamCen,limit=1] time matches 9600.. run title @a[distance=..150] subtitle [{"text":"It was only a matter of time...!","color":"white"}]
#Add one to map progress, once bad omen effect gets applied
execute if entity @e[tag=greenTeamCen,scores={mapProgress=11}] if score @e[tag=greenTeamCen,limit=1] time matches 9600.. run scoreboard players set @e[tag=greenTeamCen] time 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=11}] if score @e[tag=greenTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1

#--Initiates Final Raid (13-15) that based on how many villagers survive, they will get a good item
# Wave #1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=12}] if entity @a[team=greenTeam,limit=1] if score @e[tag=greenTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=greenTeamCen] time 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=12}] if score @e[tag=greenTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=greenTeamCen] time 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=12}] if score @e[tag=greenTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 0..5 at @e[tag=greenTeamCen] run function skyisland:green/raid_max
execute if entity @e[tag=greenTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=greenTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run teleport @s @e[tag=greenTeamh,limit=1]
execute if entity @e[tag=greenTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=greenTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run playsound minecraft:event.raid.horn master @a[team=greenTeam] ~ ~ ~ 100
execute if entity @e[tag=greenTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl -= @e[tag=green_raid] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamCen] raidControl -= @e[tag=greenTeamh] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=13}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl = @e[tag=greenTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=13}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 1 Complete","color":"red"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=13}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"You Ready Bro?","color":"aqua"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=13}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=13}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
# Wave #2
execute if entity @e[tag=greenTeamCen,scores={mapProgress=14}] if entity @a[team=greenTeam,limit=1] if score @e[tag=greenTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=greenTeamCen] time 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=14}] if score @e[tag=greenTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=greenTeamCen] time 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=14}] if score @e[tag=greenTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 0..5 at @e[tag=greenTeamCen] run function skyisland:green/raid_max
execute if entity @e[tag=greenTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=greenTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run teleport @s @e[tag=greenTeamh,limit=1]
execute if entity @e[tag=greenTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=greenTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run playsound minecraft:event.raid.horn master @a[team=greenTeam] ~ ~ ~ 100
execute if entity @e[tag=greenTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl -= @e[tag=green_raid] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamCen] raidControl -= @e[tag=greenTeamh] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=15}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl = @e[tag=greenTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=15}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 2 Complete","color":"red"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=15}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"These pillagers suck so bad bruh xD","color":"aqua"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=15}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=15}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
# Wave #3
execute if entity @e[tag=greenTeamCen,scores={mapProgress=16}] if entity @a[team=greenTeam,limit=1] if score @e[tag=greenTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=greenTeamCen] time 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=16}] if score @e[tag=greenTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=greenTeamCen] time 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=16}] if score @e[tag=greenTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 0..5 at @e[tag=greenTeamCen] run function skyisland:green/raid_max
execute if entity @e[tag=greenTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=greenTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run teleport @s @e[tag=greenTeamh,limit=1]
execute if entity @e[tag=greenTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=greenTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run playsound minecraft:event.raid.horn master @a[team=greenTeam] ~ ~ ~ 100
execute if entity @e[tag=greenTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wav
execute if entity @e[tag=greenTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl -= @e[tag=green_raid] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamCen] raidControl -= @e[tag=greenTeamh] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=17}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl = @e[tag=greenTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=17}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 3 Complete","color":"red"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=17}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Is this even a challenge!","color":"aqua"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=17}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=17}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
# Wave #4
execute if entity @e[tag=greenTeamCen,scores={mapProgress=18}] if entity @a[team=greenTeam,limit=1] if score @e[tag=greenTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=greenTeamCen] time 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=18}] if score @e[tag=greenTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=greenTeamCen] time 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=18}] if score @e[tag=greenTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 0..5 at @e[tag=greenTeamCen] run function skyisland:green/raid_max
execute if entity @e[tag=greenTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=greenTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run teleport @s @e[tag=greenTeamh,limit=1]
execute if entity @e[tag=greenTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=greenTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run playsound minecraft:event.raid.horn master @a[team=greenTeam] ~ ~ ~ 100
execute if entity @e[tag=greenTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl -= @e[tag=green_raid] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamCen] raidControl -= @e[tag=greenTeamh] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=19}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl = @e[tag=greenTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=19}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 4 Complete","color":"red"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=19}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"If you died already... oh boy","color":"aqua"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=19}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=19}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
# Wave #5
execute if entity @e[tag=greenTeamCen,scores={mapProgress=20}] if entity @a[team=greenTeam,limit=1] if score @e[tag=greenTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=greenTeamCen] time 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=20}] if score @e[tag=greenTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=greenTeamCen] time 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=20}] if score @e[tag=greenTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 0..5 at @e[tag=greenTeamCen] run function skyisland:green/raid_max
execute if entity @e[tag=greenTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=greenTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run teleport @s @e[tag=greenTeamh,limit=1]
execute if entity @e[tag=greenTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=greenTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run playsound minecraft:event.raid.horn master @a[team=greenTeam] ~ ~ ~ 100
execute if entity @e[tag=greenTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl -= @e[tag=green_raid] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamCen] raidControl -= @e[tag=greenTeamh] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=21}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl = @e[tag=greenTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=21}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 5 Complete","color":"red"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=21}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Pfft, that one was a lil too easy","color":"aqua"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=21}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=21}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
# Wave #6
execute if entity @e[tag=greenTeamCen,scores={mapProgress=22}] if entity @a[team=greenTeam,limit=1] if score @e[tag=greenTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=greenTeamCen] time 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=22}] if score @e[tag=greenTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=greenTeamCen] time 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=22}] if score @e[tag=greenTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 0..5 at @e[tag=greenTeamCen] run function skyisland:green/raid_max
execute if entity @e[tag=greenTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=greenTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run teleport @s @e[tag=greenTeamh,limit=1]
execute if entity @e[tag=greenTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=greenTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=greenTeam] ~ ~ ~ 100
execute if entity @e[tag=greenTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl -= @e[tag=green_raid] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamCen] raidControl -= @e[tag=greenTeamh] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=23}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl = @e[tag=greenTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=23}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 6 Complete","color":"red"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=23}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Alright, here comes a hard wave","color":"aqua"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=23}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=23}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
# Wave #7
execute if entity @e[tag=greenTeamCen,scores={mapProgress=24}] if entity @a[team=greenTeam,limit=1] if score @e[tag=greenTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=greenTeamCen] time 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=24}] if score @e[tag=greenTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=greenTeamCen] time 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=24}] if score @e[tag=greenTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 0..5 at @e[tag=greenTeamCen] run function skyisland:green/raid_max
execute if entity @e[tag=greenTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=greenTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run teleport @s @e[tag=greenTeamh,limit=1]
execute if entity @e[tag=greenTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=greenTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=greenTeam] ~ ~ ~ 100
execute if entity @e[tag=greenTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl -= @e[tag=green_raid] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamCen] raidControl -= @e[tag=greenTeamh] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=25}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl = @e[tag=greenTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=25}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 7 Complete","color":"red"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=25}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Next wave is impossible... xD","color":"aqua"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=25}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=25}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
# Wave #8
execute if entity @e[tag=greenTeamCen,scores={mapProgress=26}] if entity @a[team=greenTeam,limit=1] if score @e[tag=greenTeamCen,limit=1] time matches 0.. run scoreboard players add @e[tag=greenTeamCen] time 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=26}] if score @e[tag=greenTeamCen,limit=1] time matches 315.. run scoreboard players set @e[tag=greenTeamCen] time 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=26}] if score @e[tag=greenTeamCen,limit=1] time matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1
#Find total number of mobs in wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 0..5 at @e[tag=greenTeamCen] run function skyisland:green/raid_max
execute if entity @e[tag=greenTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 0..5 run scoreboard players add loopCount raidControl 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if entity @e[tag=greenTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 as @e[tag=green_raid] run teleport @s @e[tag=greenTeamh,limit=1]
execute if entity @e[tag=greenTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if entity @e[tag=greenTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 at @e[tag=greenTeamCen] run playsound minecraft:entity.ender_dragon.growl master @a[team=greenTeam] ~ ~ ~ 100
execute if entity @e[tag=greenTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 6 run scoreboard players add loopCount raidControl 1
#Determine total count of mobs left in wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl -= @e[tag=green_raid] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamCen] raidControl -= @e[tag=greenTeamh] raidControl
execute if entity @e[tag=greenTeamCen,scores={mapProgress=27}] if score loopCount raidControl matches 7 run scoreboard players operation @e[tag=greenTeamh] raidControl = @e[tag=greenTeamCen] raidControl
#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if entity @e[tag=greenTeamCen,scores={mapProgress=27}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a title {"text":"Wave 8 Complete","color":"red"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=27}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run title @a subtitle {"text":"Not bad...","color":"aqua"}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=27}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players set loopCount raidControl 0
execute if entity @e[tag=greenTeamCen,scores={mapProgress=27}] if score @e[tag=greenTeamCen,limit=1] raidControl matches 0 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1

#Stage 6 TP altar (Progress Nums: 28-30)
#--Checks if altar is setup correctly (20)
#Reset scoreboard 
execute if entity @e[tag=greenTeamCen,scores={mapProgress=28..30}] run scoreboard players set altarScore TPaltar 0
#Checking of blocks
execute if entity @e[tag=greenTeamCen,scores={mapProgress=28}] at @e[tag=greenTeama] run function skyisland:tp_setup
execute if entity @e[tag=greenTeamCen,scores={mapProgress=28}] at @e[tag=greenTeama] if score altarScore TPaltar matches 5 run setblock ~ ~16 ~ minecraft:lime_stained_glass replace
execute if entity @e[tag=greenTeamCen,scores={mapProgress=28}] at @e[tag=greenTeama] if score altarScore TPaltar matches 5 run setblock ~ ~6 ~ minecraft:lime_stained_glass replace
execute if entity @e[tag=greenTeamCen,scores={mapProgress=28}] if score altarScore TPaltar matches 5 run scoreboard players add @e[tag=greenTeamCen] mapProgress 1

#--Sets All players on team to survival mode (21)
execute if entity @e[tag=greenTeamCen,scores={mapProgress=29}] run scoreboard players set @a[team=greenTeam] survivalOn 1
execute if entity @e[tag=greenTeamCen,scores={mapProgress=29}] at @e[tag=greenTeama] run fill ~-1 ~-2 ~-1 ~1 ~-2 ~1 minecraft:diamond_ore replace
execute if entity @e[tag=greenTeamCen,scores={mapProgress=29}] at @e[tag=greenTeama] run setblock ~ ~-2 ~ minecraft:emerald_block replace
execute if entity @e[tag=greenTeamCen,scores={mapProgress=29}] at @e[tag=greenTeama] run advancement grant @a[team=greenTeam] only mainisland:root
execute if entity @e[tag=greenTeamCen,scores={mapProgress=29}] run scoreboard players add @e[tag=greenTeamCen] mapProgress 1

#--Initiates Altar TP (22)
#Resets score if player leaves altar
execute if entity @e[tag=greenTeamCen,scores={mapProgress=30}] at @e[tag=greenTeama] unless entity @a[distance=..2] if score tpTimer time matches 1.. run title @a[distance=..4] actionbar {"text":"Cancelled Teleportation...","color":"red","bold":true}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=30}] at @e[tag=greenTeama] unless entity @a[distance=..2] if score tpTimer time matches 1.. run scoreboard players set tpTimer time 0
#If player stays on altar
execute if entity @e[tag=greenTeamCen,scores={mapProgress=30}] at @e[tag=greenTeama] if score tpTimer time matches 1..5 if entity @a[team=greenTeam,distance=..10] run title @a[distance=..2] title {"text":" "}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=30}] at @e[tag=greenTeama] if score tpTimer time matches 1..5 if entity @a[team=greenTeam,distance=..10] run title @a[distance=..2] subtitle {"text":" "}
execute if entity @e[tag=greenTeamCen,scores={mapProgress=30}] at @e[tag=greenTeama] if score tpTimer time matches 1.. if entity @a[team=greenTeam,distance=..10] run particle portal ~ ~ ~ 0 .8 0 .3 8 force
execute if entity @e[tag=greenTeamCen,scores={mapProgress=30}] at @e[tag=greenTeama] if score tpTimer time matches 1.. if entity @a[team=greenTeam,distance=..10] run particle minecraft:end_rod ~ ~2 ~ .01 .01 .01 .1 1 force
execute if entity @e[tag=greenTeamCen,scores={mapProgress=30}] at @e[tag=greenTeama] if score tpTimer time matches 1.. if entity @a[team=greenTeam,distance=..10] run particle minecraft:happy_villager ~ ~2 ~ .1 .1 .1 .1 1 force
execute if entity @e[tag=greenTeamCen,scores={mapProgress=30}] at @e[tag=greenTeama] if score tpTimer time matches 1.. if entity @a[team=greenTeam,distance=..2] run function skyisland:altartp
execute if entity @e[tag=greenTeamCen,scores={mapProgress=30}] at @e[tag=greenTeama] if entity @a[team=greenTeam,distance=..2] run scoreboard players add tpTimer time 1
#Actual Teleportation of Player -- BASED, ONLY CERTAIN TEAMS CAN USE

execute if entity @e[tag=greenTeamCen,scores={mapProgress=30}] at @e[tag=greenTeama] if score tpTimer time matches 330.. as @a[team=greenTeam,distance=..2] run function skyisland:tpmain

#Makes Tp Altar unbreakable
execute if entity @e[tag=greenTeamCen,scores={mapProgress=30}] at @e[tag=greenTeama] if entity @a[scores={survivalOn=1},distance=..15] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:iron_block
execute if entity @e[tag=greenTeamCen,scores={mapProgress=30}] at @e[tag=greenTeama] if entity @a[scores={survivalOn=1},distance=..15] run fill ~ ~ ~ ~ ~ ~ minecraft:beacon
execute if entity @e[tag=greenTeamCen,scores={mapProgress=30}] at @e[tag=greenTeama] if entity @a[scores={survivalOn=1},distance=..15] run kill @e[type=item,distance=..3.5]

#Sets all players to survival if on greenTeam
execute at @e[tag=greenTeamCen] run gamemode survival @a[team=greenTeam,scores={survivalOn=1},distance=..60]
execute at @e[tag=greenTeamCen] run gamemode adventure @a[scores={survivalOn=0},distance=..80]
#Volcano TP thing
execute if entity @a[team=greenTeam,scores={particles=0}] at @e[tag=greenTeamv] run tellraw @a[team=greenTeam,distance=..5] ["",{"text":"\n"},{"text":"<Jeffrey>","color":"gray"},{"text":" Hello "},{"selector":"@a[team=greenTeam,distance=..5]","color":"gray"},{"text":"! My name is Jeffrey. To my right is a "},{"text":"one-time-use portal","color":"light_purple","bold":"true"},{"text":" to get out of here if y'all dont have any "},{"text":"diamonds","color":"gold"},{"text":". Bring me some "},{"text":"diamonds ","color":"gold"},{"text":"to trade to unlock more secrets!\n "}]
execute if entity @a[team=greenTeam,scores={particles=0}] at @e[tag=greenTeamv] if entity @a[team=greenTeam,distance=..5] run scoreboard players add @a[team=greenTeam] particles 1
execute if entity @a[team=greenTeam,scores={particles=1}] at @e[tag=greenTeamv] run title @a[distance=..0.75] title {"text":"One Way Ticket Used","color":"","bold":true}
execute if entity @a[team=greenTeam,scores={particles=1}] at @e[tag=greenTeamv] run title @a[distance=..0.75] subtitle {"text":"Bring Jeffrey Diamonds","color":"gold","bold":true}
execute if entity @a[team=greenTeam,scores={particles=1}] at @e[tag=greenTeamv] if entity @a[team=greenTeam,distance=..0.75] run playsound minecraft:item.chorus_fruit.teleport master @a[team=greenTeam,distance=..0.75] ~ ~ ~ 100
execute if entity @a[team=greenTeam,scores={particles=0..1}] at @e[tag=greenTeamv] if entity @a[team=greenTeam,distance=..15] run summon area_effect_cloud ~ ~ ~ {Particle:effect,WaitTime:2}
execute if entity @a[team=greenTeam,scores={particles=1}] at @e[tag=greenTeamv] if entity @a[team=greenTeam,distance=..0.75] run scoreboard players add @a[team=greenTeam] particles 1
execute if entity @a[team=greenTeam,scores={particles=2}] at @e[tag=greenTeamv] run teleport @a[team=greenTeam,distance=..0.75] @e[tag=greenTeamCen,limit=1]
execute if entity @a[team=greenTeam,scores={particles=2}] run scoreboard players reset @a[team=greenTeam] particles
