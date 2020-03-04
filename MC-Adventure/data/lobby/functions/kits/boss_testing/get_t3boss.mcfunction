#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will give players full enchanted prot 4 diamond with an enchanted sharp 5 diamond sword for medium bosses
#--------------------------------------

clear @s

replaceitem entity @s armor.head minecraft:diamond_helmet{Enchantments:[{id:"minecraft:unbreaking",lvl:3s},{id:"minecraft:protection",lvl:4s}]} 1
replaceitem entity @s armor.chest minecraft:diamond_chestplate{Enchantments:[{id:"minecraft:unbreaking",lvl:3s},{id:"minecraft:protection",lvl:4s}]} 1
replaceitem entity @s armor.legs minecraft:diamond_leggings{Enchantments:[{id:"minecraft:unbreaking",lvl:3s},{id:"minecraft:protection",lvl:4s}]} 1
replaceitem entity @s armor.feet minecraft:diamond_boots{Enchantments:[{id:"minecraft:unbreaking",lvl:3s},{id:"minecraft:protection",lvl:4s}]} 1
replaceitem entity @s weapon.offhand minecraft:shield 1

replaceitem entity @s hotbar.0 minecraft:diamond_sword{Enchantments:[{id:"minecraft:unbreaking",lvl:3s},{id:"minecraft:sharpness",lvl:5s}]} 1
replaceitem entity @s hotbar.1 minecraft:bow{Enchantments:[{id:"minecraft:unbreaking",lvl:3s},{id:"minecraft:power",lvl:5s}]} 1
replaceitem entity @s hotbar.2 minecraft:cooked_beef 16
replaceitem entity @s hotbar.3 minecraft:enchanted_golden_apple 3
give @s minecraft:arrow 256
