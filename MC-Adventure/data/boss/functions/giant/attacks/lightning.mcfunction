#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will create a "lightning" attack
#--------------------------------------


summon minecraft:creeper ~2 ~8 ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,powered:1b,ExplosionRadius:3b,Fuse:40,ignited:1b,Motion:[0.75,-0.75,0.75],Tags:["giant"],CustomName:'{"text":"BOOM!","color":"red","bold":true}',ActiveEffects:[{Id:14b,Amplifier:1b,Duration:60,ShowParticles:0b}]}
summon minecraft:creeper ~-2 ~8 ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,powered:1b,ExplosionRadius:3b,Fuse:40,ignited:1b,Motion:[-0.75,-0.75,0.75],Tags:["giant"],CustomName:'{"text":"BOOM!","color":"red","bold":true}',ActiveEffects:[{Id:14b,Amplifier:1b,Duration:60,ShowParticles:0b}]}
summon minecraft:creeper ~ ~8 ~2 {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,powered:1b,ExplosionRadius:3b,Fuse:40,ignited:1b,Motion:[0.75,-0.75,-0.75],Tags:["giant"],CustomName:'{"text":"BOOM!","color":"red","bold":true}',ActiveEffects:[{Id:14b,Amplifier:1b,Duration:60,ShowParticles:0b}]}
summon minecraft:creeper ~ ~8 ~-2 {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,powered:1b,ExplosionRadius:3b,Fuse:40,ignited:1b,Motion:[-0.75,-0.75,-0.75],Tags:["giant"],CustomName:'{"text":"BOOM!","color":"red","bold":true}',ActiveEffects:[{Id:14b,Amplifier:1b,Duration:60,ShowParticles:0b}]}