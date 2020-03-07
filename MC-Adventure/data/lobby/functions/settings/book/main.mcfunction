#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will handle the lobby Settings Book
#--------------------------------------


#First Page
execute if entity @s[scores={book=1}] run function lobby:settings/book/difficulty_easy
execute if entity @s[scores={book=2}] run function lobby:settings/book/difficulty_medium
execute if entity @s[scores={book=3}] run function lobby:settings/book/difficulty_hard
execute if entity @s[scores={book=4}] run function lobby:settings/book/unlock_team
execute if entity @s[scores={book=5}] run function lobby:settings/book/lock_team
execute if entity @s[scores={book=6}] run function lobby:settings/book/randomize
execute if entity @s[scores={book=7}] run function lobby:settings/book/reset
execute if entity @s[scores={book=8}] run function lobby:settings/book/enable_particles
execute if entity @s[scores={book=9}] run function lobby:settings/book/disable_particles
execute if entity @s[scores={book=10}] run function lobby:settings/book/enable_kits
execute if entity @s[scores={book=11}] run function lobby:settings/book/disable_kits
execute if entity @s[scores={book=12}] run function lobby:settings/book/loop_noloop
execute if entity @s[scores={book=13}] run function lobby:settings/book/loop_slower
execute if entity @s[scores={book=14}] run function lobby:settings/book/loop_slow
execute if entity @s[scores={book=15}] run function lobby:settings/book/loop_normal
execute if entity @s[scores={book=16}] run function lobby:settings/book/spectchunks_enable
execute if entity @s[scores={book=17}] run function lobby:settings/book/spectchunks_disable

execute if entity @s[scores={book=25}] run function lobby:settings/book/begin

#More Team Settings
#Changing Max Player Count
execute if entity @s[scores={book=30}] run function lobby:teams/gold/add_player
execute if entity @s[scores={book=31}] run function lobby:teams/gold/remove_player
execute if entity @s[scores={book=32}] run function lobby:teams/purple/add_player
execute if entity @s[scores={book=33}] run function lobby:teams/purple/remove_player
execute if entity @s[scores={book=34}] run function lobby:teams/green/add_player
execute if entity @s[scores={book=35}] run function lobby:teams/green/remove_player
execute if entity @s[scores={book=36}] run function lobby:teams/aqua/add_player
execute if entity @s[scores={book=37}] run function lobby:teams/aqua/remove_player
execute if entity @s[scores={book=38}] run function lobby:teams/red/add_player
execute if entity @s[scores={book=39}] run function lobby:teams/red/remove_player
execute if entity @s[scores={book=40}] run function lobby:teams/yellow/add_player
execute if entity @s[scores={book=41}] run function lobby:teams/yellow/remove_player
execute if entity @s[scores={book=42}] run function lobby:teams/blue/add_player
execute if entity @s[scores={book=43}] run function lobby:teams/blue/remove_player
execute if entity @s[scores={book=44}] run function lobby:teams/black/add_player
execute if entity @s[scores={book=45}] run function lobby:teams/black/remove_player
execute if entity @s[scores={book=46}] run function lobby:teams/cyan/add_player
execute if entity @s[scores={book=47}] run function lobby:teams/cyan/remove_player
execute if entity @s[scores={book=48}] run function lobby:teams/magenta/add_player
execute if entity @s[scores={book=49}] run function lobby:teams/magenta/remove_player
execute if entity @s[scores={book=50}] run function lobby:teams/silver/add_player
execute if entity @s[scores={book=51}] run function lobby:teams/silver/remove_player
execute if entity @s[scores={book=52}] run function lobby:teams/crimson/add_player
execute if entity @s[scores={book=53}] run function lobby:teams/crimson/remove_player
execute if entity @s[scores={book=54}] run function lobby:teams/cobalt/add_player
execute if entity @s[scores={book=55}] run function lobby:teams/cobalt/remove_player
execute if entity @s[scores={book=56}] run function lobby:teams/ivy/add_player
execute if entity @s[scores={book=57}] run function lobby:teams/ivy/remove_player
execute if entity @s[scores={book=58}] run function lobby:teams/opal/add_player
execute if entity @s[scores={book=59}] run function lobby:teams/opal/remove_player
#Changes to all teams...
execute if entity @s[scores={book=60}] run function lobby:teams/add_all_player
execute if entity @s[scores={book=61}] run function lobby:teams/remove_all_player
execute if entity @s[scores={book=62}] run function lobby:teams/reset_maxplayers
#Enabling or Disabling Teams
execute if entity @s[scores={book=110}] run function lobby:teams/gold/enable
execute if entity @s[scores={book=111}] run function lobby:teams/gold/disable
execute if entity @s[scores={book=112}] run function lobby:teams/purple/enable
execute if entity @s[scores={book=113}] run function lobby:teams/purple/disable
execute if entity @s[scores={book=114}] run function lobby:teams/green/enable
execute if entity @s[scores={book=115}] run function lobby:teams/green/disable
execute if entity @s[scores={book=116}] run function lobby:teams/aqua/enable
execute if entity @s[scores={book=117}] run function lobby:teams/aqua/disable
execute if entity @s[scores={book=118}] run function lobby:teams/red/enable
execute if entity @s[scores={book=119}] run function lobby:teams/red/disable
execute if entity @s[scores={book=120}] run function lobby:teams/yellow/enable
execute if entity @s[scores={book=121}] run function lobby:teams/yellow/disable
execute if entity @s[scores={book=122}] run function lobby:teams/blue/enable
execute if entity @s[scores={book=123}] run function lobby:teams/blue/disable
execute if entity @s[scores={book=124}] run function lobby:teams/black/enable
execute if entity @s[scores={book=125}] run function lobby:teams/black/disable
execute if entity @s[scores={book=126}] run function lobby:teams/cyan/enable
execute if entity @s[scores={book=127}] run function lobby:teams/cyan/disable
execute if entity @s[scores={book=128}] run function lobby:teams/magenta/enable
execute if entity @s[scores={book=129}] run function lobby:teams/magenta/disable
execute if entity @s[scores={book=130}] run function lobby:teams/silver/enable
execute if entity @s[scores={book=131}] run function lobby:teams/silver/disable
execute if entity @s[scores={book=132}] run function lobby:teams/crimson/enable
execute if entity @s[scores={book=133}] run function lobby:teams/crimson/disable
execute if entity @s[scores={book=134}] run function lobby:teams/cobalt/enable
execute if entity @s[scores={book=135}] run function lobby:teams/cobalt/disable
execute if entity @s[scores={book=136}] run function lobby:teams/ivy/enable
execute if entity @s[scores={book=137}] run function lobby:teams/ivy/disable
execute if entity @s[scores={book=138}] run function lobby:teams/opal/enable
execute if entity @s[scores={book=139}] run function lobby:teams/opal/disable