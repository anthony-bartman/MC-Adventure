#This file will allow the boss to be respawned to get a nether wart block and a beacon

#Stage 3 -Cloud City (Progress Nums: 6-8)

#--Spawns in a cloud boss (7)
execute if score cloudRespawn check matches 0 run function skyisland:cloud_boss
execute if score cloudRespawn check matches 0 run scoreboard players add cloudRespawn check 1

#-- Updates boss bar for cloud boss (8)
execute if score cloudRespawn check matches 1 run bossbar set minecraft:guardian players @a[distance=..30] 
execute if score cloudRespawn check matches 1 run function skyisland:cloud_bossbar
#Increments Score if boss is dead
execute if score cloudRespawn check matches 1 unless entity @e[type=minecraft:evoker,tag=guardian,limit=1,distance=..30] run scoreboard players add cloudRespawn check 1

#Reset cloud place
execute if score cloudRespawn check matches 2 run setblock ~1 ~ ~1 minecraft:air replace
execute if score cloudRespawn check matches 2 run summon minecraft:armor_stand ~.75 ~ ~.75 {Tags:["cloudHelp"],CustomNameVisible:1b,CustomName:'{"text":"Respawn Boss?","color":"gold","bold":true}',Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
execute if score cloudRespawn check matches 2 run scoreboard players set cloudRespawn check 0
