#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will run all of the main giant boss 
#--------------------------------------

#Constantly summons an armor stand around the boss
execute as @e[type=minecraft:giant,tag=giant,limit=1] run teleport @e[type=minecraft:armor_stand,tag=giant,limit=1] @s

#This will constantly update the boss bar as the Giant gains or loses health
execute store result bossbar minecraft:giant max as @e[type=minecraft:giant,tag=giant,limit=1] run data get entity @s Attributes[0].Base
execute store result bossbar minecraft:giant value as @e[type=minecraft:giant,tag=giant,limit=1] run data get entity @s Health
#Used for spawning more mobs based on health
execute store result score Giant_Health giant_boss as @e[type=minecraft:giant,tag=giant,limit=1] run data get entity @s Health
#Once boss is dead, make the bossbar not visible
execute unless entity @e[type=minecraft:giant,tag=giant,limit=1] run bossbar set minecraft:giant visible false
execute unless entity @e[type=minecraft:giant,tag=giant,limit=1] run kill @e[type=minecraft:armor_stand,tag=giant,limit=1]
execute unless entity @e[type=minecraft:giant,tag=giant,limit=1] run scoreboard players reset timer giant_boss
execute unless entity @e[type=minecraft:giant,tag=giant,limit=1] run scoreboard players reset Giant_Health giant_boss
execute unless entity @e[type=minecraft:giant,tag=giant,limit=1] run scoreboard players reset Boss_Lvl giant_boss
#How boss will function (4 Levels)
execute if score timer giant_boss matches 0..100 run scoreboard players add timer giant_boss 1

execute if score Boss_Lvl giant_boss matches 0 if score Giant_Health giant_boss matches 0..75 at @e[type=minecraft:armor_stand,tag=giant,limit=1] run function boss:giant/mobs/tier1
execute if score Boss_Lvl giant_boss matches 1 if score Giant_Health giant_boss matches 0..50 at @e[type=minecraft:armor_stand,tag=giant,limit=1] run function boss:giant/mobs/tier2
execute if score Boss_Lvl giant_boss matches 2 if score Giant_Health giant_boss matches 0..25 at @e[type=minecraft:armor_stand,tag=giant,limit=1] run function boss:giant/mobs/tier3

execute if score timer giant_boss matches 25 if score Boss_Lvl giant_boss matches 1..3 at @e[type=minecraft:giant,tag=giant,limit=1] run function boss:giant/attacks/poison
execute if score timer giant_boss matches 100 if score Boss_Lvl giant_boss matches 3 at @e[type=minecraft:giant,tag=giant,limit=1] run function boss:giant/attacks/lightning

execute if score timer giant_boss matches 101 run scoreboard players set timer giant_boss 0


