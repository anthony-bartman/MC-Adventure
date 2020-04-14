#This function will unlock the power room if there is sea lantern

#unlocks the power room
setblock ~5 ~ ~-1 minecraft:air replace
setblock ~5 ~1 ~-1 minecraft:air replace

#Teleports all players together
teleport @a[distance=..50] @p

#Other effects
playsound minecraft:entity.generic.explode master @a[distance=..10] ~ ~ ~ 100
playsound minecraft:entity.elder_guardian.curse master @a[distance=..10] ~ ~ ~ 100
title @a[distance=..10] title {"text":"The Power Room","color":"light_purple","italic":"true"}
title @a[distance=..10] subtitle {"bold":true,"text":"Has Now Been Unlocked","color":"white"}
tellraw @a[distance=..10] [{"text":"\n--------------------\n\n"},{"text":"     Power Room\n","color":"light_purple","bold":true},{"text":"      UNLOCKED\n","color":"white","bold":true},{"text":"\n--------------------\n","color":"reset","bold":false}]

