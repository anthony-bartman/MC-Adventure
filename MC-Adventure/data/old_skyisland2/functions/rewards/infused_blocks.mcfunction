#This function will reward all players on the same team the infused diamond blocks advancement

execute at @a[nbt={Inventory:[{id:"minecraft:diamond_block",Count:4b,tag:{Tags:["infused_block"]}}]}] run advancement grant @a[distance=..100] only skyisland:infused_blocks

