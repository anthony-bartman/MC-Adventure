#This function will spawn in custom mobs on sky island

#Phantoms
execute at @e[tag=!phantom,type=minecraft:phantom,distance=..80] run summon minecraft:phantom ^ ^ ^ {Tags:["phantom"],HandItems:[{id:"minecraft:stone_sword",Count:1b,tag:{Enchantments:[{id:"minecraft:knockback",lvl:10}]}},{}],HandDropChances:[0.0F,0.85F],ActiveEffects:[{Id:1b,Amplifier:5b,Duration:4000,ShowParticles:1b}]}
execute at @e[tag=!phantom,type=minecraft:phantom,distance=..80] run teleport @e[tag=!phantom,type=minecraft:phantom] ~ -1 ~

#Magma Cubes
execute at @e[type=enderman,distance=..80] run summon minecraft:magma_cube ^ ^ ^ {Size:4}
execute at @e[type=enderman,distance=..80] run teleport @e[type=enderman] ~ -1 ~

#Vindicators
execute at @e[type=zombie_villager,distance=..80] run summon minecraft:vindicator ^ ^ ^ {Tags:["NotRaid"]}
execute at @e[type=zombie_villager,distance=..80] run teleport @e[type=zombie_villager] ~ -1 ~
