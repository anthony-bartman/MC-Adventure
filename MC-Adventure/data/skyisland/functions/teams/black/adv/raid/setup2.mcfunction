#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This setsup the raid before it starts
#--------------------------------------

scoreboard players add blackTime raidControl 1
execute if score blackTime raidControl matches 7 run tellraw @a[team=blackTeam] {"text":"\nSomething is coming\n","color":"gray","bold":false,"italic":true}
execute if score blackTime raidControl matches 12 run tellraw @a[team=blackTeam] {"text":"\nWas that a raid horn sound?\n","color":"gray","bold":false,"italic":true}
execute if score blackTime raidControl matches 15 run tellraw @a[team=blackTeam] [{"text":"\nIs that...\n","color":"gray","bold":false,"italic":true},{"text":"PILLAGERS, EVOKERS, RAVAGERS!\n","color":"red","bold":true,"italic":false},{"text":"Oh My!\n\nThe Raid has BEGUN!\n","color":"gray","bold":false,"italic":true}]
execute if score blackTime raidControl matches 15 at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] unless entity @e[tag=villager0,distance=..90] run function skyisland:teams/black/adv/get_jerry
execute if score blackTime raidControl matches 16.. at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] run effect give @a[team=blackTeam] minecraft:bad_omen 1000000 3 true 
execute if score blackTime raidControl matches 16.. at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] run teleport @a[team=blackTeam] ~5 ~-4 ~22
execute if score blackTime raidControl matches 18.. run scoreboard players set blackSetTags raidControl 0
execute if score blackTime raidControl matches 18.. run scoreboard players set blackCurrMobsLeft raidControl 0
execute if score blackTime raidControl matches 18.. run scoreboard players set blackTotalMobsLeft raidControl 0
execute if score blackTime raidControl matches 18.. run scoreboard players set blackTime raidControl 0

