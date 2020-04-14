#This will eventually teleport players to their respective ocean islands xD NOT IMPLEMENTED YET

execute at @e[tag=redTeamCen] run effect give @s[distance=..185] minecraft:blindness 4 1 true
execute at @e[tag=redTeamCen] run effect give @s[distance=..185] minecraft:slow_falling 8 255 true
execute at @e[tag=redTeamCen] run title @s[distance=..185] title {"text":"No Death? That's Weird","color":"light_purple"}
execute at @e[tag=redTeamCen] run title @s[distance=..185] subtitle {"text":"You Found A Secret xD ... SHH","color":"aqua","bold":"true"}
execute at @e[tag=redTeamCen] run playsound minecraft:entity.evoker.prepare_wololo master @s[distance=..185] ~ ~ ~ 100
execute at @e[tag=redTeamCen] run playsound minecraft:ambient.cave master @s[distance=..185] ~ ~ ~ 75

execute at @e[tag=redTeamCen] run teleport @s[distance=..185] @e[tag=redTeamh,limit=1]