
#--------------------
#Click "START MAP" in chat
#--------------------
#Once player is teleported to teamSPawn
execute if entity @a[team=spTeam,tag=sp6,scores={check=0}] run scoreboard players add @a[team=spTeam,tag=sp6] time 0
execute if entity @a[team=spTeam,tag=sp6,scores={check=0}] run scoreboard players enable @a[team=spTeam,tag=sp6] check
#Once all players have left the lobby, start map population
execute if entity @a[team=spTeam,tag=sp6,scores={check=1}] run summon minecraft:armor_stand -206 171 -356 {Tags:["sp6Cen"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
execute if entity @a[team=spTeam,tag=sp6,scores={check=1}] at @e[tag=sp6Cen] run summon minecraft:armor_stand ~-16 ~57 ~55 {Tags:["sp6Spawn"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
#Add one to check so no infinite spawn of armor stands above
execute if entity @a[team=spTeam,tag=sp6,scores={check=1}] run scoreboard players add @a[team=spTeam,tag=sp6] check 1

execute if entity @a[team=spTeam,tag=sp6,scores={check=2,time=0..}] run function skyisland:sp6/start_box
#STARTS SKY ISLAND MAIN METHOD
execute if entity @a[team=spTeam,tag=sp6,scores={time=-1}] run scoreboard players set @e[tag=sp6Cen] mapProgress 0
#Resets counters and check
execute if entity @a[team=spTeam,scores={time=-1}] run scoreboard players set spAfter check 1
execute if entity @a[team=spTeam,tag=sp6,scores={time=-1}] run scoreboard players reset @a[team=spTeam,tag=sp6] check
execute if entity @a[team=spTeam,tag=sp6,scores={time=-1}] run scoreboard players reset @a[team=spTeam,tag=sp6] time





