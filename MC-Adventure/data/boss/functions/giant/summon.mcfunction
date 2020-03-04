#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will run all of the main function files 
#--------------------------------------

#EnderDragon has 200 maxHealth
#Test 1: Giant maxHealth 500, Wearing Diamond Armor, Glowing so players can clearly see the boss

summon minecraft:giant ~ ~ ~ {Glowing:1b,Health:100f,Tags:["giant"],CustomName:'{"text":"Gerald the Giant","color":"gold","bold":true}',ActiveEffects:[{Id:10b,Amplifier:1b,Duration:200,ShowParticles:1b}],ArmorItems:[{id:"minecraft:diamond_boots",Count:1b},{id:"minecraft:diamond_leggings",Count:1b},{id:"minecraft:diamond_chestplate",Count:1b},{id:"minecraft:diamond_helmet",Count:1b}],Attributes:[{Name:generic.maxHealth,Base:100},{Name:generic.knockbackResistance,Base:1.0}]}

#Armor stand used for other mobs spawning periodically around boss
summon minecraft:armor_stand ~ ~ ~ {Tags:["giant"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
playsound minecraft:item.totem.use master @a[distance=..50] ~ ~ ~ 100

bossbar set minecraft:giant visible true

