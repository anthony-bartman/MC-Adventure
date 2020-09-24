#This file will generate the loot in all of the loot chests around the red team's skyisland

#DELETES any previous chests
function skyisland:teams/red/loot/reset

#Populates all loot armorstands
function skyisland:teams/red/loot/populate

#Total SkyIsland chests
# T1 : 33
# T2 : 34
# T3 : 10
#TOTAL CHESTS: 77

# TIER 1 CHESTS
#Limit, will hold how many chests to spawn in
execute as @e[sort=random,type=armor_stand,tag=red_cloud,limit=5] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=red_treetop,limit=3] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=red_tower,limit=4] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=red_surf,limit=6] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=red_moss,limit=4] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=red_vc,limit=3] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=red_volc,limit=3] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy

#Tier 2 Chests
execute as @e[sort=random,type=armor_stand,tag=red_c1,limit=3] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=red_bone,limit=6] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=red_r1,limit=6] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy
execute as @e[sort=random,type=armor_stand,tag=red_r2,limit=6] at @s run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy

#Special chests... /Tier 3 chests
execute at @e[tag=red_cloudT2,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy
execute at @e[tag=red_cloudT3,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_loot"} destroy

execute at @e[tag=red_towerT1,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute at @e[tag=red_towerT2,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy

execute at @e[tag=red_surfT1,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy

execute at @e[tag=red_mossT2,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy

execute at @e[tag=red_volcT2,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy
execute at @e[tag=red_volcT3,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_loot"} destroy

execute at @e[tag=red_vcT1,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute at @e[tag=red_vcT2,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy

execute at @e[tag=red_c1T2,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy

execute at @e[tag=red_r1T2,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy
execute at @e[tag=red_r1T3,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_loot"} destroy

execute at @e[tag=red_r2T3,type=armor_stand,limit=3] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_loot"} destroy
execute at @e[tag=red_eT3,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_emerald"} destroy


execute at @e[tag=red_tpT3,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_loot"} destroy
execute at @e[tag=red_secret,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_ender_chest"} destroy
execute at @e[tag=red_spnT3,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier3_loot"} destroy

execute at @e[tag=red_towerS1,type=armor_stand,limit=1] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier1_loot"} destroy
execute at @e[tag=red_towerS2,type=armor_stand,limit=2] run setblock ~ ~ ~ minecraft:chest{LootTable:"skyisland:tier2_loot"} destroy

#Kills all loot table armorstands for LAG purposes
kill @e[tag=red_cloud,distance=..150]
kill @e[tag=red_cloudT2,distance=..150]
kill @e[tag=red_cloudT3,distance=..150]
kill @e[tag=red_treetop,distance=..150]
kill @e[tag=red_tower,distance=..150]
kill @e[tag=red_towerT1,distance=..150]
kill @e[tag=red_towerT2,distance=..150]
kill @e[tag=red_surf,distance=..150]
kill @e[tag=red_surfT1,distance=..150]
kill @e[tag=red_moss,distance=..150]
kill @e[tag=red_mossT2,distance=..150]
kill @e[tag=red_volc,distance=..150]
kill @e[tag=red_volcT2,distance=..150]
kill @e[tag=red_volcT3,distance=..150]
kill @e[tag=red_vc,distance=..150]
kill @e[tag=red_c1,distance=..150]
kill @e[tag=red_c1T2,distance=..150]
kill @e[tag=red_bone,distance=..150]
kill @e[tag=red_r1,distance=..150]
kill @e[tag=red_r2,distance=..150]
kill @e[tag=red_vcT1,distance=..150]
kill @e[tag=red_vcT2,distance=..150]
kill @e[tag=red_r1T2,distance=..150]
kill @e[tag=red_r1T3,distance=..150]
kill @e[tag=red_r2T3,distance=..150]
kill @e[tag=red_tpT3,distance=..150]
kill @e[tag=red_secret,distance=..150]
kill @e[tag=red_spnT3,distance=..150]
kill @e[tag=red_towerS1,distance=..150]
kill @e[tag=red_towerS2,distance=..150]
kill @e[tag=red_eT3,distance=..150]