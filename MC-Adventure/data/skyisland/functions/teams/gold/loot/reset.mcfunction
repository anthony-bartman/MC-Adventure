#Resets all chests if armor stand has none
function skyisland:teams/gold/loot/populate

#Above Ground
execute at @e[tag=gold_cloud] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_cloud] run kill @e[type=item,distance=..4]
execute at @e[tag=gold_cloudT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_cloudT2] run kill @e[type=item,distance=..4]
execute at @e[tag=gold_cloudT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_cloudT3] run kill @e[type=item,distance=..4]

execute at @e[tag=gold_treetop] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_treetop] run kill @e[type=item,distance=..4]

execute at @e[tag=gold_tower] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_tower] run kill @e[type=item,distance=..4]
execute at @e[tag=gold_towerT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_towerT1] run kill @e[type=item,distance=..4]
execute at @e[tag=gold_towerT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_towerT2] run kill @e[type=item,distance=..4]

execute at @e[tag=gold_surf] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_surf] run kill @e[type=item,distance=..4]
execute at @e[tag=gold_surfT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_surfT1] run kill @e[type=item,distance=..4]

execute at @e[tag=gold_moss] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_moss] run kill @e[type=item,distance=..4]
execute at @e[tag=gold_mossT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_mossT2] run kill @e[type=item,distance=..4]

execute at @e[tag=gold_volc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_volc] run kill @e[type=item,distance=..4]
execute at @e[tag=gold_volcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_volcT2] run kill @e[type=item,distance=..4]
execute at @e[tag=gold_volcT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_volcT3] run kill @e[type=item,distance=..4]

#Below Ground
execute at @e[tag=gold_vc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_vc] run kill @e[type=item,distance=..4]
execute at @e[tag=gold_vcT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_vcT1] run kill @e[type=item,distance=..4]
execute at @e[tag=gold_vcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_vcT2] run kill @e[type=item,distance=..4]

execute at @e[tag=gold_c1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_c1] run kill @e[type=item,distance=..4]
execute at @e[tag=gold_c1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_c1T2] run kill @e[type=item,distance=..4]

execute at @e[tag=gold_r1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_r1] run kill @e[type=item,distance=..4]
execute at @e[tag=gold_r1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_r1T2] run kill @e[type=item,distance=..4]
execute at @e[tag=gold_r1T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_r1T3] run kill @e[type=item,distance=..4]

execute at @e[tag=gold_r2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_r2] run kill @e[type=item,distance=..4]
execute at @e[tag=gold_r2T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_r2T3] run kill @e[type=item,distance=..4]

execute at @e[tag=gold_bone] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_bone] run kill @e[type=item,distance=..4]

execute at @e[tag=gold_tpT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_tpT3] run kill @e[type=item,distance=..4]

execute at @e[tag=gold_secret] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_secret] run kill @e[type=item,distance=..4]

execute at @e[tag=gold_spnT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_spnT3] run kill @e[type=item,distance=..4]

execute at @e[tag=gold_towerS1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_towerS1] run kill @e[type=item,distance=..4]
execute at @e[tag=gold_towerS2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_towerS2] run kill @e[type=item,distance=..4]

execute at @e[tag=gold_eT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=gold_eT3] run kill @e[type=item,distance=..4]

#Kills all loot table armorstands for LAG purposes
kill @e[tag=gold_cloud,distance=..150]
kill @e[tag=gold_cloudT2,distance=..150]
kill @e[tag=gold_cloudT3,distance=..150]
kill @e[tag=gold_treetop,distance=..150]
kill @e[tag=gold_tower,distance=..150]
kill @e[tag=gold_towerT1,distance=..150]
kill @e[tag=gold_towerT2,distance=..150]
kill @e[tag=gold_surf,distance=..150]
kill @e[tag=gold_surfT1,distance=..150]
kill @e[tag=gold_moss,distance=..150]
kill @e[tag=gold_mossT2,distance=..150]
kill @e[tag=gold_volc,distance=..150]
kill @e[tag=gold_volcT2,distance=..150]
kill @e[tag=gold_volcT3,distance=..150]
kill @e[tag=gold_vc,distance=..150]
kill @e[tag=gold_c1,distance=..150]
kill @e[tag=gold_c1T2,distance=..150]
kill @e[tag=gold_bone,distance=..150]
kill @e[tag=gold_r1,distance=..150]
kill @e[tag=gold_r2,distance=..150]
kill @e[tag=gold_vcT1,distance=..150]
kill @e[tag=gold_vcT2,distance=..150]
kill @e[tag=gold_r1T2,distance=..150]
kill @e[tag=gold_r1T3,distance=..150]
kill @e[tag=gold_r2T3,distance=..150]
kill @e[tag=gold_tpT3,distance=..150]
kill @e[tag=gold_secret,distance=..150]
kill @e[tag=gold_spnT3,distance=..150]
kill @e[tag=gold_towerS1,distance=..150]
kill @e[tag=gold_towerS2,distance=..150]
kill @e[tag=gold_eT3,distance=..150]
setblock ~-24 ~-10 ~1 minecraft:air destroy
