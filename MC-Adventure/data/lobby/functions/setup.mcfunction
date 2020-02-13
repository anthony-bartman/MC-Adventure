#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will setup the lobby armor stands, and scoreboards
#--------------------------------------


#{Tags:[""],NoGravity:1,Invisible:1,DisabledSlots:2039583,Marker:1}
#Summon Armor Stands
summon minecraft:armor_stand ~ ~ ~ {Tags:["mainLobby"],NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-25 ~1 ~5 {Tags:["goldTeam"],NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-20 ~1 ~5 {Tags:["purpleTeam"],NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-15 ~1 ~5 {Tags:["greenTeam"],NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-10 ~1 ~5 {Tags:["aquaTeam"],NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~-5 ~1 ~5 {Tags:["redTeam"],NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~ ~1 ~5 {Tags:["yellowTeam"],NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~5 ~1 ~5 {Tags:["blueTeam"],NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~10 ~1 ~5 {Tags:["blackTeam"],NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~15 ~1 ~5 {Tags:["cyanTeam"],NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~20 ~1 ~5 {Tags:["magentaTeam"],NoGravity:1}
execute at @e[tag=mainLobby] run summon minecraft:armor_stand ~25 ~1 ~5 {Tags:["spectatorTeam"],NoGravity:1}

#Create Teams
team add goldTeam {"text":"Gold Team","color":"gold"}
team add purpleTeam {"text":"Purple Team","color":"dark_purple"}
team add greenTeam {"text":"Green Team","color":"green"}
team add aquaTeam {"text":"Aqua Team","color":"aqua"}
team add redTeam {"text":"Red Team","color":"red"}
team add yellowTeam {"text":"Yellow Team","color":"yellow"}
team add blueTeam {"text":"Blue Team","color":"blue"}
team add blackTeam {"text":"Black Team","color":"black"}
team add cyanTeam {"text":"Cyan Team","color":"dark_aqua"}
team add magentaTeam {"text":"Magenta Team","color":"light_purple"}
team add spectatorTeam {"text":"Spectators","color":"gray"}

team modify goldTeam color gold
team modify purpleTeam color dark_purple
team modify greenTeam color green
team modify aquaTeam color aqua
team modify redTeam color red
team modify yellowTeam color yellow
team modify blueTeam color blue
team modify blackTeam color black
team modify cyanTeam color dark_aqua
team modify magentaTeam color light_purple
team modify spectatorTeam color gray

#Setup Scoreboards


