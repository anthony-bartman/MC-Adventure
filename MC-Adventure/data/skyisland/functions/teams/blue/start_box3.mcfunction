#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will allow the players to break coal box and populate their skyisland
#--------------------------------------
#Tell players what is happening
execute if entity @s[scores={helpmenu_time=4..5}] run summon minecraft:armor_stand 293 174 282 {Tags:["blueTeamCen"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
execute if entity @s[scores={helpmenu_time=8..9}] at @e[type=minecraft:armor_stand,tag=blueTeamCen,limit=1] run summon minecraft:armor_stand ~-16 ~57 ~55 {Tags:["blueTeamSpawn"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
execute if entity @s[scores={helpmenu_time=8}] run title @a[team=blueTeam] title {"text":"Populating Island...","bold":true,"color":"dark_aqua"}
execute if entity @s[scores={helpmenu_time=20}] run title @a[team=blueTeam] title {"text":"Beginning Map In...","bold":true,"italic":true,"color":"light_purple"}
execute if entity @s[scores={helpmenu_time=18}] run title @a[team=blueTeam] title {"text":"3","bold":true,"color":"green"}
execute if entity @s[scores={helpmenu_time=36}] run title @a[team=blueTeam] title {"text":"2","bold":true,"color":"yellow"}
execute if entity @s[scores={helpmenu_time=44}] run title @a[team=blueTeam] title {"text":"1","bold":true,"color":"red"}

#Populate Island
execute if entity @s[scores={helpmenu_time=6}] run function skyisland:teams/blue/populate

#Other Player settigns for SkyAdventure
execute if entity @s[scores={helpmenu_time=12}] run recipe give @a[team=blueTeam] *
execute if entity @s[scores={helpmenu_time=20}] run recipe take @a[team=blueTeam] *
execute if entity @s[scores={helpmenu_time=22}] run clear @a[team=blueTeam]
execute if entity @s[scores={helpmenu_time=30}] run effect clear @a[team=blueTeam]
execute if entity @s[scores={helpmenu_time=38}] run advancement revoke @a[team=blueTeam] through minecraft:story/obtain_armor 
execute if entity @s[scores={helpmenu_time=48}] run advancement grant @a[team=blueTeam] only skyisland:root
execute if entity @s[scores={helpmenu_time=52}] as @a[team=blueTeam] run playsound minecraft:entity.illusioner.prepare_mirror master @s ~ ~ ~ 100

#Lets players Free
execute if entity @s[scores={helpmenu_time=52}] run title @a[team=blueTeam] title ["",{"text":"W","bold":true,"italic":true,"color":"gold"},{"text":"e","bold":true,"italic":true,"color":"light_purple"},{"text":"l","bold":true,"italic":true,"color":"aqua"},{"text":"c","bold":true,"italic":true,"color":"red"},{"text":"o","bold":true,"italic":true,"color":"yellow"},{"text":"m","bold":true,"italic":true,"color":"yellow"},{"text":"e","bold":true,"italic":true,"color":"yellow"},{"text":" to ","bold":true,"italic":true},{"text":"S","bold":true,"italic":true,"color":"gold"},{"text":"K","bold":true,"italic":true,"color":"gray"},{"text":"Y","bold":true,"italic":true,"color":"light_purple"},{"text":"V","bold":true,"italic":true,"color":"aqua"},{"text":"I","bold":true,"italic":true,"color":"red"},{"text":"V","bold":true,"italic":true,"color":"yellow"},{"text":"A","bold":true,"italic":true,"color":"green"},{"text":"L","bold":true,"italic":true,"color":"blue"}]
execute if entity @s[scores={helpmenu_time=52}] run title @a[team=blueTeam] subtitle ["",{"text":"Don't ","bold":true,"color":"dark_aqua"},{"text":"die","bold":true,"color":"red"},{"text":" too much... ","bold":true,"color":"dark_aqua"},{"text":"xD","bold":true,"color":"gold"}]
execute if entity @s[scores={helpmenu_time=52}] at @e[type=minecraft:armor_stand,tag=blueTeamSpawn,limit=1] run function skyisland:breakcoalbox
