#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will reset players to the beginnging of lobby sequence
#--------------------------------------
tellraw @a ["",{"text":"\n"},{"text":"Resetting Teams...","color":"light_purple","bold":true},{"text":"\n "}]

#Resets team metrics
function lobby:settings/book/reset_teams

#Tp players to middle
teleport @a @e[tag=mainLobby,limit=1]

#Set leader scoreboard to 0
scoreboard players set @a[tag=leader] book 0