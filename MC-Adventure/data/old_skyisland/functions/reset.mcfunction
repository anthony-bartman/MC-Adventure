#Resets skyisland progress to nothing

execute at @e[tag=blackTeamCen] run function skyisland:black/loot/reset
execute at @e[tag=magentaTeamCen] run function skyisland:magenta/loot/reset
execute at @e[tag=aquaTeamCen] run function skyisland:aqua/loot/reset
execute at @e[tag=redTeamCen] run function skyisland:red/loot/reset
execute at @e[tag=yellowTeamCen] run function skyisland:yellow/loot/reset
execute at @e[tag=greenTeamCen] run function skyisland:blue/loot/reset
execute at @e[tag=blueTeamCen] run function skyisland:green/loot/reset
execute at @e[tag=sp1TeamCen] run function skyisland:sp1/loot/reset
execute at @e[tag=sp2TeamCen] run function skyisland:sp2/loot/reset
execute at @e[tag=sp3TeamCen] run function skyisland:sp3/loot/reset
execute at @e[tag=sp4TeamCen] run function skyisland:sp4/loot/reset
execute at @e[tag=sp5TeamCen] run function skyisland:sp5/loot/reset
execute at @e[tag=sp6TeamCen] run function skyisland:sp6/loot/reset

kill @e[tag=!,type=!player,tag=!spawnChunk]
function lobby:reset

