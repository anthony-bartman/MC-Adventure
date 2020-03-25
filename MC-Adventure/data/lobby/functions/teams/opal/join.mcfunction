#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will join the player to the team
#--------------------------------------

#False
execute if score Teammates oTeamPlayers >= opalTeam maxPlayers run playsound minecraft:block.beacon.deactivate master @s ~ ~ ~ 100
execute if score Teammates oTeamPlayers >= opalTeam maxPlayers run title @s title {"text":"\u25b6 Opal Team \u25c0","bold":true,"italic":true,"color":"white"}
execute if score Teammates oTeamPlayers >= opalTeam maxPlayers run title @a subtitle [{"text":"Already Contains ","bold":true},{"score":{"name":"opalTeam","objective":"maxPlayers"},"color":"dark_red","bold":true},{"text":" Players","color":"white"}]

#True
#Update other Team Stats if player is already on a team
execute if score Teammates oTeamPlayers < opalTeam maxPlayers as @s run function lobby:teams/update
#Join Team
execute if score Teammates oTeamPlayers < opalTeam maxPlayers run team join opalTeam @s
execute if score Teammates oTeamPlayers < opalTeam maxPlayers run scoreboard players add @s oTeamPlayers 1
#Signify Player
execute if score Teammates oTeamPlayers < opalTeam maxPlayers run scoreboard objectives setdisplay sidebar.team.white oTeamPlayers
execute if score Teammates oTeamPlayers < opalTeam maxPlayers run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 100
execute if score Teammates oTeamPlayers < opalTeam maxPlayers run title @s title {"text":"You Have Joined","bold":true}
execute if score Teammates oTeamPlayers < opalTeam maxPlayers run title @s subtitle {"text":"\u25b6 Opal Team \u25c0","bold":true,"italic":true,"color":"white"}
#Player can select kits 
execute if score Teammates oTeamPlayers < opalTeam maxPlayers if score kitsEnabled lobbySettings matches 1 run title @s actionbar {"text":"Select a Kit","color":"yellow","bold":true}
#Sets 'Kit' score to 0 (No Kit)
execute if score Teammates oTeamPlayers < opalTeam maxPlayers if score kitsEnabled lobbySettings matches 1 run scoreboard players enable @s chooseKit
execute if score Teammates oTeamPlayers < opalTeam maxPlayers if score kitsEnabled lobbySettings matches 1 as @s run function lobby:kits/selection_book
#Add one to total number of Teammates
execute if score Teammates oTeamPlayers < opalTeam maxPlayers run scoreboard players add Teammates oTeamPlayers 1

#Teleport back to middle
teleport @s @e[tag=mainLobby,limit=1]