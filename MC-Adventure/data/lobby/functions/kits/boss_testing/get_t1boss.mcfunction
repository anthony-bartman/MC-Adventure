#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will give players full iron with iron sword for easy bosses
#--------------------------------------

clear @s

replaceitem entity @s armor.head minecraft:iron_helmet 1
replaceitem entity @s armor.chest minecraft:iron_chestplate 1
replaceitem entity @s armor.legs minecraft:iron_leggings 1
replaceitem entity @s armor.feet minecraft:iron_boots 1
replaceitem entity @s weapon.offhand minecraft:shield 1

replaceitem entity @s hotbar.0 minecraft:iron_sword 1
replaceitem entity @s hotbar.1 minecraft:bow 1
replaceitem entity @s hotbar.2 minecraft:cooked_beef 16
give @s minecraft:arrow 256
