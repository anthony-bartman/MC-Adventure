#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will swap the leader of the server to another person
#--------------------------------------

#Remove old leader (@s is old leader)
execute at @e[type=minecraft:armor_stand,tag=swapLeader2,limit=1] if entity @a[distance=..1,tag=!leader,limit=1] run scoreboard players reset @s join
execute at @e[type=minecraft:armor_stand,tag=swapLeader2,limit=1] if entity @a[distance=..1,tag=!leader,limit=1] run scoreboard players reset @s book
execute at @e[type=minecraft:armor_stand,tag=swapLeader2,limit=1] if entity @a[distance=..1,tag=!leader,limit=1] run replaceitem entity @s hotbar.0 minecraft:air
execute at @e[type=minecraft:armor_stand,tag=swapLeader2,limit=1] if entity @a[distance=..1,tag=!leader,limit=1] run tag @s remove leader
#Get rid of Old leader
execute at @e[type=minecraft:armor_stand,tag=swapLeader2,limit=1] if entity @a[distance=..1,tag=!leader,limit=1] run title @s title {"text":"Demoted to member","color":"red","bold":true}
execute at @e[type=minecraft:armor_stand,tag=swapLeader2,limit=1] if entity @a[distance=..1,tag=!leader,limit=1] run teleport @s @e[tag=mainLobby,limit=1]

#Swap New Leader
execute at @e[type=minecraft:armor_stand,tag=swapLeader2,limit=1] as @a[distance=..1,tag=!leader,limit=1] run function lobby:leader/set

