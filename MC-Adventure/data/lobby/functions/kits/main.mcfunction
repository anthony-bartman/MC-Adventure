#--------------------------------------
# Author: Anthony Bartman
# Date Edited: 2-2-20
# Desc: This will be handle all of the kits books and selections of kits, etc...
#--------------------------------------

#Kit Selection
execute as @a[team=!,scores={chooseKit=1}] run function lobby:kits/select_knight
execute as @a[team=!,scores={chooseKit=3}] run function lobby:kits/select_archer
execute as @a[team=!,scores={chooseKit=5}] run function lobby:kits/select_heavy
execute as @a[team=!,scores={chooseKit=7}] run function lobby:kits/thing
execute as @a[team=!,scores={chooseKit=9}] run function lobby:kits/thing1
#Makes sure players cannot destroy their kit books and items
execute unless entity @a[team=!,scores={chooseKit=0..},nbt={Inventory:[{id:"minecraft:written_book",Count:1b,tag:{Tags:["kitSelection"]}}]}] as @a[team=!,scores={chooseKit=0..}] run function lobby:kits/selection_book
execute unless entity @a[team=!,scores={chooseKit=2},nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:golden_helmet"},{Slot:102b,Count:1b,id:"minecraft:golden_chestplate"},{Slot:101b,Count:1b,id:"minecraft:golden_leggings"},{Slot:100b,Count:1b,id:"minecraft:golden_boots"},{Slot:7b,Count:1b,id:"minecraft:stone_sword"}]}] as @a[team=!,scores={chooseKit=2}] run function lobby:kits/get_knight
execute unless entity @a[team=!,scores={chooseKit=4},nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:leather_helmet"},{Slot:102b,Count:1b,id:"minecraft:leather_chestplate"},{Slot:101b,Count:1b,id:"minecraft:leather_leggings"},{Slot:100b,Count:1b,id:"minecraft:leather_boots"},{Slot:7b,Count:1b,id:"minecraft:bow"}]}] as @a[team=!,scores={chooseKit=4}] run function lobby:kits/get_archer
execute unless entity @a[team=!,scores={chooseKit=6},nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:iron_helmet"},{Slot:102b,Count:1b,id:"minecraft:iron_chestplate"},{Slot:101b,Count:1b,id:"minecraft:iron_leggings"},{Slot:100b,Count:1b,id:"minecraft:iron_boots"},{Slot:7b,Count:1b,id:"minecraft:wooden_sword"}]}] as @a[team=!,scores={chooseKit=6}] run function lobby:kits/get_heavy
execute at @a[team=!,scores={chooseKit=0..},tag=!leader] run kill @e[type=item,distance=..3]

