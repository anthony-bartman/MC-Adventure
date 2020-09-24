#This file will automatically set the altar tp beacon to the teamA armorstand

setblock ~ ~ ~ minecraft:beacon replace
teleport @a[distance=..100] ~-4 ~3 ~-7
tellraw @a[distance=..10] [{"text":"Here's the teleport altar xD: \n  ","color":"gray","italic":true},{"selector":"@a[distance=..15]","bold":true}]

