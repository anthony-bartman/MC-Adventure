#This file will spawn in all of the armor stands and other things needed to setup the main island...

execute if score @s time matches 10 run effect give @s minecraft:blindness 30 5 true
execute if score @s time matches 10 run effect give @s minecraft:slowness 30 50 true
execute if score @s time matches 10 run effect give @s minecraft:slow_falling 50 50 true

#Teleport leader into position with bedrock box
execute if score @s time matches 10 run teleport @s 0 210 0
execute if score @s time matches 11 at @s run setblock 0 209 0 minecraft:bedrock
execute if score @s time matches 15 at @s run setblock 0 212 0 minecraft:bedrock 
execute if score @s time matches 15 at @s run setblock 1 210 0 minecraft:bedrock 
execute if score @s time matches 15 at @s run setblock -1 210 0 minecraft:bedrock 
execute if score @s time matches 15 at @s run setblock 0 210 1 minecraft:bedrock 
execute if score @s time matches 15 at @s run setblock 0 210 -1 minecraft:bedrock 
execute if score @s time matches 15 at @s run setblock 1 211 0 minecraft:bedrock 
execute if score @s time matches 15 at @s run setblock -1 211 0 minecraft:bedrock 
execute if score @s time matches 15 at @s run setblock 0 211 1 minecraft:bedrock 
execute if score @s time matches 15 at @s run setblock 0 211 -1 minecraft:bedrock 
execute if score @s time matches 20 run teleport @s 0 210 0

