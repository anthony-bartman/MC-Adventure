#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will setup the lobby armor stands, and scoreboards
#--------------------------------------

#Creates a fake timer and scoreboard objective that will increase a certain amount of time to 
#reduce 20 times a second to x times a second
scoreboard objectives add timers dummy {"text":"Timers","color":"white","bold":true}
scoreboard players set MAIN_LOOP timers 0

#Other Miscellaneous Settings
scoreboard objectives add lobbySettings dummy {"text":"Misc Lobby Settings","color":"white","bold":true}
scoreboard players set loopSpeed lobbySettings 1 

say Main Loop Timer at [Normal] Game Loop Speed