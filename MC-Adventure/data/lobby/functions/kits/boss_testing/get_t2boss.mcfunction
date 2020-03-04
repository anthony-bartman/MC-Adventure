#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will give players full diamond with a diamond sword for medium bosses
#--------------------------------------

clear @s

replaceitem entity @s armor.head minecraft:diamond_helmet 1
replaceitem entity @s armor.chest minecraft:diamond_chestplate 1
replaceitem entity @s armor.legs minecraft:diamond_leggings 1
replaceitem entity @s armor.feet minecraft:diamond_boots 1
replaceitem entity @s weapon.offhand minecraft:shield 1

replaceitem entity @s hotbar.0 minecraft:diamond_sword 1
replaceitem entity @s hotbar.1 minecraft:bow 1
replaceitem entity @s hotbar.2 minecraft:cooked_beef 16
replaceitem entity @s hotbar.3 minecraft:golden_apple 3
give @s minecraft:arrow 256
