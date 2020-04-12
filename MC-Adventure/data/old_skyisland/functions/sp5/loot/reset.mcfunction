#Resets all chests if armor stand has none
function skyisland:sp5/loot/populate

#Above Ground
execute at @e[tag=sp5_cloud] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_cloud] run kill @e[type=item,distance=..4]
execute at @e[tag=sp5_cloudT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_cloudT2] run kill @e[type=item,distance=..4]
execute at @e[tag=sp5_cloudT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_cloudT3] run kill @e[type=item,distance=..4]

execute at @e[tag=sp5_treetop] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_treetop] run kill @e[type=item,distance=..4]

execute at @e[tag=sp5_tower] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_tower] run kill @e[type=item,distance=..4]
execute at @e[tag=sp5_towerT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_towerT1] run kill @e[type=item,distance=..4]
execute at @e[tag=sp5_towerT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_towerT2] run kill @e[type=item,distance=..4]

execute at @e[tag=sp5_surf] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_surf] run kill @e[type=item,distance=..4]
execute at @e[tag=sp5_surfT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_surfT1] run kill @e[type=item,distance=..4]

execute at @e[tag=sp5_moss] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_moss] run kill @e[type=item,distance=..4]
execute at @e[tag=sp5_mossT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_mossT2] run kill @e[type=item,distance=..4]

execute at @e[tag=sp5_volc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_volc] run kill @e[type=item,distance=..4]
execute at @e[tag=sp5_volcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_volcT2] run kill @e[type=item,distance=..4]
execute at @e[tag=sp5_volcT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_volcT3] run kill @e[type=item,distance=..4]

#Below Ground
execute at @e[tag=sp5_vc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_vc] run kill @e[type=item,distance=..4]
execute at @e[tag=sp5_vcT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_vcT1] run kill @e[type=item,distance=..4]
execute at @e[tag=sp5_vcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_vcT2] run kill @e[type=item,distance=..4]

execute at @e[tag=sp5_c1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_c1] run kill @e[type=item,distance=..4]
execute at @e[tag=sp5_c1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_c1T2] run kill @e[type=item,distance=..4]

execute at @e[tag=sp5_r1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_r1] run kill @e[type=item,distance=..4]
execute at @e[tag=sp5_r1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_r1T2] run kill @e[type=item,distance=..4]
execute at @e[tag=sp5_r1T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_r1T3] run kill @e[type=item,distance=..4]

execute at @e[tag=sp5_r2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_r2] run kill @e[type=item,distance=..4]
execute at @e[tag=sp5_r2T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_r2T3] run kill @e[type=item,distance=..4]

execute at @e[tag=sp5_bone] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_bone] run kill @e[type=item,distance=..4]

execute at @e[tag=sp5_tpT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_tpT3] run kill @e[type=item,distance=..4]

execute at @e[tag=sp5_secret] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_secret] run kill @e[type=item,distance=..4]

execute at @e[tag=sp5_spnT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_spnT3] run kill @e[type=item,distance=..4]

execute at @e[tag=sp5_towerS1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_towerS1] run kill @e[type=item,distance=..4]
execute at @e[tag=sp5_towerS2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_towerS2] run kill @e[type=item,distance=..4]

execute at @e[tag=sp5_eT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=sp5_eT3] run kill @e[type=item,distance=..4]

#Kills all loot table armorstands for LAG purposes
kill @e[tag=sp5_cloud,distance=..150]
kill @e[tag=sp5_cloudT2,distance=..150]
kill @e[tag=sp5_cloudT3,distance=..150]
kill @e[tag=sp5_treetop,distance=..150]
kill @e[tag=sp5_tower,distance=..150]
kill @e[tag=sp5_towerT1,distance=..150]
kill @e[tag=sp5_towerT2,distance=..150]
kill @e[tag=sp5_surf,distance=..150]
kill @e[tag=sp5_surfT1,distance=..150]
kill @e[tag=sp5_moss,distance=..150]
kill @e[tag=sp5_mossT2,distance=..150]
kill @e[tag=sp5_volc,distance=..150]
kill @e[tag=sp5_volcT2,distance=..150]
kill @e[tag=sp5_volcT3,distance=..150]
kill @e[tag=sp5_vc,distance=..150]
kill @e[tag=sp5_c1,distance=..150]
kill @e[tag=sp5_c1T2,distance=..150]
kill @e[tag=sp5_bone,distance=..150]
kill @e[tag=sp5_r1,distance=..150]
kill @e[tag=sp5_r2,distance=..150]
kill @e[tag=sp5_vcT1,distance=..150]
kill @e[tag=sp5_vcT2,distance=..150]
kill @e[tag=sp5_r1T2,distance=..150]
kill @e[tag=sp5_r1T3,distance=..150]
kill @e[tag=sp5_r2T3,distance=..150]
kill @e[tag=sp5_tpT3,distance=..150]
kill @e[tag=sp5_secret,distance=..150]
kill @e[tag=sp5_spnT3,distance=..150]
kill @e[tag=sp5_towerS1,distance=..150]
kill @e[tag=sp5_towerS2,distance=..150]
kill @e[tag=sp5_eT3,distance=..150]
setblock ~-24 ~-10 ~1 minecraft:air destroy
