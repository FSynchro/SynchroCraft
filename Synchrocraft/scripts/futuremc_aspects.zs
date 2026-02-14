// FutureMC Thaumcraft Aspects
// Adds aspects to all items and mobs from the FutureMC mod

import mods.thaumcraft.Aspects;

// ===== FISH ENTITIES =====
// Fish mobs from 1.13
<entity:futuremc:cod>.setAspects(<aspect:bestia>*2, <aspect:aqua>*3);
<entity:futuremc:salmon>.setAspects(<aspect:bestia>*2, <aspect:aqua>*3, <aspect:victus>*1);
<entity:futuremc:pufferfish>.setAspects(<aspect:bestia>*2, <aspect:aqua>*3, <aspect:venenum>*2);
<entity:futuremc:tropical_fish>.setAspects(<aspect:bestia>*2, <aspect:aqua>*3, <aspect:sensus>*1);

// ===== ANIMAL ENTITIES =====
// Panda from 1.14
<entity:futuremc:panda>.setAspects(<aspect:bestia>*5, <aspect:terra>*3, <aspect:herba>*2);

// Bee from 1.15
<entity:futuremc:bee>.setAspects(<aspect:bestia>*1, <aspect:volatus>*2, <aspect:aer>*1, <aspect:fames>*1);

// ===== FISH ITEMS =====
<minecraft:fish:0>.setAspects(<aspect:bestia>*2, <aspect:aqua>*2, <aspect:fames>*1);  // Cod
<minecraft:fish:1>.setAspects(<aspect:bestia>*2, <aspect:aqua>*2, <aspect:fames>*2);  // Salmon
<futuremc:pufferfish>.setAspects(<aspect:bestia>*2, <aspect:aqua>*2, <aspect:venenum>*3);
<futuremc:tropical_fish>.setAspects(<aspect:bestia>*2, <aspect:aqua>*2, <aspect:sensus>*2);
<futuremc:cooked_cod>.setAspects(<aspect:bestia>*2, <aspect:ignis>*1, <aspect:fames>*3);
<futuremc:cooked_salmon>.setAspects(<aspect:bestia>*2, <aspect:ignis>*1, <aspect:fames>*4);

// ===== WEAPONS & TOOLS =====
// Trident
<futuremc:trident>.setAspects(<aspect:telum>*8, <aspect:aqua>*5, <aspect:potentia>*4, <aspect:instrumentum>*3);

// Netherite Tools and Armor
<futuremc:netherite_sword>.setAspects(<aspect:telum>*10, <aspect:ignis>*4, <aspect:metallum>*8, <aspect:potentia>*6);
<futuremc:netherite_pickaxe>.setAspects(<aspect:instrumentum>*10, <aspect:ignis>*4, <aspect:metallum>*8, <aspect:perfodio>*6);
<futuremc:netherite_axe>.setAspects(<aspect:instrumentum>*10, <aspect:ignis>*4, <aspect:metallum>*8, <aspect:arbor>*4);
<futuremc:netherite_shovel>.setAspects(<aspect:instrumentum>*10, <aspect:ignis>*4, <aspect:metallum>*8, <aspect:terra>*4);
<futuremc:netherite_hoe>.setAspects(<aspect:instrumentum>*10, <aspect:ignis>*4, <aspect:metallum>*8, <aspect:messis>*4);
<futuremc:netherite_helmet>.setAspects(<aspect:tutamen>*10, <aspect:ignis>*4, <aspect:metallum>*10);
<futuremc:netherite_chestplate>.setAspects(<aspect:tutamen>*16, <aspect:ignis>*4, <aspect:metallum>*16);
<futuremc:netherite_leggings>.setAspects(<aspect:tutamen>*14, <aspect:ignis>*4, <aspect:metallum>*14);
<futuremc:netherite_boots>.setAspects(<aspect:tutamen>*8, <aspect:ignis>*4, <aspect:metallum>*8);

// ===== BLOCKS =====
// Lantern
<futuremc:lantern>.setAspects(<aspect:lux>*4, <aspect:metallum>*2, <aspect:ignis>*2);

// Bell
<futuremc:bell>.setAspects(<aspect:metallum>*5, <aspect:sensus>*3, <aspect:aer>*2);

// Chain
<futuremc:chain>.setAspects(<aspect:metallum>*4, <aspect:vinculum>*2);

// Barrel
<futuremc:barrel>.setAspects(<aspect:arbor>*6, <aspect:vacuos>*4);

// Stonecutter
<futuremc:stonecutter>.setAspects(<aspect:instrumentum>*5, <aspect:metallum>*3, <aspect:saxum>*4);

// Grindstone
<futuremc:grindstone>.setAspects(<aspect:instrumentum>*5, <aspect:arbor>*3, <aspect:saxum>*4, <aspect:fabrico>*2);

// Smoker and Blast Furnace
<futuremc:smoker>.setAspects(<aspect:ignis>*6, <aspect:fabrico>*4, <aspect:saxum>*4);
<futuremc:blast_furnace>.setAspects(<aspect:ignis>*8, <aspect:fabrico>*5, <aspect:metallum>*4, <aspect:saxum>*4);

// Campfire
<futuremc:campfire>.setAspects(<aspect:ignis>*5, <aspect:lux>*3, <aspect:arbor>*2, <aspect:saxum>*1);

// Loom
<futuremc:loom>.setAspects(<aspect:fabrico>*5, <aspect:arbor>*4, <aspect:pannus>*2);

// Composter
<futuremc:composter>.setAspects(<aspect:arbor>*4, <aspect:herba>*3, <aspect:permutatio>*2);

// Smithing Table
<futuremc:smithing_table>.setAspects(<aspect:fabrico>*6, <aspect:metallum>*4, <aspect:arbor>*4);

