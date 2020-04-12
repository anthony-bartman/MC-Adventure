#This file will count total number of entities to determine when the wave is over


#Counts 1 Vindicator
data merge entity @e[distance=..200,type=minecraft:vindicator,tag=,limit=1] {Tags:["sp3_tempraid","sp3_raid"]}
execute as @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid,type=minecraft:vindicator] run scoreboard players add @s raidControl 1
scoreboard players operation @e[tag=sp3Teamh] raidControl += @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid] raidControl
scoreboard players operation @e[tag=sp3TeamCen] raidControl += @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid] raidControl
execute as @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid] run tag @s remove sp3_tempraid

#Counts 1 Pillager
data merge entity @e[distance=..200,type=minecraft:pillager,tag=,limit=1] {Tags:["sp3_tempraid","sp3_raid"]}
execute as @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid,type=minecraft:pillager] run scoreboard players add @s raidControl 1
scoreboard players operation @e[tag=sp3Teamh] raidControl += @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid] raidControl
scoreboard players operation @e[tag=sp3TeamCen] raidControl += @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid] raidControl
execute as @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid] run tag @s remove sp3_tempraid

#Riding Mobs
execute at @e[distance=..200,tag=,type=minecraft:ravager,nbt={Passengers:[{id:"minecraft:vindicator"}]}] run summon minecraft:armor_stand ~ ~1 ~ {Tags:["death"],NoGravity:1}
execute at @e[distance=..200,tag=,type=minecraft:ravager,nbt={Passengers:[{id:"minecraft:vindicator"}]}] run summon minecraft:ravager ~ ~5 ~
execute at @e[tag=death] run kill @e[distance=..1]
execute at @e[distance=..200,tag=,type=minecraft:ravager,nbt={Passengers:[{id:"minecraft:pillager"}]}] run summon minecraft:armor_stand ~ ~1 ~ {Tags:["death"],NoGravity:1}
execute at @e[distance=..200,tag=,type=minecraft:ravager,nbt={Passengers:[{id:"minecraft:pillager"}]}] run summon minecraft:ravager ~ ~5 ~
execute at @e[tag=death] run kill @e[distance=..1]
execute at @e[distance=..200,tag=,type=minecraft:ravager,nbt={Passengers:[{id:"minecraft:evoker"}]}] run summon minecraft:armor_stand ~ ~1 ~ {Tags:["death"],NoGravity:1}
execute at @e[distance=..200,tag=,type=minecraft:ravager,nbt={Passengers:[{id:"minecraft:evoker"}]}] run summon minecraft:ravager ~ ~5 ~
execute at @e[tag=death] run kill @e[distance=..1]

#Counts 1 Witch
data merge entity @e[distance=..200,type=minecraft:witch,tag=,limit=1] {Tags:["sp3_tempraid","sp3_raid"]}
execute as @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid,type=minecraft:witch] run scoreboard players add @s raidControl 1
scoreboard players operation @e[tag=sp3Teamh] raidControl += @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid] raidControl
scoreboard players operation @e[tag=sp3TeamCen] raidControl += @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid] raidControl
execute as @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid] run tag @s remove sp3_tempraid

#Counts 1 Evoker
data merge entity @e[distance=..200,type=minecraft:evoker,tag=,limit=1] {Tags:["sp3_tempraid","sp3_raid"]}
execute as @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid,type=minecraft:evoker] run scoreboard players add @s raidControl 1
scoreboard players operation @e[tag=sp3Teamh] raidControl += @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid] raidControl
scoreboard players operation @e[tag=sp3TeamCen] raidControl += @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid] raidControl
execute as @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid] run tag @s remove sp3_tempraid

#Counts 1 Ravager
data merge entity @e[distance=..200,type=minecraft:ravager,tag=,limit=1] {Tags:["sp3_tempraid","sp3_raid"]}
execute as @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid,type=minecraft:ravager] run scoreboard players add @s raidControl 1
scoreboard players operation @e[tag=sp3Teamh] raidControl += @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid] raidControl
scoreboard players operation @e[tag=sp3TeamCen] raidControl += @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid] raidControl
execute as @e[distance=..200,tag=sp3_tempraid,tag=sp3_raid] run tag @s remove sp3_tempraid
