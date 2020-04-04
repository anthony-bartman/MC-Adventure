#This file will count total number of entities to determine when the wave is over


#Counts 1 Vindicator
data merge entity @e[distance=..90,type=minecraft:vindicator,tag=,limit=1] {Tags:["green_tempraid","green_raid"]}
execute as @e[distance=..90,tag=green_tempraid,tag=green_raid,type=minecraft:vindicator] run scoreboard players add @s raidControl 1
scoreboard players operation @e[tag=greenTeamh] raidControl += @e[distance=..90,tag=green_tempraid,tag=green_raid] raidControl
scoreboard players operation @e[tag=greenTeamCen] raidControl += @e[distance=..90,tag=green_tempraid,tag=green_raid] raidControl
execute as @e[distance=..90,tag=green_tempraid,tag=green_raid] run tag @s remove green_tempraid

#Counts 1 Pillager
data merge entity @e[distance=..90,type=minecraft:pillager,tag=,limit=1] {Tags:["green_tempraid","green_raid"]}
execute as @e[distance=..90,tag=green_tempraid,tag=green_raid,type=minecraft:pillager] run scoreboard players add @s raidControl 1
scoreboard players operation @e[tag=greenTeamh] raidControl += @e[distance=..90,tag=green_tempraid,tag=green_raid] raidControl
scoreboard players operation @e[tag=greenTeamCen] raidControl += @e[distance=..90,tag=green_tempraid,tag=green_raid] raidControl
execute as @e[distance=..90,tag=green_tempraid,tag=green_raid] run tag @s remove green_tempraid

#Riding Mobs
execute at @e[distance=..90,tag=,type=minecraft:ravager,nbt={Passengers:[{id:"minecraft:vindicator"}]}] run summon minecraft:armor_stand ~ ~1 ~ {Tags:["death"],NoGravity:1}
execute at @e[distance=..90,tag=,type=minecraft:ravager,nbt={Passengers:[{id:"minecraft:vindicator"}]}] run summon minecraft:ravager ~ ~5 ~
execute at @e[tag=death] run kill @e[distance=..1]
execute at @e[distance=..90,tag=,type=minecraft:ravager,nbt={Passengers:[{id:"minecraft:pillager"}]}] run summon minecraft:armor_stand ~ ~1 ~ {Tags:["death"],NoGravity:1}
execute at @e[distance=..90,tag=,type=minecraft:ravager,nbt={Passengers:[{id:"minecraft:pillager"}]}] run summon minecraft:ravager ~ ~5 ~
execute at @e[tag=death] run kill @e[distance=..1]
execute at @e[distance=..90,tag=,type=minecraft:ravager,nbt={Passengers:[{id:"minecraft:evoker"}]}] run summon minecraft:armor_stand ~ ~1 ~ {Tags:["death"],NoGravity:1}
execute at @e[distance=..90,tag=,type=minecraft:ravager,nbt={Passengers:[{id:"minecraft:evoker"}]}] run summon minecraft:ravager ~ ~5 ~
execute at @e[tag=death] run kill @e[distance=..1]

#Counts 1 Witch
data merge entity @e[distance=..90,type=minecraft:witch,tag=,limit=1] {Tags:["green_tempraid","green_raid"]}
execute as @e[distance=..90,tag=green_tempraid,tag=green_raid,type=minecraft:witch] run scoreboard players add @s raidControl 1
scoreboard players operation @e[tag=greenTeamh] raidControl += @e[distance=..90,tag=green_tempraid,tag=green_raid] raidControl
scoreboard players operation @e[tag=greenTeamCen] raidControl += @e[distance=..90,tag=green_tempraid,tag=green_raid] raidControl
execute as @e[distance=..90,tag=green_tempraid,tag=green_raid] run tag @s remove green_tempraid

#Counts 1 Evoker
data merge entity @e[distance=..90,type=minecraft:evoker,tag=,limit=1] {Tags:["green_tempraid","green_raid"]}
execute as @e[distance=..90,tag=green_tempraid,tag=green_raid,type=minecraft:evoker] run scoreboard players add @s raidControl 1
scoreboard players operation @e[tag=greenTeamh] raidControl += @e[distance=..90,tag=green_tempraid,tag=green_raid] raidControl
scoreboard players operation @e[tag=greenTeamCen] raidControl += @e[distance=..90,tag=green_tempraid,tag=green_raid] raidControl
execute as @e[distance=..90,tag=green_tempraid,tag=green_raid] run tag @s remove green_tempraid

#Counts 1 Ravager
data merge entity @e[distance=..90,type=minecraft:ravager,tag=,limit=1] {Tags:["green_tempraid","green_raid"]}
execute as @e[distance=..90,tag=green_tempraid,tag=green_raid,type=minecraft:ravager] run scoreboard players add @s raidControl 1
scoreboard players operation @e[tag=greenTeamh] raidControl += @e[distance=..90,tag=green_tempraid,tag=green_raid] raidControl
scoreboard players operation @e[tag=greenTeamCen] raidControl += @e[distance=..90,tag=green_tempraid,tag=green_raid] raidControl
execute as @e[distance=..90,tag=green_tempraid,tag=green_raid] run tag @s remove green_tempraid
