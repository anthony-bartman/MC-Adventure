#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will remove all of the main giant boss things
#--------------------------------------

kill @e[tag=giant]
bossbar set minecraft:giant visible false
bossbar remove minecraft:giant

scoreboard players reset timer giant_boss
scoreboard players reset Giant_Health giant_boss
scoreboard players reset Boss_Lvl giant_boss
