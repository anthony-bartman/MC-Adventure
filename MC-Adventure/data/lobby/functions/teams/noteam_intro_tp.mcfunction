#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will teleport players who aren't on a team to the middle again
#--------------------------------------

title @s subtitle ["",{"text":"Before "},{"text":"Viewing","color":"yellow"},{"text":" The "},{"text":"Intro Sequence","color":"gold"}]
title @s title {"text":"Join A Team","bold":true,"color":"aqua"}

#Teleport back to center
teleport @s @e[type=minecraft:armor_stand,tag=mainLobby,limit=1]