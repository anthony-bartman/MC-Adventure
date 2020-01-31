#This function will reward all players on the same team the infused diamond blocks advancement

execute at @a[nbt={Inventory:[{id:"minecraft:lever",Count:1b,tag:{Tags:["tower_key"]}}]}] run advancement grant @a[distance=..100] only skyisland:tower_key

