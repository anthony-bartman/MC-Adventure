#Resets all chests if armor stand has none
function skyisland:black/loot/populate

#Above Ground
execute at @e[tag=black_cloud] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_cloud] run kill @e[type=item,distance=..4]
execute at @e[tag=black_cloudT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_cloudT2] run kill @e[type=item,distance=..4]
execute at @e[tag=black_cloudT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_cloudT3] run kill @e[type=item,distance=..4]

execute at @e[tag=black_treetop] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_treetop] run kill @e[type=item,distance=..4]

execute at @e[tag=black_tower] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_tower] run kill @e[type=item,distance=..4]
execute at @e[tag=black_towerT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_towerT1] run kill @e[type=item,distance=..4]
execute at @e[tag=black_towerT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_towerT2] run kill @e[type=item,distance=..4]

execute at @e[tag=black_surf] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_surf] run kill @e[type=item,distance=..4]
execute at @e[tag=black_surfT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_surfT1] run kill @e[type=item,distance=..4]

execute at @e[tag=black_moss] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_moss] run kill @e[type=item,distance=..4]
execute at @e[tag=black_mossT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_mossT2] run kill @e[type=item,distance=..4]

execute at @e[tag=black_volc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_volc] run kill @e[type=item,distance=..4]
execute at @e[tag=black_volcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_volcT2] run kill @e[type=item,distance=..4]
execute at @e[tag=black_volcT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_volcT3] run kill @e[type=item,distance=..4]

#Below Ground
execute at @e[tag=black_vc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_vc] run kill @e[type=item,distance=..4]
execute at @e[tag=black_vcT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_vcT1] run kill @e[type=item,distance=..4]
execute at @e[tag=black_vcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_vcT2] run kill @e[type=item,distance=..4]

execute at @e[tag=black_c1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_c1] run kill @e[type=item,distance=..4]
execute at @e[tag=black_c1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_c1T2] run kill @e[type=item,distance=..4]

execute at @e[tag=black_r1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_r1] run kill @e[type=item,distance=..4]
execute at @e[tag=black_r1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_r1T2] run kill @e[type=item,distance=..4]
execute at @e[tag=black_r1T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_r1T3] run kill @e[type=item,distance=..4]

execute at @e[tag=black_r2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_r2] run kill @e[type=item,distance=..4]
execute at @e[tag=black_r2T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_r2T3] run kill @e[type=item,distance=..4]

execute at @e[tag=black_bone] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_bone] run kill @e[type=item,distance=..4]

execute at @e[tag=black_tpT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_tpT3] run kill @e[type=item,distance=..4]

execute at @e[tag=black_secret] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_secret] run kill @e[type=item,distance=..4]

execute at @e[tag=black_spnT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_spnT3] run kill @e[type=item,distance=..4]

execute at @e[tag=black_towerS1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_towerS1] run kill @e[type=item,distance=..4]
execute at @e[tag=black_towerS2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_towerS2] run kill @e[type=item,distance=..4]

execute at @e[tag=black_eT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=black_eT3] run kill @e[type=item,distance=..4]

#Kills all loot table armorstands for LAG purposes
kill @e[tag=black_cloud,distance=..150]
kill @e[tag=black_cloudT2,distance=..150]
kill @e[tag=black_cloudT3,distance=..150]
kill @e[tag=black_treetop,distance=..150]
kill @e[tag=black_tower,distance=..150]
kill @e[tag=black_towerT1,distance=..150]
kill @e[tag=black_towerT2,distance=..150]
kill @e[tag=black_surf,distance=..150]
kill @e[tag=black_surfT1,distance=..150]
kill @e[tag=black_moss,distance=..150]
kill @e[tag=black_mossT2,distance=..150]
kill @e[tag=black_volc,distance=..150]
kill @e[tag=black_volcT2,distance=..150]
kill @e[tag=black_volcT3,distance=..150]
kill @e[tag=black_vc,distance=..150]
kill @e[tag=black_c1,distance=..150]
kill @e[tag=black_c1T2,distance=..150]
kill @e[tag=black_bone,distance=..150]
kill @e[tag=black_r1,distance=..150]
kill @e[tag=black_r2,distance=..150]
kill @e[tag=black_vcT1,distance=..150]
kill @e[tag=black_vcT2,distance=..150]
kill @e[tag=black_r1T2,distance=..150]
kill @e[tag=black_r1T3,distance=..150]
kill @e[tag=black_r2T3,distance=..150]
kill @e[tag=black_tpT3,distance=..150]
kill @e[tag=black_secret,distance=..150]
kill @e[tag=black_spnT3,distance=..150]
kill @e[tag=black_towerS1,distance=..150]
kill @e[tag=black_towerS2,distance=..150]
kill @e[tag=black_eT3,distance=..150]
setblock ~-24 ~-10 ~1 minecraft:air destroy
