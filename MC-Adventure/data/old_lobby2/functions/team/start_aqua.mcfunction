
#--------------------
#Click "START MAP" in chat
#--------------------
#Once player is teleported to teamSPawn
execute if entity @a[team=aquaTeam,tag=head,scores={check=0}] run scoreboard players add @a[team=aquaTeam,tag=head] time 0
execute if entity @a[team=aquaTeam,tag=head,scores={check=0}] run scoreboard players enable @a[team=aquaTeam,tag=head] check

#Once all players have left the lobby, start map population
# execute if entity @a[team=aquaTeam,tag=head,scores={check=1}] run summon minecraft:armor_stand -190 149 367 {Tags:["aquaTeamCen"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
# execute if entity @a[team=aquaTeam,tag=head,scores={check=1}] at @e[tag=aquaTeamCen] run summon minecraft:armor_stand ~-16 ~57 ~55 {Tags:["aquaTeamSpawn"],Invisible:1,NoGravity:1,DisabledSlots:2039583,Marker:1}
#Add one to check so no infinite spawn of armor stands above
execute if entity @a[team=aquaTeam,tag=head,scores={check=1}] run scoreboard players add @a[team=aquaTeam,tag=head] check 1

execute if entity @a[team=aquaTeam,tag=head,scores={check=2,time=0..}] run function skyisland:aqua/start_box
#STARTS SKY ISLAND MAIN METHOD
execute if entity @a[team=aquaTeam,tag=head,scores={time=-1}] run scoreboard players set @e[tag=aquaTeamCen] mapProgress 0
#Resets counters and check
execute if entity @a[team=aquaTeam,tag=head,scores={time=-1}] run tag @a[team=aquaTeam,tag=head] remove head
execute if entity @a[team=aquaTeam,scores={time=-1}] run scoreboard players set aquaAfter check 1
execute if entity @a[team=aquaTeam,scores={time=-1}] run scoreboard players reset @a[team=aquaTeam] check
execute if entity @a[team=aquaTeam,scores={time=-1}] run scoreboard players reset @a[team=aquaTeam] time
