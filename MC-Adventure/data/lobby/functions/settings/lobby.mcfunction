#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will set all parameters needed to set all lobby settings to the correct binaries
#--------------------------------------

#Set the gamerules
#gamerule commandBlockOutput false
gamerule doFireTick false
gamerule keepInventory true
gamerule mobGriefing false
gamerule spectatorsGenerateChunks false
#gamerule doImmediateRespawn true

gamerule doMobSpawning false
gamerule doWeatherCycle false
gamerule doDaylightCycle false

#Kill remaining bad guys
kill @e[type=!minecraft:player,type=!minecraft:armor_stand,type=!minecraft:item_frame]

time set day
weather clear
difficulty hard

