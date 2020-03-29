#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will teleport all players on a team to the introduction sequence
#--------------------------------------

#Setup intro sequence armor stands
execute if score introProgress intro matches 0 at @e[type=minecraft:armor_stand,tag=mainLobby,limit=1] run function lobby:intro/setup

#Teleport players to the intro sequence area
execute if score introProgress intro matches 1..5 if score particles lobbySettings matches 1 at @e[type=minecraft:armor_stand,tag=intro,limit=1] run function lobby:intro/join_particles 
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=goldTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/gold/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=purpleTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/purple/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=greenTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/green/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=aquaTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/aqua/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=redTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/red/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=yellowTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/yellow/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=blueTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/blue/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=blackTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/black/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=cyanTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/cyan/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=magentaTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/magenta/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=silverTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/silver/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=crimsonTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/crimson/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=cobaltTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/cobalt/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=ivyTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/ivy/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=opalTeam,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/opal/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=spectators,tag=player,tag=!leader,distance=..2,limit=1] run function lobby:teams/spectators/intro_tp
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=!,tag=leader,distance=..2,limit=1] run function lobby:leader/intro_tp
#Players who aren't on a team
execute if score introProgress intro matches 1..5 at @e[type=minecraft:armor_stand,tag=intro,limit=1] as @a[team=,tag=player,distance=..2,limit=1] run function lobby:teams/noteam_intro_tp
#Increment Intro Progression
execute if score introProgress intro matches 1 if score Total_Players intro matches 0 run scoreboard players set introProgress intro 2

#----------
#Leader right clicks item to allow other players
#To begin the map
#----------
#Wait for leader to right click item to start
execute if score introProgress intro matches 2 unless entity @s[tag=begin] as @s run function lobby:intro/get_beginrclick
#Leader selected begin map... need to confirm
execute if score introProgress intro matches 2 if entity @s[scores={introBeginRClick=1..}] run scoreboard players set introProgress intro 3
#Reset counter to 1 in case leader spam clicks or something 
execute if score introProgress intro matches 3 run scoreboard players add @s intro 1
execute if score introProgress intro matches 3 if entity @s[scores={introBeginRClick=2..}] run scoreboard players set @s introBeginRClick 1 
execute if score introProgress intro matches 3 run tag @s[scores={introBeginRClick=1..}] add begin
execute if score introProgress intro matches 3 if score @s intro matches 18..20 run replaceitem entity @s hotbar.4 minecraft:carrot_on_a_stick{Tags:["confirm"],display:{Name:'{"text":"Confirm?","color":"green","bold":true,"italic":true}'},HideFlags:33,CustomModelData:2,Enchantments:[{id:"minecraft:mending",lvl:1s}]} 1
execute if score introProgress intro matches 3 if score @s intro matches 18..20 if entity @s[scores={introBeginRClick=1..}] run scoreboard players set introProgress intro 4
execute if score introProgress intro matches 3 if score @s intro matches 18..20 run scoreboard players reset @s intro
#Waits for leader to confirm to begin map 
execute if score introProgress intro matches 4 unless entity @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{Tags:["confirm"]}}]}] run replaceitem entity @s hotbar.4 minecraft:carrot_on_a_stick{Tags:["confirm"],display:{Name:'{"text":"Confirm?","color":"green","bold":true,"italic":true}'},HideFlags:33,CustomModelData:2,Enchantments:[{id:"minecraft:mending",lvl:1s}]} 1
execute if score introProgress intro matches 4 as @s[scores={introBeginRClick=2..}] run function lobby:intro/leader_rclick

#INTRO SEQUENCE BEGINS HERE
#Timer for Intro Sequence
execute if score introProgress intro matches 5 run scoreboard players set LP lobbySettings 3
execute if score introProgress intro matches 5 run scoreboard players reset @s intro


