#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will create all scoreboards needed for the skyisland adventure
#--------------------------------------

#Skyisland Scoreboards
scoreboard objectives add skyAltars dummy {"text":"Skyisland Altars"}
scoreboard objectives add raidControl dummy {"text":"Raid Control"}
scoreboard objectives add mapProgress trigger {"text":"Map Progress"}
scoreboard objectives add help trigger {"text":"Help Menu"}
scoreboard objectives add helpmenu_time dummy {"text":"Help Menu WaitTime"}

#Set up Main Methods for Teams If they are Enabled
execute if score aquaTeam enabledTeams matches 1 run scoreboard players set aquaMP mapProgress -1
execute if score blackTeam enabledTeams matches 1 run scoreboard players set blackMP mapProgress -1
execute if score blueTeam enabledTeams matches 1 run scoreboard players set blueMP mapProgress -1
execute if score cobaltTeam enabledTeams matches 1 run scoreboard players set cobaltMP mapProgress -1
execute if score crimsonTeam enabledTeams matches 1 run scoreboard players set crimsonMP mapProgress -1
execute if score cyanTeam enabledTeams matches 1 run scoreboard players set cyanMP mapProgress -1
execute if score goldTeam enabledTeams matches 1 run scoreboard players set goldMP mapProgress -1
execute if score greenTeam enabledTeams matches 1 run scoreboard players set greenMP mapProgress -1
execute if score ivyTeam enabledTeams matches 1 run scoreboard players set ivyMP mapProgress -1
execute if score magentaTeam enabledTeams matches 1 run scoreboard players set magentaMP mapProgress -1
execute if score purpleTeam enabledTeams matches 1 run scoreboard players set purpleMP mapProgress -1
execute if score redTeam enabledTeams matches 1 run scoreboard players set redMP mapProgress -1
execute if score yellowTeam enabledTeams matches 1 run scoreboard players set yellowMP mapProgress -1


