#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will tell players who are about to begin the map what to do
#--------------------------------------


#Normal Players on a team
tellraw @s[tag=player] ["",{"text":"\n"},{"text":"Spawnpoint","bold":true,"color":"aqua"},{"text":" for","color":"gray"},{"text":" "},{"selector":"@s","bold":true},{"text":" has been ","color":"gray"},{"text":"SET","bold":true,"color":"yellow"},{"text":" xD","bold":true,"color":"green"},{"text":"\n "}]
tellraw @s[tag=player] ["",{"text":" \u25b6","color":"aqua"},{"text":" To Use The ","color":"gray"},{"text":"Adventure Help Menu","bold":true,"color":"yellow"},{"text":" while playing the map, ","color":"gray"},{"text":"Type Command:","bold":true,"color":"aqua"},{"text":" /trigger help","bold":true,"italic":true,"color":"gold"}]

#Tells Leader
tellraw @s[tag=leader] ["",{"text":" \u25b6","color":"aqua"},{"text":" To Use The ","color":"gray"},{"text":"Settings Book","bold":true,"color":"yellow"},{"text":" Again, ","color":"gray"},{"text":"Type Command:","bold":true,"color":"aqua"},{"text":" /trigger book","bold":true,"italic":true,"color":"gold"}]

#Tells Spectators
tellraw @s[gamemode=spectator] ["",{"text":" \u25b6","color":"aqua"},{"text":" To Join A ","color":"gray"},{"text":"Team","bold":true,"color":"yellow"},{"text":", ","color":"gray"},{"text":"Type Command:","bold":true,"color":"aqua"},{"text":" /trigger join","bold":true,"italic":true,"color":"gold"}]

