#This will update the cloud boss' bar when its spawned in

execute store result bossbar minecraft:guardian max as @e[tag=guardian,limit=1] run data get entity @s Attributes[0].Base
execute store result bossbar minecraft:guardian value as @e[tag=guardian,limit=1] run data get entity @s Health
execute unless entity @e[type=minecraft:evoker,tag=guardian,limit=1] run bossbar set minecraft:guardian visible false
