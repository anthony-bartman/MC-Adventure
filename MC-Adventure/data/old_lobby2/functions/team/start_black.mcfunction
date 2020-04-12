
#--------------------
#Click "START MAP" in chat
#--------------------
#Once player is teleported to teamSPawn
execute if entity @a[team=blackTeam,tag=head,scores={check=0}] run scoreboard players add @a[team=blackTeam,tag=head] time 0
execute if entity @a[team=blackTeam,tag=head,scores={check=0}] run scoreboard players enable @a[team=blackTeam,tag=head] check

#Once all players have left the lobby, start map population
# execute if entity @a[team=blackTeam,tag=head,scores={check=1}] run summon minecraft:armor_stand -382 152 24 {Tags:["blackTeamCen"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
# execute if entity @a[team=blackTeam,tag=head,scores={check=1}] at @e[tag=blackTeamCen] run summon minecraft:armor_stand ~-16 ~57 ~55 {Tags:["blackTeamSpawn"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
#Add one to check so no infinite spawn of armor stands above
execute if entity @a[team=blackTeam,tag=head,scores={check=1}] run scoreboard players add @a[team=blackTeam,tag=head] check 1

execute if entity @a[team=blackTeam,tag=head,scores={check=2,time=0..}] run function skyisland:black/start_box
#STARTS SKY ISLAND MAIN METHOD
execute if entity @a[team=blackTeam,tag=head,scores={time=-1}] run scoreboard players set @e[tag=blackTeamCen] mapProgress 0
#Resets counters and check
execute if entity @a[team=blackTeam,tag=head,scores={time=-1}] run tag @a[team=blackTeam,tag=head] remove head
execute if entity @a[team=blackTeam,scores={time=-1}] run scoreboard players set blackAfter check 1
execute if entity @a[team=blackTeam,scores={time=-1}] run scoreboard players reset @a[team=blackTeam] check
execute if entity @a[team=blackTeam,scores={time=-1}] run scoreboard players reset @a[team=blackTeam] time



