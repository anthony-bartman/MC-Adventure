#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will teleport player back 'down' to the ocean
#--------------------------------------

#Cool Effects
effect give @s minecraft:slow_falling 22 1 true
effect give @s minecraft:blindness 10 1 true

#Swap Gamemode
gamemode survival @s

#Update Player
title @s subtitle ["",{"text":"Not Implemented","color":"yellow"},{"text":" once "},{"text":"ADVENTURE is complete","color":"green"}]
title @s title ["",{"text":"Ocean Islands","color":"aqua","bold":true}]

#Grant Players Advancement
execute unless entity @s[advancements={oceanisland:root=true}] run advancement grant @s only oceanisland:root

#Tag them for tpcoin and other things
tag @s add ocean

#Island Spawn Coords
teleport @s[team=aquaTeam] -500 200 -8500
teleport @s[team=blackTeam] -500 200 -8500
teleport @s[team=blueTeam] -500 200 -8500
teleport @s[team=cobaltTeam] -500 200 -8500
teleport @s[team=crimsonTeam] -500 200 -8500
teleport @s[team=cyanTeam] -500 200 -8500
teleport @s[team=goldTeam] -500 200 -8500
teleport @s[team=greenTeam] -500 200 -8500
teleport @s[team=ivyTeam] -500 200 -8500
teleport @s[team=magentaTeam] -500 200 -8500
teleport @s[team=purpleTeam] -500 200 -8500
teleport @s[team=redTeam] -500 200 -8500
teleport @s[team=yellowTeam] -500 200 -8500
#With their coressponding Spawn Coordinates
spawnpoint @s[team=aquaTeam] -491 75 -8405
spawnpoint @s[team=blackTeam] -491 75 -8405
spawnpoint @s[team=blueTeam] -491 75 -8405
spawnpoint @s[team=cobaltTeam] -491 75 -8405
spawnpoint @s[team=crimsonTeam] -491 75 -8405
spawnpoint @s[team=cyanTeam] -491 75 -8405
spawnpoint @s[team=goldTeam] -491 75 -8405
spawnpoint @s[team=greenTeam] -491 75 -8405
spawnpoint @s[team=ivyTeam] -491 75 -8405
spawnpoint @s[team=magentaTeam] -491 75 -8405
spawnpoint @s[team=purpleTeam] -491 75 -8405
spawnpoint @s[team=redTeam] -491 75 -8405
spawnpoint @s[team=yellowTeam] -491 75 -8405