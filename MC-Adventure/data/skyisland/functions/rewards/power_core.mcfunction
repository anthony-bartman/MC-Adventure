#This function will reward all players on the same team the guardian advancement

execute at @a[nbt={Inventory:[{id:"minecraft:sea_lantern",Count:1b,tag:{Tags:["powerCore"]}}]}] run advancement grant @a[distance=..100] only skyisland:power_core

