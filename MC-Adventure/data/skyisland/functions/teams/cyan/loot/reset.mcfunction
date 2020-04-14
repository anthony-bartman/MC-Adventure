#Resets all chests if armor stand has none
function skyisland:sp3/loot/populate

#Above Ground
execute at @e[tag=sp3_cloud] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_cloud] run kill @e[type=item,distance=..4]
execute at @e[tag=sp3_cloudT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_cloudT2] run kill @e[type=item,distance=..4]
execute at @e[tag=sp3_cloudT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_cloudT3] run kill @e[type=item,distance=..4]

execute at @e[tag=sp3_treetop] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_treetop] run kill @e[type=item,distance=..4]

execute at @e[tag=sp3_tower] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_tower] run kill @e[type=item,distance=..4]
execute at @e[tag=sp3_towerT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_towerT1] run kill @e[type=item,distance=..4]
execute at @e[tag=sp3_towerT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_towerT2] run kill @e[type=item,distance=..4]

execute at @e[tag=sp3_surf] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_surf] run kill @e[type=item,distance=..4]
execute at @e[tag=sp3_surfT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_surfT1] run kill @e[type=item,distance=..4]

execute at @e[tag=sp3_moss] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_moss] run kill @e[type=item,distance=..4]
execute at @e[tag=sp3_mossT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_mossT2] run kill @e[type=item,distance=..4]

execute at @e[tag=sp3_volc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_volc] run kill @e[type=item,distance=..4]
execute at @e[tag=sp3_volcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_volcT2] run kill @e[type=item,distance=..4]
execute at @e[tag=sp3_volcT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_volcT3] run kill @e[type=item,distance=..4]

#Below Ground
execute at @e[tag=sp3_vc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_vc] run kill @e[type=item,distance=..4]
execute at @e[tag=sp3_vcT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_vcT1] run kill @e[type=item,distance=..4]
execute at @e[tag=sp3_vcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_vcT2] run kill @e[type=item,distance=..4]

execute at @e[tag=sp3_c1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_c1] run kill @e[type=item,distance=..4]
execute at @e[tag=sp3_c1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_c1T2] run kill @e[type=item,distance=..4]

execute at @e[tag=sp3_r1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_r1] run kill @e[type=item,distance=..4]
execute at @e[tag=sp3_r1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_r1T2] run kill @e[type=item,distance=..4]
execute at @e[tag=sp3_r1T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_r1T3] run kill @e[type=item,distance=..4]

execute at @e[tag=sp3_r2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_r2] run kill @e[type=item,distance=..4]
execute at @e[tag=sp3_r2T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_r2T3] run kill @e[type=item,distance=..4]

execute at @e[tag=sp3_bone] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_bone] run kill @e[type=item,distance=..4]

execute at @e[tag=sp3_tpT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_tpT3] run kill @e[type=item,distance=..4]

execute at @e[tag=sp3_secret] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_secret] run kill @e[type=item,distance=..4]

execute at @e[tag=sp3_spnT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_spnT3] run kill @e[type=item,distance=..4]

execute at @e[tag=sp3_towerS1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_towerS1] run kill @e[type=item,distance=..4]
execute at @e[tag=sp3_towerS2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_towerS2] run kill @e[type=item,distance=..4]

execute at @e[tag=sp3_eT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp3_eT3] run kill @e[type=item,distance=..4]

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
setblock ~-24 ~-10 ~1 minecraft:air destroy
