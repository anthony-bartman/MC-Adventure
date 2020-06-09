#This will allow players to respawn the powercore


#--skyAltars for altar slime blocks (2)
#Reset scoreboard 
execute if score @s skyAltars matches 0..1 run scoreboard players set slimeScore skyAltars 0
#Particle Effects above altar
execute if score @s skyAltars matches 0 if entity @a[distance=..5] run summon minecraft:area_effect_cloud ~ ~2 ~ {Particle:witchMagic,WaitTime:30}
#Checks for 4 slimeblocks
execute if score @s skyAltars matches 0 if block ~2 ~ ~ minecraft:slime_block run scoreboard players add slimeScore skyAltars 1
execute if score @s skyAltars matches 0 if block ~-2 ~ ~ minecraft:slime_block run scoreboard players add slimeScore skyAltars 1
execute if score @s skyAltars matches 0 if block ~ ~ ~2 minecraft:slime_block run scoreboard players add slimeScore skyAltars 1
execute if score @s skyAltars matches 0 if block ~ ~ ~-2 minecraft:slime_block run scoreboard players add slimeScore skyAltars 1
#If 4 Slime Blocks
execute if score slimeScore skyAltars matches 4 run scoreboard players set slimeTime skyAltars 1
execute if score slimeScore skyAltars matches 4 if score slimeTime skyAltars matches 1 run function skyisland:adv/slime_room/powercore_animation
execute if score slimeScore skyAltars matches 4 run function skyisland:adv/slime_room/altslime
#Increment skyAltars Score
execute if score slimeScore skyAltars matches 4 run scoreboard players add @s skyAltars 1

#--Begin a skyAltarsr that will activate once 4 slime blocks have been placed (3)
execute if score @s skyAltars matches 1 if score slimeTime skyAltars matches 1.. run scoreboard players add slimeTime skyAltars 1

#---- Alt_timer
execute if score slimeTime skyAltars matches 26 run title @a[distance=..50] title {"text":"A Power Core?","color":"white"}
execute if score slimeTime skyAltars matches 26 run title @a[distance=..50] subtitle {"bold":true,"text":"Time to power up the island","color":"blue"}
execute if score slimeTime skyAltars matches 28 run summon firework_rocket ~ ~1 ~ {FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:2,Flicker:1b,Colors:[I;3601151],FadeColors:[I;10185215]},{Type:1,Flicker:1b,Colors:[I;16777215],FadeColors:[I;2842111]}]}}}}
execute if score slimeTime skyAltars matches 28 run function skyisland:adv/special_blocks/getpowercore

#Sounds during ritual
execute if score slimeTime skyAltars matches 3 run playsound minecraft:entity.elder_guardian.curse master @a[distance=..50] ~ ~ ~ 100
execute if score slimeTime skyAltars matches 3 run playsound minecraft:entity.guardian.hurt master @a[distance=..50] ~ ~ ~ 100
execute if score slimeTime skyAltars matches 15 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..50] ~ ~ ~ 100
execute if score slimeTime skyAltars matches 15 run playsound minecraft:entity.lightning_bolt.thunder master @a[distance=..50] ~ ~ ~ 100
execute if score slimeTime skyAltars matches 19 run playsound minecraft:entity.elder_guardian.curse master @a[distance=..50] ~ ~ ~ 100
execute if score slimeTime skyAltars matches 19 run playsound minecraft:entity.guardian.hurt master @a[distance=..50] ~ ~ ~ 100
execute if score slimeTime skyAltars matches 19 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..50] ~ ~ ~ 100
execute if score slimeTime skyAltars matches 19 run playsound minecraft:entity.lightning_bolt.thunder master @a[distance=..50] ~ ~ ~ 100

execute if score slimeTime skyAltars matches 25 run playsound minecraft:block.end_portal.spawn master @a[distance=..50] ~ ~ ~ 100
execute if score slimeTime skyAltars matches 25 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..50] ~ ~ ~ 100
execute if score slimeTime skyAltars matches 25 run playsound minecraft:entity.lightning_bolt.thunder master @a[distance=..50] ~ ~ ~ 100

#-----

execute if score slimeTime skyAltars matches 28 run scoreboard players set @s skyAltars 0 
execute if score slimeTime skyAltars matches 28 run scoreboard players reset slimeTime skyAltars


