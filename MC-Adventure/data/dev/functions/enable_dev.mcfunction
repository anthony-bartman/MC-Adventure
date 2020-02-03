#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will set all parameters needed to enable 'dev' mode
#--------------------------------------

#Set some gamerules to test efficiently
gamerule commandBlockOutput true
gamerule doImmediateRespawn true
gamerule doDaylightCycle false
gamerule doFireTick false
gamerule doMobSpawning false
gamerule doWeatherCycle false
gamerule keepInventory true
gamerule mobGriefing false

#Give player Elytra
clear @s

effect give @s minecraft:night_vision 10000
effect give @s minecraft:saturation 10000 100
effect give @s minecraft:regeneration 10000 100
replaceitem entity @s armor.chest minecraft:elytra 1
give @s minecraft:diamond_sword{display:{Name:'{"text":"OP Sword","color":"gold","bold":true,"italic":true}'},Unbreakable:1b,Enchantments:[{id:"minecraft:sharpness",lvl:50s}]} 1
give @s minecraft:firework_rocket 1
give @s minecraft:command_block 1
give @s minecraft:stone_button 1
give @s minecraft:redstone_block 1

gamemode creative @s
time set day
weather clear
kill @e[type=!player,type=!minecraft:armor_stand]

