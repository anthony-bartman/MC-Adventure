#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will setup the introduction sequence armor stands and whatnot
#--------------------------------------

#Join Armor Stand in Lobby
execute at @e[type=minecraft:armor_stand,tag=mainLobby,limit=1] run summon minecraft:armor_stand ~ ~1.5 ~10 {Tags:["intro"],CustomNameVisible:1b,CustomName:'{"text":"Start Map","color":"dark_blue","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute at @e[type=minecraft:armor_stand,tag=intro,limit=1] run summon minecraft:armor_stand ~ ~-0.5 ~ {Tags:["introj"],CustomNameVisible:1b,CustomName:'{"text":"JOIN","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}

#Intro Sequence Place, Spot for Each Team, and a Central Armor Stand in the middle
execute at @e[type=minecraft:armor_stand,tag=mainLobby,limit=1] run summon minecraft:armor_stand ~ ~15 ~10 {Tags:["introCen"],CustomNameVisible:1b,CustomName:'{"text":"Introduction","color":"yellow","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
#Team intro 'Spawn' stands
execute at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~18 ~1.5 ~ {Tags:["spectatorsIntro"],CustomNameVisible:1b,CustomName:'{"text":"Spectators","color":"dark_gray","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score goldTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~16 ~1.5 ~6 {Tags:["goldIntro"],CustomNameVisible:1b,CustomName:'{"text":"Gold Team","color":"gold","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score purpleTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~12 ~1.5 ~12 {Tags:["purpleIntro"],CustomNameVisible:1b,CustomName:'{"text":"Purple Team","color":"dark_purple","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score greenTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~6 ~1.5 ~16 {Tags:["greenIntro"],CustomNameVisible:1b,CustomName:'{"text":"Green Team","color":"green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score aquaTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~ ~1.5 ~18 {Tags:["aquaIntro"],CustomNameVisible:1b,CustomName:'{"text":"Aqua Team","color":"aqua","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score redTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~-6 ~1.5 ~16 {Tags:["redIntro"],CustomNameVisible:1b,CustomName:'{"text":"Red Team","color":"red","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score yellowTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~-12 ~1.5 ~12 {Tags:["yellowIntro"],CustomNameVisible:1b,CustomName:'{"text":"Yellow Team","color":"yellow","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score blueTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~-16 ~1.5 ~6 {Tags:["blueIntro"],CustomNameVisible:1b,CustomName:'{"text":"Blue Team","color":"blue","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score blackTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~-18 ~1.5 ~ {Tags:["blackIntro"],CustomNameVisible:1b,CustomName:'{"text":"Black Team","color":"dark_gray","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score cyanTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~-16 ~1.5 ~-6 {Tags:["cyanIntro"],CustomNameVisible:1b,CustomName:'{"text":"Cyan Team","color":"dark_aqua","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score magentaTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~-12 ~1.5 ~-12 {Tags:["magentaIntro"],CustomNameVisible:1b,CustomName:'{"text":"Magenta Team","color":"light_purple","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score silverTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~-6 ~1.5 ~-16 {Tags:["silverIntro"],CustomNameVisible:1b,CustomName:'{"text":"Silver Team","color":"gray","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score crimsonTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~ ~1.5 ~-18 {Tags:["crimsonIntro"],CustomNameVisible:1b,CustomName:'{"text":"Crimson Team","color":"dark_red","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score cobaltTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~6 ~1.5 ~-16 {Tags:["cobaltIntro"],CustomNameVisible:1b,CustomName:'{"text":"Cobalt Team","color":"dark_blue","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score ivyTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~12 ~1.5 ~-12 {Tags:["ivyIntro"],CustomNameVisible:1b,CustomName:'{"text":"Ivy Team","color":"dark_green","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
execute if score opalTeam enabledTeams matches 1 at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run summon minecraft:armor_stand ~16 ~1.5 ~-6 {Tags:["opalIntro"],CustomNameVisible:1b,CustomName:'{"text":"Opal Team","color":"white","bold":true}',NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}

#Summon Colored blocks below the enabled Team Armor Stands
execute at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run fill ~7 ~-3 ~7 ~-7 ~-3 ~-7 minecraft:white_concrete
execute at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run setblock ~ ~-3 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run setblock ~4 ~-3 ~4 minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run setblock ~-4 ~-3 ~4 minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run setblock ~4 ~-3 ~-4 minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run setblock ~-4 ~-3 ~-4 minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run setblock ~4 ~-3 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run setblock ~-4 ~-3 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run setblock ~ ~-3 ~4 minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=introCen,limit=1] run setblock ~ ~-3 ~-4 minecraft:sea_lantern replace
#Teams
execute at @e[type=minecraft:armor_stand,tag=goldIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:gold_block
execute at @e[type=minecraft:armor_stand,tag=goldIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=purpleIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:purple_concrete
execute at @e[type=minecraft:armor_stand,tag=purpleIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=greenIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:lime_concrete
execute at @e[type=minecraft:armor_stand,tag=greenIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=aquaIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:light_blue_wool
execute at @e[type=minecraft:armor_stand,tag=aquaIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=redIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:red_concrete
execute at @e[type=minecraft:armor_stand,tag=redIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=yellowIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:yellow_concrete
execute at @e[type=minecraft:armor_stand,tag=yellowIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=blueIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:light_blue_concrete
execute at @e[type=minecraft:armor_stand,tag=blueIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=blackIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:black_concrete
execute at @e[type=minecraft:armor_stand,tag=blackIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=cyanIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:cyan_concrete
execute at @e[type=minecraft:armor_stand,tag=cyanIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=magentaIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:magenta_concrete
execute at @e[type=minecraft:armor_stand,tag=magentaIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=silverIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:gray_concrete
execute at @e[type=minecraft:armor_stand,tag=silverIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=crimsonIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:red_nether_bricks
execute at @e[type=minecraft:armor_stand,tag=crimsonIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=cobaltIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:blue_concrete
execute at @e[type=minecraft:armor_stand,tag=cobaltIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=ivyIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:green_concrete
execute at @e[type=minecraft:armor_stand,tag=ivyIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=opalIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:quartz_block
execute at @e[type=minecraft:armor_stand,tag=opalIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace
execute at @e[type=minecraft:armor_stand,tag=spectatorsIntro,limit=1] run fill ~2 ~-2.5 ~2 ~-2 ~-2.5 ~-2 minecraft:gray_concrete
execute at @e[type=minecraft:armor_stand,tag=spectatorsIntro,limit=1] run setblock ~ ~-2.5 ~ minecraft:sea_lantern replace