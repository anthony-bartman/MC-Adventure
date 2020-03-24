#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will set spawn location of the team and set the teams spawnpoint here
#--------------------------------------

teleport @s ~ ~100 ~
spawnpoint @s ~ ~ ~
effect give @s minecraft:blindness 50 10 true
effect give @s minecraft:slow_falling 50 10 true
effect give @s minecraft:regeneration 50 10 true
title @s actionbar ["",{"text":"Spawnpoint for "},{"selector":"@s"},{"text":" is set"},""]