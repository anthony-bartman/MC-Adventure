#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will run all of the main giant boss 
#--------------------------------------

execute store result bossbar minecraft:giant max as @e[tag=giant,limit=1] run data get entity @s Attributes[0].Base
execute store result bossbar minecraft:giant value as @e[tag=giant,limit=1] run data get entity @s Health
execute unless entity @e[type=minecraft:giant,tag=giant,limit=1] run bossbar set minecraft:giant visible false