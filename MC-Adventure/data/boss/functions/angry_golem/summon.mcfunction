#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will run all of the main function files 
#--------------------------------------

#EnderDragon has 200 maxHealth
#Test 1: Giant maxHealth 500, Wearing Diamond Armor, Glowing so players can clearly see the boss

summon minecraft:giant ~ ~ ~ {Glowing:1b,CustomNameVisible:1b,Health:500f,Tags:["giant"],CustomName:'{"text":"Gerald the Giant","color":"gold","bold":true}',ArmorItems:[{id:"minecraft:diamond_boots",Count:1b},{id:"minecraft:diamond_leggings",Count:1b},{id:"minecraft:diamond_chestplate",Count:1b},{id:"minecraft:diamond_helmet",Count:1b}],Attributes:[{Name:generic.maxHealth,Base:500},{Name:generic.attackDamage,Base:8}]}
playsound minecraft:item.totem.use master @a[distance=..75] ~ ~ ~ 100

bossbar set minecraft:giant visible true

