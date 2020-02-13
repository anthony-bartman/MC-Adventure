#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will run all of the main giant boss 
#--------------------------------------

#This will constantly update the boss bar as the Giant gains or loses health
execute store result bossbar minecraft:giant max as @e[tag=giant,limit=1] run data get entity @s Attributes[0].Base
execute store result bossbar minecraft:giant value as @e[tag=giant,limit=1] run data get entity @s Health
#Once boss is dead, make the bossbar not visible
execute unless entity @e[type=minecraft:giant,tag=giant,limit=1] run bossbar set minecraft:giant visible false