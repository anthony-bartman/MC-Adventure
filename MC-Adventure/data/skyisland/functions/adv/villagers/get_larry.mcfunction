#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This summons in a new villager that trades good stuff after the sky adventure
#--------------------------------------

summon minecraft:lightning_bolt ~5 ~5 ~
summon minecraft:lightning_bolt ~ ~5 ~5
summon minecraft:lightning_bolt ~-5 ~5 ~
summon minecraft:lightning_bolt ~ ~5 ~-5

#Summon in Larry
summon minecraft:villager ~ ~ ~ {Tags:["villager4"],VillagerData:{level:5,profession:"minecraft:toolsmith",type:"minecraft:swamp"},CustomNameVisible:1b,CustomName:"{\"text\":\"Larry\",\"color\":\"gray\"}",Invulnerable:1}