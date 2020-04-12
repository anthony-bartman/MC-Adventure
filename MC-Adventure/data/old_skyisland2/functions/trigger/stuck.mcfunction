#This file pulls up a help menu for players during the adventure part of the map
execute if score @s helpmenu_time matches 30 as @s run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 100

execute if score @s helpmenu_time matches 50 run tellraw @s {"text":"Granting Levitation...","color":"gray","bold":false,"italic":true}
execute if score @s helpmenu_time matches 60 run effect give @s minecraft:levitation 2 2

execute if score @s helpmenu_time matches 120 run tellraw @s {"text":"Help Menu Cooldown Activated","color":"yellow","bold":true,"italic":true}
execute if score @s helpmenu_time matches 120 as @s run playsound minecraft:block.beacon.deactivate master @s ~ ~ ~ 100

