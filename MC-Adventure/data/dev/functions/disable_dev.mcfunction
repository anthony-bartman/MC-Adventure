#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will set all parameters needed to disable 'dev' mode
#--------------------------------------


#Set some gamerules to place them back to normal
gamerule commandBlockOutput false
gamerule doFireTick false
gamerule keepInventory true
gamerule mobGriefing false

gamerule doMobSpawning true
gamerule doWeatherCycle true
gamerule doDaylightCycle true

#Clear Inventory
clear @s
effect clear @s 

gamemode adventure @s

title @s title {"text":"DEV MODE","bold":true}
title @s subtitle {"text":"Disabled","color":"red","bold":true,"italic":true}
