#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will allow the players to break coal box and populate their skyisland
#--------------------------------------
#Tell players what is happening
execute if entity @s[scores={helpmenu_time=20..21}] run summon minecraft:armor_stand 348 164 -242 {Tags:["cyanTeamCen"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
execute if entity @s[scores={helpmenu_time=40..41}] at @e[type=minecraft:armor_stand,tag=cyanTeamCen,limit=1] run summon minecraft:armor_stand ~-16 ~57 ~55 {Tags:["cyanTeamSpawn"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
execute if entity @s[scores={helpmenu_time=40}] run title @a[team=cyanTeam] title {"text":"Populating Island...","bold":true,"color":"dark_aqua"}
execute if entity @s[scores={helpmenu_time=100}] run title @a[team=cyanTeam] title {"text":"Beginning Map In...","bold":true,"italic":true,"color":"light_purple"}
execute if entity @s[scores={helpmenu_time=140}] run title @a[team=cyanTeam] title {"text":"3","bold":true,"color":"green"}
execute if entity @s[scores={helpmenu_time=180}] run title @a[team=cyanTeam] title {"text":"2","bold":true,"color":"yellow"}
execute if entity @s[scores={helpmenu_time=220}] run title @a[team=cyanTeam] title {"text":"1","bold":true,"color":"red"}

#Populate Island
execute if entity @s[scores={helpmenu_time=30}] run function skyisland:teams/cyan/populate

#Other Player settigns for SkyAdventure
execute if entity @s[scores={helpmenu_time=60}] run recipe give @a[team=cyanTeam] *
execute if entity @s[scores={helpmenu_time=100}] run recipe take @a[team=cyanTeam] *
execute if entity @s[scores={helpmenu_time=110}] run clear @a[team=cyanTeam]
execute if entity @s[scores={helpmenu_time=150}] run effect clear @a[team=cyanTeam]
execute if entity @s[scores={helpmenu_time=190}] run advancement revoke @a[team=cyanTeam] through minecraft:story/obtain_armor 
execute if entity @s[scores={helpmenu_time=240}] run advancement grant @a[team=cyanTeam] only skyisland:root
execute if entity @s[scores={helpmenu_time=260}] as @a[team=cyanTeam] run playsound minecraft:entity.illusioner.prepare_mirror master @s ~ ~ ~ 100

#Lets players Free
execute if entity @s[scores={helpmenu_time=260}] run title @a[team=cyanTeam] title ["",{"text":"W","bold":true,"italic":true,"color":"gold"},{"text":"e","bold":true,"italic":true,"color":"light_purple"},{"text":"l","bold":true,"italic":true,"color":"aqua"},{"text":"c","bold":true,"italic":true,"color":"red"},{"text":"o","bold":true,"italic":true,"color":"yellow"},{"text":"m","bold":true,"italic":true,"color":"yellow"},{"text":"e","bold":true,"italic":true,"color":"yellow"},{"text":" to ","bold":true,"italic":true},{"text":"S","bold":true,"italic":true,"color":"gold"},{"text":"K","bold":true,"italic":true,"color":"gray"},{"text":"Y","bold":true,"italic":true,"color":"light_purple"},{"text":"V","bold":true,"italic":true,"color":"aqua"},{"text":"I","bold":true,"italic":true,"color":"red"},{"text":"V","bold":true,"italic":true,"color":"yellow"},{"text":"A","bold":true,"italic":true,"color":"green"},{"text":"L","bold":true,"italic":true,"color":"blue"}]
execute if entity @s[scores={helpmenu_time=260}] run title @a[team=cyanTeam] subtitle ["",{"text":"Don't ","bold":true,"color":"dark_aqua"},{"text":"die","bold":true,"color":"red"},{"text":" too much... ","bold":true,"color":"dark_aqua"},{"text":"xD","bold":true,"color":"gold"}]
execute if entity @s[scores={helpmenu_time=260}] at @e[type=minecraft:armor_stand,tag=cyanTeamSpawn,limit=1] run function skyisland:breakcoalbox
