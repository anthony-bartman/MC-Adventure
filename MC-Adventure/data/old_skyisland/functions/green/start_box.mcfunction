#Green Team
scoreboard players add @a[team=greenTeam,tag=head] time 1
execute if entity @a[team=greenTeam,tag=head,scores={time=40}] run title @a[team=greenTeam] title {"text":"Populating Island...","bold":true,"color":"dark_aqua"}
execute if entity @a[team=greenTeam,tag=head,scores={time=100}] run title @a[team=greenTeam] title {"text":"Beginning Map In...","bold":true,"italic":true,"color":"light_purple"}
execute if entity @a[team=greenTeam,tag=head,scores={time=140}] run title @a[team=greenTeam] title {"text":"3","bold":true,"color":"green"}
execute if entity @a[team=greenTeam,tag=head,scores={time=180}] run title @a[team=greenTeam] title {"text":"2","bold":true,"color":"yellow"}
execute if entity @a[team=greenTeam,tag=head,scores={time=220}] run title @a[team=greenTeam] title {"text":"1","bold":true,"color":"red"}

#Populate Island
execute if entity @a[team=greenTeam,tag=head,scores={time=45}] run function skyisland:green/populate 
execute if entity @a[team=greenTeam,tag=head,scores={time=45}] run recipe give @a[team=greenTeam] *
execute if entity @a[team=greenTeam,tag=head,scores={time=60}] run recipe take @a[team=greenTeam] *
execute if entity @a[team=greenTeam,tag=head,scores={time=60}] run title @a[team=greenTeam] reset
execute if entity @a[team=greenTeam,tag=head,scores={time=60}] run clear @a[team=greenTeam]
execute if entity @a[team=greenTeam,tag=head,scores={time=260}] run title @a[team=greenTeam] title ["",{"text":"W","bold":true,"italic":true,"color":"gold"},{"text":"e","bold":true,"italic":true,"color":"light_purple"},{"text":"l","bold":true,"italic":true,"color":"aqua"},{"text":"c","bold":true,"italic":true,"color":"red"},{"text":"o","bold":true,"italic":true,"color":"yellow"},{"text":"m","bold":true,"italic":true,"color":"yellow"},{"text":"e","bold":true,"italic":true,"color":"yellow"},{"text":" to ","bold":true,"italic":true},{"text":"S","bold":true,"italic":true,"color":"gold"},{"text":"K","bold":true,"italic":true,"color":"gray"},{"text":"Y","bold":true,"italic":true,"color":"light_purple"},{"text":"V","bold":true,"italic":true,"color":"aqua"},{"text":"I","bold":true,"italic":true,"color":"red"},{"text":"V","bold":true,"italic":true,"color":"yellow"},{"text":"A","bold":true,"italic":true,"color":"green"},{"text":"L","bold":true,"italic":true,"color":"blue"}]
execute if entity @a[team=greenTeam,tag=head,scores={time=260}] run title @a[team=greenTeam] subtitle ["",{"text":"Don't ","bold":true,"color":"dark_aqua"},{"text":"die","bold":true,"color":"red"},{"text":" too much... ","bold":true,"color":"dark_aqua"},{"text":"xD","bold":true,"color":"gold"}]
execute if entity @a[team=greenTeam,tag=head,scores={time=260}] run spawnpoint @a[team=greenTeam] 393 172 120
execute if entity @a[team=greenTeam,tag=head,scores={time=260}] run advancement grant @a[team=greenTeam] only skyisland:root
execute if entity @a[team=greenTeam,tag=head,scores={time=260}] as @a[team=greenTeam] run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 100
execute if entity @a[team=greenTeam,tag=head,scores={time=5}] run scoreboard objectives setdisplay sidebar.team.green
execute if entity @a[team=greenTeam,tag=head,scores={time=5}] run scoreboard players set @a[team=greenTeam] survivalOn 0
execute if entity @a[team=greenTeam,tag=head,scores={time=260}] run effect clear @a[team=greenTeam]
execute if entity @a[team=greenTeam,tag=head,scores={time=260}] run team modify greenTeam friendlyFire true
#Lets players Free
#execute if entity @a[team=greenTeam,tag=head,scores={time=260}] at @e[tag=greenTeamSpawn] run fill ~-1 ~-1 ~-1 ~2 ~2 ~2 air
#Reset Timer
execute if entity @a[team=greenTeam,tag=head,scores={time=260}] run scoreboard players set @a[team=greenTeam,tag=head] time -1