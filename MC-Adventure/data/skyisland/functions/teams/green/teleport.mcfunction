#--Initiates Altar TP (22)
#TP TO MAIN
#-----
#Resets score if player leaves altar
execute at @e[tag=greenTeama] unless entity @a[distance=..2] if score greenTpTimer time matches 1.. run title @a[distance=..4] actionbar {"text":"Cancelled Teleportation...","color":"red","bold":true}
execute at @e[tag=greenTeama] unless entity @a[distance=..2] if score greenTpTimer time matches 1.. run scoreboard players set greenTpTimer time 0
#If player stays on altar
execute at @e[tag=greenTeama] if score greenTpTimer time matches 1..5 if entity @a[team=greenTeam,distance=..10] run title @a[distance=..2] title {"text":" "}
execute at @e[tag=greenTeama] if score greenTpTimer time matches 1..5 if entity @a[team=greenTeam,distance=..10] run title @a[distance=..2] subtitle {"text":" "}
execute at @e[tag=greenTeama] if score greenTpTimer time matches 1.. if entity @a[team=greenTeam,distance=..10] run particle portal ~ ~ ~ 0 .8 0 .3 8 force
execute at @e[tag=greenTeama] if score greenTpTimer time matches 1.. if entity @a[team=greenTeam,distance=..10] run particle minecraft:end_rod ~ ~2 ~ .01 .01 .01 .1 1 force
execute at @e[tag=greenTeama] if score greenTpTimer time matches 1.. if entity @a[team=greenTeam,distance=..10] run particle minecraft:happy_villager ~ ~2 ~ .1 .1 .1 .1 1 force

#Animations for Teleporting
execute at @e[tag=greenTeama] if entity @a[team=greenTeam,distance=..2] if score greenTpTimer time matches 210 run title @a[distance=..1.5] title {"text":"Teleporting...","color":"white","bold":true}
#Cool Sounds Based on timer
execute at @e[tag=greenTeama] if entity @a[team=greenTeam,distance=..2] if score greenTpTimer time matches 5 run title @a[distance=..1.5] actionbar {"text":" "}
execute at @e[tag=greenTeama] if entity @a[team=greenTeam,distance=..2] if score greenTpTimer time matches 25 run playsound minecraft:block.beacon.power_select master @a[distance=..5] ~ ~ ~ 100
execute at @e[tag=greenTeama] if entity @a[team=greenTeam,distance=..2] if score greenTpTimer time matches 90 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..5] ~ ~ ~ 100
execute at @e[tag=greenTeama] if entity @a[team=greenTeam,distance=..2] if score greenTpTimer time matches 130 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..5] ~ ~ ~ 100
execute at @e[tag=greenTeama] if entity @a[team=greenTeam,distance=..2] if score greenTpTimer time matches 190 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..5] ~ ~ ~ 100
execute at @e[tag=greenTeama] if entity @a[team=greenTeam,distance=..2] if score greenTpTimer time matches 210 run playsound minecraft:entity.wither.spawn master @a[distance=..5] ~ ~ ~ 100
execute at @e[tag=greenTeama] if entity @a[team=greenTeam,distance=..2] if score greenTpTimer time matches 300 run playsound minecraft:entity.illusioner.prepare_mirror master @a[distance=..5] ~ ~ ~ 100
#Cool effects based on timer
execute at @e[tag=greenTeama] if entity @a[team=greenTeam,distance=..2] if score greenTpTimer time matches 300 run effect give @a[distance=..2] minecraft:blindness 3 10 true
execute at @e[tag=greenTeama] if entity @a[team=greenTeam,distance=..2] if score greenTpTimer time matches 325 run summon area_effect_cloud ~ ~3 ~ {Particle:explosion_emitter,WaitTime:5}
execute at @e[tag=greenTeama] if entity @a[team=greenTeam,distance=..2] if score greenTpTimer time matches 330 run summon firework_rocket ~ ~1 ~ {FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Colors:[I;3599359,3735491],FadeColors:[I;16777215]},{Type:2,Colors:[I;1877247,16777215],FadeColors:[I;3735551]}]}}}}
#-----
execute at @e[tag=greenTeama] if entity @a[team=greenTeam,distance=..2] run scoreboard players add greenTpTimer time 1
#Actual Teleportation of Player -- BASED, ONLY CERTAIN TEAMS CAN USE
execute at @e[tag=greenTeama] if score greenTpTimer time matches 330.. as @a[team=greenTeam,distance=..2] run function skyisland:tpmain

#Makes Tp Altar unbreakable
execute at @e[tag=greenTeama] if entity @a[scores={survivalOn=1},distance=..10] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:iron_block
execute at @e[tag=greenTeama] if entity @a[scores={survivalOn=1},distance=..10] run fill ~ ~ ~ ~ ~ ~ minecraft:beacon
execute at @e[tag=greenTeama] if entity @a[scores={survivalOn=1},distance=..10] run kill @e[type=item,distance=..3.5]
#Sets all players to survival if on greenTeam
execute at @e[tag=greenTeamCen] run gamemode survival @a[team=greenTeam,scores={survivalOn=1},distance=..75]
execute at @e[tag=greenTeamCen] run gamemode adventure @a[team=!greenTeam,distance=..75,scores={survivalOn=0..1}]

#TP from MAIN TO ISLAND
#------
#From Main Island to Island
execute at @e[tag=greenTeamMainTp] if entity @a[team=greenTeam,distance=..8] run particle minecraft:happy_villager ~ ~-1 ~ .1 .1 .1 .1 1 force
execute at @e[tag=greenTeamMainTp] if entity @a[team=greenTeam,distance=..8] run particle minecraft:end_rod ~ ~1 ~ .01 .01 .01 .1 1 force
execute at @e[tag=greenTeamMainTp] as @a[team=greenTeam,distance=..1.5] run title @s title {"text":"Welcome Home"}
execute at @e[tag=greenTeamMainTp] as @a[team=greenTeam,distance=..1.5] run title @s subtitle {"selector":"@s"}
execute at @e[tag=greenTeamMainTp] as @a[team=greenTeam,distance=..1.5] run effect give @s minecraft:blindness 3 10 true
execute at @e[tag=greenTeamMainTp] as @a[team=greenTeam,distance=..1.5] run effect give @s minecraft:slow_falling 8 1 true
execute at @e[tag=greenTeamMainTp] as @a[team=greenTeam,distance=..1.5] at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 100
#Makes Tp Altar unbreakable
execute at @e[tag=greenTeamMainTp] if entity @a[distance=..10] run setblock ~ ~-1 ~ minecraft:sea_lantern
execute at @e[tag=greenTeamMainTp] if entity @a[distance=..10] run kill @e[type=item,distance=..1.5]
execute at @e[tag=greenTeamMainTp] as @a[team=greenTeam,distance=..1.5] run teleport @s @e[tag=greenTeamh,limit=1]
