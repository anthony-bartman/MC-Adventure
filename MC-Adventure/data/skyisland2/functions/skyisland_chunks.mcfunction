#This file will teleport players who accidentally destroy their spawn point to the correct island...

#SinglePlayer Coords
execute positioned 5236 137 5134 run spawnpoint @a[distance=..10,tag=sp1] -340 151 -191
execute positioned 5236 137 5134 run spawnpoint @a[distance=..10,tag=sp2] 409 172 -47
execute positioned 5236 137 5134 run spawnpoint @a[distance=..10,tag=sp3] 348 164 -242
execute positioned 5236 137 5134 run spawnpoint @a[distance=..10,tag=sp4] 207 174 -373
execute positioned 5236 137 5134 run spawnpoint @a[distance=..10,tag=sp5] 17 170 -395
execute positioned 5236 137 5134 run spawnpoint @a[distance=..10,tag=sp6] -206 171 -356

#Multiplayer Coords
#Black Team
execute positioned 5236 137 5134 run spawnpoint @a[distance=..10,team=blackTeam] -382 152 24
execute positioned 5236 137 5134 run teleport @a[distance=..10,team=blackTeam] -382 152 24
#Magenta Team
execute positioned 5236 137 5134 run spawnpoint @a[distance=..10,team=magentaTeam] -309 167 224
execute positioned 5236 137 5134 run teleport @a[distance=..10,team=magentaTeam] -309 167 224
#Aqua Team
execute positioned 5236 137 5134 run spawnpoint @a[distance=..10,team=aquaTeam] -190 149 367
execute positioned 5236 137 5134 run teleport @a[distance=..10,team=aquaTeam] -190 149 367
#Red Team
execute positioned 5236 137 5134 run spawnpoint @a[distance=..10,team=redTeam] -20 155 394
execute positioned 5236 137 5134 run teleport @a[distance=..10,team=redTeam] -20 155 394
#Yellow Team
execute positioned 5236 137 5134 run spawnpoint @a[distance=..10,team=yellowTeam] 153 165 379
execute positioned 5236 137 5134 run teleport @a[distance=..10,team=yellowTeam] 153 165 379
#Blue Team
execute positioned 5236 137 5134 run spawnpoint @a[distance=..10,team=blueTeam] 293 174 282
execute positioned 5236 137 5134 run teleport @a[distance=..10,team=blueTeam] 293 174 282
#Green Team
execute positioned 5236 137 5134 run spawnpoint @a[distance=..10,team=greenTeam] 393 172 120
execute positioned 5236 137 5134 run teleport @a[distance=..10,team=greenTeam] 393 172 120
