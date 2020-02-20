#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will set all parameters needed to set all lobby settings to the correct binaries
#--------------------------------------

#Set the gamerules
gamerule commandBlockOutput false
gamerule doFireTick false
gamerule keepInventory true
gamerule mobGriefing false

gamerule doMobSpawning false
gamerule doWeatherCycle false
gamerule doDaylightCycle false

#Kill remaining bad guys
kill @e[type=!minecraft:player,type=!minecraft:armor_stand]
kill @e[type=!minecraft:player,type=!minecraft:armor_stand]
kill @e[type=!minecraft:player,type=!minecraft:armor_stand]
kill @e[type=!minecraft:player,type=!minecraft:armor_stand]

time set day
weather clear

