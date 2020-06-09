#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This will handle all of the functions regarding the skyislands
#--------------------------------------

#Handles when a player get's rid of their spawn point on accident
execute positioned 136 200 136 as @a[team=!,tag=player,distance=..3] run function skyisland:adv/skyisland_chunks

#Teleport to Ocean_Island (LAGGIEST THINGS RIGHT HERE) will be in main_method


#SKYISLAND
#---
#Bugs
# ++ DO SOME TESTING WITH MULTIPLE PLAYERS ACCESSING THE HELP MENU!!!
#Teams Adventure
execute if score goldMP mapProgress matches 0..31 as @a[team=goldTeam] run function skyisland:teams/gold/adventure
execute if score purpleMP mapProgress matches 0..31 as @a[team=purpleTeam] run function skyisland:teams/purple/adventure
execute if score greenMP mapProgress matches 0..31 as @a[team=greenTeam] run function skyisland:teams/green/adventure
execute if score aquaMP mapProgress matches 0..31 as @a[team=aquaTeam] run function skyisland:teams/aqua/adventure
execute if score redMP mapProgress matches 0..31 as @a[team=redTeam] run function skyisland:teams/red/adventure
execute if score yellowMP mapProgress matches 0..31 as @a[team=yellowTeam] run function skyisland:teams/yellow/adventure
execute if score blueMP mapProgress matches 0..31 as @a[team=blueTeam] run function skyisland:teams/blue/adventure
execute if score blackMP mapProgress matches 0..31 as @a[team=blackTeam] run function skyisland:teams/black/adventure
execute if score cyanMP mapProgress matches 0..31 as @a[team=cyanTeam] run function skyisland:teams/cyan/adventure
execute if score magentaMP mapProgress matches 0..31 as @a[team=magentaTeam] run function skyisland:teams/magenta/adventure
execute if score crimsonMP mapProgress matches 0..31 as @a[team=crimsonTeam] run function skyisland:teams/crimson/adventure
execute if score cobaltMP mapProgress matches 0..31 as @a[team=cobaltTeam] run function skyisland:teams/cobalt/adventure
execute if score ivyMP mapProgress matches 0..31 as @a[team=ivyTeam] run function skyisland:teams/ivy/adventure


#Teams Teleportation to MainIsland
execute if score goldMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=goldTeama,limit=1] as @a[team=goldTeam,distance=..10] run function skyisland:teams/teleport
execute if score purpleMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=purpleTeama,limit=1] as @a[team=purpleTeam,distance=..10] run function skyisland:teams/teleport
execute if score greenMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=greenTeama,limit=1] as @a[team=greenTeam,distance=..10] run function skyisland:teams/teleport
execute if score aquaMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=aquaTeama,limit=1] as @a[team=aquaTeam,distance=..10] run function skyisland:teams/teleport
execute if score redMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=redTeama,limit=1] as @a[team=redTeam,distance=..10] run function skyisland:teams/teleport
execute if score yellowMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=yellowTeama,limit=1] as @a[team=yellowTeam,distance=..10] run function skyisland:teams/teleport
execute if score blueMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=blueTeama,limit=1] as @a[team=blueTeam,distance=..10] run function skyisland:teams/teleport
execute if score blackMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=blackTeama,limit=1] as @a[team=blackTeam,distance=..10] run function skyisland:teams/teleport
execute if score cyanMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=cyanTeama,limit=1] as @a[team=cyanTeam,distance=..10] run function skyisland:teams/teleport
execute if score magentaMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=magentaTeama,limit=1] as @a[team=magentaTeam,distance=..10] run function skyisland:teams/teleport
execute if score crimsonMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=crimsonTeama,limit=1] as @a[team=crimsonTeam,distance=..10] run function skyisland:teams/teleport
execute if score cobaltMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=cobaltTeama,limit=1] as @a[team=cobaltTeam,distance=..10] run function skyisland:teams/teleport
execute if score ivyMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=ivyTeama,limit=1] as @a[team=ivyTeam,distance=..10] run function skyisland:teams/teleport

#TPHome from Mainisland to skyisland
execute if score goldMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=goldTeamMainTp,limit=1] as @a[team=goldTeam,distance=..10] run function skyisland:teams/tphome
execute if score purpleMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=purpleTeamMainTp,limit=1] as @a[team=purpleTeam,distance=..10] run function skyisland:teams/tphome
execute if score greenMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=greenTeamMainTp,limit=1] as @a[team=greenTeam,distance=..10] run function skyisland:teams/tphome
execute if score aquaMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=aquaTeamMainTp,limit=1] as @a[team=aquaTeam,distance=..10] run function skyisland:teams/tphome
execute if score redMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=redTeamMainTp,limit=1] as @a[team=redTeam,distance=..10] run function skyisland:teams/tphome
execute if score yellowMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=yellowTeamMainTp,limit=1] as @a[team=yellowTeam,distance=..10] run function skyisland:teams/tphome
execute if score blueMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=blueTeamMainTp,limit=1] as @a[team=blueTeam,distance=..10] run function skyisland:teams/tphome
execute if score blackMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=blackTeamMainTp,limit=1] as @a[team=blackTeam,distance=..10] run function skyisland:teams/tphome
execute if score cyanMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=cyanTeamMainTp,limit=1] as @a[team=cyanTeam,distance=..10] run function skyisland:teams/tphome
execute if score magentaMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=magentaTeamMainTp,limit=1] as @a[team=magentaTeam,distance=..10] run function skyisland:teams/tphome
execute if score crimsonMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=crimsonTeamMainTp,limit=1] as @a[team=crimsonTeam,distance=..10] run function skyisland:teams/tphome
execute if score cobaltMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=cobaltTeamMainTp,limit=1] as @a[team=cobaltTeam,distance=..10] run function skyisland:teams/tphome
execute if score ivyMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=ivyTeamMainTp,limit=1] as @a[team=ivyTeam,distance=..10] run function skyisland:teams/tphome

