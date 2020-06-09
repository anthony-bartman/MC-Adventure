#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-16-20
# Desc: This will teleport players back home :)
#--------------------------------------


#Teleport the player to the island, based on their team
execute as @s[tag=ocean,team=aquaTeam] run function skyisland:teams/aqua/tpsky
execute as @s[tag=ocean,team=blackTeam] run function skyisland:teams/black/tpsky
execute as @s[tag=ocean,team=blueTeam] run function skyisland:teams/blue/tpsky
execute as @s[tag=ocean,team=cobaltTeam] run function skyisland:teams/cobalt/tpsky
execute as @s[tag=ocean,team=crimsonTeam] run function skyisland:teams/crimson/tpsky
execute as @s[tag=ocean,team=cyanTeam] run function skyisland:teams/cyan/tpsky
execute as @s[tag=ocean,team=goldTeam] run function skyisland:teams/gold/tpsky
execute as @s[tag=ocean,team=greenTeam] run function skyisland:teams/green/tpsky
execute as @s[tag=ocean,team=ivyTeam] run function skyisland:teams/ivy/tpsky
execute as @s[tag=ocean,team=magentaTeam] run function skyisland:teams/magenta/tpsky
execute as @s[tag=ocean,team=purpleTeam] run function skyisland:teams/purple/tpsky
execute as @s[tag=ocean,team=redTeam] run function skyisland:teams/red/tpsky
execute as @s[tag=ocean,team=yellowTeam] run function skyisland:teams/yellow/tpsky

#Resets player's score
scoreboard players reset @s tpCoinRC

