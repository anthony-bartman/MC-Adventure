#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will remove all lobby related items
#--------------------------------------

#Remove Intro Base Blocks
execute at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run fill ~8 ~-3 ~8 ~-8 ~1 ~-8 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=goldIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=purpleIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=greenIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=aquaIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=redIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=yellowIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=blueIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=blackIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=cyanIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=magentaIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=silverIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=crimsonIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=cobaltIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=ivyIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=opalIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=spectatorsIntro,limit=1] run fill ~3 ~-3.5 ~3 ~-3 ~1.5 ~-3 minecraft:air

#Remove Armor Stands
execute at @e[type=minecraft:armor_stand,tag=mainLobby,limit=1] run kill @e[distance=..100,type=!minecraft:player,type=!minecraft:item_frame]

#Remove Teams
team remove goldTeam
team remove purpleTeam
team remove greenTeam
team remove aquaTeam
team remove redTeam
team remove yellowTeam
team remove blueTeam
team remove blackTeam
team remove cyanTeam
team remove magentaTeam
team remove silverTeam
team remove crimsonTeam
team remove cobaltTeam
team remove ivyTeam
team remove opalTeam
team remove spectators

#-------------------
#Remove Scoreboards
#------------------
#Lobby
scoreboard objectives remove maxPlayers
scoreboard objectives remove enabledTeams
scoreboard objectives remove chooseKit
scoreboard objectives remove intro
scoreboard objectives remove leader
scoreboard objectives remove book
scoreboard objectives remove lobbySettings
scoreboard objectives remove introBeginRClick
scoreboard objectives remove deathCounter
#Teams
scoreboard objectives remove teamPlayers
scoreboard objectives remove gdTeamPlayers
scoreboard objectives remove pTeamPlayers
scoreboard objectives remove grTeamPlayers
scoreboard objectives remove aTeamPlayers
scoreboard objectives remove rTeamPlayers
scoreboard objectives remove yTeamPlayers
scoreboard objectives remove blueTeamPlayers
scoreboard objectives remove blackTeamPlayers
scoreboard objectives remove cyTeamPlayers
scoreboard objectives remove mTeamPlayers
scoreboard objectives remove sTeamPlayers
scoreboard objectives remove crTeamPlayers
scoreboard objectives remove coTeamPlayers
scoreboard objectives remove iTeamPlayers
scoreboard objectives remove oTeamPlayers
scoreboard objectives remove spectators

#Remove Tags
tag @a remove leader
tag @a remove begin
tag @a remove player
tag @a remove newbie


