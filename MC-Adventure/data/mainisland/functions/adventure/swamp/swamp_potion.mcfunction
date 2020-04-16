#This handles if a player walks into the witch hut

#Checks if player has ingredients
execute at @e[tag=swampCen] run execute if entity @a[distance=..0.35,nbt={Inventory:[{id:"minecraft:diamond_chestplate"}]}] run scoreboard players add @a[distance=..0.35] witchPotion 1
execute at @e[tag=swampCen] run execute if entity @a[distance=..0.35,nbt={Inventory:[{id:"minecraft:bone"}]}] run scoreboard players add @a[distance=..0.35] witchPotion 1
execute at @e[tag=swampCen] run execute if entity @a[distance=..0.35,nbt={Inventory:[{id:"minecraft:rotten_flesh"}]}] run scoreboard players add @a[distance=..0.35] witchPotion 1
execute at @e[tag=swampCen] run execute if entity @a[distance=..0.35,nbt={Inventory:[{id:"minecraft:redstone"}]}] run scoreboard players add @a[distance=..0.35] witchPotion 1
execute at @e[tag=swampCen] run execute if entity @a[distance=..0.35,nbt={Inventory:[{id:"minecraft:lime_dye"}]}] run scoreboard players add @a[distance=..0.35] witchPotion 1
execute at @e[tag=swampCen] run execute if entity @a[distance=..0.35,nbt={Inventory:[{id:"minecraft:spider_eye"}]}] run scoreboard players add @a[distance=..0.35] witchPotion 1

#Tells player how many ingredients are still needed
execute at @e[type=minecraft:armor_stand,tag=swampCen] run title @a[scores={witchPotion=1}] title {"text":"There Are Five More","color":"light_purple"}
execute at @e[type=minecraft:armor_stand,tag=swampCen] run title @a[scores={witchPotion=1}] subtitle {"bold":true,"text":"Ingredients I Need...","color":"red"}
execute at @e[type=minecraft:armor_stand,tag=swampCen] run title @a[scores={witchPotion=2}] title {"text":"There Are Four More","color":"light_purple"}
execute at @e[type=minecraft:armor_stand,tag=swampCen] run title @a[scores={witchPotion=2}] subtitle {"bold":true,"text":"Ingredients I Need...","color":"red"}
execute at @e[type=minecraft:armor_stand,tag=swampCen] run title @a[scores={witchPotion=3}] title {"text":"There Are Three More","color":"light_purple"}
execute at @e[type=minecraft:armor_stand,tag=swampCen] run title @a[scores={witchPotion=3}] subtitle {"bold":true,"text":"Ingredients I Need...","color":"red"}
execute at @e[type=minecraft:armor_stand,tag=swampCen] run title @a[scores={witchPotion=4}] title {"text":"There Are Two More","color":"light_purple"}
execute at @e[type=minecraft:armor_stand,tag=swampCen] run title @a[scores={witchPotion=4}] subtitle {"bold":true,"text":"Ingredients I Need...","color":"red"}
execute at @e[type=minecraft:armor_stand,tag=swampCen] run title @a[scores={witchPotion=5}] title {"text":"There Is One More","color":"light_purple"}
execute at @e[type=minecraft:armor_stand,tag=swampCen] run title @a[scores={witchPotion=5}] subtitle {"bold":true,"text":"Ingredient I Need...","color":"red"}

#Player has all ingredients: Tp player to dungeon
execute at @e[type=minecraft:armor_stand,tag=swampCen] run title @a[scores={witchPotion=6}] title {"text":"There Is One More","color":"green"}
execute at @e[type=minecraft:armor_stand,tag=swampCen] run title @a[scores={witchPotion=6}] subtitle {"bold":true,"text":"Secret Ingredient I Need...","color":"dark_purple"}
execute at @e[type=minecraft:armor_stand,tag=swampCen] run playsound minecraft:item.totem.use master @a[scores={witchPotion=6}] ~ ~ ~ 100
execute at @e[type=minecraft:armor_stand,tag=swampCen] run playsound minecraft:entity.witch.ambient master @a[scores={witchPotion=0}] ~ ~ ~ 100
#Tp player to dungeon
#------
execute at @e[tag=swampCen] run execute if entity @a[scores={witchPotion=6}] run execute as @e[sort=random,type=armor_stand,tag=swamp,limit=1] at @s run teleport @p[scores={witchPotion=6}] @s
#-----

#Players does not have all ingredients
execute at @e[type=minecraft:armor_stand,tag=swampCen] run playsound minecraft:entity.witch.ambient master @a[distance=..0.35,scores={witchPotion=0..5}] ~ ~ ~ 100
execute at @e[type=minecraft:armor_stand,tag=swampCen] run playsound minecraft:entity.witch.hurt master @a[distance=..0.35,scores={witchPotion=0..5}] ~ ~ ~ 100
execute at @e[type=minecraft:armor_stand,tag=swampCen] run effect give @a[scores={witchPotion=0..5}] minecraft:blindness 2 2
execute at @e[type=minecraft:armor_stand,tag=swampCen] run effect give @a[scores={witchPotion=0..5}] minecraft:instant_damage 1 1
#Reset players score to 0
execute at @e[tag=swampCen] run scoreboard players set @a[distance=..35] witchPotion 0
execute at @e[tag=swampCen] run execute if entity @a[scores={witchPotion=0..5}] run execute as @e[sort=random,type=armor_stand,tag=swamp,limit=1] at @s run teleport @p[scores={witchPotion=0..5}] @s






