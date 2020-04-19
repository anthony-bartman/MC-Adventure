#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will run the methods and make the 3 keys respawn
#--------------------------------------
#Stage 4 Survival Key 
#-- Place Master core in power room 
execute if score skyKeyRespawn skyAltars matches 0 run function skyisland:adv/abyssal_room/pow_key
execute if score skyKeyRespawn skyAltars matches 0 run scoreboard players set @s skyAltars 1
execute if score skyKeyRespawn skyAltars matches 0 run scoreboard players set skyKeyRespawn skyAltars 1

#--Begin a timer that will activate nether wart block has been placed (10)
#Adds one to counter, and runs commands based on the timer's values
execute if score skyKeyRespawn skyAltars matches 1 if score @s skyAltars matches 1.. run scoreboard players add @s skyAltars 1
#---- Pow Timer
#Gets key
execute if score @s skyAltars matches 320 run function skyisland:adv/special_blocks/getsurvivalkey
execute if score @s skyAltars matches 320 run summon firework_rocket ~ ~ ~ {FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:3,Flicker:1b,Colors:[I;5898022],FadeColors:[I;16763760]},{Type:1,Flicker:1b,Colors:[I;16731635],FadeColors:[I;16777215]},{Type:2,Flicker:1b,Colors:[I;15859568],FadeColors:[I;6935295]}]}}}}
execute if score @s skyAltars matches 320 run setblock ~-5 ~2 ~ minecraft:air replace 
execute if score @s skyAltars matches 320 run setblock ~-5 ~3 ~ minecraft:sea_lantern replace
#Tells user tp altar unlocked
execute if score @s skyAltars matches 315 run title @a[distance=..50] title {"text":"New Altar","color":"white"}
execute if score @s skyAltars matches 315 run title @a[distance=..50] subtitle {"bold":true,"text":"Has Been Unlocked","color":"aqua"}
execute if score @s skyAltars matches 315 run tellraw @a[distance=..50] [{"text":"\n--------------------\n\n"},{"text":"     Take the key\n","color":"white","bold":true},{"text":"      to the altar\n","color":"aqua","bold":true},{"text":"\n--------------------\n","color":"reset","bold":false}]
#Extra sound effects
execute if score @s skyAltars matches 50 run playsound minecraft:entity.generic.explode master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 50 run playsound minecraft:entity.ender_dragon.growl master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 170 run playsound minecraft:entity.generic.explode master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 170 run playsound minecraft:entity.elder_guardian.curse master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 170 run playsound minecraft:entity.generic.explode master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 225 run playsound minecraft:entity.ender_dragon.growl master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 225 run playsound minecraft:entity.lightning_bolt.thunder master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 225 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 225 run playsound minecraft:entity.generic.explode master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 315 run playsound minecraft:entity.generic.explode master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 315 run playsound minecraft:entity.generic.explode master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 315 run playsound minecraft:block.end_portal.spawn master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 315 run playsound minecraft:entity.lightning_bolt.thunder master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 315 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..50] ~ ~ ~ 100
#------
#Reset everything for next round
execute if score skyKeyRespawn skyAltars matches 1 if score @s skyAltars matches 320 run scoreboard players set skyKeyRespawn skyAltars 2
#Timer
execute if score skyKeyRespawn skyAltars matches 2 run scoreboard players reset @s skyAltars


