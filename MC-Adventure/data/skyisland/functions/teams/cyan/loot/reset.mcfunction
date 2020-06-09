#Resets all chests if armor stand has none
function skyisland:teams/cyan/loot/populate

#Above Ground
execute at @e[tag=cyan_cloud] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_cloud] run kill @e[type=item,distance=..4]
execute at @e[tag=cyan_cloudT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_cloudT2] run kill @e[type=item,distance=..4]
execute at @e[tag=cyan_cloudT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_cloudT3] run kill @e[type=item,distance=..4]

execute at @e[tag=cyan_treetop] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_treetop] run kill @e[type=item,distance=..4]

execute at @e[tag=cyan_tower] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_tower] run kill @e[type=item,distance=..4]
execute at @e[tag=cyan_towerT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_towerT1] run kill @e[type=item,distance=..4]
execute at @e[tag=cyan_towerT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_towerT2] run kill @e[type=item,distance=..4]

execute at @e[tag=cyan_surf] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_surf] run kill @e[type=item,distance=..4]
execute at @e[tag=cyan_surfT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_surfT1] run kill @e[type=item,distance=..4]

execute at @e[tag=cyan_moss] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_moss] run kill @e[type=item,distance=..4]
execute at @e[tag=cyan_mossT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_mossT2] run kill @e[type=item,distance=..4]

execute at @e[tag=cyan_volc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_volc] run kill @e[type=item,distance=..4]
execute at @e[tag=cyan_volcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_volcT2] run kill @e[type=item,distance=..4]
execute at @e[tag=cyan_volcT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_volcT3] run kill @e[type=item,distance=..4]

#Below Ground
execute at @e[tag=cyan_vc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_vc] run kill @e[type=item,distance=..4]
execute at @e[tag=cyan_vcT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_vcT1] run kill @e[type=item,distance=..4]
execute at @e[tag=cyan_vcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_vcT2] run kill @e[type=item,distance=..4]

execute at @e[tag=cyan_c1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_c1] run kill @e[type=item,distance=..4]
execute at @e[tag=cyan_c1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_c1T2] run kill @e[type=item,distance=..4]

execute at @e[tag=cyan_r1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_r1] run kill @e[type=item,distance=..4]
execute at @e[tag=cyan_r1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_r1T2] run kill @e[type=item,distance=..4]
execute at @e[tag=cyan_r1T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_r1T3] run kill @e[type=item,distance=..4]

execute at @e[tag=cyan_r2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_r2] run kill @e[type=item,distance=..4]
execute at @e[tag=cyan_r2T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_r2T3] run kill @e[type=item,distance=..4]

execute at @e[tag=cyan_bone] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_bone] run kill @e[type=item,distance=..4]

execute at @e[tag=cyan_tpT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_tpT3] run kill @e[type=item,distance=..4]

execute at @e[tag=cyan_secret] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_secret] run kill @e[type=item,distance=..4]

execute at @e[tag=cyan_spnT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_spnT3] run kill @e[type=item,distance=..4]

execute at @e[tag=cyan_towerS1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_towerS1] run kill @e[type=item,distance=..4]
execute at @e[tag=cyan_towerS2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_towerS2] run kill @e[type=item,distance=..4]

execute at @e[tag=cyan_eT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=cyan_eT3] run kill @e[type=item,distance=..4]

#Kills all loot table armorstands for LAG purposes
kill @e[tag=cyan_cloud,distance=..150]
kill @e[tag=cyan_cloudT2,distance=..150]
kill @e[tag=cyan_cloudT3,distance=..150]
kill @e[tag=cyan_treetop,distance=..150]
kill @e[tag=cyan_tower,distance=..150]
kill @e[tag=cyan_towerT1,distance=..150]
kill @e[tag=cyan_towerT2,distance=..150]
kill @e[tag=cyan_surf,distance=..150]
kill @e[tag=cyan_surfT1,distance=..150]
kill @e[tag=cyan_moss,distance=..150]
kill @e[tag=cyan_mossT2,distance=..150]
kill @e[tag=cyan_volc,distance=..150]
kill @e[tag=cyan_volcT2,distance=..150]
kill @e[tag=cyan_volcT3,distance=..150]
kill @e[tag=cyan_vc,distance=..150]
kill @e[tag=cyan_c1,distance=..150]
kill @e[tag=cyan_c1T2,distance=..150]
kill @e[tag=cyan_bone,distance=..150]
kill @e[tag=cyan_r1,distance=..150]
kill @e[tag=cyan_r2,distance=..150]
kill @e[tag=cyan_vcT1,distance=..150]
kill @e[tag=cyan_vcT2,distance=..150]
kill @e[tag=cyan_r1T2,distance=..150]
kill @e[tag=cyan_r1T3,distance=..150]
kill @e[tag=cyan_r2T3,distance=..150]
kill @e[tag=cyan_tpT3,distance=..150]
kill @e[tag=cyan_secret,distance=..150]
kill @e[tag=cyan_spnT3,distance=..150]
kill @e[tag=cyan_towerS1,distance=..150]
kill @e[tag=cyan_towerS2,distance=..150]
kill @e[tag=cyan_eT3,distance=..150]
setblock ~-24 ~-10 ~1 minecraft:air destroy
