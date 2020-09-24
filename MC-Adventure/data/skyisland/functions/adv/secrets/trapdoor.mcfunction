#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will handle the trapdoor secret :)
#--------------------------------------


#If players finds hidden coal entrance
execute unless block ~ ~ ~ minecraft:coal_block run setblock ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] replace
execute if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run summon firework_rocket ~ ~2 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[I;10288939,4718585,16725712],FadeColors:[I;16777215]}]}}}}
execute if block ~ ~ ~ minecraft:oak_trapdoor[half=top,facing=east] run kill @e[type=minecraft:armor_stand,distance=..1]