// ===== FLOWERS & DYES =====
<futuremc:lily_of_the_valley>.setAspects(<aspect:herba>*2, <aspect:sensus>*1);
<futuremc:wither_rose>.setAspects(<aspect:herba>*2, <aspect:mortuus>*3, <aspect:venenum>*2);
<futuremc:cornflower>.setAspects(<aspect:herba>*2, <aspect:sensus>*1);

<futuremc:white_dye>.setAspects(<aspect:sensus>*2);
<futuremc:black_dye>.setAspects(<aspect:sensus>*2, <aspect:tenebrae>*1);
<futuremc:blue_dye>.setAspects(<aspect:sensus>*2, <aspect:aqua>*1);

// ===== STRIPPED LOGS & WOOD =====
<futuremc:stripped_oak_log>.setAspects(<aspect:arbor>*4);
<futuremc:stripped_spruce_log>.setAspects(<aspect:arbor>*4);
<futuremc:stripped_birch_log>.setAspects(<aspect:arbor>*4);
<futuremc:stripped_jungle_log>.setAspects(<aspect:arbor>*4);
<futuremc:stripped_acacia_log>.setAspects(<aspect:arbor>*4);
<futuremc:stripped_dark_oak_log>.setAspects(<aspect:arbor>*4);

// ===== BAMBOO =====
<futuremc:bamboo>.setAspects(<aspect:herba>*2, <aspect:arbor>*1);

// ===== BERRY BUSH & BERRIES =====
<futuremc:sweet_berry_bush>.setAspects(<aspect:herba>*2, <aspect:victus>*1);
<futuremc:sweet_berries>.setAspects(<aspect:herba>*1, <aspect:fames>*2, <aspect:victus>*1);

// ===== SUSPICIOUS STEW =====
<futuremc:suspicious_stew>.setAspects(<aspect:fames>*3, <aspect:herba>*2, <aspect:praecantatio>*2);

// ===== HONEY ITEMS =====
<futuremc:honey_bottle>.setAspects(<aspect:fames>*4, <aspect:aqua>*2, <aspect:bestia>*1, <aspect:sano>*2);
<futuremc:honeycomb>.setAspects(<aspect:bestia>*2, <aspect:fabrico>*1);
<futuremc:honey_block>.setAspects(<aspect:limus>*5, <aspect:bestia>*3, <aspect:aqua>*2);
<futuremc:honeycomb_block>.setAspects(<aspect:bestia>*4, <aspect:fabrico>*2);

// ===== BEE NESTS & BEEHIVES =====
<futuremc:bee_nest>.setAspects(<aspect:arbor>*4, <aspect:bestia>*3, <aspect:fabrico>*2);
<futuremc:beehive>.setAspects(<aspect:arbor>*6, <aspect:bestia>*2, <aspect:fabrico>*3);

// ===== NETHER ITEMS =====
// Ancient Debris
<futuremc:ancient_debris>.setAspects(<aspect:metallum>*8, <aspect:ignis>*5, <aspect:desiderium>*4);

// Netherite Scrap & Ingot
<futuremc:netherite_scrap>.setAspects(<aspect:metallum>*6, <aspect:ignis>*3);
<futuremc:netherite_ingot>.setAspects(<aspect:metallum>*10, <aspect:ignis>*5, <aspect:praecantatio>*2);

// Blackstone
<futuremc:blackstone>.setAspects(<aspect:saxum>*2, <aspect:ignis>*1, <aspect:tenebrae>*1);
<futuremc:polished_blackstone>.setAspects(<aspect:saxum>*2, <aspect:ignis>*1, <aspect:ordo>*1);
<futuremc:chiseled_polished_blackstone>.setAspects(<aspect:saxum>*2, <aspect:ignis>*1, <aspect:fabrico>*1);
<futuremc:gilded_blackstone>.setAspects(<aspect:saxum>*2, <aspect:metallum>*1, <aspect:ignis>*1, <aspect:desiderium>*1);

// Basalt
<futuremc:basalt>.setAspects(<aspect:saxum>*2, <aspect:ignis>*2);
<futuremc:polished_basalt>.setAspects(<aspect:saxum>*2, <aspect:ignis>*2, <aspect:ordo>*1);

// Walls (1.14)
<futuremc:brick_wall>.setAspects(<aspect:saxum>*2);
<futuremc:andesite_wall>.setAspects(<aspect:saxum>*2);
<futuremc:diorite_wall>.setAspects(<aspect:saxum>*2);
<futuremc:granite_wall>.setAspects(<aspect:saxum>*2);
<futuremc:prismarine_wall>.setAspects(<aspect:saxum>*2, <aspect:aqua>*1);
<futuremc:stone_brick_wall>.setAspects(<aspect:saxum>*2);
<futuremc:mossy_stone_brick_wall>.setAspects(<aspect:saxum>*2, <aspect:herba>*1);
<futuremc:sandstone_wall>.setAspects(<aspect:saxum>*2, <aspect:perditio>*1);
<futuremc:red_sandstone_wall>.setAspects(<aspect:saxum>*2, <aspect:perditio>*1);
<futuremc:nether_brick_wall>.setAspects(<aspect:saxum>*2, <aspect:ignis>*1);
<futuremc:end_stone_brick_wall>.setAspects(<aspect:saxum>*2, <aspect:alienis>*1);
<futuremc:red_nether_brick_wall>.setAspects(<aspect:saxum>*2, <aspect:ignis>*1);

// ===== MUSIC DISC =====
<futuremc:music_disc_pigstep>.setAspects(<aspect:sensus>*5, <aspect:aer>*3, <aspect:praecantatio>*2);

print("FutureMC Thaumcraft Aspects loaded successfully!");
