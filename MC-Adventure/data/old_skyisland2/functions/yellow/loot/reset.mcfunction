#Resets all chests if armor stand has none
function skyisland:yellow/loot/populate

#Above Ground
execute at @e[tag=yellow_cloud] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_cloud] run kill @e[type=item,distance=..4]
execute at @e[tag=yellow_cloudT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_cloudT2] run kill @e[type=item,distance=..4]
execute at @e[tag=yellow_cloudT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_cloudT3] run kill @e[type=item,distance=..4]

execute at @e[tag=yellow_treetop] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_treetop] run kill @e[type=item,distance=..4]

execute at @e[tag=yellow_tower] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_tower] run kill @e[type=item,distance=..4]
execute at @e[tag=yellow_towerT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_towerT1] run kill @e[type=item,distance=..4]
execute at @e[tag=yellow_towerT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_towerT2] run kill @e[type=item,distance=..4]

execute at @e[tag=yellow_surf] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_surf] run kill @e[type=item,distance=..4]
execute at @e[tag=yellow_surfT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_surfT1] run kill @e[type=item,distance=..4]

execute at @e[tag=yellow_moss] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_moss] run kill @e[type=item,distance=..4]
execute at @e[tag=yellow_mossT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_mossT2] run kill @e[type=item,distance=..4]

execute at @e[tag=yellow_volc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_volc] run kill @e[type=item,distance=..4]
execute at @e[tag=yellow_volcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_volcT2] run kill @e[type=item,distance=..4]
execute at @e[tag=yellow_volcT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_volcT3] run kill @e[type=item,distance=..4]

#Below Ground
execute at @e[tag=yellow_vc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_vc] run kill @e[type=item,distance=..4]
execute at @e[tag=yellow_vcT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_vcT1] run kill @e[type=item,distance=..4]
execute at @e[tag=yellow_vcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_vcT2] run kill @e[type=item,distance=..4]

execute at @e[tag=yellow_c1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_c1] run kill @e[type=item,distance=..4]
execute at @e[tag=yellow_c1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_c1T2] run kill @e[type=item,distance=..4]

execute at @e[tag=yellow_r1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_r1] run kill @e[type=item,distance=..4]
execute at @e[tag=yellow_r1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_r1T2] run kill @e[type=item,distance=..4]
execute at @e[tag=yellow_r1T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_r1T3] run kill @e[type=item,distance=..4]

execute at @e[tag=yellow_r2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_r2] run kill @e[type=item,distance=..4]
execute at @e[tag=yellow_r2T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_r2T3] run kill @e[type=item,distance=..4]

execute at @e[tag=yellow_bone] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_bone] run kill @e[type=item,distance=..4]

execute at @e[tag=yellow_tpT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_tpT3] run kill @e[type=item,distance=..4]

execute at @e[tag=yellow_secret] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_secret] run kill @e[type=item,distance=..4]

execute at @e[tag=yellow_spnT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_spnT3] run kill @e[type=item,distance=..4]

execute at @e[tag=yellow_towerS1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_towerS1] run kill @e[type=item,distance=..4]
execute at @e[tag=yellow_towerS2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_towerS2] run kill @e[type=item,distance=..4]

execute at @e[tag=yellow_eT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=yellow_eT3] run kill @e[type=item,distance=..4]

#Kills all loot table armorstands for LAG purposes
kill @e[tag=yellow_cloud,distance=..150]
kill @e[tag=yellow_cloudT2,distance=..150]
kill @e[tag=yellow_cloudT3,distance=..150]
kill @e[tag=yellow_treetop,distance=..150]
kill @e[tag=yellow_tower,distance=..150]
kill @e[tag=yellow_towerT1,distance=..150]
kill @e[tag=yellow_towerT2,distance=..150]
kill @e[tag=yellow_surf,distance=..150]
kill @e[tag=yellow_surfT1,distance=..150]
kill @e[tag=yellow_moss,distance=..150]
kill @e[tag=yellow_mossT2,distance=..150]
kill @e[tag=yellow_volc,distance=..150]
kill @e[tag=yellow_volcT2,distance=..150]
kill @e[tag=yellow_volcT3,distance=..150]
kill @e[tag=yellow_vc,distance=..150]
kill @e[tag=yellow_c1,distance=..150]
kill @e[tag=yellow_c1T2,distance=..150]
kill @e[tag=yellow_bone,distance=..150]
kill @e[tag=yellow_r1,distance=..150]
kill @e[tag=yellow_r2,distance=..150]
kill @e[tag=yellow_vcT1,distance=..150]
kill @e[tag=yellow_vcT2,distance=..150]
kill @e[tag=yellow_r1T2,distance=..150]
kill @e[tag=yellow_r1T3,distance=..150]
kill @e[tag=yellow_r2T3,distance=..150]
kill @e[tag=yellow_tpT3,distance=..150]
kill @e[tag=yellow_secret,distance=..150]
kill @e[tag=yellow_spnT3,distance=..150]
kill @e[tag=yellow_towerS1,distance=..150]
kill @e[tag=yellow_towerS2,distance=..150]
kill @e[tag=yellow_eT3,distance=..150]
setblock ~-24 ~-10 ~1 minecraft:air destroy
