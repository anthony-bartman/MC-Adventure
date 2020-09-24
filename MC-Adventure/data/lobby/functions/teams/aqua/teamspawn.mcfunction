#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will set spawn location of the team and set the teams spawnpoint here
#--------------------------------------

teleport @s -206 207 422
spawnpoint @s -190 149 367
effect give @s minecraft:blindness 22 10 true
effect give @s minecraft:slow_falling 22 10 true
effect give @s minecraft:regeneration 22 10 true
playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 100
#Update Players
execute as @s run function lobby:teams/tellraw_players