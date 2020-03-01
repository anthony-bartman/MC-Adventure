#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will run all MAP progression main methods in order to not lag. It will slow down how often to run commands
#--------------------------------------

#Use timer initialized in the Lobby 'setup' function
#Executes each main lobby loop commands once every 5 seconds
execute if score MAIN_LOOP timers matches 0..100 run scoreboard players add MAIN_LOOP timers 1


#Lobby - T0
execute if score MAIN_LOOP timers matches 20..25 run function lobby:main

#Ocean - T1
execute if score MAIN_LOOP timers matches 40..45 run function ocean:main

#Twilight Forest - T2
execute if score MAIN_LOOP timers matches 60 run function twilight_forest:main

#Caves - T3
execute if score MAIN_LOOP timers matches 80 run function caves:main

#Hell - T4
execute if score MAIN_LOOP timers matches 100 run function hell:main


#Resets timer loop counter
execute if score MAIN_LOOP timers matches 101 run scoreboard players set MAIN_LOOP timers 0
