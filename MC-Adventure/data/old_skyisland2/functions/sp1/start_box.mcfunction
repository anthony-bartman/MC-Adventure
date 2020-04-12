#Singleplayer 1
execute if entity @a[tag=sp1,scores={time=0..}] run scoreboard players add @a[tag=sp1] time 1
execute if entity @a[tag=sp1,scores={time=40}] run title @a[tag=sp1] title {"text":"Populating Island...","bold":true,"color":"dark_aqua"}
execute if entity @a[tag=sp1,scores={time=100}] run title @a[tag=sp1] title {"text":"Beginning Map In...","bold":true,"italic":true,"color":"light_purple"}
execute if entity @a[tag=sp1,scores={time=140}] run title @a[tag=sp1] title {"text":"3","bold":true,"color":"green"}
execute if entity @a[tag=sp1,scores={time=180}] run title @a[tag=sp1] title {"text":"2","bold":true,"color":"yellow"}
execute if entity @a[tag=sp1,scores={time=220}] run title @a[tag=sp1] title {"text":"1","bold":true,"color":"red"}

#Populate Island
execute if entity @a[tag=sp1,scores={time=45}] run function skyisland:sp1/populate
execute if entity @a[tag=sp1,scores={time=45}] run recipe give @a[tag=sp1] *
execute if entity @a[tag=sp1,scores={time=60}] run recipe take @a[tag=sp1] *
execute if entity @a[tag=sp1,scores={time=60}] run title @a[tag=sp1] reset
execute if entity @a[tag=sp1,scores={time=60}] run clear @a[tag=sp1]
execute if entity @a[tag=sp1,scores={time=260}] run title @a[tag=sp1] title ["",{"text":"W","bold":true,"italic":true,"color":"gold"},{"text":"e","bold":true,"italic":true,"color":"light_purple"},{"text":"l","bold":true,"italic":true,"color":"aqua"},{"text":"c","bold":true,"italic":true,"color":"red"},{"text":"o","bold":true,"italic":true,"color":"yellow"},{"text":"m","bold":true,"italic":true,"color":"yellow"},{"text":"e","bold":true,"italic":true,"color":"yellow"},{"text":" to ","bold":true,"italic":true},{"text":"S","bold":true,"italic":true,"color":"gold"},{"text":"K","bold":true,"italic":true,"color":"gray"},{"text":"Y","bold":true,"italic":true,"color":"light_purple"},{"text":"V","bold":true,"italic":true,"color":"aqua"},{"text":"I","bold":true,"italic":true,"color":"red"},{"text":"V","bold":true,"italic":true,"color":"yellow"},{"text":"A","bold":true,"italic":true,"color":"green"},{"text":"L","bold":true,"italic":true,"color":"blue"}]
execute if entity @a[tag=sp1,scores={time=260}] run title @a[tag=sp1] subtitle ["",{"text":"Don't ","bold":true,"color":"dark_aqua"},{"text":"die","bold":true,"color":"red"},{"text":" too much... ","bold":true,"color":"dark_aqua"},{"text":"xD","bold":true,"color":"gold"}]
execute if entity @a[tag=sp1,scores={time=260}] run spawnpoint @a[tag=sp1] -340 151 -191
#The advancment will give the players all neccesary crafting recipies...
execute if entity @a[tag=sp1,scores={time=260}] run advancement grant @a[tag=sp1] only skyisland:root
execute if entity @a[tag=sp1,scores={time=255}] as @a[tag=sp1] run playsound minecraft:entity.ender_dragon.growl master @a[tag=sp1] ~ ~ ~ 100
execute if entity @a[tag=sp1,scores={time=5}] run scoreboard objectives setdisplay sidebar.team.white
execute if entity @a[tag=sp1,scores={time=5}] run scoreboard players set @a[tag=sp1] survivalOn 0
execute if entity @a[tag=sp1,scores={time=260}] run effect clear @a[tag=sp1]
execute if entity @a[tag=sp1,scores={time=260}] run team modify spTeam friendlyFire true
#Lets players Free
execute if entity @a[tag=sp1,scores={time=260}] at @e[tag=sp1Spawn] run function skyisland:breakcoalbox
#Reset Timer
execute if entity @a[tag=sp1,scores={time=260}] run scoreboard players set @a[tag=sp1] time -1
