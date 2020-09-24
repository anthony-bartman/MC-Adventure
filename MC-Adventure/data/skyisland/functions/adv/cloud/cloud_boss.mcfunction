#This file takes care of the cloud area and its boss

#Teleports all players together
teleport @a[distance=..100] @p

#Erase powercore block
kill @e[type=minecraft:armor_stand,tag=cloudHelp,distance=..3]

#Spawn boss and minions
function skyisland:adv/cloud/guardian
playsound minecraft:item.totem.use master @a[distance=..75] ~ ~ ~ 100
time set midnight
title @a title {"text":"A Guardian","color":"dark_red","bold":true}
title @a subtitle {"text":"has been summoned!","color":"white","bold":true}

#Sets guardians bossbar to visible
bossbar set minecraft:guardian visible true
