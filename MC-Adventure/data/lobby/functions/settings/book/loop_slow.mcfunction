#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will set the slow game loop speed
#--------------------------------------

#Updates user its enabled
execute if score loopSpeed lobbySettings matches 0..1 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Game loop speed has been set to [","color":"gray"},{"text":"SLOW","bold":true,"color":"yellow"},{"text":"]\n","color":"gray"},{"text":"Approximate Loop Speed: ","color":"gray"},{"text":"3 Seconds","color":"aqua","bold":true},{"text":"\n "}]
execute if score loopSpeed lobbySettings matches 3 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Game loop speed has been set to [","color":"gray"},{"text":"SLOW","bold":true,"color":"yellow"},{"text":"]\n","color":"gray"},{"text":"Approximate Loop Speed: ","color":"gray"},{"text":"3 Seconds","color":"aqua","bold":true},{"text":"\n "}]

#Already Enabled
execute if score loopSpeed lobbySettings matches 2 run tellraw @a[tag=leader] ["",{"text":"\n"},{"text":"Game loop speed has already been set to [","color":"gray"},{"text":"SLOW","bold":true,"color":"yellow"},{"text":"]\n","color":"gray"},{"text":"Approximate Loop Speed: ","color":"gray"},{"text":"3 Seconds","color":"aqua","bold":true},{"text":"\n "}]

execute if score loopSpeed lobbySettings matches 0..1 run scoreboard players set MAIN_LOOP timers 0
execute if score loopSpeed lobbySettings matches 0..1 run scoreboard players set loopSpeed lobbySettings 2
execute if score loopSpeed lobbySettings matches 3 run scoreboard players set MAIN_LOOP timers 0
execute if score loopSpeed lobbySettings matches 3 run scoreboard players set loopSpeed lobbySettings 2

#Reset book counter once this executes
scoreboard players set @a[tag=leader] book 0