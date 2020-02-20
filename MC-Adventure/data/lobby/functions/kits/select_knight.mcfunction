#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-12-20
# Desc: This will give players the knight kit when selected from book
#--------------------------------------

#Clear Inventory and Get book back
clear @s
execute as @s run function lobby:kits/selection_book

#Enables Player to make a different selection
scoreboard players enable @s chooseKit

#Things to make knight
title @s actionbar [{"text":"Selected: ","color":"yellow","bold":true},{"text":"Knight Kit","color":"green","bold":true,"italic":true}]
execute as @s run function lobby:kits/get_knight

#Sets score to 2 to say knight
scoreboard players set @s chooseKit 2