#MainIsland Things (Island Settings and Trigger Help)
execute if score goldMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=goldTeamCen,limit=1] as @a[team=goldTeam] run function skyisland:teams/gold/settings_after
execute if score purpleMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=purpleTeamCen,limit=1] as @a[team=purpleTeam] run function skyisland:teams/purple/settings_after
execute if score greenMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=greenTeamCen,limit=1] as @a[team=greenTeam] run function skyisland:teams/green/settings_after
execute if score aquaMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=aquaTeamCen,limit=1] as @a[team=aquaTeam] run function skyisland:teams/aqua/settings_after
execute if score redMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=redTeamCen,limit=1] as @a[team=redTeam] run function skyisland:teams/red/settings_after
execute if score yellowMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=yellowTeamCen,limit=1] as @a[team=yellowTeam] run function skyisland:teams/yellow/settings_after
execute if score blueMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=blueTeamCen,limit=1] as @a[team=blueTeam] run function skyisland:teams/blue/settings_after
execute if score blackMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] as @a[team=blackTeam] run function skyisland:teams/black/settings_after
execute if score cyanMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=cyanTeamCen,limit=1] as @a[team=cyanTeam] run function skyisland:teams/cyan/settings_after
execute if score magentaMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=magentaTeamCen,limit=1] as @a[team=magentaTeam] run function skyisland:teams/magenta/settings_after
execute if score crimsonMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=crimsonTeamCen,limit=1] as @a[team=crimsonTeam] run function skyisland:teams/crimson/settings_after
execute if score cobaltMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=cobaltTeamCen,limit=1] as @a[team=cobaltTeam] run function skyisland:teams/cobalt/settings_after
execute if score ivyMP mapProgress matches 32 at @e[type=minecraft:armor_stand,tag=ivyTeamCen,limit=1] as @a[team=ivyTeam] run function skyisland:teams/ivy/settings_after

#---------------------------
#Based on Island Settings, this will teleport players away from island, NEEDS TO BE ABLE TO BE ENABLED IF TEAM IS NOT ONLINE
execute if score goldIS mapProgress matches 2 at @e[type=minecraft:armor_stand,tag=goldTeamCen,limit=1] as @a[team=!goldTeam,tag=player,distance=..60] run function skyisland:adv/tp_homeskyisland
execute if score purpleIS mapProgress matches 2 at @e[type=minecraft:armor_stand,tag=purpleTeamCen,limit=1] as @a[team=!purpleTeam,tag=player,distance=..60] run function skyisland:adv/tp_homeskyisland
execute if score greenIS mapProgress matches 2 at @e[type=minecraft:armor_stand,tag=greenTeamCen,limit=1] as @a[team=!greenTeam,tag=player,distance=..60] run function skyisland:adv/tp_homeskyisland
execute if score aquaIS mapProgress matches 2 at @e[type=minecraft:armor_stand,tag=aquaTeamCen,limit=1] as @a[team=!aquaTeam,tag=player,distance=..60] run function skyisland:adv/tp_homeskyisland
execute if score redIS mapProgress matches 2 at @e[type=minecraft:armor_stand,tag=redTeamCen,limit=1] as @a[team=!redTeam,tag=player,distance=..60] run function skyisland:adv/tp_homeskyisland
execute if score yellowIS mapProgress matches 2 at @e[type=minecraft:armor_stand,tag=yellowTeamCen,limit=1] as @a[team=!yellowTeam,tag=player,distance=..60] run function skyisland:adv/tp_homeskyisland
execute if score blueIS mapProgress matches 2 at @e[type=minecraft:armor_stand,tag=blueTeamCen,limit=1] as @a[team=!blueTeam,tag=player,distance=..60] run function skyisland:adv/tp_homeskyisland
execute if score blackIS mapProgress matches 2 at @e[type=minecraft:armor_stand,tag=blackTeamCen,limit=1] as @a[team=!blackTeam,tag=player,distance=..60] run function skyisland:adv/tp_homeskyisland
execute if score cyanIS mapProgress matches 2 at @e[type=minecraft:armor_stand,tag=cyanTeamCen,limit=1] as @a[team=!cyanTeam,tag=player,distance=..60] run function skyisland:adv/tp_homeskyisland
execute if score magentaIS mapProgress matches 2 at @e[type=minecraft:armor_stand,tag=magentaTeamCen,limit=1] as @a[team=!magentaTeam,tag=player,distance=..60] run function skyisland:adv/tp_homeskyisland
execute if score crimsonIS mapProgress matches 2 at @e[type=minecraft:armor_stand,tag=crimsonTeamCen,limit=1] as @a[team=!crimsonTeam,tag=player,distance=..60] run function skyisland:adv/tp_homeskyisland
execute if score cobaltIS mapProgress matches 2 at @e[type=minecraft:armor_stand,tag=cobaltTeamCen,limit=1] as @a[team=!cobaltTeam,tag=player,distance=..60] run function skyisland:adv/tp_homeskyisland
execute if score ivyIS mapProgress matches 2 at @e[type=minecraft:armor_stand,tag=ivyTeamCen,limit=1] as @a[team=!ivyTeam,tag=player,distance=..60] run function skyisland:adv/tp_homeskyisland


