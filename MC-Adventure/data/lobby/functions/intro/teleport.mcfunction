#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will teleport all players on a team to the introduction sequence
#--------------------------------------

#Setup intro sequence armor stands
execute if score introProgress intro matches 0 at @e[type=minecraft:armor_stand,tag=mainLobby,limit=1] run function lobby:intro/setup

#Teleport players to the intro sequence area
execute if score introProgress intro matches 1 if score particles lobbySettings matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] run function lobby:intro/join_particles 
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=goldTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/gold/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=purpleTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/purple/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=greenTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/green/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=aquaTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/aqua/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=redTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/red/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=yellowTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/yellow/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=blueTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/blue/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=blackTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/black/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=cyanTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/cyan/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=magentaTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/magenta/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=silverTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/silver/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=crimsonTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/crimson/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=cobaltTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/cobalt/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=ivyTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/ivy/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=opalTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/opal/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=spectators,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/spectators/intro_tp
execute if score introProgress intro matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=!,tag=player,tag=leader,distance=..2,limit=1] run function lobby:leader/intro_tp


#Increment Intro Progression
execute if score Total_Players intro matches 0 run scoreboard players set introProgress intro 2

#Wait for leader to right click item to start


