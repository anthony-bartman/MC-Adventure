#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will set spawn location of the team and set the teams spawnpoint here
#--------------------------------------

teleport @s -356 209 -136
spawnpoint @s -340 151 -191
effect give @s minecraft:blindness 22 10 true
effect give @s minecraft:slow_falling 22 10 true
effect give @s minecraft:regeneration 22 10 true
playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 100
tellraw @s ["",{"text":"\n"},{"text":"Spawnpoint","bold":true,"color":"aqua"},{"text":" for","color":"gray"},{"text":" "},{"selector":"@s","bold":true},{"text":" has been ","color":"gray"},{"text":"SET","bold":true,"color":"yellow"},{"text":" xD","bold":true,"color":"green"},{"text":"\n "}]