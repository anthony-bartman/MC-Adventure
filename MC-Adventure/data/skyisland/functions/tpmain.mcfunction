#This file will teleport players to the main island 

effect give @s minecraft:slow_falling 100000 10 true
effect give @s minecraft:jump_boost 100000 10 true
effect give @s minecraft:night_vision 100000 10 true
effect give @s minecraft:speed 100000 5 true
execute as @s run function lobby:god_mode
scoreboard players reset @s survivalOn

teleport @s 0 300 0

title @s title {"text":"Thank you for playing!","color":"yellow","bold":"true"}
title @s subtitle {"text":"Please tell me your suggestions/experience xD","color":"white"}
tellraw @s ["",{"text":"\n\n\n\n\n\n\n\n\n\n","color":"none","bold":false},{"text":"Thank you for playing my map demo ","bold":true},{"selector":"@a","color":"yellow","bold":true},{"text":" I have worked on this part of the map for too long! Hopefully for my next release, this main island will have some life :) ","color":"none","bold":false},{"text":"And again, thanks for playing,","color":"none"},{"text":"\n\n            |- Skyvival -|","color":"gold","bold":true},{"text":"\n\n                          By: ","color":"none","bold":false},{"text":"\n\n                                  Atraindabeast","color":"aqua","bold":true},{"text":"\n","color":"none","bold":false}]
