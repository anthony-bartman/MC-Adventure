#This file will teleport players to the main island 

#check if player has all of these options
recipe give @s *
advancement grant @s through skyisland:survival_key
advancement grant @s through skyisland:t4tools
advancement grant @s through skyisland:v3knowledge
scoreboard players set @s survivalOn 1

#Teleportation
effect give @s minecraft:slow_falling 15 1 true
effect give @s minecraft:blindness 10 10 true
teleport @s 0 275 0

#Teleport Altar Thing back 



