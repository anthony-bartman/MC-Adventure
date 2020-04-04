
#--------------------
#Click "START MAP" in chat
#--------------------
#Once player is teleported to teamSPawn
execute if entity @a[team=spTeam,tag=sp4,scores={check=0}] run scoreboard players add @a[team=spTeam,tag=sp4] time 0
execute if entity @a[team=spTeam,tag=sp4,scores={check=0}] run scoreboard players enable @a[team=spTeam,tag=sp4] check
#Once all players have left the lobby, start map population
execute if entity @a[team=spTeam,tag=sp4,scores={check=1}] run summon minecraft:armor_stand 207 174 -373 {Tags:["sp4Cen"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
execute if entity @a[team=spTeam,tag=sp4,scores={check=1}] at @e[tag=sp4Cen] run summon minecraft:armor_stand ~-16 ~57 ~55 {Tags:["sp4Spawn"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
#Add one to check so no infinite spawn of armor stands above
execute if entity @a[team=spTeam,tag=sp4,scores={check=1}] run scoreboard players add @a[team=spTeam,tag=sp4] check 1

execute if entity @a[team=spTeam,tag=sp4,scores={check=2,time=0..}] run function skyisland:sp4/start_box
#STARTS SKY ISLAND MAIN METHOD
execute if entity @a[team=spTeam,tag=sp4,scores={time=-1}] run scoreboard players set @e[tag=sp4Cen] mapProgress 0
#Resets counters and check
execute if entity @a[team=aquaTeam,scores={time=-1}] run scoreboard players set aquaAfter check 1
execute if entity @a[team=spTeam,tag=sp4,scores={time=-1}] run scoreboard players reset @a[team=spTeam,tag=sp4] check
execute if entity @a[team=spTeam,tag=sp4,scores={time=-1}] run scoreboard players reset @a[team=spTeam,tag=sp4] time





