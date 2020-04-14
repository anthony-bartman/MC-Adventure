#This file will Set all permissions needed, unlock the coal box, and populate island

#Blue Team
execute if entity @a[team=blueTeam,tag=head,scores={time=0..}] run scoreboard players add @a[team=blueTeam,tag=head] time 1
execute if entity @a[team=blueTeam,tag=head,scores={time=40}] run title @a[team=blueTeam] title {"text":"Populating Island...","bold":true,"color":"dark_aqua"}
execute if entity @a[team=blueTeam,tag=head,scores={time=100}] run title @a[team=blueTeam] title {"text":"Beginning Map In...","bold":true,"italic":true,"color":"light_purple"}
execute if entity @a[team=blueTeam,tag=head,scores={time=140}] run title @a[team=blueTeam] title {"text":"3","bold":true,"color":"green"}
execute if entity @a[team=blueTeam,tag=head,scores={time=180}] run title @a[team=blueTeam] title {"text":"2","bold":true,"color":"yellow"}
execute if entity @a[team=blueTeam,tag=head,scores={time=220}] run title @a[team=blueTeam] title {"text":"1","bold":true,"color":"red"}

#Populate Island
execute if entity @a[team=blueTeam,tag=head,scores={time=45}] run function skyisland:blue/populate 
execute if entity @a[team=blueTeam,tag=head,scores={time=45}] run recipe give @a[team=blueTeam] *
execute if entity @a[team=blueTeam,tag=head,scores={time=60}] run recipe take @a[team=blueTeam] *
execute if entity @a[team=blueTeam,tag=head,scores={time=60}] run title @a[team=blueTeam] reset
execute if entity @a[team=blueTeam,tag=head,scores={time=60}] run clear @a[team=blueTeam]
execute if entity @a[team=blueTeam,tag=head,scores={time=260}] run title @a[team=blueTeam] title ["",{"text":"W","bold":true,"italic":true,"color":"gold"},{"text":"e","bold":true,"italic":true,"color":"light_purple"},{"text":"l","bold":true,"italic":true,"color":"aqua"},{"text":"c","bold":true,"italic":true,"color":"red"},{"text":"o","bold":true,"italic":true,"color":"yellow"},{"text":"m","bold":true,"italic":true,"color":"yellow"},{"text":"e","bold":true,"italic":true,"color":"yellow"},{"text":" to ","bold":true,"italic":true},{"text":"S","bold":true,"italic":true,"color":"gold"},{"text":"K","bold":true,"italic":true,"color":"gray"},{"text":"Y","bold":true,"italic":true,"color":"light_purple"},{"text":"V","bold":true,"italic":true,"color":"aqua"},{"text":"I","bold":true,"italic":true,"color":"red"},{"text":"V","bold":true,"italic":true,"color":"yellow"},{"text":"A","bold":true,"italic":true,"color":"green"},{"text":"L","bold":true,"italic":true,"color":"blue"}]
execute if entity @a[team=blueTeam,tag=head,scores={time=260}] run title @a[team=blueTeam] subtitle ["",{"text":"Don't ","bold":true,"color":"dark_aqua"},{"text":"die","bold":true,"color":"red"},{"text":" too much... ","bold":true,"color":"dark_aqua"},{"text":"xD","bold":true,"color":"gold"}]
execute if entity @a[team=blueTeam,tag=head,scores={time=260}] run spawnpoint @a[team=blueTeam] 293 174 282
execute if entity @a[team=blueTeam,tag=head,scores={time=260}] run advancement grant @a[team=blueTeam] only skyisland:root
execute if entity @a[team=blueTeam,tag=head,scores={time=260}] as @a[team=blueTeam] run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 100
execute if entity @a[team=blueTeam,tag=head,scores={time=5}] run scoreboard objectives setdisplay sidebar.team.blue
execute if entity @a[team=blueTeam,tag=head,scores={time=5}] run scoreboard players set @a[team=blueTeam] survivalOn 0
execute if entity @a[team=blueTeam,tag=head,scores={time=260}] run effect clear @a[team=blueTeam]
execute if entity @a[team=blueTeam,tag=head,scores={time=260}] run team modify blueTeam friendlyFire true
#Lets players Free
execute if entity @a[team=blueTeam,tag=head,scores={time=260}] at @e[tag=blueTeamSpawn] run function skyisland:breakcoalbox
#Reset Timer
execute if entity @a[team=blueTeam,tag=head,scores={time=260}] run scoreboard players set @a[team=blueTeam,tag=head] time -1
