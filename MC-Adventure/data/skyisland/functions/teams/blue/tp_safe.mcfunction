#This saves players from death

effect give @s minecraft:blindness 4 1 true
effect give @s minecraft:slow_falling 8 255 true
title @s title {"text":"Defeat Raid","color":"light_purple"}
title @s subtitle {"text":"Before Proceeding To Other Islands","color":"aqua","bold":"true"}
playsound minecraft:entity.evoker.prepare_wololo master @s ~ ~ ~ 100
playsound minecraft:ambient.cave master @s ~ ~ ~ 100
playsound minecraft:entity.villager.no master @s ~ ~ ~ 100

#Tp Command
teleport @s @e[type=minecraft:armor_stand,tag=blueTeamh,limit=1]