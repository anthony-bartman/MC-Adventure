#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will run all MAP progression main methods in order to not lag. It will slow down how often to run commands
#--------------------------------------

#Use timer initialized in the Lobby 'setup' function
#Executes each main lobby loop commands once every 5 seconds
execute if score loopSpeed lobbySettings matches 3 if score MAIN_LOOP timers matches 0..100 run scoreboard players add MAIN_LOOP timers 1
execute if score loopSpeed lobbySettings matches 2 if score MAIN_LOOP timers matches 0..60 run scoreboard players add MAIN_LOOP timers 1
execute if score loopSpeed lobbySettings matches 1 if score MAIN_LOOP timers matches 0..20 run scoreboard players add MAIN_LOOP timers 1


#SLOWEST Time Frame (Around Once every 5 seconds)
execute if score loopSpeed lobbySettings matches 3 if score MAIN_LOOP timers matches 95..100 if score LP lobbySettings matches 0..4 run function lobby:main_begin
execute if score loopSpeed lobbySettings matches 3 if score MAIN_LOOP timers matches 95..100 if score LP lobbySettings matches 5 run function lobby:main_after
execute if score loopSpeed lobbySettings matches 3 if score MAIN_LOOP timers matches 95..100 run function boss:main

#SLOW Time Frame (Around Once every 3 seconds)
execute if score loopSpeed lobbySettings matches 2 if score MAIN_LOOP timers matches 55..60 if score LP lobbySettings matches 0..4 run function lobby:main_begin
execute if score loopSpeed lobbySettings matches 2 if score MAIN_LOOP timers matches 55..60 if score LP lobbySettings matches 5 run function lobby:main_after
execute if score loopSpeed lobbySettings matches 2 if score MAIN_LOOP timers matches 55..60 run function boss:main

#Normal Time Frame (Around Once every 1 seconds)
execute if score loopSpeed lobbySettings matches 1 if score MAIN_LOOP timers matches 15..20 if score LP lobbySettings matches 0..4 run function lobby:main_begin
execute if score loopSpeed lobbySettings matches 1 if score MAIN_LOOP timers matches 15..20 if score LP lobbySettings matches 5 run function lobby:main_after
execute if score loopSpeed lobbySettings matches 1 if score MAIN_LOOP timers matches 15..20 run function boss:main

#No Time Frame (20 Times a Second)
execute if score loopSpeed lobbySettings matches 0 run function lobby:main
execute if score loopSpeed lobbySettings matches 0 run function boss:main


#Resets timer loop counter
execute if score loopSpeed lobbySettings matches 3 if score MAIN_LOOP timers matches 101 run scoreboard players set MAIN_LOOP timers 0
execute if score loopSpeed lobbySettings matches 2 if score MAIN_LOOP timers matches 61 run scoreboard players set MAIN_LOOP timers 0
execute if score loopSpeed lobbySettings matches 1 if score MAIN_LOOP timers matches 21 run scoreboard players set MAIN_LOOP timers 0
