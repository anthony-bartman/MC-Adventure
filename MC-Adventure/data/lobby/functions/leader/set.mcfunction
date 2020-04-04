#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20  
# Desc: This will set the leader of the server who will populate map 
#--------------------------------------

#Instantiate new Leader
tag @s add leader
execute as @s[tag=leader] run function lobby:settings/book/settings_book
scoreboard players set @s[tag=leader] join -1
#Indicate to player what happened
title @s subtitle {"text":"Server Settings Leader","bold":true,"italic":true,"color":"gold"}
title @s title {"text":"You are now the","color":"white","bold":true}
scoreboard players enable @s[tag=leader] book

#Teleport to main lobby
teleport @s @e[tag=mainLobby,limit=1]
