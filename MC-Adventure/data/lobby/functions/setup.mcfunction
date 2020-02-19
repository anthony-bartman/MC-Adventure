#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will setup the lobby armor stands, and scoreboards
#--------------------------------------

#Resets Lobby
function lobby:remove

#{Tags:[""],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
#Summon Armor Stands
summon minecraft:armor_stand ~ ~ ~ {Tags:["mainLobby"],NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~25 ~1 ~5 {Tags:["goldTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"green","bold":true}',NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~20 ~1 ~5 {Tags:["purpleTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"green","bold":true}',NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~15 ~1 ~5 {Tags:["greenTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"green","bold":true}',NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~10 ~1 ~5 {Tags:["aquaTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"green","bold":true}',NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~5 ~1 ~5 {Tags:["redTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"green","bold":true}',NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~ ~1 ~5 {Tags:["yellowTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"green","bold":true}',NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-5 ~1 ~5 {Tags:["blueTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"green","bold":true}',NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-10 ~1 ~5 {Tags:["blackTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"green","bold":true}',NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-15 ~1 ~5 {Tags:["cyanTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"green","bold":true}',NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-20 ~1 ~5 {Tags:["magentaTeamj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"green","bold":true}',NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-25 ~1 ~5 {Tags:["spectatorsj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"green","bold":true}',NoGravity:1}

#Create Teams
team add goldTeam {"text":"Gold Team","color":"gold"}
team add purpleTeam {"text":"Purple Team","color":"dark_purple"}
team add greenTeam {"text":"Green Team","color":"green"}
team add aquaTeam {"text":"Aqua Team","color":"aqua"}
team add redTeam {"text":"Red Team","color":"red"}
team add yellowTeam {"text":"Yellow Team","color":"yellow"}
team add blueTeam {"text":"Blue Team","color":"blue"}
team add blackTeam {"text":"Black Team","color":"black"}
team add cyanTeam {"text":"Cyan Team","color":"dark_aqua"}
team add magentaTeam {"text":"Magenta Team","color":"light_purple"}
team add spectators {"text":"Spectators","color":"gray"}

team modify goldTeam color gold
team modify purpleTeam color dark_purple
team modify greenTeam color green
team modify aquaTeam color aqua
team modify redTeam color red
team modify yellowTeam color yellow
team modify blueTeam color blue
team modify blackTeam color black
team modify cyanTeam color dark_aqua
team modify magentaTeam color light_purple
team modify spectators color gray

#------------------
#Setup Scoreboards
#------------------
#Set fake player colors
team join goldTeam goldTeam
team join purpleTeam purpleTeam
team join greenTeam greenTeam
team join aquaTeam aquaTeam
team join redTeam redTeam
team join yellowTeam yellowTeam
team join blueTeam blueTeam
team join blackTeam blackTeam
team join cyanTeam cyanTeam
team join magentaTeam magentaTeam

#Max Team Players
scoreboard objectives add maxPlayers dummy {"text":"Max Players per Team","color":"white","bold":true}
function lobby:teams/set_maxplayers
#Allows player to choose kits
scoreboard objectives add chooseKit trigger {"text":"Kit Values","color":"white","bold":true}
#Lobby Progression to go to map
scoreboard objectives add LP trigger {"text":"Lobby Progression","color":"white","bold":true}
scoreboard players set lobbyProgress LP 0

#Players on each Team
scoreboard objectives add gdTeamPlayers dummy {"text":"Gold Team","color":"white","bold":true}
scoreboard objectives add pTeamPlayers dummy {"text":"Purple Team","color":"white","bold":true}
scoreboard objectives add grTeamPlayers dummy {"text":"Green Team","color":"white","bold":true}
scoreboard objectives add aTeamPlayers dummy {"text":"Aqua Team","color":"white","bold":true}
scoreboard objectives add rTeamPlayers dummy {"text":"Red Team","color":"white","bold":true}
scoreboard objectives add yTeamPlayers dummy {"text":"Yellow Team","color":"white","bold":true}
scoreboard objectives add blueTeamPlayers dummy {"text":"Blue Team","color":"white","bold":true}
scoreboard objectives add blackTeamPlayers dummy {"text":"Black Team","color":"white","bold":true}
scoreboard objectives add cTeamPlayers dummy {"text":"Cyan Team","color":"white","bold":true}
scoreboard objectives add mTeamPlayers dummy {"text":"Magenta Team","color":"white","bold":true}
scoreboard objectives add spectators dummy {"text":"Spectators","color":"white","bold":true}
#Fake Player to determine numPlayers on each team
scoreboard players set Teammates gdTeamPlayers 0
scoreboard players set Teammates pTeamPlayers 0
scoreboard players set Teammates grTeamPlayers 0
scoreboard players set Teammates aTeamPlayers 0
scoreboard players set Teammates rTeamPlayers 0
scoreboard players set Teammates yTeamPlayers 0
scoreboard players set Teammates blueTeamPlayers 0
scoreboard players set Teammates blackTeamPlayers 0
scoreboard players set Teammates cTeamPlayers 0
scoreboard players set Teammates mTeamPlayers 0
scoreboard players set Total_Spectators spectators 0

