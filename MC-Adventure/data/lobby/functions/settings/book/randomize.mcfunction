#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will randomize each player to a different team
#--------------------------------------
#Used to only do below commands once
execute unless score lockSettingsBook book matches 0 run scoreboard players set randomCounter book 0
execute if score randomCounter book matches 0 run scoreboard players set lockSettingsBook book 0
execute if score randomCounter book matches 0 run teleport @a @e[tag=mainLobby,limit=1]

#Lock team joining, leave all teams, reset all team values..etc
execute if score randomCounter book matches 0 run kill @e[tag=rand]
execute if score randomCounter book matches 0 run kill @e[tag=noSpace]
execute if score randomCounter book matches 0 run function lobby:settings/book/reset_teams
execute if score randomCounter book matches 0 run tellraw @a ["",{"text":"\n"},{"text":"Randomizing Teams...","color":"yellow","bold":true},{"text":"\n"}]
#Spawn in random armor stands
execute if score randomCounter book matches 0 if score goldTeam enabledTeams matches 1 at @e[tag=goldTeam] run summon minecraft:armor_stand ~ ~ ~ {Tags:["rand"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score randomCounter book matches 0 if score purpleTeam enabledTeams matches 1 at @e[tag=purpleTeam] run summon minecraft:armor_stand ~ ~ ~ {Tags:["rand"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score randomCounter book matches 0 if score greenTeam enabledTeams matches 1 at @e[tag=greenTeam] run summon minecraft:armor_stand ~ ~ ~ {Tags:["rand"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score randomCounter book matches 0 if score aquaTeam enabledTeams matches 1 at @e[tag=aquaTeam] run summon minecraft:armor_stand ~ ~ ~ {Tags:["rand"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score randomCounter book matches 0 if score redTeam enabledTeams matches 1 at @e[tag=redTeam] run summon minecraft:armor_stand ~ ~ ~ {Tags:["rand"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score randomCounter book matches 0 if score yellowTeam enabledTeams matches 1 at @e[tag=yellowTeam] run summon minecraft:armor_stand ~ ~ ~ {Tags:["rand"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score randomCounter book matches 0 if score blueTeam enabledTeams matches 1 at @e[tag=blueTeam] run summon minecraft:armor_stand ~ ~ ~ {Tags:["rand"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score randomCounter book matches 0 if score blackTeam enabledTeams matches 1 at @e[tag=blackTeam] run summon minecraft:armor_stand ~ ~ ~ {Tags:["rand"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score randomCounter book matches 0 if score cyanTeam enabledTeams matches 1 at @e[tag=cyanTeam] run summon minecraft:armor_stand ~ ~ ~ {Tags:["rand"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score randomCounter book matches 0 if score magentaTeam enabledTeams matches 1 at @e[tag=magentaTeam] run summon minecraft:armor_stand ~ ~ ~ {Tags:["rand"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score randomCounter book matches 0 if score silverTeam enabledTeams matches 1 at @e[tag=silverTeam] run summon minecraft:armor_stand ~ ~ ~ {Tags:["rand"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score randomCounter book matches 0 if score crimsonTeam enabledTeams matches 1 at @e[tag=crimsonTeam] run summon minecraft:armor_stand ~ ~ ~ {Tags:["rand"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score randomCounter book matches 0 if score cobaltTeam enabledTeams matches 1 at @e[tag=cobaltTeam] run summon minecraft:armor_stand ~ ~ ~ {Tags:["rand"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score randomCounter book matches 0 at @e[tag=spectators] run summon minecraft:armor_stand ~ ~ ~ {Tags:["noSpace"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
#Add one to score so that it doesnt loop above commands
execute if score randomCounter book matches 0 run scoreboard players set randomCounter book 1

#ALGORITHM FOR RANDOMIZATION
#Check if team is full
execute if score randomCounter book matches 1 if score Teammates gdTeamPlayers >= goldTeam maxPlayers at @e[tag=goldTeam] run kill @e[tag=rand,distance=..1]
execute if score randomCounter book matches 1 if score Teammates pTeamPlayers >= purpleTeam maxPlayers at @e[tag=purpleTeam] run kill @e[tag=rand,distance=..1]
execute if score randomCounter book matches 1 if score Teammates grTeamPlayers >= greenTeam maxPlayers at @e[tag=greenTeam] run kill @e[tag=rand,distance=..1]
execute if score randomCounter book matches 1 if score Teammates aTeamPlayers >= aquaTeam maxPlayers at @e[tag=aquaTeam] run kill @e[tag=rand,distance=..1]
execute if score randomCounter book matches 1 if score Teammates rTeamPlayers >= redTeam maxPlayers at @e[tag=redTeam] run kill @e[tag=rand,distance=..1]
execute if score randomCounter book matches 1 if score Teammates yTeamPlayers >= yellowTeam maxPlayers at @e[tag=yellowTeam] run kill @e[tag=rand,distance=..1]
execute if score randomCounter book matches 1 if score Teammates blueTeamPlayers >= blueTeam maxPlayers at @e[tag=blueTeam] run kill @e[tag=rand,distance=..1]
execute if score randomCounter book matches 1 if score Teammates blackTeamPlayers >= blackTeam maxPlayers at @e[tag=blackTeam] run kill @e[tag=rand,distance=..1]
execute if score randomCounter book matches 1 if score Teammates cyTeamPlayers >= cyanTeam maxPlayers at @e[tag=cyanTeam] run kill @e[tag=rand,distance=..1]
execute if score randomCounter book matches 1 if score Teammates mTeamPlayers >= magentaTeam maxPlayers at @e[tag=magentaTeam] run kill @e[tag=rand,distance=..1]
execute if score randomCounter book matches 1 if score Teammates sTeamPlayers >= silverTeam maxPlayers at @e[tag=silverTeam] run kill @e[tag=rand,distance=..1]
execute if score randomCounter book matches 1 if score Teammates crTeamPlayers >= crimsonTeam maxPlayers at @e[tag=crimsonTeam] run kill @e[tag=rand,distance=..1]
execute if score randomCounter book matches 1 if score Teammates coTeamPlayers >= cobaltTeam maxPlayers at @e[tag=cobaltTeam] run kill @e[tag=rand,distance=..1]
#Make random players join teams
execute if score randomCounter book matches 1 as @e[sort=random,type=armor_stand,tag=rand,limit=1] at @s run teleport @r[team=] @s
#Check if all armor stands are gone, to select players to go on spectator
execute if score randomCounter book matches 1 at @e[tag=mainLobby,limit=1] unless entity @e[tag=rand,distance=..100] run teleport @a[team=] @e[tag=noSpace,limit=1]
execute if score randomCounter book matches 1 run title @a[team=spectators] actionbar [{"text":"* ","color":"gold","bold":true},{"text":"ALL TEAMS ARE FULL","color":"red","bold":true},{"text":" *","color":"gold"}]

#Delay in order to teleport all players to a team
execute if score randomCounter book matches 1 run scoreboard players set randomCounter book 2
execute if score randomCounter book matches 2 run scoreboard players add delay book 1

#Reset book counter once this executes
execute if score delay book matches 15.. run scoreboard players reset randomCounter book
execute if score delay book matches 15.. run scoreboard players reset lockSettingsBook book
execute if score delay book matches 15.. run kill @e[tag=rand]
execute if score delay book matches 15.. run kill @e[tag=noSpace]
execute if score delay book matches 15.. run scoreboard players set @a[tag=leader] book 0
execute if score delay book matches 15.. run scoreboard players reset delay book

#Reset local loop variables - All players havent been dispresed yet
execute if score randomCounter book matches 2 run scoreboard players set randomCounter book 1

