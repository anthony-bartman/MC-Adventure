#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will let a player on the team teleport out of the volcano
#--------------------------------------


#Particle effects of tp spot
execute if score blackVolc mapProgress matches 0..3 if entity @s[distance=..8] run summon area_effect_cloud ~ ~ ~ {Particle:effect,WaitTime:10}

#Progression
#Tell Players What the sparkles are
execute if score blackVolc mapProgress matches 0 run tellraw @s[distance=..5] ["",{"text":"\n"},{"text":"<Jeffrey>","color":"gray"},{"text":" Hello "},{"selector":"@s[distance=..5]","color":"gray"},{"text":"! My name is Jeffrey. To my right is a "},{"text":"one-time-use portal","color":"light_purple","bold":"true"},{"text":" to get out of here if y'all dont have any "},{"text":"diamonds","color":"gold"},{"text":". Bring me some "},{"text":"diamonds ","color":"gold"},{"text":"to trade to unlock more secrets!\n "}]
execute if score blackVolc mapProgress matches 0 if entity @s[distance=..5] run scoreboard players set blackVolc mapProgress 1

#Tell players after they tp
execute if score blackVolc mapProgress matches 1 run title @s[distance=..0.75] title {"text":"One Way Ticket Used","color":"","bold":true}
execute if score blackVolc mapProgress matches 1 run title @s[distance=..0.75] subtitle {"text":"Bring Jeffrey Diamonds","color":"gold","bold":true}
execute if score blackVolc mapProgress matches 1 as @s[distance=..0.75] run playsound minecraft:item.chorus_fruit.teleport master @s ~ ~ ~ 100
execute if score blackVolc mapProgress matches 1 if entity @s[distance=..0.75] run scoreboard players set blackVolc mapProgress 2

execute if score blackVolc mapProgress matches 2 run teleport @s[distance=..0.75] ~ ~20 ~
execute if score blackVolc mapProgress matches 2 positioned ~ ~20 ~ if entity @s[distance=..5] run scoreboard players set blackVolc mapProgress 3

#Two Times
execute if score blackVolc mapProgress matches 3 run title @s[distance=..0.75] title {"text":"Last Ticket Used...","color":"","bold":true}
execute if score blackVolc mapProgress matches 3 run title @s[distance=..0.75] subtitle {"text":"Bring Jeffrey Diamonds for a Key","color":"gold","bold":true}
execute if score blackVolc mapProgress matches 3 as @s[distance=..0.75] run playsound minecraft:item.chorus_fruit.teleport master @s ~ ~ ~ 100
execute if score blackVolc mapProgress matches 3 if entity @s[distance=..0.75] run scoreboard players set blackVolc mapProgress 4

#Resets counter
execute if score blackVolc mapProgress matches 4 run teleport @s[distance=..0.75] ~ ~20 ~
execute if score blackVolc mapProgress matches 4 run scoreboard players reset blackVolc mapProgress
