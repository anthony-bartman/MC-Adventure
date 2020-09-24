#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This setup the raid before it starts
#--------------------------------------

scoreboard players add greenTime raidControl 1
execute if score greenTime raidControl matches 20 run tellraw @a[team=greenTeam] {"text":"\nSomething is coming\n","color":"gray","bold":false,"italic":true}
execute if score greenTime raidControl matches 35 run tellraw @a[team=greenTeam] {"text":"\nWas that a raid horn sound?\n","color":"gray","bold":false,"italic":true}
execute if score greenTime raidControl matches 45 run tellraw @a[team=greenTeam] [{"text":"\nIs that...\n","color":"gray","bold":false,"italic":true},{"text":"PILLAGERS, EVOKERS, RAVAGERS!\n","color":"red","bold":true,"italic":false},{"text":"Oh My!\n\nThe Raid has BEGUN!\n","color":"gray","bold":false,"italic":true}]
execute if score greenTime raidControl matches 45 at @e[type=minecraft:armor_stand,tag=greenTeamCen,limit=1] unless entity @e[tag=villager0,distance=..90] run function skyisland:teams/green/adv/get_jerry
execute if score greenTime raidControl matches 50.. at @e[type=minecraft:armor_stand,tag=greenTeamCen,limit=1] run effect give @a[team=greenTeam] minecraft:bad_omen 1000000 3 true 
execute if score greenTime raidControl matches 50.. at @e[type=minecraft:armor_stand,tag=greenTeamCen,limit=1] run teleport @a[team=greenTeam] ~5 ~-4 ~22
execute if score greenTime raidControl matches 50.. run scoreboard players set greenSetTags raidControl 0
execute if score greenTime raidControl matches 50.. run scoreboard players set greenCurrMobsLeft raidControl 0
execute if score greenTime raidControl matches 50.. run scoreboard players set greenTotalMobsLeft raidControl 0
execute if score greenTime raidControl matches 50.. run scoreboard players set greenTime raidControl 0


