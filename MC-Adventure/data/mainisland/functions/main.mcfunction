#This file runs all of the functions for the main island

#Handles Boss Altars
#Beginning of all altars on island
execute at @e[tag=oceanAltar] if block ~ ~ ~ minecraft:lapis_block if entity @a[team=blackTeam,distance=..15] run scoreboard players add blackTeamAltars bossAltarCount 1
execute at @e[tag=oceanAltar] if block ~ ~ ~ minecraft:lapis_block as @a[team=blackTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=oceanAltar] if block ~ ~ ~ minecraft:lapis_block if entity @a[team=magentaTeam,distance=..15] run scoreboard players add magentaTeamAltars bossAltarCount 1
execute at @e[tag=oceanAltar] if block ~ ~ ~ minecraft:lapis_block as @a[team=magentaTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=oceanAltar] if block ~ ~ ~ minecraft:lapis_block if entity @a[team=aquaTeam,distance=..15] run scoreboard players add aquaTeamAltars bossAltarCount 1
execute at @e[tag=oceanAltar] if block ~ ~ ~ minecraft:lapis_block as @a[team=aquaTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=oceanAltar] if block ~ ~ ~ minecraft:lapis_block if entity @a[team=redTeam,distance=..15] run scoreboard players add redTeamAltars bossAltarCount 1
execute at @e[tag=oceanAltar] if block ~ ~ ~ minecraft:lapis_block as @a[team=redTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=oceanAltar] if block ~ ~ ~ minecraft:lapis_block if entity @a[team=yellowTeam,distance=..15] run scoreboard players add yellowTeamAltars bossAltarCount 1
execute at @e[tag=oceanAltar] if block ~ ~ ~ minecraft:lapis_block as @a[team=yellowTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=oceanAltar] if block ~ ~ ~ minecraft:lapis_block if entity @a[team=blueTeam,distance=..15] run scoreboard players add blueTeamAltars bossAltarCount 1
execute at @e[tag=oceanAltar] if block ~ ~ ~ minecraft:lapis_block as @a[team=blueTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=oceanAltar] if block ~ ~ ~ minecraft:lapis_block if entity @a[team=greenTeam,distance=..15] run scoreboard players add greenTeamAltars bossAltarCount 1
execute at @e[tag=oceanAltar] if block ~ ~ ~ minecraft:lapis_block as @a[team=greenTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=oceanAltar] if block ~ ~ ~ minecraft:lapis_block run setblock ~ ~ ~ minecraft:air replace


execute at @e[tag=desertAltar] if block ~ ~ ~ minecraft:gold_block if entity @a[team=blackTeam,distance=..15] run scoreboard players add blackTeamAltars bossAltarCount 1
execute at @e[tag=desertAltar] if block ~ ~ ~ minecraft:gold_block as @a[team=blackTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=desertAltar] if block ~ ~ ~ minecraft:gold_block if entity @a[team=magentaTeam,distance=..15] run scoreboard players add magentaTeamAltars bossAltarCount 1
execute at @e[tag=desertAltar] if block ~ ~ ~ minecraft:gold_block as @a[team=magentaTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=desertAltar] if block ~ ~ ~ minecraft:gold_block if entity @a[team=aquaTeam,distance=..15] run scoreboard players add aquaTeamAltars bossAltarCount 1
execute at @e[tag=desertAltar] if block ~ ~ ~ minecraft:gold_block as @a[team=aquaTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=desertAltar] if block ~ ~ ~ minecraft:gold_block if entity @a[team=redTeam,distance=..15] run scoreboard players add redTeamAltars bossAltarCount 1
execute at @e[tag=desertAltar] if block ~ ~ ~ minecraft:gold_block as @a[team=redTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=desertAltar] if block ~ ~ ~ minecraft:gold_block if entity @a[team=yellowTeam,distance=..15] run scoreboard players add yellowTeamAltars bossAltarCount 1
execute at @e[tag=desertAltar] if block ~ ~ ~ minecraft:gold_block as @a[team=yellowTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=desertAltar] if block ~ ~ ~ minecraft:gold_block if entity @a[team=blueTeam,distance=..15] run scoreboard players add blueTeamAltars bossAltarCount 1
execute at @e[tag=desertAltar] if block ~ ~ ~ minecraft:gold_block as @a[team=blueTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=desertAltar] if block ~ ~ ~ minecraft:gold_block if entity @a[team=greenTeam,distance=..15] run scoreboard players add greenTeamAltars bossAltarCount 1
execute at @e[tag=desertAltar] if block ~ ~ ~ minecraft:gold_block as @a[team=greenTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=desertAltar] if block ~ ~ ~ minecraft:gold_block run setblock ~ ~ ~ minecraft:air replace

