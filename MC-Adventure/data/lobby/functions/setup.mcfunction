#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will setup the lobby armor stands, and scoreboards
#--------------------------------------

#Resets Lobby
function lobby:remove
#Sets up gamerule Settings for Lobby
#function lobby:settings/lobby

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
team add silverTeam {"text":"Silver Team","color":"gray"}
team add crimsonTeam {"text":"Crimson Team","color":"dark_red"}
team add cobaltTeam {"text":"Cobalt Team","color":"dark_blue"}
team add spectators {"text":"Spectators","color":"dark_gray"}

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
team modify silverTeam color gray
team modify crimsonTeam color dark_red
team modify cobaltTeam color dark_blue
team modify spectators color dark_gray
#Team Settings
function lobby:settings/team_disableff

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
team join silverTeam silverTeam
team join crimsonTeam crimsonTeam
team join cobaltTeam cobaltTeam

#Max Team Players
scoreboard objectives add maxPlayers dummy {"text":"Max Players Per Team","color":"white","bold":true}
function lobby:teams/set_maxplayers
#Which Teams are Enabled
scoreboard objectives add enabledTeams dummy {"text":"Teams Enabled?","color":"white","bold":true}
#Allows player to choose kits
scoreboard objectives add chooseKit trigger {"text":"Kit Values","color":"white","bold":true}
#Lobby Progression to begin the map
scoreboard objectives add LP dummy {"text":"Lobby Progression","color":"white","bold":true}
scoreboard players set lobbyProgress LP 0
#Can tell who is 'leader' of server
scoreboard objectives add leader dummy {"text":"Leader?","color":"white","bold":true}
#Handles Map Settings Book
scoreboard objectives add book trigger {"text":"Settings Book","color":"white","bold":true}
scoreboard objectives add lockTeams dummy {"text":"Teams Joining Locked?","color":"white","bold":true}
scoreboard objectives add particles dummy {"text":"Particles?","color":"white","bold":true}


#Initial Lobby Settings (Unlocked and Particles Enabled)
scoreboard players set lockTeams lockTeams 0
scoreboard players set particles particles 1

#Players on each Team
scoreboard objectives add gdTeamPlayers dummy {"text":"Gold Team","color":"white","bold":true}
scoreboard objectives add pTeamPlayers dummy {"text":"Purple Team","color":"white","bold":true}
scoreboard objectives add grTeamPlayers dummy {"text":"Green Team","color":"white","bold":true}
scoreboard objectives add aTeamPlayers dummy {"text":"Aqua Team","color":"white","bold":true}
scoreboard objectives add rTeamPlayers dummy {"text":"Red Team","color":"white","bold":true}
scoreboard objectives add yTeamPlayers dummy {"text":"Yellow Team","color":"white","bold":true}
scoreboard objectives add blueTeamPlayers dummy {"text":"Blue Team","color":"white","bold":true}
scoreboard objectives add blackTeamPlayers dummy {"text":"Black Team","color":"white","bold":true}
scoreboard objectives add cyTeamPlayers dummy {"text":"Cyan Team","color":"white","bold":true}
scoreboard objectives add mTeamPlayers dummy {"text":"Magenta Team","color":"white","bold":true}
scoreboard objectives add sTeamPlayers dummy {"text":"Silver Team","color":"white","bold":true}
scoreboard objectives add crTeamPlayers dummy {"text":"Crimson Team","color":"white","bold":true}
scoreboard objectives add coTeamPlayers dummy {"text":"Cobalt Team","color":"white","bold":true}
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
scoreboard players set Teammates cyTeamPlayers 0
scoreboard players set Teammates mTeamPlayers 0
scoreboard players set Teammates sTeamPlayers 0
scoreboard players set Teammates crTeamPlayers 0
scoreboard players set Teammates coTeamPlayers 0
scoreboard players set Total_Spectators spectators 0

#Fake Player to determine if the team is enabled
# * 10 will be enabled to begin * Book can change that
scoreboard players set goldTeam enabledTeams 1
scoreboard players set purpleTeam enabledTeams 1
scoreboard players set greenTeam enabledTeams 1
scoreboard players set aquaTeam enabledTeams 1
scoreboard players set redTeam enabledTeams 1
scoreboard players set yellowTeam enabledTeams 1
scoreboard players set blueTeam enabledTeams 1
scoreboard players set blackTeam enabledTeams 1
scoreboard players set cyanTeam enabledTeams 1
scoreboard players set magentaTeam enabledTeams 1
scoreboard players set silverTeam enabledTeams 0
scoreboard players set crimsonTeam enabledTeams 0
scoreboard players set cobaltTeam enabledTeams 0

#---------------------
# Team Armor Stands
#---------------------
summon minecraft:armor_stand ~ ~ ~ {Tags:["mainLobby"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
#Teams Stands
execute if score goldTeam enabledTeams matches 1 at @e[tag=mainLobby,limit=1] positioned ~30 ~1.5 ~5 run function lobby:teams/gold/summon
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~25 ~1.5 ~5 {Tags:["purpleTeam"],CustomNameVisible:1b,CustomName:'{"text":"Purple Team","color":"dark_purple","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~20 ~1.5 ~5 {Tags:["greenTeam"],CustomNameVisible:1b,CustomName:'{"text":"Green Team","color":"green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~15 ~1.5 ~5 {Tags:["aquaTeam"],CustomNameVisible:1b,CustomName:'{"text":"Aqua Team","color":"aqua","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~10 ~1.5 ~5 {Tags:["redTeam"],CustomNameVisible:1b,CustomName:'{"text":"Red Team","color":"red","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~5 ~1.5 ~5 {Tags:["yellowTeam"],CustomNameVisible:1b,CustomName:'{"text":"Yellow Team","color":"yellow","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~ ~1.5 ~5 {Tags:["blueTeam"],CustomNameVisible:1b,CustomName:'{"text":"Blue Team","color":"blue","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-5 ~1.5 ~5 {Tags:["blackTeam"],CustomNameVisible:1b,CustomName:'{"text":"Black Team","color":"black","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-10 ~1.5 ~5 {Tags:["cyanTeam"],CustomNameVisible:1b,CustomName:'{"text":"Cyan Team","color":"dark_aqua","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-15 ~1.5 ~5 {Tags:["magentaTeam"],CustomNameVisible:1b,CustomName:'{"text":"Magenta Team","color":"light_purple","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-20 ~1.5 ~5 {Tags:["silverTeam"],CustomNameVisible:1b,CustomName:'{"text":"Silver Team","color":"gray","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-25 ~1.5 ~5 {Tags:["crimsonTeam"],CustomNameVisible:1b,CustomName:'{"text":"Crimson Team","color":"dark_red","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-30 ~1.5 ~5 {Tags:["cobaltTeam"],CustomNameVisible:1b,CustomName:'{"text":"Cobalt Team","color":"dark_blue","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~10 ~1.5 ~ {Tags:["spectators"],CustomNameVisible:1b,CustomName:'{"text":"Spectators","color":"dark_gray","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}

#Leader
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~5 ~1 ~ {Tags:["leader"],CustomNameVisible:1b,CustomName:'{"text":"Select Leader","color":"yellow","bold":true}',NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-5 ~1 ~ {Tags:["swapLeader1"],CustomNameVisible:1b,CustomName:'{"text":"Swap Leader1","color":"yellow","bold":true}',NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-10 ~1 ~ {Tags:["swapLeader2"],CustomNameVisible:1b,CustomName:'{"text":"Swap Leader2","color":"yellow","bold":true}',NoGravity:1}

