#This file will generate the loot in all of the loot chests around the sp3 team's skyisland

#DELETES any previous chests
function skyisland:sp3/loot/reset

#Populates all loot armorstands
function skyisland:sp3/loot/populate

#Total SkyIsland chests
# T1 : 33
# T2 : 34
# T3 : 10
#TOTAL CHESTS: 77

# TIER 1 CHESTS
#Limit, will hold how many chests to spawn in
execute as @e[sort=random,type=armor_stand,tag=sp3_cloud,limit=5] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=sp3_treetop,limit=3] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=sp3_tower,limit=4] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=sp3_surf,limit=6] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=sp3_moss,limit=4] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=sp3_vc,limit=3] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=sp3_volc,limit=3] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy

#Tier 2 Chests
execute as @e[sort=random,type=armor_stand,tag=sp3_c1,limit=3] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=sp3_bone,limit=6] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=sp3_r1,limit=6] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=sp3_r2,limit=6] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy

#Special chests... /Tier 3 chests
execute at @e[tag=sp3_cloudT2,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy
execute at @e[tag=sp3_cloudT3,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_loot"} destroy

execute at @e[tag=sp3_towerT1,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute at @e[tag=sp3_towerT2,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy

execute at @e[tag=sp3_surfT1,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy

execute at @e[tag=sp3_mossT2,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy

execute at @e[tag=sp3_volcT2,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy
execute at @e[tag=sp3_volcT3,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_loot"} destroy

execute at @e[tag=sp3_vcT1,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute at @e[tag=sp3_vcT2,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy

execute at @e[tag=sp3_c1T2,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy

execute at @e[tag=sp3_r1T2,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy
execute at @e[tag=sp3_r1T3,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_loot"} destroy

execute at @e[tag=sp3_r2T3,type=armor_stand,limit=3] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_loot"} destroy
execute at @e[tag=sp3_eT3,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_emerald"} destroy


execute at @e[tag=sp3_tpT3,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_loot"} destroy
execute at @e[tag=sp3_secret,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_ender_chest"} destroy
execute at @e[tag=sp3_spnT3,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_loot"} destroy

execute at @e[tag=sp3_towerS1,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute at @e[tag=sp3_towerS2,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy

#Kills all loot table armorstands for LAG purposes
kill @e[tag=sp3_cloud,distance=..150]
kill @e[tag=sp3_cloudT2,distance=..150]
kill @e[tag=sp3_cloudT3,distance=..150]
kill @e[tag=sp3_treetop,distance=..150]
kill @e[tag=sp3_tower,distance=..150]
kill @e[tag=sp3_towerT1,distance=..150]
kill @e[tag=sp3_towerT2,distance=..150]
kill @e[tag=sp3_surf,distance=..150]
kill @e[tag=sp3_surfT1,distance=..150]
kill @e[tag=sp3_moss,distance=..150]
kill @e[tag=sp3_mossT2,distance=..150]
kill @e[tag=sp3_volc,distance=..150]
kill @e[tag=sp3_volcT2,distance=..150]
kill @e[tag=sp3_volcT3,distance=..150]
kill @e[tag=sp3_vc,distance=..150]
kill @e[tag=sp3_c1,distance=..150]
kill @e[tag=sp3_c1T2,distance=..150]
kill @e[tag=sp3_bone,distance=..150]
kill @e[tag=sp3_r1,distance=..150]
kill @e[tag=sp3_r2,distance=..150]
kill @e[tag=sp3_vcT1,distance=..150]
kill @e[tag=sp3_vcT2,distance=..150]
kill @e[tag=sp3_r1T2,distance=..150]
kill @e[tag=sp3_r1T3,distance=..150]
kill @e[tag=sp3_r2T3,distance=..150]
kill @e[tag=sp3_tpT3,distance=..150]
kill @e[tag=sp3_secret,distance=..150]
kill @e[tag=sp3_spnT3,distance=..150]
kill @e[tag=sp3_towerS1,distance=..150]
kill @e[tag=sp3_towerS2,distance=..150]
kill @e[tag=sp3_eT3,distance=..150]