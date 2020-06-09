#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This takes care of what happens to the raid wave 1
#--------------------------------------

# Wave #1

#Find total number of mobs in wave
execute if score greenSetTags raidControl matches 0..5 at @e[type=minecraft:armor_stand,tag=greenTeamCen,limit=1] run function skyisland:teams/green/adv/raid/max_mobs
execute if score greenSetTags raidControl matches 0..5 run scoreboard players add greenSetTags raidControl 1
execute if score greenSetTags raidControl matches 6 as @e[tag=green_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if score greenSetTags raidControl matches 6 as @e[tag=green_raid] run teleport @s @e[type=minecraft:armor_stand,tag=greenTeamh,limit=1]
execute if score greenSetTags raidControl matches 6 at @e[type=minecraft:armor_stand,tag=greenTeamCen,limit=1] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if score greenSetTags raidControl matches 6 at @e[type=minecraft:armor_stand,tag=greenTeamCen,limit=1] run playsound minecraft:event.raid.horn master @a[team=greenTeam] ~ ~ ~ 100
execute if score greenSetTags raidControl matches 6 run scoreboard players add greenSetTags raidControl 1
#Determine total count of mobs left in wave
execute if score greenSetTags raidControl matches 7 run scoreboard players operation greenCurrMobsLeft raidControl -= @e[tag=green_raid] raidControl
execute if score greenSetTags raidControl matches 7 run scoreboard players operation greenTotalMobsLeft raidControl -= greenCurrMobsLeft raidControl
execute if score greenSetTags raidControl matches 7 run scoreboard players operation greenCurrMobsLeft raidControl = greenTotalMobsLeft raidControl

#Wave 1
execute if score greenMP mapProgress matches 15 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] title {"text":"Wave 1 Complete","color":"red"}
execute if score greenMP mapProgress matches 15 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] subtitle {"text":"You Ready Bro?","color":"aqua"}

execute if score greenMP mapProgress matches 17 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] title {"text":"Wave 2 Complete","color":"red"}
execute if score greenMP mapProgress matches 17 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] subtitle {"text":"These pillagers suck so bad bruh xD","color":"aqua"}

execute if score greenMP mapProgress matches 19 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] title {"text":"Wave 3 Complete","color":"red"}
execute if score greenMP mapProgress matches 19 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] subtitle {"text":"Is this even a challenge!","color":"aqua"}

execute if score greenMP mapProgress matches 21 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] title {"text":"Wave 4 Complete","color":"red"}
execute if score greenMP mapProgress matches 21 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] subtitle {"text":"If you died already... oh boy","color":"aqua"}

execute if score greenMP mapProgress matches 23 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] title {"text":"Wave 5 Complete","color":"red"}
execute if score greenMP mapProgress matches 23 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] subtitle {"text":"Pfft, that one was a lil too easy","color":"aqua"}

execute if score greenMP mapProgress matches 25 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] title {"text":"Wave 6 Complete","color":"red"}
execute if score greenMP mapProgress matches 25 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] subtitle {"text":"Alright, here comes a hard wave","color":"aqua"}

execute if score greenMP mapProgress matches 27 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] title {"text":"Wave 7 Complete","color":"red"}
execute if score greenMP mapProgress matches 27 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] subtitle {"text":"Next wave is impossible... xD","color":"aqua"}

execute if score greenMP mapProgress matches 29 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] title {"text":"Wave 8 Complete","color":"red"}
execute if score greenMP mapProgress matches 29 if score greenTotalMobsLeft raidControl matches 0 run title @a[team=greenTeam] subtitle {"text":"Not bad bro... xD","color":"aqua"}

#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if score greenTotalMobsLeft raidControl matches 0 run scoreboard players set greenSetTags raidControl 0
execute if score greenTotalMobsLeft raidControl matches 0 run scoreboard players add greenMP mapProgress 1
