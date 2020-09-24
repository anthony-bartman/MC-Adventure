#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will run the main for the teleport altar to mainIsland
#--------------------------------------

execute if score @s helpmenu_time matches 30 as @s run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 100
execute if score @s helpmenu_time matches 30 as @s run setblock ~ ~ ~ minecraft:stone destroy

execute if score @s helpmenu_time matches 50 run tellraw @s ["",{"text":"Use "},{"text":"Island Settings Book","bold":true,"color":"yellow"},{"text":" to change these settings"}]
execute if score @s helpmenu_time matches 50 run scoreboard players enable @s mapProgress
execute if score @s helpmenu_time matches 70 run function skyisland:trigger/island_book


execute if score @s helpmenu_time matches 120 run tellraw @s {"text":"Help Menu Cooldown Activated","color":"yellow","bold":true,"italic":true}
execute if score @s helpmenu_time matches 120 as @s run playsound minecraft:block.beacon.deactivate master @s ~ ~ ~ 100


