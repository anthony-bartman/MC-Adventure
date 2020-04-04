#This function will reward all players on the same team the guardian advancement

execute at @a[nbt={Inventory:[{id:"minecraft:nether_wart_block",Count:1b,tag:{Tags:["masterCore"]}}]}] run advancement grant @a[distance=..100] only skyisland:guardian
execute at @a[nbt={Inventory:[{id:"minecraft:nether_wart_block",Count:1b,tag:{Tags:["masterCore"]}}]}] run advancement grant @a[distance=..100] only skyisland:master_core

