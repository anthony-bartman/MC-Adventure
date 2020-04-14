#This function will delete and recreate all scoreboard functions used in this map

#------------------------
#Skyisland Scoreboards
#------------------------
#Remove
scoreboard objectives remove deathCounter
scoreboard objectives remove TPaltar
scoreboard objectives remove raidControl
scoreboard objectives remove slimeCounter
scoreboard objectives remove mapProgress
scoreboard objectives remove time
scoreboard objectives remove survivalOn
scoreboard objectives remove check
scoreboard objectives remove help
scoreboard objectives remove helpmenu_time
scoreboard objectives remove skyvivalKeys

#Add
scoreboard objectives add deathCounter deathCount {"text":"Death Counter"}
scoreboard objectives add TPaltar dummy {"text":"TPaltar"}
scoreboard objectives add raidControl dummy {"text":"Raid Control"}
scoreboard objectives add slimeCounter dummy {"text":"Slime Counter"}
scoreboard objectives add mapProgress dummy {"text":"Map Progress"}
scoreboard objectives add time dummy {"text":"Time"}
scoreboard objectives add survivalOn dummy {"text":"Survival On?"}
scoreboard objectives add check trigger {"text":"Skyisland Check?"}
scoreboard objectives add help trigger {"text":"Help Menu"}
scoreboard objectives add helpmenu_time dummy {"text":"Help Menu WaitTime"}
scoreboard objectives add skyvivalKeys dummy {"text":"Num Keys Spawned"}

#SetDisplays
scoreboard objectives setdisplay list deathCounter

#------------------------
#Main Island Scoreboards
#------------------------
#Remove
scoreboard objectives remove witchPotion
scoreboard objectives remove bossAltarCount
scoreboard objectives remove bossSpawn

#Add
scoreboard objectives add witchPotion dummy {"text":"Witch Potion"}
scoreboard objectives add bossAltarCount dummy {"text":"Num Altars Activated"}
scoreboard objectives add bossSpawn dummy {"text":"Bosses Spawned?"}
