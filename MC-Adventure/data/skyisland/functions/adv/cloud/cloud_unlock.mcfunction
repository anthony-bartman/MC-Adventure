#This function unlocks the cloud area

#Tells user cloud area is unlocked
title @a[distance=..100] title {"text":"Cloud City"}
title @a[distance=..100] subtitle {"text":"Has Now Been Unlocked","color":"aqua","bold":true}
tellraw @a[distance=..100] [{"text":"\n--------------------\n\n"},{"text":"     Cloud City\n","color":"white","bold":true},{"text":"     UNLOCKED\n","color":"aqua","bold":true},{"text":"\n--------------------\n","color":"reset","bold":false}]

#ArmorStand for powercore
summon minecraft:armor_stand ~.75 ~ ~.75 {Tags:["cloudHelp"],CustomNameVisible:1b,CustomName:'{"text":"Power Core?","color":"gold","bold":true}',Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}

#Door to palace
setblock ~-4 ~ ~-4 minecraft:air replace
setblock ~-4 ~1 ~-4 minecraft:air replace

#Waterfall
setblock ~-5 ~-2 ~-19 minecraft:air replace
setblock ~-6 ~-2 ~-19 minecraft:air replace

