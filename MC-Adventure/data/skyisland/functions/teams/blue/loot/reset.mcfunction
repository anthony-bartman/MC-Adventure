#Resets all chests if armor stand has none
function skyisland:blue/loot/populate

#Above Ground
execute at @e[tag=blue_cloud] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_cloud] run kill @e[type=item,distance=..4]
execute at @e[tag=blue_cloudT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_cloudT2] run kill @e[type=item,distance=..4]
execute at @e[tag=blue_cloudT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_cloudT3] run kill @e[type=item,distance=..4]

execute at @e[tag=blue_treetop] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_treetop] run kill @e[type=item,distance=..4]

execute at @e[tag=blue_tower] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_tower] run kill @e[type=item,distance=..4]
execute at @e[tag=blue_towerT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_towerT1] run kill @e[type=item,distance=..4]
execute at @e[tag=blue_towerT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_towerT2] run kill @e[type=item,distance=..4]

execute at @e[tag=blue_surf] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_surf] run kill @e[type=item,distance=..4]
execute at @e[tag=blue_surfT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_surfT1] run kill @e[type=item,distance=..4]

execute at @e[tag=blue_moss] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_moss] run kill @e[type=item,distance=..4]
execute at @e[tag=blue_mossT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_mossT2] run kill @e[type=item,distance=..4]

execute at @e[tag=blue_volc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_volc] run kill @e[type=item,distance=..4]
execute at @e[tag=blue_volcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_volcT2] run kill @e[type=item,distance=..4]
execute at @e[tag=blue_volcT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_volcT3] run kill @e[type=item,distance=..4]

#Below Ground
execute at @e[tag=blue_vc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_vc] run kill @e[type=item,distance=..4]
execute at @e[tag=blue_vcT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_vcT1] run kill @e[type=item,distance=..4]
execute at @e[tag=blue_vcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_vcT2] run kill @e[type=item,distance=..4]

execute at @e[tag=blue_c1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_c1] run kill @e[type=item,distance=..4]
execute at @e[tag=blue_c1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_c1T2] run kill @e[type=item,distance=..4]

execute at @e[tag=blue_r1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_r1] run kill @e[type=item,distance=..4]
execute at @e[tag=blue_r1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_r1T2] run kill @e[type=item,distance=..4]
execute at @e[tag=blue_r1T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_r1T3] run kill @e[type=item,distance=..4]

execute at @e[tag=blue_r2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_r2] run kill @e[type=item,distance=..4]
execute at @e[tag=blue_r2T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_r2T3] run kill @e[type=item,distance=..4]

execute at @e[tag=blue_bone] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_bone] run kill @e[type=item,distance=..4]

execute at @e[tag=blue_tpT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_tpT3] run kill @e[type=item,distance=..4]

execute at @e[tag=blue_secret] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_secret] run kill @e[type=item,distance=..4]

execute at @e[tag=blue_spnT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_spnT3] run kill @e[type=item,distance=..4]

execute at @e[tag=blue_towerS1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_towerS1] run kill @e[type=item,distance=..4]
execute at @e[tag=blue_towerS2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_towerS2] run kill @e[type=item,distance=..4]

execute at @e[tag=blue_eT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=blue_eT3] run kill @e[type=item,distance=..4]

#Kills all loot table armorstands for LAG purposes
kill @e[tag=blue_cloud,distance=..150]
kill @e[tag=blue_cloudT2,distance=..150]
kill @e[tag=blue_cloudT3,distance=..150]
kill @e[tag=blue_treetop,distance=..150]
kill @e[tag=blue_tower,distance=..150]
kill @e[tag=blue_towerT1,distance=..150]
kill @e[tag=blue_towerT2,distance=..150]
kill @e[tag=blue_surf,distance=..150]
kill @e[tag=blue_surfT1,distance=..150]
kill @e[tag=blue_moss,distance=..150]
kill @e[tag=blue_mossT2,distance=..150]
kill @e[tag=blue_volc,distance=..150]
kill @e[tag=blue_volcT2,distance=..150]
kill @e[tag=blue_volcT3,distance=..150]
kill @e[tag=blue_vc,distance=..150]
kill @e[tag=blue_c1,distance=..150]
kill @e[tag=blue_c1T2,distance=..150]
kill @e[tag=blue_bone,distance=..150]
kill @e[tag=blue_r1,distance=..150]
kill @e[tag=blue_r2,distance=..150]
kill @e[tag=blue_vcT1,distance=..150]
kill @e[tag=blue_vcT2,distance=..150]
kill @e[tag=blue_r1T2,distance=..150]
kill @e[tag=blue_r1T3,distance=..150]
kill @e[tag=blue_r2T3,distance=..150]
kill @e[tag=blue_tpT3,distance=..150]
kill @e[tag=blue_secret,distance=..150]
kill @e[tag=blue_spnT3,distance=..150]
kill @e[tag=blue_towerS1,distance=..150]
kill @e[tag=blue_towerS2,distance=..150]
kill @e[tag=blue_eT3,distance=..150]
setblock ~-24 ~-10 ~1 minecraft:air destroy
