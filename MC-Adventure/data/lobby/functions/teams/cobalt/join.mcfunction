#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will join the player to the team
#--------------------------------------

#False
execute if score Teammates coTeamPlayers >= cobaltTeam maxPlayers run playsound minecraft:block.beacon.deactivate master @s ~ ~ ~ 100
execute if score Teammates coTeamPlayers >= cobaltTeam maxPlayers run title @s title {"text":"\u25b6 Cobalt Team \u25c0","bold":true,"italic":true,"color":"dark_blue"}
execute if score Teammates coTeamPlayers >= cobaltTeam maxPlayers run title @a subtitle [{"text":"Already Contains ","bold":true},{"score":{"name":"cobaltTeam","objective":"maxPlayers"},"color":"dark_red","bold":true},{"text":" Players","color":"white"}]

#True
#Update other Team Stats if player is already on a team
execute if score Teammates coTeamPlayers < cobaltTeam maxPlayers as @s run function lobby:teams/update
#Join Team
execute if score Teammates coTeamPlayers < cobaltTeam maxPlayers run team join cobaltTeam @s
execute if score Teammates coTeamPlayers < cobaltTeam maxPlayers run scoreboard players add @s coTeamPlayers 1
#Signify Player
execute if score Teammates coTeamPlayers < cobaltTeam maxPlayers run scoreboard objectives setdisplay sidebar.team.dark_blue coTeamPlayers
execute if score Teammates coTeamPlayers < cobaltTeam maxPlayers run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 100
execute if score Teammates coTeamPlayers < cobaltTeam maxPlayers run title @s title {"text":"You Have Joined","bold":true}
execute if score Teammates coTeamPlayers < cobaltTeam maxPlayers run title @s subtitle {"text":"\u25b6 Cobalt Team \u25c0","bold":true,"italic":true,"color":"dark_blue"}
#Player can select kits 
execute if score Teammates coTeamPlayers < cobaltTeam maxPlayers if score kitsEnabled lobbySettings matches 1 run title @s actionbar {"text":"Select a Kit","color":"yellow","bold":true}
#Sets 'Kit' score to 0 (No Kit)
execute if score Teammates coTeamPlayers < cobaltTeam maxPlayers if score kitsEnabled lobbySettings matches 1 run scoreboard players enable @s chooseKit
execute if score Teammates coTeamPlayers < cobaltTeam maxPlayers if score kitsEnabled lobbySettings matches 1 as @s run function lobby:kits/selection_book
#Add one to total number of Teammates
execute if score Teammates coTeamPlayers < cobaltTeam maxPlayers run scoreboard players add Teammates coTeamPlayers 1

#Teleport back to middle
teleport @s @e[tag=mainLobby,limit=1]