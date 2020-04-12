#This function will reward all players on the same team the guardian advancement

#------------------
#   Multiplayer
#------------------
execute at @a[team=redTeam,advancements={skyisland:hknowledge=true}] run advancement grant @a[team=redTeam] only skyisland:hknowledge
execute at @a[team=redTeam,advancements={skyisland:hknowledge=true}] run give @s minecraft:knowledge_book{Tags:["hknowledge"],HideFlags:1,Enchantments:[{id:"minecraft:protection",lvl:1}],Recipes:["skyisland:emerald_items/emerald_axe","skyisland:emerald_items/emerald_pickaxe","skyisland:emerald_items/emerald_sword","skyisland:emerald_items/emerald_hoe","skyisland:emerald_items/emerald_shovel","skyisland:emerald_items/emerald_helmet","skyisland:emerald_items/emerald_chestplate","skyisland:emerald_items/emerald_leggings","skyisland:emerald_items/emerald_boots"],display:{Name:"{\"text\":\"Book of Lost Knowledge\",\"bold\":\"true\",\"color\":\"red\",\"italic\":\"false\"}",Lore:["{\"text\":\"Grants Ability to Craft\",\"color\":\"blue\",\"italic\":\"false\"}","{\"text\":\"Inconspicuous Patterns\",\"color\":\"blue\",\"italic\":\"false\"}"]}} 1



