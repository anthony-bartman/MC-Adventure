#This handles when a player walks into the teleportation beacon
#Timer based stuff
execute if score tpTimer time matches 210 run title @a[distance=..1.5] title {"text":"Teleporting...","color":"white","bold":true}

#Cool Sounds Based on timer
execute if score tpTimer time matches 5 run title @a[distance=..1.5] actionbar {"text":" "}
execute if score tpTimer time matches 25 run playsound minecraft:block.beacon.power_select master @a[distance=..5] ~ ~ ~ 100
execute if score tpTimer time matches 90 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..5] ~ ~ ~ 100
execute if score tpTimer time matches 130 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..5] ~ ~ ~ 100
execute if score tpTimer time matches 190 run playsound minecraft:entity.lightning_bolt.impact master @a[distance=..5] ~ ~ ~ 100
execute if score tpTimer time matches 210 run playsound minecraft:entity.wither.spawn master @a[distance=..5] ~ ~ ~ 100
execute if score tpTimer time matches 300 run playsound minecraft:entity.illusioner.prepare_mirror master @a[distance=..5] ~ ~ ~ 100

#Cool effects based on timer
execute if score tpTimer time matches 300 run effect give @a[distance=..2] minecraft:blindness 3 10 true
execute if score tpTimer time matches 325 run summon area_effect_cloud ~ ~3 ~ {Particle:explosion_emitter,WaitTime:5}
execute if score tpTimer time matches 330 run summon firework_rocket ~ ~1 ~ {FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Colors:[I;3599359,3735491],FadeColors:[I;16777215]},{Type:2,Colors:[I;1877247,16777215],FadeColors:[I;3735551]}]}}}}
