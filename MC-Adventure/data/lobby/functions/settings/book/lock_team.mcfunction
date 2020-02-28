#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will lock the teams from joining
#--------------------------------------

#Locks team joining allow players to join teams
execute if score lockTeams lockTeams matches 0 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Team joining settings have been set to: [","color":"gray"},{"text":"LOCKED","bold":true,"color":"red"},{"text":"]","color":"gray"},{"text":"\n "}]
#Team Joining already Locked
execute if score lockTeams lockTeams matches 1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Team joining settings have already been set to: [","color":"gray"},{"text":"LOCKED","bold":true,"color":"red"},{"text":"]","color":"gray"},{"text":"\n "}]

execute if score lockTeams lockTeams matches 0 run scoreboard players set lockTeams lockTeams 1
#Summon Armor stand saying its locked
execute if score lockTeams lockTeams matches 1 run kill @e[tag=goldLock]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=purpleLock]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=greenLock]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=aquaLock]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=redLock]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=yellowLock]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=blueLock]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=blackLock]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=cyanLock]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=magentaLock]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=silverLock]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=crimsonLock]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=cobaltLock]
#Kill the Join Armor Stands
execute if score lockTeams lockTeams matches 1 run kill @e[tag=goldTeamj]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=purpleTeamj]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=greenTeamj]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=aquaTeamj]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=redTeamj]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=yellowTeamj]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=blueTeamj]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=blackTeamj]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=cyanTeamj]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=magentaTeamj]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=silverTeamj]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=crimsonTeamj]
execute if score lockTeams lockTeams matches 1 run kill @e[tag=cobaltTeamj]
#Summon New Armor Stands that say LOCKED
execute if score lockTeams lockTeams matches 1 at @e[tag=goldTeam] run summon minecraft:armor_stand ~ ~-2.5 ~ {NoGravity:1,Tags:["goldLock"],CustomNameVisible:1b,Invisible:1b,CustomName:"{\"text\":\"LOCKED\",\"color\":\"red\",\"bold\":\"true\"}"}
execute if score lockTeams lockTeams matches 1 at @e[tag=purpleTeam] run summon minecraft:armor_stand ~ ~-2.5 ~ {NoGravity:1,Tags:["purpleLock"],CustomNameVisible:1b,Invisible:1b,CustomName:"{\"text\":\"LOCKED\",\"color\":\"red\",\"bold\":\"true\"}"}
execute if score lockTeams lockTeams matches 1 at @e[tag=greenTeam] run summon minecraft:armor_stand ~ ~-2.5 ~ {NoGravity:1,Tags:["greenLock"],CustomNameVisible:1b,Invisible:1b,CustomName:"{\"text\":\"LOCKED\",\"color\":\"red\",\"bold\":\"true\"}"}
execute if score lockTeams lockTeams matches 1 at @e[tag=aquaTeam] run summon minecraft:armor_stand ~ ~-2.5 ~ {NoGravity:1,Tags:["aquaLock"],CustomNameVisible:1b,Invisible:1b,CustomName:"{\"text\":\"LOCKED\",\"color\":\"red\",\"bold\":\"true\"}"}
execute if score lockTeams lockTeams matches 1 at @e[tag=redTeam] run summon minecraft:armor_stand ~ ~-2.5 ~ {NoGravity:1,Tags:["redLock"],CustomNameVisible:1b,Invisible:1b,CustomName:"{\"text\":\"LOCKED\",\"color\":\"red\",\"bold\":\"true\"}"}
execute if score lockTeams lockTeams matches 1 at @e[tag=yellowTeam] run summon minecraft:armor_stand ~ ~-2.5 ~ {NoGravity:1,Tags:["yellowLock"],CustomNameVisible:1b,Invisible:1b,CustomName:"{\"text\":\"LOCKED\",\"color\":\"red\",\"bold\":\"true\"}"}
execute if score lockTeams lockTeams matches 1 at @e[tag=blueTeam] run summon minecraft:armor_stand ~ ~-2.5 ~ {NoGravity:1,Tags:["blueLock"],CustomNameVisible:1b,Invisible:1b,CustomName:"{\"text\":\"LOCKED\",\"color\":\"red\",\"bold\":\"true\"}"}
execute if score lockTeams lockTeams matches 1 at @e[tag=blackTeam] run summon minecraft:armor_stand ~ ~-2.5 ~ {NoGravity:1,Tags:["blackLock"],CustomNameVisible:1b,Invisible:1b,CustomName:"{\"text\":\"LOCKED\",\"color\":\"red\",\"bold\":\"true\"}"}
execute if score lockTeams lockTeams matches 1 at @e[tag=cyanTeam] run summon minecraft:armor_stand ~ ~-2.5 ~ {NoGravity:1,Tags:["cyanLock"],CustomNameVisible:1b,Invisible:1b,CustomName:"{\"text\":\"LOCKED\",\"color\":\"red\",\"bold\":\"true\"}"}
execute if score lockTeams lockTeams matches 1 at @e[tag=magentaTeam] run summon minecraft:armor_stand ~ ~-2.5 ~ {NoGravity:1,Tags:["magentaLock"],CustomNameVisible:1b,Invisible:1b,CustomName:"{\"text\":\"LOCKED\",\"color\":\"red\",\"bold\":\"true\"}"}
execute if score lockTeams lockTeams matches 1 at @e[tag=silverTeam] run summon minecraft:armor_stand ~ ~-2.5 ~ {NoGravity:1,Tags:["silverLock"],CustomNameVisible:1b,Invisible:1b,CustomName:"{\"text\":\"LOCKED\",\"color\":\"red\",\"bold\":\"true\"}"}
execute if score lockTeams lockTeams matches 1 at @e[tag=crimsonTeam] run summon minecraft:armor_stand ~ ~-2.5 ~ {NoGravity:1,Tags:["crimsonLock"],CustomNameVisible:1b,Invisible:1b,CustomName:"{\"text\":\"LOCKED\",\"color\":\"red\",\"bold\":\"true\"}"}
execute if score lockTeams lockTeams matches 1 at @e[tag=cobaltTeam] run summon minecraft:armor_stand ~ ~-2.5 ~ {NoGravity:1,Tags:["cobaltLock"],CustomNameVisible:1b,Invisible:1b,CustomName:"{\"text\":\"LOCKED\",\"color\":\"red\",\"bold\":\"true\"}"}

#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0



