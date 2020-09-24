#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 4-16-20
# Desc: This will run the methods for the cloud area
#--------------------------------------

#--Spawns in a cloud boss (7)
execute if score greenMP mapProgress matches 8 if block ~1 ~ ~1 minecraft:sea_lantern run function skyisland:adv/cloud/cloud_boss
#Increments Map Score
execute if score greenMP mapProgress matches 8 if block ~1 ~ ~1 minecraft:sea_lantern run scoreboard players set greenMP mapProgress 9
execute if score greenMP mapProgress matches 9 if block ~1 ~ ~1 minecraft:sea_lantern run setblock ~1 ~ ~1 minecraft:air replace

#-- Updates boss bar for cloud boss (8)
execute if score greenMP mapProgress matches 9 run bossbar set minecraft:guardian players @a[team=greenTeam] 
execute if score greenMP mapProgress matches 9 run function skyisland:adv/cloud/cloud_bossbar
#Increments Map Score if boss is dead
execute if score greenMP mapProgress matches 9 unless entity @e[type=minecraft:evoker,tag=guardian,limit=1] run scoreboard players set @s skyAltars 0
execute if score greenMP mapProgress matches 9 unless entity @e[type=minecraft:evoker,tag=guardian,limit=1] run summon minecraft:armor_stand ~.75 ~ ~.75 {Tags:["cloudHelp"],CustomNameVisible:1b,CustomName:'{"text":"Respawn Boss?","color":"gold","bold":true}',Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
execute if score greenMP mapProgress matches 9 unless entity @e[type=minecraft:evoker,tag=guardian,limit=1] run tellraw @a[team=greenTeam] [{"selector":"@a[team=greenTeam]","bold":true},{"text":" can now go to the dark ","color":"gray","italic":true,"bold":false},{"text":"Power Core ","color":"gold","bold":true,"italic":true},{"text":"room...","color":"gray","bold":false,"italic":true}]
execute if score greenMP mapProgress matches 9 unless entity @e[type=minecraft:evoker,tag=guardian,limit=1] run scoreboard players set greenMP mapProgress 10
