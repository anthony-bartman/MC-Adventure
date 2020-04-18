#This file will summon the skyvival key

#Animation for key
function skyisland:adv/abyssal_room/survivalkey_animation
#Sounds
playsound minecraft:entity.lightning_bolt.thunder master @a[distance=..50] ~ ~ ~ 100
playsound minecraft:entity.lightning_bolt.thunder master @a[distance=..50] ~ ~ ~ 100

#Title Command
title @a[distance=..10] title {"text":"Altar Has Been","bold":true}
title @a[distance=..10] subtitle {"text":"ACTIVATED","bold":true,"color":"dark_red"}
