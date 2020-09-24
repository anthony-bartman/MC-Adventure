#Turn on altar sequence
execute if block ~2 ~ ~ minecraft:slime_block run scoreboard players add slimeScore slimeCounter 1
execute if block ~-2 ~ ~ minecraft:slime_block run scoreboard players add slimeScore slimeCounter 1
execute if block ~ ~ ~2 minecraft:slime_block run scoreboard players add slimeScore slimeCounter 1
execute if block ~ ~ ~-2 minecraft:slime_block run scoreboard players add slimeScore slimeCounter 1

scoreboard players reset @s slimeCounter