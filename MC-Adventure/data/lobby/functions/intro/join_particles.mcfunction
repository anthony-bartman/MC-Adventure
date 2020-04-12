#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will show cool particles at intro sequence
#--------------------------------------


particle end_rod ~ ~ ~ .01 .01 .01 .1 1 force
summon minecraft:area_effect_cloud ~ ~1 ~ {Particle:"happy_villager",Radius:0.5f,Duration:20}