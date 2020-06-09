#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This takes care of what happens to wave before it gets spawned in (Normal Loop Speed)
#--------------------------------------

# '100' : time for the raid wave to load up in Normal Speed
scoreboard players add greenTime raidControl 1

#Sadly, mobs get fall off the map and die cause the clock is too slow once you get down to SLOWER and SLOWEST

#Based on GameLoop speed
execute if score loopSpeed lobbySettings matches 0 if score greenTime raidControl matches 400.. run function skyisland:teams/green/adv/raid/pre_wave
execute if score loopSpeed lobbySettings matches 1 if score greenTime raidControl matches 100.. run function skyisland:teams/green/adv/raid/pre_wave
execute if score loopSpeed lobbySettings matches 2 if score greenTime raidControl matches 18.. run function skyisland:teams/green/adv/raid/pre_wave
execute if score loopSpeed lobbySettings matches 3 if score greenTime raidControl matches 13.. run function skyisland:teams/green/adv/raid/pre_wave
