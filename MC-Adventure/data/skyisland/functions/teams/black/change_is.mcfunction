#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will wait for person to change the island settings
#--------------------------------------

#Players uses help menu to get book, and enables them to use it

#Select Yes (Players can visit)
execute if score @s mapProgress matches 1 run scoreboard players set blackIS mapProgress 1
execute if score @s mapProgress matches 1 run tellraw @s ["",{"text":"Island Settings changed to: "},{"text":"All Players","bold":true,"color":"yellow"},{"text":" can "},{"text":"visit island","color":"green","bold":true}]
execute if score @s mapProgress matches 1 run scoreboard players set @s mapProgress 3

#Select No (Players cannot visit)
execute if score @s mapProgress matches 2 run scoreboard players set blackIS mapProgress 2
execute if score @s mapProgress matches 2 run tellraw @s ["",{"text":"Island Settings changed to: "},{"text":"All Players","bold":true,"color":"yellow"},{"text":" will be "},{"text":"teleported away","color":"red","bold":true}]
execute if score @s mapProgress matches 2 run scoreboard players set @s mapProgress 3

#Reset Players Score
execute if score @s mapProgress matches 3 run scoreboard players reset @s mapProgress