#Tell Leader whats Happening
execute if score @s time matches 20 at @s run title @s title {"text":"Setting Up"}
execute if score @s time matches 20 at @s run title @s subtitle {"text":"Map..."}
execute if score @s time matches 20 at @s run tellraw @a {"text":"Setting up map...","color":"gray","bold":true,"italic":true}
#Sky Island Center and Spawn Armor Stands
execute if score @s time matches 20 run teleport @s -382 152 24
execute if score @s time matches 30 run summon minecraft:armor_stand -382 152 24 {Tags:["blackTeamCen"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 40 at @e[tag=blackTeamCen] run summon minecraft:armor_stand ~-16 ~57 ~55 {Tags:["blackTeamSpawn"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 50 run scoreboard players set @e[tag=blackTeamCen] mapProgress 0

execute if score @s time matches 60 run teleport @s -309 167 224
execute if score @s time matches 70 run summon minecraft:armor_stand -309 167 224 {Tags:["magentaTeamCen"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 80 at @e[tag=magentaTeamCen] run summon minecraft:armor_stand ~-16 ~57 ~55 {Tags:["magentaTeamSpawn"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 90 run scoreboard players set @e[tag=magentaTeamCen] mapProgress 0

execute if score @s time matches 100 run teleport @s -190 149 367
execute if score @s time matches 110 run summon minecraft:armor_stand -190 149 367 {Tags:["aquaTeamCen"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 120 at @e[tag=aquaTeamCen] run summon minecraft:armor_stand ~-16 ~57 ~55 {Tags:["aquaTeamSpawn"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 130 run scoreboard players set @e[tag=aquaTeamCen] mapProgress 0

execute if score @s time matches 140 run teleport @s -20 155 394
execute if score @s time matches 150 run summon minecraft:armor_stand -20 155 394 {Tags:["redTeamCen"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 160 at @e[tag=redTeamCen] run summon minecraft:armor_stand ~-16 ~57 ~55 {Tags:["redTeamSpawn"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 170 run scoreboard players set @e[tag=redTeamCen] mapProgress 0

execute if score @s time matches 180 run teleport @s 153 165 379
execute if score @s time matches 190 run summon minecraft:armor_stand 153 165 379 {Tags:["yellowTeamCen"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 200 at @e[tag=yellowTeamCen] run summon minecraft:armor_stand ~-16 ~57 ~55 {Tags:["yellowTeamSpawn"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 210 run scoreboard players set @e[tag=yellowTeamCen] mapProgress 0

execute if score @s time matches 220 run teleport @s 293 174 282
execute if score @s time matches 230 run summon minecraft:armor_stand 293 174 282 {Tags:["blueTeamCen"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 240 at @e[tag=blueTeamCen] run summon minecraft:armor_stand ~-16 ~57 ~55 {Tags:["blueTeamSpawn"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 250 run scoreboard players set @e[tag=blueTeamCen] mapProgress 0

execute if score @s time matches 260 run teleport @s 393 172 120
execute if score @s time matches 270 run summon minecraft:armor_stand 393 172 120 {Tags:["greenTeamCen"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 280 at @e[tag=greenTeamCen] run summon minecraft:armor_stand ~-16 ~57 ~55 {Tags:["greenTeamSpawn"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 290 run scoreboard players set @e[tag=greenTeamCen] mapProgress 0

execute if score @s time matches 300 run teleport @s 0 210 0
#MAIN ISLAND ARMOR STANDS
#-----------
#Main Armor Stand
execute if score @s time matches 310 run summon minecraft:armor_stand 0 200 0 {Tags:["mainCenter"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}

#Summon custom villagers
#Plains
execute if score @s time matches 320 at @e[tag=mainCenter] positioned ~-75 ~-45 ~60 run function mainisland:villagers/get_fred
#Jungle
execute if score @s time matches 325 at @e[tag=mainCenter] positioned ~122 ~-33 ~52 run function mainisland:villagers/get_willy
#DarkOak
execute if score @s time matches 330 at @e[tag=mainCenter] positioned ~-118 ~-41 ~-149 run function mainisland:villagers/get_timmy
#Ice Area
execute if score @s time matches 335 at @e[tag=mainCenter] positioned ~23 ~-8 ~-147 run function mainisland:villagers/get_andizzy
#Behind Waterfall
execute if score @s time matches 340 at @e[tag=mainCenter] positioned ~104 ~-32 ~-62 run function mainisland:villagers/get_lukealicious

#Outcast Villager who trades good stuff
#Blue Spheres
execute if score @s time matches 345 at @e[tag=mainCenter] positioned ~20 ~-121 ~-94 run function mainisland:villagers/get_dredgen
#Green Spheres
execute if score @s time matches 350 at @e[tag=mainCenter] positioned ~123 ~-124 ~36 run function mainisland:villagers/get_osiris
#Orange Spheres
execute if score @s time matches 355 at @e[tag=mainCenter] positioned ~-81 ~-123 ~56 run function mainisland:villagers/get_aegeus


#Summon boss altar armor stands
execute if score @s time matches 360 at @e[tag=mainCenter] run summon minecraft:armor_stand ~-30 ~-18 ~-163 {Tags:["iceAltar"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 365 at @e[tag=mainCenter] run summon minecraft:armor_stand ~91 ~-127 ~157 {Tags:["oceanAltar"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 370 at @e[tag=mainCenter] run summon minecraft:armor_stand ~172 ~33 ~-79 {Tags:["volcanoAltar"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 375 at @e[tag=mainCenter] run summon minecraft:armor_stand ~-144 ~-91 ~15 {Tags:["desertAltar"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
# execute if score @s time matches 0 at @e[tag=mainCenter] summon minecraft:armor_stand ~-144 ~-91 ~15 {Tags:["jungleAltar"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}


#DUNGEON ISLAND RELATED ARMOR STANDS...
#-----
#BOSS ARMOR STANDS
execute if score @s time matches 400 run teleport @s -70 152 854
execute if score @s time matches 440 at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["dungeonSpawn"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 460 at @e[tag=dungeonSpawn] run summon minecraft:armor_stand ~-20 ~1 ~6 {Tags:["badGuy"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 480 at @e[tag=dungeonSpawn] run summon minecraft:armor_stand ~3 ~1 ~-34 {Tags:["badGuy"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 500 at @e[tag=dungeonSpawn] run summon minecraft:armor_stand ~-30 ~2 ~-14 {Tags:["badGuy"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 520 at @e[tag=dungeonSpawn] run summon minecraft:armor_stand ~-20 ~2 ~-45 {Tags:["tpMain"],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score @s time matches 540 run teleport @s 0 210 0

#Back To Lobby
execute if score @s time matches 595 run fill -1 209 1 1 212 -1 minecraft:air
execute if score @s time matches 595 run effect give @s minecraft:blindness 3 5 true
execute if score @s time matches 595 run effect give @s minecraft:slowness 3 50 true
execute if score @s time matches 600 run teleport @s 5100 158 5000

#Increment Timer
execute if score @s time matches 1.. run scoreboard players add @s time 1