execute at @e[tag=iceAltar] if block ~ ~ ~ minecraft:diamond_block if entity @a[team=blackTeam,distance=..15] run scoreboard players add blackTeamAltars bossAltarCount 1
execute at @e[tag=iceAltar] if block ~ ~ ~ minecraft:diamond_block as @a[team=blackTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=iceAltar] if block ~ ~ ~ minecraft:diamond_block if entity @a[team=magentaTeam,distance=..15] run scoreboard players add magentaTeamAltars bossAltarCount 1
execute at @e[tag=iceAltar] if block ~ ~ ~ minecraft:diamond_block as @a[team=magentaTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=iceAltar] if block ~ ~ ~ minecraft:diamond_block if entity @a[team=aquaTeam,distance=..15] run scoreboard players add aquaTeamAltars bossAltarCount 1
execute at @e[tag=iceAltar] if block ~ ~ ~ minecraft:diamond_block as @a[team=aquaTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=iceAltar] if block ~ ~ ~ minecraft:diamond_block if entity @a[team=redTeam,distance=..15] run scoreboard players add redTeamAltars bossAltarCount 1
execute at @e[tag=iceAltar] if block ~ ~ ~ minecraft:diamond_block as @a[team=redTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=iceAltar] if block ~ ~ ~ minecraft:diamond_block if entity @a[team=yellowTeam,distance=..15] run scoreboard players add yellowTeamAltars bossAltarCount 1
execute at @e[tag=iceAltar] if block ~ ~ ~ minecraft:diamond_block as @a[team=yellowTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=iceAltar] if block ~ ~ ~ minecraft:diamond_block if entity @a[team=blueTeam,distance=..15] run scoreboard players add blueTeamAltars bossAltarCount 1
execute at @e[tag=iceAltar] if block ~ ~ ~ minecraft:diamond_block as @a[team=blueTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=iceAltar] if block ~ ~ ~ minecraft:diamond_block if entity @a[team=greenTeam,distance=..15] run scoreboard players add greenTeamAltars bossAltarCount 1
execute at @e[tag=iceAltar] if block ~ ~ ~ minecraft:diamond_block as @a[team=greenTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=iceAltar] if block ~ ~ ~ minecraft:diamond_block run setblock ~ ~ ~ minecraft:air replace

execute at @e[tag=volcanoAltar] if block ~ ~ ~ minecraft:emerald_block if entity @a[team=blackTeam,distance=..15] run scoreboard players add blackTeamAltars bossAltarCount 1
execute at @e[tag=volcanoAltar] if block ~ ~ ~ minecraft:emerald_block as @a[team=blackTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=volcanoAltar] if block ~ ~ ~ minecraft:emerald_block if entity @a[team=magentaTeam,distance=..15] run scoreboard players add magentaTeamAltars bossAltarCount 1
execute at @e[tag=volcanoAltar] if block ~ ~ ~ minecraft:emerald_block as @a[team=magentaTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=volcanoAltar] if block ~ ~ ~ minecraft:emerald_block if entity @a[team=aquaTeam,distance=..15] run scoreboard players add aquaTeamAltars bossAltarCount 1
execute at @e[tag=volcanoAltar] if block ~ ~ ~ minecraft:emerald_block as @a[team=aquaTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=volcanoAltar] if block ~ ~ ~ minecraft:emerald_block if entity @a[team=redTeam,distance=..15] run scoreboard players add redTeamAltars bossAltarCount 1
execute at @e[tag=volcanoAltar] if block ~ ~ ~ minecraft:emerald_block as @a[team=redTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=volcanoAltar] if block ~ ~ ~ minecraft:emerald_block if entity @a[team=yellowTeam,distance=..15] run scoreboard players add yellowTeamAltars bossAltarCount 1
execute at @e[tag=volcanoAltar] if block ~ ~ ~ minecraft:emerald_block as @a[team=yellowTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=volcanoAltar] if block ~ ~ ~ minecraft:emerald_block if entity @a[team=blueTeam,distance=..15] run scoreboard players add blueTeamAltars bossAltarCount 1
execute at @e[tag=volcanoAltar] if block ~ ~ ~ minecraft:emerald_block as @a[team=blueTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=volcanoAltar] if block ~ ~ ~ minecraft:emerald_block if entity @a[team=greenTeam,distance=..15] run scoreboard players add greenTeamAltars bossAltarCount 1
execute at @e[tag=volcanoAltar] if block ~ ~ ~ minecraft:emerald_block as @a[team=greenTeam,distance=..15] run teleport @s -25 225 160
execute at @e[tag=volcanoAltar] if block ~ ~ ~ minecraft:emerald_block run setblock ~ ~ ~ minecraft:air replace

#Teleports to Boss Battle
execute if score blackTeamAltars bossAltarCount matches 4 run teleport @a[team=blackTeam] -70 152 854
execute if score magentaTeamAltars bossAltarCount matches 4 run teleport @a[team=magentaTeam] -70 152 854
execute if score aquaTeamAltars bossAltarCount matches 4 run teleport @a[team=aquaTeam] -70 152 854
execute if score redTeamAltars bossAltarCount matches 4 run teleport @a[team=redTeam] -70 152 854
execute if score yellowTeamAltars bossAltarCount matches 4 run teleport @a[team=yellowTeam] -70 152 854
execute if score blueTeamAltars bossAltarCount matches 4 run teleport @a[team=blueTeam] -70 152 854
execute if score greenTeamAltars bossAltarCount matches 4 run teleport @a[team=greenTeam] -70 152 854




