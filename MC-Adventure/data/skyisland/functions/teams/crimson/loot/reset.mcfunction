#Resets all chests if armor stand has none
function skyisland:teams/crimson/loot/populate

#Above Ground
execute at @e[tag=crimson_cloud] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_cloud] run kill @e[type=item,distance=..4]
execute at @e[tag=crimson_cloudT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_cloudT2] run kill @e[type=item,distance=..4]
execute at @e[tag=crimson_cloudT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_cloudT3] run kill @e[type=item,distance=..4]

execute at @e[tag=crimson_treetop] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_treetop] run kill @e[type=item,distance=..4]

execute at @e[tag=crimson_tower] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_tower] run kill @e[type=item,distance=..4]
execute at @e[tag=crimson_towerT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_towerT1] run kill @e[type=item,distance=..4]
execute at @e[tag=crimson_towerT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_towerT2] run kill @e[type=item,distance=..4]

execute at @e[tag=crimson_surf] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_surf] run kill @e[type=item,distance=..4]
execute at @e[tag=crimson_surfT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_surfT1] run kill @e[type=item,distance=..4]

execute at @e[tag=crimson_moss] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_moss] run kill @e[type=item,distance=..4]
execute at @e[tag=crimson_mossT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_mossT2] run kill @e[type=item,distance=..4]

execute at @e[tag=crimson_volc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_volc] run kill @e[type=item,distance=..4]
execute at @e[tag=crimson_volcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_volcT2] run kill @e[type=item,distance=..4]
execute at @e[tag=crimson_volcT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_volcT3] run kill @e[type=item,distance=..4]

#Below Ground
execute at @e[tag=crimson_vc] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_vc] run kill @e[type=item,distance=..4]
execute at @e[tag=crimson_vcT1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_vcT1] run kill @e[type=item,distance=..4]
execute at @e[tag=crimson_vcT2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_vcT2] run kill @e[type=item,distance=..4]

execute at @e[tag=crimson_c1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_c1] run kill @e[type=item,distance=..4]
execute at @e[tag=crimson_c1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_c1T2] run kill @e[type=item,distance=..4]

execute at @e[tag=crimson_r1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_r1] run kill @e[type=item,distance=..4]
execute at @e[tag=crimson_r1T2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_r1T2] run kill @e[type=item,distance=..4]
execute at @e[tag=crimson_r1T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_r1T3] run kill @e[type=item,distance=..4]

execute at @e[tag=crimson_r2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_r2] run kill @e[type=item,distance=..4]
execute at @e[tag=crimson_r2T3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_r2T3] run kill @e[type=item,distance=..4]

execute at @e[tag=crimson_bone] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_bone] run kill @e[type=item,distance=..4]

execute at @e[tag=crimson_tpT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_tpT3] run kill @e[type=item,distance=..4]

execute at @e[tag=crimson_secret] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_secret] run kill @e[type=item,distance=..4]

execute at @e[tag=crimson_spnT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_spnT3] run kill @e[type=item,distance=..4]

execute at @e[tag=crimson_towerS1] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_towerS1] run kill @e[type=item,distance=..4]
execute at @e[tag=crimson_towerS2] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_towerS2] run kill @e[type=item,distance=..4]

execute at @e[tag=crimson_eT3] run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=crimson_eT3] run kill @e[type=item,distance=..4]

#Kills all loot table armorstands for LAG purposes
kill @e[tag=crimson_cloud,distance=..150]
kill @e[tag=crimson_cloudT2,distance=..150]
kill @e[tag=crimson_cloudT3,distance=..150]
kill @e[tag=crimson_treetop,distance=..150]
kill @e[tag=crimson_tower,distance=..150]
kill @e[tag=crimson_towerT1,distance=..150]
kill @e[tag=crimson_towerT2,distance=..150]
kill @e[tag=crimson_surf,distance=..150]
kill @e[tag=crimson_surfT1,distance=..150]
kill @e[tag=crimson_moss,distance=..150]
kill @e[tag=crimson_mossT2,distance=..150]
kill @e[tag=crimson_volc,distance=..150]
kill @e[tag=crimson_volcT2,distance=..150]
kill @e[tag=crimson_volcT3,distance=..150]
kill @e[tag=crimson_vc,distance=..150]
kill @e[tag=crimson_c1,distance=..150]
kill @e[tag=crimson_c1T2,distance=..150]
kill @e[tag=crimson_bone,distance=..150]
kill @e[tag=crimson_r1,distance=..150]
kill @e[tag=crimson_r2,distance=..150]
kill @e[tag=crimson_vcT1,distance=..150]
kill @e[tag=crimson_vcT2,distance=..150]
kill @e[tag=crimson_r1T2,distance=..150]
kill @e[tag=crimson_r1T3,distance=..150]
kill @e[tag=crimson_r2T3,distance=..150]
kill @e[tag=crimson_tpT3,distance=..150]
kill @e[tag=crimson_secret,distance=..150]
kill @e[tag=crimson_spnT3,distance=..150]
kill @e[tag=crimson_towerS1,distance=..150]
kill @e[tag=crimson_towerS2,distance=..150]
kill @e[tag=crimson_eT3,distance=..150]
setblock ~-24 ~-10 ~1 minecraft:air destroy
