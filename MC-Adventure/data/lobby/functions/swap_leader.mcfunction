#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will swap the leader of the server to another person
#--------------------------------------

#Remove old leader
execute at @e[type=minecraft:armor_stand,tag=swapLeader2,limit=1] if entity @a[distance=..1,tag=!leader,limit=2] run tag @s remove leader
execute at @e[type=minecraft:armor_stand,tag=swapLeader2,limit=1] if entity @a[distance=..1,tag=!leader,limit=2] run scoreboard players reset @s leader
execute at @e[type=minecraft:armor_stand,tag=swapLeader2,limit=1] if entity @a[distance=..1,tag=!leader,limit=2] run scoreboard players reset @s book
execute at @e[type=minecraft:armor_stand,tag=swapLeader2,limit=1] if entity @a[distance=..1,tag=!leader,limit=2] run replaceitem entity @s hotbar.0 minecraft:air

#Swap New Leader
execute at @e[type=minecraft:armor_stand,tag=swapLeader2,limit=1] as @a[distance=..1,tag=!leader,limit=2] run function lobby:set_leader
execute at @e[type=minecraft:armor_stand,tag=swapLeader2,limit=1] if entity @a[distance=..1,tag=!leader,limit=2] run title @s actionbar {"text":"Demoted to server member","color":"red","bold":true}
#Teleport back to middle
execute at @e[type=minecraft:armor_stand,tag=swapLeader2,limit=1] if entity @a[distance=..1,tag=!leader,limit=2] run teleport @s @e[tag=mainLobby,limit=1]
execute at @e[type=minecraft:armor_stand,tag=swapLeader2,limit=1] as @a[distance=..1,tag=leader,limit=2] run teleport @s @e[tag=mainLobby,limit=1]
