#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This will teleport players back home from oceanisland :)
#--------------------------------------

#Title
title @s title {"text":"Welcome Home"}
title @s subtitle {"selector":"@s"}

#Effects
effect give @s minecraft:blindness 4 10 true
effect give @s minecraft:slow_falling 10 1 true
playsound minecraft:entity.illusioner.prepare_mirror master @s ~ ~ ~ 100
summon area_effect_cloud ~ ~3 ~ {Particle:explosion_emitter,WaitTime:5}

#Check if still in sky adventure, then set in gamemode accordingly
# execute unless score aquaMP mapProgress matches 32 run gamemode adventure @s[team=aquaTeam]
execute unless score blackMP mapProgress matches 32 run gamemode adventure @s[team=blackTeam]
# execute unless score blueMP mapProgress matches 32 run gamemode adventure @s[team=blueTeam]
# execute unless score cobaltMP mapProgress matches 32 run gamemode adventure @s[team=cobaltTeam]
# execute unless score crimsonMP mapProgress matches 32 run gamemode adventure @s[team=crimsonTeam]
# execute unless score cyanMP mapProgress matches 32 run gamemode adventure @s[team=cyanTeam]
# execute unless score goldMP mapProgress matches 32 run gamemode adventure @s[team=goldTeam]
# execute unless score greenMP mapProgress matches 32 run gamemode adventure @s[team=greenTeam]
# execute unless score ivyMP mapProgress matches 32 run gamemode adventure @s[team=ivyTeam]
# execute unless score magentaMP mapProgress matches 32 run gamemode adventure @s[team=magentaTeam]
# execute unless score purpleMP mapProgress matches 32 run gamemode adventure @s[team=purpleTeam]
# execute unless score redMP mapProgress matches 32 run gamemode adventure @s[team=redTeam]
# execute unless score yellowMP mapProgress matches 32 run gamemode adventure @s[team=yellowTeam]

#Remove tag
tag @s remove ocean

#Tp Home Coordinates
teleport @s -382 200 24
spawnpoint @s -382 152 24