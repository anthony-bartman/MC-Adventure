#This file runs all of the dungeons island's main methods...
# As of VERS 1.2, Runs the singular boss island... xD


#Beginning of all altars on island
execute at @e[tag=badGuy] if score blackTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score blackTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score blackTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score magentaTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score magentaTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score magentaTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score aquaTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score aquaTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score aquaTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score redTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score redTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score redTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score yellowTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score yellowTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score yellowTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score blueTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score blueTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score blueTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score greenTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score greenTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~
execute at @e[tag=badGuy] if score greenTeamAltars bossAltarCount matches 4 if entity @a[distance=..50] run summon minecraft:wither ~ ~ ~



# #Change Altar Counts Back to 0
execute if score blackTeamAltars bossAltarCount matches 4 run scoreboard players set blackTeamAltars bossAltarCount 0 
execute if score magentaTeamAltars bossAltarCount matches 4 run scoreboard players set magentaTeamAltars bossAltarCount 0 
execute if score aquaTeamAltars bossAltarCount matches 4 run scoreboard players set aquaTeamAltars bossAltarCount 0 
execute if score redTeamAltars bossAltarCount matches 4 run scoreboard players set redTeamAltars bossAltarCount 0 
execute if score yellowTeamAltars bossAltarCount matches 4 run scoreboard players set yellowTeamAltars bossAltarCount 0 
execute if score blueTeamAltars bossAltarCount matches 4 run scoreboard players set blueTeamAltars bossAltarCount 0 
execute if score greenTeamAltars bossAltarCount matches 4 run scoreboard players set greenTeamAltars bossAltarCount 0 

# #Cool Particles
execute at @e[tag=tpMain] if entity @a[team=!,distance=..15] run particle minecraft:happy_villager ~ ~-1 ~ .1 .1 .1 .1 1 force
execute at @e[tag=tpMain] if entity @a[team=!,distance=..15] run particle minecraft:end_rod ~ ~1 ~ .01 .01 .01 .1 1 force

execute at @e[tag=dungeonSpawn] unless entity @e[type=wither, distance=..100] as @a[distance=..1.5] run title @s title {"text":"Back to Main"}
execute at @e[tag=dungeonSpawn] unless entity @e[type=wither, distance=..100] as @a[distance=..1.5] run title @s subtitle {"selector":"@s"}
execute at @e[tag=dungeonSpawn] unless entity @e[type=wither, distance=..100] as @a[distance=..1.5] run effect give @s minecraft:blindness 3 10 true
execute at @e[tag=dungeonSpawn] unless entity @e[type=wither, distance=..100] as @a[distance=..1.5] run effect give @s minecraft:slow_falling 8 1 true
execute at @e[tag=dungeonSpawn] unless entity @e[type=wither, distance=..100] as @a[distance=..1.5] at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 100
execute at @e[tag=dungeonSpawn] unless entity @e[type=wither, distance=..100] as @a[distance=..1.5] run teleport @s -25 225 160
