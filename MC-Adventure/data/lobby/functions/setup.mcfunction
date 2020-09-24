#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will setup the lobby armor stands, and scoreboards
#--------------------------------------

#Resets Lobby
function lobby:remove

#Sets up gamerule Settings for Lobby
function lobby:settings/lobby

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
team add crimsonTeam {"text":"Crimson Team","color":"dark_red"}
team add cobaltTeam {"text":"Cobalt Team","color":"dark_blue"}
team add ivyTeam {"text":"Ivy Team","color":"dark_green"}
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
team modify crimsonTeam color dark_red
team modify cobaltTeam color dark_blue
team modify ivyTeam color dark_green
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
team join crimsonTeam crimsonTeam
team join cobaltTeam cobaltTeam
team join ivyTeam ivyTeam

#Max Team Players
scoreboard objectives add maxPlayers dummy {"text":"Max Players Per Team","color":"white","bold":true}
function lobby:teams/set_maxplayers
#Which Teams are Enabled
scoreboard objectives add enabledTeams dummy {"text":"Teams Enabled?","color":"white","bold":true}
#Allows player to choose kits
scoreboard objectives add chooseKit trigger {"text":"Kit Values","color":"white","bold":true}
#Can tell who is 'leader' of server
scoreboard objectives add join trigger {"text":"Leader and Spectators?","color":"white","bold":true}
scoreboard objectives add book trigger {"text":"Settings Book","color":"white","bold":true}
#Intro Sequence 
scoreboard objectives add intro dummy {"text":"Intro Sequence","color":"white","bold":true}
#Start Map from Intro, and Individual Team Start
scoreboard objectives add introBeginRClick minecraft.used:minecraft.carrot_on_a_stick {"text":"Begin Map from Intro","color":"white","bold":true}
#Other Miscellaneous Settings
scoreboard objectives add lobbySettings dummy {"text":"Misc Lobby Settings","color":"white","bold":true}
scoreboard objectives add deathCounter deathCount {"text":"Death Counter","color":"white","bold":true}

#Default Gamemode
defaultgamemode adventure

#Initial Lobby Settings (Unlocked and Particles Enabled)
scoreboard players set LP lobbySettings 0
scoreboard players set lockTeams lobbySettings 0
scoreboard players set particles lobbySettings 1
scoreboard players set kitsEnabled lobbySettings 0
scoreboard players set difficulty lobbySettings 3
scoreboard players set spectatorChunks lobbySettings 0
#Normal GameLoop Speed
scoreboard players set loopSpeed lobbySettings 1 

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
scoreboard objectives add crTeamPlayers dummy {"text":"Crimson Team","color":"white","bold":true}
scoreboard objectives add coTeamPlayers dummy {"text":"Cobalt Team","color":"white","bold":true}
scoreboard objectives add iTeamPlayers dummy {"text":"Ivy Team","color":"white","bold":true}
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
scoreboard players set Teammates iTeamPlayers 0
scoreboard players set Teammates oTeamPlayers 0
scoreboard players set Total_Spectators spectators 0
scoreboard players set Total_Players intro 0

#Fake Player to determine if the team is enabled
# * 13 will be enabled to begin * Book can change that
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
scoreboard players set crimsonTeam enabledTeams 1
scoreboard players set cobaltTeam enabledTeams 1
scoreboard players set ivyTeam enabledTeams 1

#---------------------
# Team Armor Stands
#---------------------
summon minecraft:armor_stand ~ ~ ~ {Tags:["mainLobby"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
#Teams Stands
execute if score goldTeam enabledTeams matches 1 at @e[tag=mainLobby,limit=1] run function lobby:teams/gold/summon
execute if score purpleTeam enabledTeams matches 1 at @e[tag=mainLobby,limit=1] run function lobby:teams/purple/summon
execute if score greenTeam enabledTeams matches 1 at @e[tag=mainLobby,limit=1] run function lobby:teams/green/summon
execute if score aquaTeam enabledTeams matches 1 at @e[tag=mainLobby,limit=1] run function lobby:teams/aqua/summon
execute if score redTeam enabledTeams matches 1 at @e[tag=mainLobby,limit=1] run function lobby:teams/red/summon
execute if score yellowTeam enabledTeams matches 1 at @e[tag=mainLobby,limit=1] run function lobby:teams/yellow/summon
execute if score blueTeam enabledTeams matches 1 at @e[tag=mainLobby,limit=1] run function lobby:teams/blue/summon
execute if score blackTeam enabledTeams matches 1 at @e[tag=mainLobby,limit=1] run function lobby:teams/black/summon
execute if score cyanTeam enabledTeams matches 1 at @e[tag=mainLobby,limit=1] run function lobby:teams/cyan/summon
execute if score magentaTeam enabledTeams matches 1 at @e[tag=mainLobby,limit=1] run function lobby:teams/magenta/summon
execute if score crimsonTeam enabledTeams matches 1 at @e[tag=mainLobby,limit=1] run function lobby:teams/crimson/summon
execute if score cobaltTeam enabledTeams matches 1 at @e[tag=mainLobby,limit=1] run function lobby:teams/cobalt/summon
execute if score ivyTeam enabledTeams matches 1 at @e[tag=mainLobby,limit=1] run function lobby:teams/ivy/summon
execute at @e[tag=mainLobby,limit=1] run function lobby:teams/spectators/summon

#Leader
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~5 ~1 ~ {Tags:["leader"],CustomNameVisible:1b,CustomName:'{"text":"Select Leader","color":"yellow","bold":true}',NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-5 ~1 ~ {Tags:["swapLeader1"],CustomNameVisible:1b,CustomName:'{"text":"Swap Leader1","color":"yellow","bold":true}',NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-10 ~1 ~ {Tags:["swapLeader2"],CustomNameVisible:1b,CustomName:'{"text":"Swap Leader2","color":"yellow","bold":true}',NoGravity:1}

