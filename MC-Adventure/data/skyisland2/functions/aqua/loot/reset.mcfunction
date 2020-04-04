#Resets all chests if armor stand has none
function skyisland:aqua/loot/populate

#Above Ground
execute at @e[tag=aqua_cloud] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_cloud] run kill @e[type=item,distance=..4]
execute at @e[tag=aqua_cloudT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_cloudT2] run kill @e[type=item,distance=..4]
execute at @e[tag=aqua_cloudT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_cloudT3] run kill @e[type=item,distance=..4]

execute at @e[tag=aqua_treetop] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_treetop] run kill @e[type=item,distance=..4]

execute at @e[tag=aqua_tower] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_tower] run kill @e[type=item,distance=..4]
execute at @e[tag=aqua_towerT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_towerT1] run kill @e[type=item,distance=..4]
execute at @e[tag=aqua_towerT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_towerT2] run kill @e[type=item,distance=..4]

execute at @e[tag=aqua_surf] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_surf] run kill @e[type=item,distance=..4]
execute at @e[tag=aqua_surfT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_surfT1] run kill @e[type=item,distance=..4]

execute at @e[tag=aqua_moss] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_moss] run kill @e[type=item,distance=..4]
execute at @e[tag=aqua_mossT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_mossT2] run kill @e[type=item,distance=..4]

execute at @e[tag=aqua_volc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_volc] run kill @e[type=item,distance=..4]
execute at @e[tag=aqua_volcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_volcT2] run kill @e[type=item,distance=..4]
execute at @e[tag=aqua_volcT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_volcT3] run kill @e[type=item,distance=..4]

#Below Ground
execute at @e[tag=aqua_vc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_vc] run kill @e[type=item,distance=..4]
execute at @e[tag=aqua_vcT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_vcT1] run kill @e[type=item,distance=..4]
execute at @e[tag=aqua_vcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_vcT2] run kill @e[type=item,distance=..4]

execute at @e[tag=aqua_c1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_c1] run kill @e[type=item,distance=..4]
execute at @e[tag=aqua_c1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_c1T2] run kill @e[type=item,distance=..4]

execute at @e[tag=aqua_r1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_r1] run kill @e[type=item,distance=..4]
execute at @e[tag=aqua_r1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_r1T2] run kill @e[type=item,distance=..4]
execute at @e[tag=aqua_r1T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_r1T3] run kill @e[type=item,distance=..4]

execute at @e[tag=aqua_r2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_r2] run kill @e[type=item,distance=..4]
execute at @e[tag=aqua_r2T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_r2T3] run kill @e[type=item,distance=..4]

execute at @e[tag=aqua_bone] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_bone] run kill @e[type=item,distance=..4]

execute at @e[tag=aqua_tpT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_tpT3] run kill @e[type=item,distance=..4]

execute at @e[tag=aqua_secret] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_secret] run kill @e[type=item,distance=..4]

execute at @e[tag=aqua_spnT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_spnT3] run kill @e[type=item,distance=..4]

execute at @e[tag=aqua_towerS1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_towerS1] run kill @e[type=item,distance=..4]
execute at @e[tag=aqua_towerS2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_towerS2] run kill @e[type=item,distance=..4]

execute at @e[tag=aqua_eT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=aqua_eT3] run kill @e[type=item,distance=..4]

#Kills all loot table armorstands for LAG purposes
kill @e[tag=aqua_cloud,distance=..150]
kill @e[tag=aqua_cloudT2,distance=..150]
kill @e[tag=aqua_cloudT3,distance=..150]
kill @e[tag=aqua_treetop,distance=..150]
kill @e[tag=aqua_tower,distance=..150]
kill @e[tag=aqua_towerT1,distance=..150]
kill @e[tag=aqua_towerT2,distance=..150]
kill @e[tag=aqua_surf,distance=..150]
kill @e[tag=aqua_surfT1,distance=..150]
kill @e[tag=aqua_moss,distance=..150]
kill @e[tag=aqua_mossT2,distance=..150]
kill @e[tag=aqua_volc,distance=..150]
kill @e[tag=aqua_volcT2,distance=..150]
kill @e[tag=aqua_volcT3,distance=..150]
kill @e[tag=aqua_vc,distance=..150]
kill @e[tag=aqua_c1,distance=..150]
kill @e[tag=aqua_c1T2,distance=..150]
kill @e[tag=aqua_bone,distance=..150]
kill @e[tag=aqua_r1,distance=..150]
kill @e[tag=aqua_r2,distance=..150]
kill @e[tag=aqua_vcT1,distance=..150]
kill @e[tag=aqua_vcT2,distance=..150]
kill @e[tag=aqua_r1T2,distance=..150]
kill @e[tag=aqua_r1T3,distance=..150]
kill @e[tag=aqua_r2T3,distance=..150]
kill @e[tag=aqua_tpT3,distance=..150]
kill @e[tag=aqua_secret,distance=..150]
kill @e[tag=aqua_spnT3,distance=..150]
kill @e[tag=aqua_towerS1,distance=..150]
kill @e[tag=aqua_towerS2,distance=..150]
kill @e[tag=aqua_eT3,distance=..150]
setblock ~-24 ~-10 ~1 minecraft:air destroy
