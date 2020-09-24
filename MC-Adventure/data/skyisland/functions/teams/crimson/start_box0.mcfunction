#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will allow the players to break coal box and populate their skyisland
#--------------------------------------
#Tell players what is happening
execute if entity @s[scores={helpmenu_time=80..81}] run summon minecraft:armor_stand 207 174 -373 {Tags:["crimsonTeamCen"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
execute if entity @s[scores={helpmenu_time=160..161}] at @e[type=minecraft:armor_stand,tag=crimsonTeamCen,limit=1] run summon minecraft:armor_stand ~-16 ~57 ~55 {Tags:["crimsonTeamSpawn"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
execute if entity @s[scores={helpmenu_time=160}] run title @a[team=crimsonTeam] title {"text":"Populating Island...","bold":true,"color":"dark_aqua"}
execute if entity @s[scores={helpmenu_time=400}] run title @a[team=crimsonTeam] title {"text":"Beginning Map In...","bold":true,"italic":true,"color":"light_purple"}
execute if entity @s[scores={helpmenu_time=560}] run title @a[team=crimsonTeam] title {"text":"3","bold":true,"color":"green"}
execute if entity @s[scores={helpmenu_time=720}] run title @a[team=crimsonTeam] title {"text":"2","bold":true,"color":"yellow"}
execute if entity @s[scores={helpmenu_time=880}] run title @a[team=crimsonTeam] title {"text":"1","bold":true,"color":"red"}

#Populate Island
execute if entity @s[scores={helpmenu_time=120}] run function skyisland:teams/crimson/populate

#Other Player settigns for SkyAdventure
execute if entity @s[scores={helpmenu_time=240}] run recipe give @a[team=crimsonTeam] *
execute if entity @s[scores={helpmenu_time=400}] run recipe take @a[team=crimsonTeam] *
execute if entity @s[scores={helpmenu_time=440}] run clear @a[team=crimsonTeam]
execute if entity @s[scores={helpmenu_time=600}] run effect clear @a[team=crimsonTeam]
execute if entity @s[scores={helpmenu_time=760}] run advancement revoke @a[team=crimsonTeam] through minecraft:story/obtain_armor 
execute if entity @s[scores={helpmenu_time=960}] run advancement grant @a[team=crimsonTeam] only skyisland:root
execute if entity @s[scores={helpmenu_time=1040}] as @a[team=crimsonTeam] run playsound minecraft:entity.illusioner.prepare_mirror master @s ~ ~ ~ 100

#Lets players Free
execute if entity @s[scores={helpmenu_time=1040}] run title @a[team=crimsonTeam] title ["",{"text":"W","bold":true,"italic":true,"color":"gold"},{"text":"e","bold":true,"italic":true,"color":"light_purple"},{"text":"l","bold":true,"italic":true,"color":"aqua"},{"text":"c","bold":true,"italic":true,"color":"red"},{"text":"o","bold":true,"italic":true,"color":"yellow"},{"text":"m","bold":true,"italic":true,"color":"yellow"},{"text":"e","bold":true,"italic":true,"color":"yellow"},{"text":" to ","bold":true,"italic":true},{"text":"S","bold":true,"italic":true,"color":"gold"},{"text":"K","bold":true,"italic":true,"color":"gray"},{"text":"Y","bold":true,"italic":true,"color":"light_purple"},{"text":"V","bold":true,"italic":true,"color":"aqua"},{"text":"I","bold":true,"italic":true,"color":"red"},{"text":"V","bold":true,"italic":true,"color":"yellow"},{"text":"A","bold":true,"italic":true,"color":"green"},{"text":"L","bold":true,"italic":true,"color":"blue"}]
execute if entity @s[scores={helpmenu_time=1040}] run title @a[team=crimsonTeam] subtitle ["",{"text":"Don't ","bold":true,"color":"dark_aqua"},{"text":"die","bold":true,"color":"red"},{"text":" too much... ","bold":true,"color":"dark_aqua"},{"text":"xD","bold":true,"color":"gold"}]
execute if entity @s[scores={helpmenu_time=1040}] at @e[type=minecraft:armor_stand,tag=crimsonTeamSpawn,limit=1] run function skyisland:breakcoalbox
