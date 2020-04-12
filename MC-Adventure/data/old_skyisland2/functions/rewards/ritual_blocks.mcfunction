#This function will reward all players on the same team the guardian advancement

execute at @a[nbt={Inventory:[{id:"minecraft:slime_block",Count:4b,tag:{Tags:["ritual_block"]}}]}] run advancement grant @a[distance=..100] only skyisland:ritual_blocks

