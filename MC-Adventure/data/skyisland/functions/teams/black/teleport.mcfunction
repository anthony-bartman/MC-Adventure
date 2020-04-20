

#Help Menu After Sky Adventure
execute as @s[scores={help=1..1499}] run function skyisland:trigger/main_adv
#This handles the islandSettings Book
execute as @s[scores={mapProgress=0..}] run function skyisland:teams/black/change_is

#TP to Main
#-----
#Resets score if player leaves altar
execute unless entity @s[distance=..2] if score blackTpTimer skyAltars matches 1.. run title @s[distance=..4] actionbar {"text":"Cancelled Teleportation...","color":"red","bold":true}
execute unless entity @s[distance=..2] if score blackTpTimer skyAltars matches 1.. run scoreboard players set blackTpTimer skyAltars 0
#If player stays on altar
execute if score blackTpTimer skyAltars matches 1..5 run title @s[distance=..2] title {"text":" "}
execute if score blackTpTimer skyAltars matches 1..5 run title @s[distance=..2] subtitle {"text":" "}
execute if score blackTpTimer skyAltars matches 1.. if entity @s[distance=..10] run particle portal ~ ~ ~ 0 .8 0 .3 8 force
execute if score blackTpTimer skyAltars matches 1.. if entity @s[distance=..10] run particle minecraft:end_rod ~ ~2 ~ .01 .01 .01 .1 1 force
execute if score blackTpTimer skyAltars matches 1.. if entity @s[distance=..10] run particle minecraft:happy_villager ~ ~2 ~ .1 .1 .1 .1 1 force

#Animations for Teleporting
execute if entity @s[distance=..2] if score blackTpTimer skyAltars matches 210 run title @s[distance=..1.5] title {"text":"Teleporting...","color":"white","bold":true}
#Cool Sounds Based on skyAltarsr
execute if entity @s[distance=..2] if score blackTpTimer skyAltars matches 5 run title @s[distance=..1.5] actionbar {"text":" "}
execute if entity @s[distance=..2] if score blackTpTimer skyAltars matches 25 run playsound minecraft:block.beacon.power_select master @a[distance=..5] ~ ~ ~ 100
execute if entity @s[distance=..2] if score blackTpTimer skyAltars matches 90 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..5] ~ ~ ~ 100
execute if entity @s[distance=..2] if score blackTpTimer skyAltars matches 130 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..5] ~ ~ ~ 100
execute if entity @s[distance=..2] if score blackTpTimer skyAltars matches 190 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..5] ~ ~ ~ 100
execute if entity @s[distance=..2] if score blackTpTimer skyAltars matches 210 run playsound minecraft:entity.wither.spawn master @a[distance=..5] ~ ~ ~ 100
execute if entity @s[distance=..2] if score blackTpTimer skyAltars matches 300 run playsound minecraft:entity.illusioner.prepare_mirror master @a[distance=..5] ~ ~ ~ 100
#Cool effects based on skyAltarsr
execute if score blackTpTimer skyAltars matches 300 run effect give @s[distance=..2] minecraft:blindness 3 10 true
execute if entity @s[distance=..2] if score blackTpTimer skyAltars matches 325 run summon area_effect_cloud ~ ~3 ~ {Particle:explosion_emitter,WaitTime:5}
execute if entity @s[distance=..2] if score blackTpTimer skyAltars matches 330 run summon firework_rocket ~ ~1 ~ {FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Colors:[I;3599359,3735491],FadeColors:[I;16777215]},{Type:2,Colors:[I;1877247,16777215],FadeColors:[I;3735551]}]}}}}
#-----
execute if entity @s[distance=..2] run scoreboard players add blackTpTimer skyAltars 1
#Actual Teleportation of Player -- BASED, ONLY CERTAIN TEAMS CAN USE
execute if score blackTpTimer skyAltars matches 330.. as @s[distance=..2] run function skyisland:adv/tp_altar/tpmain

#Makes Tp Altar unbreakable
execute if entity @s run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:iron_block
execute if entity @s run fill ~ ~ ~ ~ ~ ~ minecraft:beacon
execute if entity @s run kill @e[type=item,distance=..2.5]
#Sets all players to survival if on blackTeam
execute if score blackIS mapProgress matches 2 at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] as @a[team=!blackTeam,tag=player,distance=..150] run function skyisland:adv/tp_homeskyisland


#TP from MAIN TO ISLAND
#------
#From Main Island to Island
execute at @e[tag=blackTeamMainTp] if entity @a[distance=..8] run particle minecraft:happy_villager ~ ~-1 ~ .1 .1 .1 .1 1 force
execute at @e[tag=blackTeamMainTp] if entity @a[distance=..8] run particle minecraft:end_rod ~ ~1 ~ .01 .01 .01 .1 1 force
execute at @e[tag=blackTeamMainTp] as @a[distance=..1.5] run title @s title {"text":"Welcome Home"}
execute at @e[tag=blackTeamMainTp] as @a[distance=..1.5] run title @s subtitle {"selector":"@s"}
execute at @e[tag=blackTeamMainTp] as @a[distance=..1.5] run effect give @s minecraft:blindness 3 10 true
execute at @e[tag=blackTeamMainTp] as @a[distance=..1.5] run effect give @s minecraft:slow_falling 8 1 true
execute at @e[tag=blackTeamMainTp] as @a[distance=..1.5] at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 100
#Makes Tp Altar unbreakable
execute at @e[tag=blackTeamMainTp] if entity @a[distance=..10] run setblock ~ ~-1 ~ minecraft:sea_lantern
execute at @e[tag=blackTeamMainTp] if entity @a[distance=..10] run kill @e[type=item,distance=..1.5]
execute at @e[tag=blackTeamMainTp] as @a[distance=..1.5] run teleport @s @e[tag=blackTeamh,limit=1]
