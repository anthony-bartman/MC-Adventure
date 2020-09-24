#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This takes care of what happens to the raid wave 1
#--------------------------------------

# Wave #1

#Find total number of mobs in wave
execute if score blackSetTags raidControl matches 0..5 at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] run function skyisland:teams/black/adv/raid/max_mobs
execute if score blackSetTags raidControl matches 0..5 run scoreboard players add blackSetTags raidControl 1
execute if score blackSetTags raidControl matches 6 as @e[tag=black_raid] run effect give @s minecraft:slow_falling 10 1 true
execute if score blackSetTags raidControl matches 6 as @e[tag=black_raid] run teleport @s @e[type=minecraft:armor_stand,tag=blackTeamh,limit=1]
execute if score blackSetTags raidControl matches 6 at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] run summon minecraft:lightning_bolt ~ ~-10 ~ 
execute if score blackSetTags raidControl matches 6 at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] run playsound minecraft:event.raid.horn master @a[team=blackTeam] ~ ~ ~ 100
execute if score blackSetTags raidControl matches 6 run scoreboard players add blackSetTags raidControl 1
#Determine total count of mobs left in wave
execute if score blackSetTags raidControl matches 7 run scoreboard players operation blackCurrMobsLeft raidControl -= @e[tag=black_raid] raidControl
execute if score blackSetTags raidControl matches 7 run scoreboard players operation blackTotalMobsLeft raidControl -= blackCurrMobsLeft raidControl
execute if score blackSetTags raidControl matches 7 run scoreboard players operation blackCurrMobsLeft raidControl = blackTotalMobsLeft raidControl

#Wave 1
execute if score blackMP mapProgress matches 15 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 1 Complete","color":"red"}
execute if score blackMP mapProgress matches 15 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"You Ready Bro?","color":"aqua"}

execute if score blackMP mapProgress matches 17 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 2 Complete","color":"red"}
execute if score blackMP mapProgress matches 17 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"These pillagers suck so bad bruh xD","color":"aqua"}

execute if score blackMP mapProgress matches 19 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 3 Complete","color":"red"}
execute if score blackMP mapProgress matches 19 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"Is this even a challenge!","color":"aqua"}

execute if score blackMP mapProgress matches 21 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 4 Complete","color":"red"}
execute if score blackMP mapProgress matches 21 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"If you died already... oh boy","color":"aqua"}

execute if score blackMP mapProgress matches 23 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 5 Complete","color":"red"}
execute if score blackMP mapProgress matches 23 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"Pfft, that one was a lil too easy","color":"aqua"}

execute if score blackMP mapProgress matches 25 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 6 Complete","color":"red"}
execute if score blackMP mapProgress matches 25 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"Alright, here comes a hard wave","color":"aqua"}

execute if score blackMP mapProgress matches 27 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 7 Complete","color":"red"}
execute if score blackMP mapProgress matches 27 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"Next wave is impossible... xD","color":"aqua"}

execute if score blackMP mapProgress matches 29 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] title {"text":"Wave 8 Complete","color":"red"}
execute if score blackMP mapProgress matches 29 if score blackTotalMobsLeft raidControl matches 0 run title @a[team=blackTeam] subtitle {"text":"Not bad bro... xD","color":"aqua"}

#Once all mobs from the raid wave are killed, increment one on map progress for next raid wave
execute if score blackTotalMobsLeft raidControl matches 0 run scoreboard players set blackSetTags raidControl 0
execute if score blackTotalMobsLeft raidControl matches 0 run scoreboard players add blackMP mapProgress 1
