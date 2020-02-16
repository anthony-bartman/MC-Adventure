#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will run all main lobby functions before the beginning of the map
#--------------------------------------
#Moreover, functions tagged in the minecraft:tick tag runs every tick at the start of the tick and 
#functions tagged in minecraft:load runs once at the start of the tick after a server (re)load.

#The /debug command is useful for measuring performance. Use /debug start to start the profiling, wait a while, then /debug stop to end.
#This produces a file in .minecraft\debug breaking down how long everything took to run. Kind of like the F3 pie-chart, but for the server rather than the client.

#scoreboard players operation NameToShow Display = @e[type=ArmorStand,name=NameToShow] Score

execute at @e[tag=goldTeamj,limit=1] as @a[distance=..2,team=!goldTeam] run function lobby:teams/gold/join

execute at @e[tag=purpleTeamj,limit=1] as @a[distance=..2,team=!purpleTeam] run function lobby:teams/purple/join

