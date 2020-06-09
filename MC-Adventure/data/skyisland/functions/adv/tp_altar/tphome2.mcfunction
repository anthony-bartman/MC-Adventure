#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will teleport players home from mainisland
#--------------------------------------

#TP from MAIN TO ISLAND
#------
#Cool Particle Effects
particle minecraft:happy_villager ~ ~-1 ~ .1 .1 .1 .1 1 force
particle minecraft:end_rod ~ ~1 ~ .01 .01 .01 .1 1 force

#Checks if player leaves altar
execute unless entity @s[distance=..2] run title @s[distance=..4,scores={skyAltars=1..}] actionbar {"text":"Cancelled Teleportation...","color":"red","bold":true}
execute unless entity @s[distance=..2] run scoreboard players reset @s[scores={skyAltars=1..}] skyAltars

#From Main Island to skyIsland
#Cool Effects
title @s[distance=..1.5,scores={skyAltars=17}] title {"text":"Welcome Home"}
title @s[distance=..1.5,scores={skyAltars=17}] subtitle {"selector":"@s"}
effect give @s[distance=..1.5,scores={skyAltars=17}] minecraft:blindness 3 10 true
effect give @s[distance=..1.5,scores={skyAltars=17}] minecraft:slow_falling 8 1 true
execute at @s[distance=..1.5,scores={skyAltars=17}] run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 100
execute if score @s skyAltars matches 3 run playsound minecraft:block.beacon.power_select master @a[distance=..5] ~ ~ ~ 100
execute if score @s skyAltars matches 7 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..5] ~ ~ ~ 100
execute if score @s skyAltars matches 9 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..5] ~ ~ ~ 100
execute if score @s skyAltars matches 11 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..5] ~ ~ ~ 100
execute if score @s skyAltars matches 13 run playsound minecraft:entity.wither.spawn master @a[distance=..5] ~ ~ ~ 100
execute if score @s skyAltars matches 15 run playsound minecraft:entity.illusioner.prepare_mirror master @a[distance=..5] ~ ~ ~ 100

#Tells user they are getting teleported
title @s[distance=..4,scores={skyAltars=7..12}] actionbar {"text":"Teleporting...","color":"white","bold":true}

#Sets player back into survival
gamemode survival @s[scores={skyAltars=17}]
#Teleport players to team spawn
teleport @s[distance=..1.5,scores={skyAltars=17}] -382 202 24
#Reset clock
scoreboard players reset @s[scores={skyAltars=17}] skyAltars
#Increment Clock if they are on the pad
scoreboard players add @s[distance=..2] skyAltars 1
