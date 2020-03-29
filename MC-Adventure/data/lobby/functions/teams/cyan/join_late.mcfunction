#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will join player after the game has begun already
#--------------------------------------

#False
execute if score cyPlayersLeft teamPlayers < Min_Team_Players maxPlayers run playsound minecraft:block.beacon.deactivate master @s ~ ~ ~ 100
execute if score cyPlayersLeft teamPlayers < Min_Team_Players maxPlayers run title @s title {"text":"\u25b6 Cyan Team \u25c0","bold":true,"italic":true,"color":"dark_aqua"}
execute if score cyPlayersLeft teamPlayers < Min_Team_Players maxPlayers run title @s subtitle [{"text":"Already Contains ","bold":true},{"score":{"name":"cyanTeam","objective":"maxPlayers"},"color":"dark_red","bold":true},{"text":" Players","color":"white"}]

#True
#Join Team
execute if score cyPlayersLeft teamPlayers >= Min_Team_Players maxPlayers as @s run function lobby:teams/update_late
execute if score cyPlayersLeft teamPlayers >= Min_Team_Players maxPlayers run team join cyanTeam @s
#Signify Player
execute if score cyPlayersLeft teamPlayers >= Min_Team_Players maxPlayers run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 100
execute if score cyPlayersLeft teamPlayers >= Min_Team_Players maxPlayers run title @s title {"text":"You Have Joined","bold":true}
execute if score cyPlayersLeft teamPlayers >= Min_Team_Players maxPlayers run title @s subtitle {"text":"\u25b6 Cyan Team \u25c0","bold":true,"italic":true,"color":"dark_aqua"}
#Player can select kits 
execute if score cyPlayersLeft teamPlayers >= Min_Team_Players maxPlayers if score kitsEnabled lobbySettings matches 1 run title @s actionbar {"text":"Select a Kit","color":"yellow","bold":true}
#Sets 'Kit' score to 0 (No Kit)
execute if score cyPlayersLeft teamPlayers >= Min_Team_Players maxPlayers if score kitsEnabled lobbySettings matches 1 run scoreboard players enable @s chooseKit
execute if score cyPlayersLeft teamPlayers >= Min_Team_Players maxPlayers if score kitsEnabled lobbySettings matches 1 as @s run function lobby:kits/selection_book
#Tag this player 
execute if score cyPlayersLeft teamPlayers >= Min_Team_Players maxPlayers run tag @s add newbie
#Add one to total number of yPlayersLeft
execute if score cyPlayersLeft teamPlayers >= Min_Team_Players maxPlayers run scoreboard players remove cyPlayersLeft teamPlayers 1

#Teleport back to middle
teleport @s @e[tag=mainLobby,limit=1]