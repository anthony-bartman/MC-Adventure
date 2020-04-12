#Resets all chests if armor stand has none
function skyisland:green/loot/populate

#Above Ground
execute at @e[tag=green_cloud] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_cloud] run kill @e[type=item,distance=..4]
execute at @e[tag=green_cloudT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_cloudT2] run kill @e[type=item,distance=..4]
execute at @e[tag=green_cloudT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_cloudT3] run kill @e[type=item,distance=..4]

execute at @e[tag=green_treetop] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_treetop] run kill @e[type=item,distance=..4]

execute at @e[tag=green_tower] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_tower] run kill @e[type=item,distance=..4]
execute at @e[tag=green_towerT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_towerT1] run kill @e[type=item,distance=..4]
execute at @e[tag=green_towerT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_towerT2] run kill @e[type=item,distance=..4]

execute at @e[tag=green_surf] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_surf] run kill @e[type=item,distance=..4]
execute at @e[tag=green_surfT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_surfT1] run kill @e[type=item,distance=..4]

execute at @e[tag=green_moss] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_moss] run kill @e[type=item,distance=..4]
execute at @e[tag=green_mossT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_mossT2] run kill @e[type=item,distance=..4]

execute at @e[tag=green_volc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_volc] run kill @e[type=item,distance=..4]
execute at @e[tag=green_volcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_volcT2] run kill @e[type=item,distance=..4]
execute at @e[tag=green_volcT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_volcT3] run kill @e[type=item,distance=..4]

#Below Ground
execute at @e[tag=green_vc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_vc] run kill @e[type=item,distance=..4]
execute at @e[tag=green_vcT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_vcT1] run kill @e[type=item,distance=..4]
execute at @e[tag=green_vcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_vcT2] run kill @e[type=item,distance=..4]

execute at @e[tag=green_c1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_c1] run kill @e[type=item,distance=..4]
execute at @e[tag=green_c1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_c1T2] run kill @e[type=item,distance=..4]

execute at @e[tag=green_r1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_r1] run kill @e[type=item,distance=..4]
execute at @e[tag=green_r1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_r1T2] run kill @e[type=item,distance=..4]
execute at @e[tag=green_r1T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_r1T3] run kill @e[type=item,distance=..4]

execute at @e[tag=green_r2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_r2] run kill @e[type=item,distance=..4]
execute at @e[tag=green_r2T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_r2T3] run kill @e[type=item,distance=..4]

execute at @e[tag=green_bone] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_bone] run kill @e[type=item,distance=..4]

execute at @e[tag=green_tpT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_tpT3] run kill @e[type=item,distance=..4]

execute at @e[tag=green_secret] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_secret] run kill @e[type=item,distance=..4]

execute at @e[tag=green_spnT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_spnT3] run kill @e[type=item,distance=..4]

execute at @e[tag=green_towerS1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_towerS1] run kill @e[type=item,distance=..4]
execute at @e[tag=green_towerS2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_towerS2] run kill @e[type=item,distance=..4]

execute at @e[tag=green_eT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=green_eT3] run kill @e[type=item,distance=..4]

#Kills all loot table armorstands for LAG purposes
kill @e[tag=green_cloud,distance=..150]
kill @e[tag=green_cloudT2,distance=..150]
kill @e[tag=green_cloudT3,distance=..150]
kill @e[tag=green_treetop,distance=..150]
kill @e[tag=green_tower,distance=..150]
kill @e[tag=green_towerT1,distance=..150]
kill @e[tag=green_towerT2,distance=..150]
kill @e[tag=green_surf,distance=..150]
kill @e[tag=green_surfT1,distance=..150]
kill @e[tag=green_moss,distance=..150]
kill @e[tag=green_mossT2,distance=..150]
kill @e[tag=green_volc,distance=..150]
kill @e[tag=green_volcT2,distance=..150]
kill @e[tag=green_volcT3,distance=..150]
kill @e[tag=green_vc,distance=..150]
kill @e[tag=green_c1,distance=..150]
kill @e[tag=green_c1T2,distance=..150]
kill @e[tag=green_bone,distance=..150]
kill @e[tag=green_r1,distance=..150]
kill @e[tag=green_r2,distance=..150]
kill @e[tag=green_vcT1,distance=..150]
kill @e[tag=green_vcT2,distance=..150]
kill @e[tag=green_r1T2,distance=..150]
kill @e[tag=green_r1T3,distance=..150]
kill @e[tag=green_r2T3,distance=..150]
kill @e[tag=green_tpT3,distance=..150]
kill @e[tag=green_secret,distance=..150]
kill @e[tag=green_spnT3,distance=..150]
kill @e[tag=green_towerS1,distance=..150]
kill @e[tag=green_towerS2,distance=..150]
kill @e[tag=green_eT3,distance=..150]
setblock ~-24 ~-10 ~1 minecraft:air destroy
