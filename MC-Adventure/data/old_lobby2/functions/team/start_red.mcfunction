#This file will teleport all red team players to their respective island

#--------------------
#Click "START MAP" in chat
#--------------------
#Once player is teleported to teamSPawn
execute if entity @a[team=redTeam,tag=head,scores={check=0}] run scoreboard players add @a[team=redTeam,tag=head] time 0
execute if entity @a[team=redTeam,tag=head,scores={check=0}] run scoreboard players enable @a[team=redTeam,tag=head] check

#Once all players have left the lobby, start map population
# execute if entity @a[team=redTeam,tag=head,scores={check=1}] run summon minecraft:armor_stand -20 155 394 {Tags:["redTeamCen"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
# execute if entity @a[team=redTeam,tag=head,scores={check=1}] at @e[tag=redTeamCen] run summon minecraft:armor_stand ~-16 ~57 ~55 {Tags:["redTeamSpawn"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
#Add one to check so no infinite spawn of armor stands above
execute if entity @a[team=redTeam,tag=head,scores={check=1}] run scoreboard players add @a[team=redTeam,tag=head] check 1

execute if entity @a[team=redTeam,tag=head,scores={check=2,time=0..}] run function skyisland:red/start_box
#STARTS SKY ISLAND MAIN METHOD
execute if entity @a[team=redTeam,tag=head,scores={time=-1}] run scoreboard players set @e[tag=redTeamCen] mapProgress 0
#Resets counters and check
execute if entity @a[team=redTeam,tag=head,scores={time=-1}] run tag @a[team=redTeam,tag=head] remove head
execute if entity @a[team=redTeam,scores={time=-1}] run scoreboard players set redAfter check 1
execute if entity @a[team=redTeam,scores={time=-1}] run scoreboard players reset @a[team=redTeam] check
execute if entity @a[team=redTeam,scores={time=-1}] run scoreboard players reset @a[team=redTeam] time



