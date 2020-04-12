#This file will check if the altar is setup correctly

#Checks if beacon is setup
execute if block ~ ~ ~ minecraft:beacon run scoreboard players add @s TPaltar 1
execute if block ~-1 ~-1 ~ minecraft:diamond_block run scoreboard players add @s TPaltar 1
execute if block ~1 ~-1 ~ minecraft:diamond_block run scoreboard players add @s TPaltar 1
execute if block ~ ~-1 ~-1 minecraft:diamond_block run scoreboard players add @s TPaltar 1
execute if block ~ ~-1 ~1 minecraft:diamond_block run scoreboard players add @s TPaltar 1

#Tells user Altar is activated
execute if score @s TPaltar matches 5 run title @a[distance=..75] title {"italics":true,"bold":true,"text":"Survival Mode","color":"green"}
execute if score @s TPaltar matches 5 run title @a[distance=..75] subtitle {"bold":true,"text":"Has Been Activated"}
execute if score @s TPaltar matches 5 run title @a[distance=75..] title [{"text":"Survival Mode","color":"green","italic":true},{"text":" Unlocked","color":"white","italic":false}]
execute if score @s TPaltar matches 5 run title @a[distance=75..] subtitle [{"text":"for ","color":"white"},{"selector":"@a[distance=..75]"}]
execute if score @s TPaltar matches 5 run tellraw @a[distance=..75] [{"text":"--------------------\n\n"},{"text":"     SURVIVAL MODE\n","color":"green","bold":true},{"text":"         UNLOCKED\n","color":"red","bold":true},{"text":"\n--------------------\n","color":"reset","bold":false},{"text":"     * WARNING *     \n","color":"red","bold":true,"italic":true},{"text":"If a team member falls into the void, they will die...\n","color":"gray","bold":false,"italic":true},{"text":"Your team will not be teleported to safety anymore!\n","color":"gray","bold":false,"italic":true},{"text":"Good Luck :)","color":"aqua","bold":true,"italic":false}]

#Fancy effects
execute if score @s TPaltar matches 5 run summon firework_rocket ~ ~ ~ {FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:3,Flicker:1b,Colors:[I;5898022],FadeColors:[I;16763760]},{Type:1,Flicker:1b,Colors:[I;16731635],FadeColors:[I;16777215]},{Type:2,Flicker:1b,Colors:[I;15859568],FadeColors:[I;6935295]}]}}}}
execute if score @s TPaltar matches 5 run summon minecraft:lightning_bolt ~ ~15 ~
execute if score @s TPaltar matches 5 run playsound minecraft:ui.toast.challenge_complete master @a[distance=..75] ~ ~ ~ 100
