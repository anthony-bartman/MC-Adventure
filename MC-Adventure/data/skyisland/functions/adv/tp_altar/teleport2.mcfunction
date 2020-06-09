#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will teleport players to mainIsland
#--------------------------------------

#TP to Main
#-----
#Resets score if player leaves altar
execute unless entity @s[distance=..2] run title @s[distance=..4,scores={skyAltars=1..}] actionbar {"text":"Cancelled Teleportation...","color":"red","bold":true}
execute unless entity @s[distance=..2] run scoreboard players reset @s[scores={skyAltars=1..}] skyAltars
#If player stays on altar
title @s[distance=..2,scores={skyAltars=1..5}] title {"text":" "}
title @s[distance=..2,scores={skyAltars=1..5}] subtitle {"text":" "}
execute if entity @s[distance=..10,scores={skyAltars=1..}] run particle portal ~ ~ ~ 0 .8 0 .3 8 force
execute if entity @s[distance=..10,scores={skyAltars=1..}] run particle minecraft:end_rod ~ ~2 ~ .01 .01 .01 .1 1 force
execute if entity @s[distance=..10,scores={skyAltars=1..}] run particle minecraft:happy_villager ~ ~2 ~ .1 .1 .1 .1 1 force

#Animations for Teleporting
execute if entity @s[distance=..2,scores={skyAltars=18}] run title @s[distance=..1.5] title {"text":"Teleporting...","color":"white","bold":true}
#Cool Sounds Based on skyAltars
execute if entity @s[distance=..2,scores={skyAltars=5}] run title @s[distance=..1.5] actionbar {"text":" "}
execute if entity @s[distance=..2,scores={skyAltars=6}] run playsound minecraft:block.beacon.power_select master @a[distance=..5] ~ ~ ~ 100
execute if entity @s[distance=..2,scores={skyAltars=7}] run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..5] ~ ~ ~ 100
execute if entity @s[distance=..2,scores={skyAltars=12}] run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..5] ~ ~ ~ 100
execute if entity @s[distance=..2,scores={skyAltars=16}] run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..5] ~ ~ ~ 100
execute if entity @s[distance=..2,scores={skyAltars=18}] run playsound minecraft:entity.wither.spawn master @a[distance=..5] ~ ~ ~ 100
execute if entity @s[distance=..2,scores={skyAltars=25}] run playsound minecraft:entity.illusioner.prepare_mirror master @a[distance=..5] ~ ~ ~ 100
#Cool effects based on skyAltars
effect give @s[distance=..2,scores={skyAltars=25}] minecraft:blindness 3 10 true
execute if entity @s[distance=..2,scores={skyAltars=27}] run summon area_effect_cloud ~ ~3 ~ {Particle:explosion_emitter,WaitTime:5}
execute if entity @s[distance=..2,scores={skyAltars=27}] run summon firework_rocket ~ ~1 ~ {FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Colors:[I;3599359,3735491],FadeColors:[I;16777215]},{Type:2,Colors:[I;1877247,16777215],FadeColors:[I;3735551]}]}}}}
#-----
execute if entity @s[distance=..2] run scoreboard players add @s[distance=..2] skyAltars 1
#Actual Teleportation of Player -- BASED, ONLY CERTAIN TEAMS CAN USE
execute as @s[distance=..2,scores={skyAltars=27}] run function skyisland:adv/tp_altar/tpmain
execute if score @s skyAltars matches 27 run scoreboard players reset @s skyAltars

