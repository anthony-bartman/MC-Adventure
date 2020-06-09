#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This will handle all of the functions regarding the ocean Island
#--------------------------------------

#Holds data for tpCoin
#scoreboard objectives add tpCoinRC minecraft.used:minecraft.carrot_on_a_stick {"text":"tpCoin to Skyisland","color":"white","bold":true}


#BUGS,
# ++ Only want it to be used if players are in ocean... give them a tag in tpocean and remove in tpsky
#Waits for player to click it twice
execute as @a[team=!,scores={tpCoinRC=1..}] run function oceanisland:tpsky

