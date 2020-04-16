#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will teleport players who accidentally reset their spawn to the world spawn
#--------------------------------------

#Effects
effect give @s minecraft:blindness 5 10 true
effect give @s minecraft:slow_falling 5 10 true
effect give @s minecraft:regeneration 5 10 true

#GoldTeam
spawnpoint @s[team=goldTeam] -340 151 -191
teleport @s[team=goldTeam] -340 151 -191
#PurpleTeam
spawnpoint @s[team=purpleTeam] 409 172 -47
teleport @s[team=purpleTeam] 409 172 -47
#Cyan Team
spawnpoint @s[team=cyanTeam] 348 164 -242
teleport @s[team=cyanTeam] 348 164 -242
#Crimson Team
spawnpoint @s[team=crimsonTeam] 207 174 -373
teleport @s[team=crimsonTeam] 207 174 -373
#Cobalt Team
spawnpoint @s[team=cobaltTeam] 17 170 -395
teleport @s[team=cobaltTeam] 17 170 -395
#Ivy Team
spawnpoint @s[team=ivyTeam] -206 171 -356
teleport @s[team=ivyTeam] -206 171 -356
#Black Team
spawnpoint @a[distance=..10,team=blackTeam] -382 152 24
teleport @a[distance=..10,team=blackTeam] -382 152 24
#Magenta Team
spawnpoint @a[distance=..10,team=magentaTeam] -309 167 224
teleport @a[distance=..10,team=magentaTeam] -309 167 224
#Aqua Team
spawnpoint @a[distance=..10,team=aquaTeam] -190 149 367
teleport @a[distance=..10,team=aquaTeam] -190 149 367
#Red Team
spawnpoint @a[distance=..10,team=redTeam] -20 155 394
teleport @a[distance=..10,team=redTeam] -20 155 394
#Yellow Team
spawnpoint @a[distance=..10,team=yellowTeam] 153 165 379
teleport @a[distance=..10,team=yellowTeam] 153 165 379
#Blue Team
spawnpoint @a[distance=..10,team=blueTeam] 293 174 282
teleport @a[distance=..10,team=blueTeam] 293 174 282
#Green Team
spawnpoint @a[distance=..10,team=greenTeam] 393 172 120
teleport @a[distance=..10,team=greenTeam] 393 172 120
