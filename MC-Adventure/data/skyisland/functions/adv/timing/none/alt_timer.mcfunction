#This file will activate certain things based on a timer in minecraft

execute if score @s skyAltars matches 315 run title @a[distance=..50] title {"text":"A Power Core?","color":"white"}
execute if score @s skyAltars matches 315 run title @a[distance=..50] subtitle {"bold":true,"text":"Time to power up the island","color":"blue"}
execute if score @s skyAltars matches 320 run summon firework_rocket ~ ~1 ~ {FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:2,Flicker:1b,Colors:[I;3601151],FadeColors:[I;101320215]},{Type:1,Flicker:1b,Colors:[I;16777215],FadeColors:[I;2842111]}]}}}}
execute if score @s skyAltars matches 320 run function skyisland:adv/special_blocks/getpowercore

#Sounds during ritual
execute if score @s skyAltars matches 50 run playsound minecraft:entity.elder_guardian.curse master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 50 run playsound minecraft:entity.guardian.hurt master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 170 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 170 run playsound minecraft:entity.lightning_bolt.thunder master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 225 run playsound minecraft:entity.elder_guardian.curse master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 225 run playsound minecraft:entity.guardian.hurt master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 225 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 225 run playsound minecraft:entity.lightning_bolt.thunder master @a[distance=..50] ~ ~ ~ 100

execute if score @s skyAltars matches 315 run playsound minecraft:block.end_portal.spawn master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 315 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..50] ~ ~ ~ 100
execute if score @s skyAltars matches 315 run playsound minecraft:entity.lightning_bolt.thunder master @a[distance=..50] ~ ~ ~ 100

#Sets respawn counter to using teamA stand
execute if score @s skyAltars matches 320 if score goldMP mapProgress matches 3 run scoreboard players set goldMP mapProgress 4
execute if score @s skyAltars matches 320 if score purpleMP mapProgress matches 3 run scoreboard players set purpleMP mapProgress 4
execute if score @s skyAltars matches 320 if score greenMP mapProgress matches 3 run scoreboard players set greenMP mapProgress 4
execute if score @s skyAltars matches 320 if score aquaMP mapProgress matches 3 run scoreboard players set aquaMP mapProgress 4
execute if score @s skyAltars matches 320 if score redMP mapProgress matches 3 run scoreboard players set redMP mapProgress 4
execute if score @s skyAltars matches 320 if score yellowMP mapProgress matches 3 run scoreboard players set yellowMP mapProgress 4
execute if score @s skyAltars matches 320 if score blueMP mapProgress matches 3 run scoreboard players set blueMP mapProgress 4
execute if score @s skyAltars matches 320 if score blackMP mapProgress matches 3 run scoreboard players set blackMP mapProgress 4
execute if score @s skyAltars matches 320 if score cyanMP mapProgress matches 3 run scoreboard players set cyanMP mapProgress 4
execute if score @s skyAltars matches 320 if score magentaMP mapProgress matches 3 run scoreboard players set magentaMP mapProgress 4
execute if score @s skyAltars matches 320 if score crimsonMP mapProgress matches 3 run scoreboard players set crimsonMP mapProgress 4
execute if score @s skyAltars matches 320 if score cobaltMP mapProgress matches 3 run scoreboard players set cobaltMP mapProgress 4
execute if score @s skyAltars matches 320 if score ivyMP mapProgress matches 3 run scoreboard players set ivyMP mapProgress 4

#Sets up counter for respawning the altar slime thing
execute if score @s skyAltars matches 320 run scoreboard players set @s skyAltars 0