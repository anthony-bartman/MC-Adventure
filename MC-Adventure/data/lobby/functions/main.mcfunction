#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will run all main lobby functions before the beginning of the map
#--------------------------------------
#The /debug command is useful for measuring performance. Use /debug start to start the profiling, wait a while, then /debug stop to end.
#This produces a file in .minecraft\debug breaking down how long everything took to run. Kind of like the F3 pie-chart, but for the server rather than the client.

#Add a way for players to change kits... as of now players are able to choose kit after they join a team, and then it goes bye bye

#-------
#Step 0
#-------
#Lobby Loops
execute unless entity @a[tag=leader,nbt={Inventory:[{id:"minecraft:written_book"}]}] run replaceitem entity @a[tag=leader] hotbar.1 minecraft:written_book{Tags:["lobbyBook"],display:{Name:"{\"text\":\"Skyvival Pt2 Settings\",\"color\":\"gold\",\"bold\":\"true\"}",Lore:["Use This Book To Change Map Settings"]},HideFlags:1,Enchantments:[{id:"minecraft:protection",lvl:1}],title:"Skyvival Pt2 Settings",author:"Atraindabeast",generation:0,pages:["[{\"text\":\"Skyvival Settings:\\n\",\"color\":\"black\",\"bold\":\"true\",\"underlined\":\"true\"},{\"text\":\"\\nParticle Effects:\",\"color\":\"dark_aqua\",\"bold\":\"false\",\"underlined\":\"false\",\"hoverEvent\":{\"action\":\"show_text\",\"value\":\"Disable Or Enable Lobby Particles\"}},{\"text\":\"\\n      \",\"bold\":\"false\",\"underlined\":\"false\"},{\"text\":\"On\",\"color\":\"dark_green\",\"underlined\":\"false\",\"hoverEvent\":{\"action\":\"show_text\",\"value\":\"Click To Enable\"},\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger book set 1\"}},{\"text\":\"      \",\"bold\":\"false\",\"underlined\":\"false\"},{\"text\":\"Off\\n\",\"color\":\"red\",\"underlined\":\"false\",\"hoverEvent\":{\"action\":\"show_text\",\"value\":\"Click To Disable\"},\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger book set 2\"}},{\"text\":\"\\nTeam Joining:\",\"color\":\"dark_aqua\",\"bold\":\"false\",\"underlined\":\"false\",\"hoverEvent\":{\"action\":\"show_text\",\"value\":\"Enables Or Disables Players To Join Teams\"}},{\"text\":\"\\n      \",\"bold\":\"false\",\"underlined\":\"false\"},{\"text\":\"On\",\"color\":\"dark_green\",\"underlined\":\"false\",\"hoverEvent\":{\"action\":\"show_text\",\"value\":\"Click To Enable\"},\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger book set 3\"}},{\"text\":\"      \",\"bold\":\"false\",\"underlined\":\"false\"},{\"text\":\"Off\\n\",\"color\":\"red\",\"underlined\":\"false\",\"hoverEvent\":{\"action\":\"show_text\",\"value\":\"Click To Disable\"},\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger book set 4\"}},{\"text\":\"\\nTeam Settings:\",\"color\":\"dark_aqua\",\"bold\":\"false\",\"underlined\":\"false\",\"hoverEvent\":{\"action\":\"show_text\",\"value\":\"Randomize or Reset Teams\"}},{\"text\":\"\\n      \",\"bold\":\"false\",\"underlined\":\"false\"},{\"text\":\"Randomize\",\"color\":\"gold\",\"underlined\":\"false\",\"hoverEvent\":{\"action\":\"show_text\",\"value\":\"Click To Randomize\"},\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger book set 5\"}},{\"text\":\"\\n         \",\"bold\":\"false\",\"underlined\":\"false\"},{\"text\":\"Reset\",\"color\":\"light_purple\",\"bold\":\"true\",\"italic\":\"false\",\"underlined\":\"false\",\"hoverEvent\":{\"action\":\"show_text\",\"value\":\"Click to Reset Teams\"},\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger book set 6\"}},{\"text\":\"\\n   \",\"bold\":\"false\",\"italic\":\"false\",\"underlined\":\"false\"},{\"text\":\"\\n   Begin Skyvival\",\"color\":\"blue\",\"bold\":\"true\",\"italic\":\"true\",\"underlined\":\"false\",\"hoverEvent\":{\"action\":\"show_text\",\"value\":\"Click to Leave the Lobby and Go to Skyislands\"},\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger book set 7\"}}]"]} 1
execute at @a[tag=leader] run kill @e[type=item,distance=..3]

#Potion Effects in Lobby
execute if score lobbyProgress LP matches 0.. at @e[tag=mainLobby,limit=1] run effect give @a[distance=..100] minecraft:night_vision 2 10 true
execute if score lobbyProgress LP matches 0.. at @e[tag=mainLobby,limit=1] run effect give @a[distance=..100] minecraft:regeneration 2 50 true
execute if score lobbyProgress LP matches 0.. at @e[tag=mainLobby,limit=1] run effect give @a[distance=..100] minecraft:saturation 2 10 true


#-------
#Stage 1
#-------
#Team Joining
execute if score lobbyProgress LP matches 0..1 at @e[tag=goldTeamj,limit=1] as @a[distance=..2,team=!goldTeam] run function lobby:teams/gold/join
execute if score lobbyProgress LP matches 0..1 at @e[tag=purpleTeamj,limit=1] as @a[distance=..2,team=!purpleTeam] run function lobby:teams/purple/join


#Kit Selection
execute if score lobbyProgress LP matches 0..1 as @a[team=!,scores={chooseKit=1}] run function lobby:kits/select_knight
execute if score lobbyProgress LP matches 0..1 as @a[team=!,scores={chooseKit=3}] run function lobby:kits/select_archer
execute if score lobbyProgress LP matches 0..1 as @a[team=!,scores={chooseKit=5}] run function lobby:kits/select_heavy
execute if score lobbyProgress LP matches 0..1 as @a[team=!,scores={chooseKit=7}] run function lobby:kits/thing
execute if score lobbyProgress LP matches 0..1 as @a[team=!,scores={chooseKit=9}] run function lobby:kits/thing1
#Makes sure players cannot destroy their kit books and items
execute unless entity @a[team=!,scores={chooseKit=0..},nbt={Inventory:[{id:"minecraft:written_book"}]}] as @a[team=!,scores={chooseKit=0..}] run function lobby:kits/selection_book
execute unless entity @a[team=!,scores={chooseKit=2},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:golden_chestplate"},{Slot:7b,Count:1b,id:"minecraft:stone_sword"}]}] as @a[team=!,scores={chooseKit=2}] run function lobby:kits/get_knight
execute unless entity @a[team=!,scores={chooseKit=4},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:leather_chestplate"},{Slot:7b,Count:1b,id:"minecraft:bow"}]}] as @a[team=!,scores={chooseKit=4}] run function lobby:kits/get_archer
execute unless entity @a[team=!,scores={chooseKit=6},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"},{Slot:7b,Count:1b,id:"minecraft:wooden_sword"}]}] as @a[team=!,scores={chooseKit=6}] run function lobby:kits/get_heavy
execute if score lobbyProgress LP matches 0..1 at @a[team=!,scores={chooseKit=0..}] run kill @e[type=item,distance=..3]


#-------
#Stage 2
#-------
#Leader Starts Map


#Reselect Kits before teleporting to intro



#-------
#Stage 3a
#-------
#Introduction Sequence on how to play map


#Players select when to teleport



#-------
#Stage 3b
#-------
#Rejoin available teams after initial Sequence

