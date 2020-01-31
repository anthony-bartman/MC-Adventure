#This file will give the team players the advancement if one of them recieve the key of survival

execute at @a[nbt={Inventory:[{id:"minecraft:beacon",Count:1b,tag:{Tags:["survivalKey"]}}]}] run advancement grant @a[distance=..100] only skyisland:survival_key

