#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will set the slowest game loop speed
#--------------------------------------

#Updates user its enabled
execute if score loopSpeed lobbySettings matches 0..2 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Game loop speed has been set to [","color":"gray"},{"text":"SLOWER","bold":true,"color":"gold"},{"text":"]\n","color":"gray"},{"text":"Approximate Loop Speed: ","color":"gray"},{"text":"5 Seconds","color":"aqua","bold":true},{"text":"\n "}]

#Already Enabled
execute if score loopSpeed lobbySettings matches 3 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Game loop speed has already been set to [","color":"gray"},{"text":"SLOWER","bold":true,"color":"gold"},{"text":"]\n","color":"gray"},{"text":"Approximate Loop Speed: ","color":"gray"},{"text":"5 Seconds","color":"aqua","bold":true},{"text":"\n "}]

execute if score loopSpeed lobbySettings matches 0..2 run scoreboard players set MAIN_LOOP timers 0
execute if score loopSpeed lobbySettings matches 0..2 run scoreboard players set loopSpeed lobbySettings 3

#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0