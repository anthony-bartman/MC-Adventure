#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will check if the leader rclicks the carrot on a stick
#--------------------------------------

#Confirm Choice Keep these in hotbar...
execute unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{Tags:["confirm"]}}]}] run replaceitem entity @s hotbar.4 minecraft:carrot_on_a_stick{Tags:["confirm"],display:{Name:'{"text":"Confirm?","color":"green","bold":true,"italic":true}'},HideFlags:33,CustomModelData:2,Enchantments:[{id:"minecraft:mending",lvl:1s}]} 1

#If Confirm
#Teleport leader to his own team
teleport @s @e[type=minecraft:armor_stand,tag=goldIntro,limit=1]
teleport @s @e[type=minecraft:armor_stand,tag=purpleIntro,limit=1]
teleport @s @e[type=minecraft:armor_stand,tag=greenIntro,limit=1]
teleport @s @e[type=minecraft:armor_stand,tag=aquaIntro,limit=1]
teleport @s @e[type=minecraft:armor_stand,tag=redIntro,limit=1]
teleport @s @e[type=minecraft:armor_stand,tag=yellowIntro,limit=1]
teleport @s @e[type=minecraft:armor_stand,tag=blueIntro,limit=1]
teleport @s @e[type=minecraft:armor_stand,tag=blackIntro,limit=1]
teleport @s @e[type=minecraft:armor_stand,tag=cyanIntro,limit=1]
teleport @s @e[type=minecraft:armor_stand,tag=magentaIntro,limit=1]
teleport @s @e[type=minecraft:armor_stand,tag=silverIntro,limit=1]
teleport @s @e[type=minecraft:armor_stand,tag=crimsonIntro,limit=1]
teleport @s @e[type=minecraft:armor_stand,tag=cobaltIntro,limit=1]
teleport @s @e[type=minecraft:armor_stand,tag=ivyIntro,limit=1]
teleport @s @e[type=minecraft:armor_stand,tag=opalIntro,limit=1]
#Remvoe other settings
tag @s remove begin
replaceitem entity @s hotbar.4 minecraft:air 1
scoreboard players set introProgress intro 5
scoreboard players set @s introBeginRClick 0

