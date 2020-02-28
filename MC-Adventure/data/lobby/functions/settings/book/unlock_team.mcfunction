#Will allow players to join teams

execute if score lockTeams lockTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Team Joining settings have been set to: [","color":"gray"},{"text":"UNLOCKED","bold":true,"color":"dark_green"},{"text":"]","color":"gray"},{"text":"\n "}]

#Already Been Unlocked
execute if score lockTeams lockTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Team Joining settings have already been set to: [","color":"gray"},{"text":"UNLOCKED","bold":true,"color":"dark_green"},{"text":"]","color":"gray"},{"text":"\n "}]

execute if score lockTeams lockTeams matches 1 run scoreboard players set lockTeams lockTeams 0
#Kills armor stands that say LOCKED
#Summon Armor stand saying its locked
execute if score lockTeams lockTeams matches 0 run kill @e[tag=goldLock]
execute if score lockTeams lockTeams matches 0 run kill @e[tag=purpleLock]
execute if score lockTeams lockTeams matches 0 run kill @e[tag=greenLock]
execute if score lockTeams lockTeams matches 0 run kill @e[tag=aquaLock]
execute if score lockTeams lockTeams matches 0 run kill @e[tag=redLock]
execute if score lockTeams lockTeams matches 0 run kill @e[tag=yellowLock]
execute if score lockTeams lockTeams matches 0 run kill @e[tag=blueLock]
execute if score lockTeams lockTeams matches 0 run kill @e[tag=blackLock]
execute if score lockTeams lockTeams matches 0 run kill @e[tag=cyanLock]
execute if score lockTeams lockTeams matches 0 run kill @e[tag=magentaLock]
execute if score lockTeams lockTeams matches 0 run kill @e[tag=silverLock]
execute if score lockTeams lockTeams matches 0 run kill @e[tag=crimsonLock]
execute if score lockTeams lockTeams matches 0 run kill @e[tag=cobaltLock]

#Teams Join
execute at @e[tag=goldTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["goldTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=purpleTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["purpleTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=greenTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["greenTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=aquaTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["aquaTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=redTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["redTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=yellowTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["yellowTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=blueTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["blueTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=blackTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["blackTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=cyanTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["cyanTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=magentaTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["magentaTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=silverTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["silverTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=crimsonTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["crimsonTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=cobaltTeam] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["cobaltTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}

#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0