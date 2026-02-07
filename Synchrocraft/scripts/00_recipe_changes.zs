#Name: recipe_changes.zs
#Author: Feed the Beast + FSync


#do the imports!

import mods.thaumcraft.Infusion;
import mods.thaumcraft.ArcaneWorkbench;
import mods.jei.JEI;

print("Initializing 'recipe_changes.zs'...");




	#Atempt to fix TiC grout shapless recipe
recipes.addShapeless(<tconstruct:soil> * 2, [<minecraft:sand>, <minecraft:gravel>, <minecraft:clay_ball>]);

	#Fix wood gear recipe in grindstone
recipes.remove(<appliedenergistics2:material:40>);

	#Remove ExU2 Sickles to prevent overlap with Thermal Foundation Sickles
recipes.remove(<extrautils2:sickle_wood>);
recipes.remove(<extrautils2:sickle_stone>);
recipes.remove(<extrautils2:sickle_iron>);
recipes.remove(<extrautils2:sickle_gold>);
recipes.remove(<extrautils2:sickle_diamond>);


	#Remove Thaumcraft Magic mirror recipe to change it to something else
recipes.remove(<thaumcraft:mirrored_glass>);
recipes.addShapeless(<thaumcraft:mirrored_glass> * 2,
	[<ore:paneGlassColorless>, <thaumcraft:quicksilver>, <ore:paneGlassColorless>]
);


	#Changed Bark recipe to prevent overlap with Wood piles
recipes.remove(<quark:bark:5>);
recipes.addShaped(<quark:bark:5> * 2, 
	[
		[<minecraft:log2:1>, <minecraft:log2:1>, <minecraft:log2:1>],
		[<minecraft:log2:1>, <minecraft:log2:1>, <minecraft:log2:1>],
		[<minecraft:log2:1>, <minecraft:log2:1>, <minecraft:log2:1>]
	]
);

recipes.remove(<quark:bark:4>);
recipes.addShaped(<quark:bark:4> * 2,
	[
		[<minecraft:log2>, <minecraft:log2>, <minecraft:log2>],
		[<minecraft:log2>, <minecraft:log2>, <minecraft:log2>],
		[<minecraft:log2>, <minecraft:log2>, <minecraft:log2>]
	]
);

recipes.remove(<quark:bark:3>);
recipes.addShaped(<quark:bark:3> * 2,
	[
		[<minecraft:log:3>, <minecraft:log:3>, <minecraft:log:3>],
		[<minecraft:log:3>, <minecraft:log:3>, <minecraft:log:3>],
		[<minecraft:log:3>, <minecraft:log:3>, <minecraft:log:3>]
	]
);

recipes.remove(<quark:bark:2>);
recipes.addShaped(<quark:bark:2> * 2,
	[
		[<minecraft:log:2>, <minecraft:log:2>, <minecraft:log:2>],
		[<minecraft:log:2>, <minecraft:log:2>, <minecraft:log:2>],
		[<minecraft:log:2>, <minecraft:log:2>, <minecraft:log:2>]
	]
);

recipes.remove(<quark:bark:1>);
recipes.addShaped(<quark:bark:1> * 2,
	[
		[<minecraft:log:1>, <minecraft:log:1>, <minecraft:log:1>],
		[<minecraft:log:1>, <minecraft:log:1>, <minecraft:log:1>],
		[<minecraft:log:1>, <minecraft:log:1>, <minecraft:log:1>]
	]
);

recipes.remove(<quark:bark>);
recipes.addShaped(<quark:bark> * 2,
	[
		[<minecraft:log>, <minecraft:log>, <minecraft:log>],
		[<minecraft:log>, <minecraft:log>, <minecraft:log>],
		[<minecraft:log>, <minecraft:log>, <minecraft:log>]
	]
);

	#Convert Quark deco adds to vanilla equiv
recipes.addShapeless(<minecraft:trapped_chest>,
	[<quark:custom_chest_trap:4>]
);
recipes.addShapeless(<minecraft:trapped_chest>,
	[<quark:custom_chest_trap:3>]
);
recipes.addShapeless(<minecraft:trapped_chest>,
	[<quark:custom_chest_trap:2>]
);
recipes.addShapeless(<minecraft:trapped_chest>,
	[<quark:custom_chest_trap:1>]
);
recipes.addShapeless(<minecraft:trapped_chest>,
	[<quark:custom_chest_trap>]
);
recipes.addShapeless(<minecraft:chest>,
	[<quark:custom_chest:4>]
);
recipes.addShapeless(<minecraft:chest>,
	[<quark:custom_chest:3>]
);
recipes.addShapeless(<minecraft:chest>,
	[<quark:custom_chest:2>]
);
recipes.addShapeless(<minecraft:chest>,
	[<quark:custom_chest:1>]
);
recipes.addShapeless(<minecraft:chest>,
	[<quark:custom_chest>]
);

	#Items removed due to bugs
recipes.remove(<actuallyadditions:item_bag>);
<actuallyadditions:item_bag>.addTooltip(format.darkRed("Disabled due to bug!"));
recipes.remove(<extrautils2:bagofholding>);
<extrautils2:bagofholding>.addTooltip(format.darkRed("Disabled due to bug!"));

	#Reduce crafting of bronze ingots to 2 from 4 in crafting table, various machine outputs are still 4
recipes.remove(<forestry:ingot_bronze>);
recipes.addShapeless(<thermalfoundation:material:163> * 2,
	[<ore:ingotCopper>, <ore:ingotCopper>, <ore:ingotCopper>, <ore:ingotTin>]
);

	#Fix bronze gear recipe
recipes.addShaped(<thermalfoundation:material:291>,
	[
		[null, <ore:ingotBronze>, null],
		[<ore:ingotBronze>, <minecraft:iron_ingot>, <ore:ingotBronze>],
		[null, <ore:ingotBronze>, null]
	]
);

	#Experience Solidifier
recipes.remove(<actuallyadditions:block_xp_solidifier>);
recipes.addShaped(<actuallyadditions:block_xp_solidifier>,
	[
		[<minecraft:emerald>, <minecraft:emerald>, <minecraft:emerald>],
		[<actuallyadditions:block_crystal_empowered:2>, <actuallyadditions:item_misc:8>, <actuallyadditions:block_crystal_empowered:2>],
		[<minecraft:emerald>, <minecraft:emerald>, <minecraft:emerald>]
	]
);


	#Architecture Craft Pulley
recipes.remove(<architecturecraft:largepulley>);
recipes.addShaped(<architecturecraft:largepulley>,
	[
		[null, <ore:slabWood>, null],
		[<ore:slabWood>, <ore:plankWood>, <ore:slabWood>],
		[null, <ore:slabWood>, null]
	]
);

	#Removed Charcoal Block (chisel) to allow AA's version be default which is registered as a fuel type
recipes.remove(<chisel:block_charcoal2:1>);

	#Wither ash
recipes.addShaped(<minecraft:skull:1>,
	[
		[<quark:black_ash>, <quark:black_ash>, <quark:black_ash>],
		[<quark:black_ash>, <minecraft:skull>, <quark:black_ash>],
		[<quark:black_ash>, <quark:black_ash>, <quark:black_ash>]
	]
);

	#Essence of Scornful Oblivion
recipes.addShaped(<magicbees:resource:11>,
	[
		[<magicbees:resource:8>, <minecraft:skull:1>, <magicbees:resource:9>],
		[<minecraft:skull:1>, null, <minecraft:skull:1>],
		[<magicbees:resource:9>, <minecraft:skull:1>, <magicbees:resource:8>]
	]
);

	#End star fix
recipes.remove(<minecraft:end_crystal>);
recipes.addShaped(<minecraft:end_crystal>,
	[
		[<ore:paneGlassColorless>, <ore:paneGlassColorless>, <ore:paneGlassColorless>],
		[<ore:paneGlassColorless>, <minecraft:nether_star>, <ore:paneGlassColorless>],
		[<ore:paneGlassColorless>, <minecraft:ghast_tear>, <ore:paneGlassColorless>]
	]
);

	#revamp futura block recipe due to conflicting CC recipe
recipes.remove(<chisel:futura>);
recipes.addShaped(<chisel:futura>,
	[
		[<minecraft:stone>, <minecraft:redstone>, <minecraft:stone>],
		[<minecraft:stone>, <minecraft:redstone>, <minecraft:redstone>],
		[<minecraft:stone>, <minecraft:redstone>, <minecraft:stone>]
	]
);

	#Remove blutonium recipe as there is one added by draconic evolution
recipes.remove(<bigreactors:ingotblutonium>);


print("Initialising removing forbidden machines in 'recipe_changes.zs'");
#Remove forbidden machines
recipes.remove(<enderio:block_powered_spawner>);
recipes.remove(<draconicevolution:draconic_spawner>);
mods.jei.JEI.removeAndHide(<draconicevolution:draconic_spawner>);  
recipes.remove(<rftools:spawner>);
recipes.remove(<actuallyadditions:block_farmer>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_farmer>); 
recipes.remove(<enderio:block_farm_station>);
mods.jei.JEI.removeAndHide(<enderio:block_farm_station>); 
recipes.remove(<draconicevolution:grinder>);
mods.jei.JEI.removeAndHide(<draconicevolution:grinder>); 
recipes.remove(<draconicevolution:generator>);
mods.jei.JEI.removeAndHide(<draconicevolution:generator>); 
recipes.remove(<draconicevolution:draconium_chest>);
mods.jei.JEI.removeAndHide(<draconicevolution:draconium_chest>); 
recipes.remove(<actuallyadditions:block_item_viewer_hopping>);
recipes.remove(<actuallyadditions:block_coal_generator>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_coal_generator>); 
recipes.remove(<actuallyadditions:block_item_viewer_hopping>);
recipes.remove(<tconstruct:wooden_hopper>);
mods.jei.JEI.removeAndHide(<tconstruct:wooden_hopper>); 

print("Done removing forbidden machines in 'recipe_changes.zs'");


    #Add the knightslime Atomic reconstructor recipe
mods.actuallyadditions.AtomicReconstructor.addRecipe(<industrialforegoing:pink_slime_ingot>, <tconstruct:ingots:3>, 250000);

	#Add the Draconium dust to Yellorium recipe
mods.actuallyadditions.AtomicReconstructor.addRecipe(<draconicevolution:draconium_dust>, <bigreactors:dustyellorium>, 50000);

	#Add the EnvironmentalTech Recipes Kyronite and the function block Mica
mods.actuallyadditions.AtomicReconstructor.addRecipe(<environmentaltech:kyronite>, <environmentaltech:erodium>, 200000);
mods.actuallyadditions.AtomicReconstructor.addRecipe(<environmentaltech:mica>, <thermalfoundation:storage:7>, 250000);

	#Add the pinkslime recipe after removing the mob slaughterhouse option.
mods.actuallyadditions.AtomicReconstructor.addRecipe(<industrialforegoing:pink_slime>, <minecraft:slime_ball>,  250000);
mods.actuallyadditions.AtomicReconstructor.addRecipe(<industrialforegoing:pink_slime>, <tconstruct:edible:1>, 250000);

	#Transposer recipe for EnvironmentalTech Erodium
mods.thermalexpansion.Transposer.addFillRecipe(<environmentaltech:erodium>, <environmentaltech:litherite>, <liquid:ender> * 2000, 200);

##########           2024 build additions      ##########




print("Init Thaumcraft infusion changes");
mods.thaumcraft.Infusion.registerRecipe("Chaos Fragments", "RIFTCLOSER", <draconicevolution:chaos_shard:3>, 20, [<aspect:metallum>*700, <aspect:ignis>*780, <aspect:perditio>*300, <aspect:exanimis>*200, <aspect:draco>*200, <aspect:exitium>*500], <draconicevolution:energy_storage_core>, [<thaumcraft:metal_void>, <draconicevolution:draconic_block>, <thaumcraft:metal_void>, <draconicevolution:draconic_block>, <thaumcraft:metal_void>, <draconicevolution:draconic_block>]);
mods.jei.JEI.addDescription(<draconicevolution:chaos_shard:3>, "Kill the Chaos dragon, or infuse it with Thaumcraft, you will need to know how to close rifts!");

mods.thaumcraft.Infusion.registerRecipe("Primordial pearls", "RIFTCLOSER", <thaumcraft:primordial_pearl>, 20, [<aspect:vitium>*700, <aspect:alienis>*480, <aspect:perditio>*600, <aspect:caeles>*200, <aspect:exitium>*200, <aspect:vacuos>*420, <aspect:fluctus>*500], <thaumcraft:causality_collapser>, [<actuallyadditions:block_crystal_empowered:3>, <thaumcraft:metal_void>, <thaumcraft:metal_void>, <thaumcraft:metal_void>, <thaumcraft:metal_void>, <actuallyadditions:block_crystal_empowered:3>]);
mods.jei.JEI.addDescription(<thaumcraft:primordial_pearl>, "You will get these closing rifts, learn how to close rifts!");



#Thaumic energistics infusion fix
val OrdoCrystal = <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]});
val AerCrystal = <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]});
val AquaCrystal = <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]});
val PerditioCrystal = <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]});
val TerraCrystal = <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]});
val IgnisCrystal = <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]});

print("Thaumcraft infusion changes complete");

#thaumic energistics arcane table crafting fixes
mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumicenergistics:blank_knowledge_core>);
mods.thaumcraft.Infusion.registerRecipe("blank knowledge core", "KNOWLEDGECORE", <thaumicenergistics:blank_knowledge_core>, 6, [<aspect:fabrico>*50, <aspect:permutatio>*50, <aspect:cognitio>*20, <aspect:metallum>*8, <aspect:vitreus>*8], <appliedenergistics2:material:52>, [OrdoCrystal, <appliedenergistics2:quartz_vibrant_glass>, <thaumcraft:morphic_resonator>, <thaumcraft:brain>, <appliedenergistics2:quartz_vibrant_glass>, TerraCrystal, AquaCrystal,  <appliedenergistics2:quartz_vibrant_glass>, <thaumcraft:morphic_resonator>, <ore:dyeBlue>,  <appliedenergistics2:quartz_vibrant_glass>, <appliedenergistics2:material:23>]);



print("Init Overhaul Recipes");

recipes.remove(<draconicevolution:fusion_crafting_core>);
recipes.addShaped(<draconicevolution:fusion_crafting_core>,
	[
		[<actuallyadditions:block_crystal_empowered:1>, <actuallyadditions:item_crystal:2>, <actuallyadditions:block_crystal_empowered:1>],
		[<actuallyadditions:item_crystal:2>, <minecraft:shulker_shell>, <actuallyadditions:item_crystal:2>],
		[<actuallyadditions:block_crystal_empowered:1>, <actuallyadditions:item_crystal:2>, <actuallyadditions:block_crystal_empowered:1>]
	]
);

recipes.remove(<draconicevolution:crafting_injector:0>);
recipes.addShaped(<draconicevolution:crafting_injector:0>,
	[
		[<actuallyadditions:item_crystal:2>, <draconicevolution:draconic_core>, <actuallyadditions:item_crystal:2>],
		[<minecraft:stone>, <thermalfoundation:material:352>, <minecraft:stone>],
		[<thermalfoundation:material:294>, <thermaldynamics:duct_0:5>, <thermalfoundation:material:294>]
	]
);

recipes.remove(<draconicevolution:draconic_core>);
recipes.addShaped(<draconicevolution:draconic_core>,
	[
		[<draconicevolution:draconium_ingot>, <tconstruct:ingots:2>, <draconicevolution:draconium_ingot>],
		[<thaumcraft:plate:2>, <actuallyadditions:item_crystal_empowered:2>, <thermalfoundation:material:353>],
		[<draconicevolution:draconium_ingot>, <woot:stygianironplate>, <draconicevolution:draconium_ingot>]
	]
);

recipes.remove(<environmentaltech:void_ore_miner_cont_1>);
recipes.addShaped(<environmentaltech:void_ore_miner_cont_1>,
	[
		[<environmentaltech:litherite_bricks>, <draconicevolution:draconic_block>, <environmentaltech:litherite_bricks>],
		[<environmentaltech:litherite_bricks>, <environmentaltech:diode>, <environmentaltech:litherite_bricks>],
		[<environmentaltech:interconnect>, <environmentaltech:laser_lens>, <environmentaltech:interconnect>]
	]
);

recipes.remove(<valkyrielib:modifier_component>);
recipes.addShaped(<valkyrielib:modifier_component>,
	[
		[<minecraft:concrete:15>, <actuallyadditions:item_crystal:0>, <minecraft:concrete:15>],
		[<actuallyadditions:item_crystal:0>, <actuallyadditions:block_crystal_empowered:5>, <actuallyadditions:item_crystal:0>],
		[<minecraft:concrete:15>, <actuallyadditions:item_crystal:0>, <minecraft:concrete:15>]
	]
);

recipes.remove(<draconicevolution:wyvern_pick>);
mods.thaumcraft.Infusion.registerRecipe("Draconic Pickaxe", "RIFTCLOSER", <draconicevolution:wyvern_pick>, 5, [<aspect:metallum>*50, <aspect:motus>*200, <aspect:perditio>*300, <aspect:fabrico>*200], <thaumcraft:elemental_pick>, [<draconicevolution:wyvern_core>, <draconicevolution:draconium_ingot>, <draconicevolution:draconium_ingot>, <draconicevolution:wyvern_energy_core>]);
mods.jei.JEI.addDescription(<draconicevolution:wyvern_pick>, "To know how to make this, learn how to close thaumic rifts!");

recipes.remove(<draconicevolution:wyvern_sword>);
mods.thaumcraft.Infusion.registerRecipe("Draconic Sword", "RIFTCLOSER", <draconicevolution:wyvern_sword>, 5, [<aspect:metallum>*50, <aspect:motus>*200, <aspect:perditio>*300, <aspect:fabrico>*200], <thaumcraft:elemental_sword>, [<draconicevolution:wyvern_core>, <draconicevolution:draconium_ingot>, <draconicevolution:draconium_ingot>, <draconicevolution:wyvern_energy_core>]);
mods.jei.JEI.addDescription(<draconicevolution:wyvern_sword>, "To know how to make this, learn how to close thaumic rifts!");

recipes.remove(<draconicevolution:wyvern_shovel>);
mods.thaumcraft.Infusion.registerRecipe("Draconic shovel", "RIFTCLOSER", <draconicevolution:wyvern_shovel>, 5, [<aspect:metallum>*50, <aspect:motus>*200, <aspect:perditio>*300, <aspect:fabrico>*200], <thaumcraft:elemental_shovel>, [<draconicevolution:wyvern_core>, <draconicevolution:draconium_ingot>, <draconicevolution:draconium_ingot>, <draconicevolution:wyvern_energy_core>]);
mods.jei.JEI.addDescription(<draconicevolution:wyvern_shovel>, "To know how to make this, learn how to close thaumic rifts!");

recipes.remove(<draconicevolution:wyvern_helm>);
mods.thaumcraft.Infusion.registerRecipe("Draconic helm", "RIFTCLOSER", <draconicevolution:wyvern_helm>, 15, [<aspect:metallum>*50, <aspect:motus>*200, <aspect:perditio>*300, <aspect:praemunio>*400], <thaumcraft:fortress_helm>, [<draconicevolution:wyvern_core>, <draconicevolution:draconium_ingot>, <draconicevolution:draconium_ingot>, <draconicevolution:wyvern_energy_core>]);
mods.jei.JEI.addDescription(<draconicevolution:wyvern_helm>, "To know how to make this, learn how to close thaumic rifts!");

recipes.remove(<draconicevolution:wyvern_chest>);
mods.thaumcraft.Infusion.registerRecipe("Draconic chest", "RIFTCLOSER", <draconicevolution:wyvern_chest>, 15, [<aspect:metallum>*50, <aspect:motus>*200, <aspect:perditio>*300, <aspect:praemunio>*400], <thaumcraft:fortress_chest>, [<draconicevolution:wyvern_core>, <draconicevolution:draconium_ingot>, <draconicevolution:draconium_ingot>, <draconicevolution:wyvern_energy_core>]);
mods.jei.JEI.addDescription(<draconicevolution:wyvern_chest>, "To know how to make this, learn how to close thaumic rifts!");

recipes.remove(<draconicevolution:wyvern_legs>);
mods.thaumcraft.Infusion.registerRecipe("Draconic legs", "RIFTCLOSER", <draconicevolution:wyvern_legs>, 15, [<aspect:metallum>*50, <aspect:motus>*200, <aspect:perditio>*300, <aspect:praemunio>*400], <thaumcraft:fortress_legs>, [<draconicevolution:wyvern_core>, <draconicevolution:draconium_ingot>, <draconicevolution:draconium_ingot>, <draconicevolution:wyvern_energy_core>]);
mods.jei.JEI.addDescription(<draconicevolution:wyvern_legs>, "To know how to make this, learn how to close thaumic rifts!");

recipes.remove(<draconicevolution:wyvern_boots>);
mods.thaumcraft.Infusion.registerRecipe("Draconic boots", "RIFTCLOSER", <draconicevolution:wyvern_boots>, 15, [<aspect:metallum>*50, <aspect:motus>*200, <aspect:perditio>*300, <aspect:praemunio>*400], <thaumcraft:traveller_boots>, [<draconicevolution:wyvern_core>, <draconicevolution:draconium_ingot>, <draconicevolution:draconium_ingot>, <draconicevolution:wyvern_energy_core>]);
mods.jei.JEI.addDescription(<draconicevolution:wyvern_boots>, "To know how to make this, learn how to close thaumic rifts!");

mods.thaumcraft.Infusion.registerRecipe("Ambient Grass", "", <thaumcraft:grass_ambient>, 3, [<aspect:terra>*50, <aspect:auram>*100, <aspect:lux>*10, <aspect:praecantatio>*100], <minecraft:dirt>, [TerraCrystal, TerraCrystal, OrdoCrystal]);

recipes.remove(<draconicevolution:wyvern_core>);
recipes.addShaped(<draconicevolution:wyvern_core>,
	[
		[<draconicevolution:draconium_ingot>, <thaumcraft:jar_brain>, <draconicevolution:draconium_ingot>],
		[<draconicevolution:draconic_core>, <minecraft:nether_star>, <draconicevolution:draconic_core>],
		[<industrialforegoing:plastic>, <enderio:item_material:11>, <rftools:infused_diamond>]
	]
);
recipes.remove(<draconicevolution:energy_storage_core>);
recipes.addShaped(<draconicevolution:energy_storage_core>,
	[
		[<draconicevolution:draconium_ingot>, <draconicevolution:draconium_ingot>, <draconicevolution:draconium_ingot>],
		[<draconicevolution:wyvern_energy_core>, <thaumcraft:causality_collapser>, <draconicevolution:wyvern_energy_core>],
		[<draconicevolution:draconium_ingot>, <draconicevolution:draconium_ingot>, <draconicevolution:draconium_ingot>]
	]
);

#disabled because Opperdepop
recipes.remove(<draconicevolution:celestial_manipulator>);



#Added these recipes due to the research necessity of Thaumic additions plate crafting necessity
mods.thaumcraft.ArcaneWorkbench.registerShapelessRecipe("mithrillium_plate", "", 20, [<aspect:ordo>, <aspect:ignis>, <aspect:terra>], <thaumadditions:mithrillium_plate>, [<thaumadditions:mithrillium_ingot>, <thermalfoundation:material:1027>, <thermalfoundation:material:328>, <thaumcraft:plate:3>]);
mods.thaumcraft.ArcaneWorkbench.registerShapelessRecipe("adaminite_plate", "", 20, [<aspect:ordo>, <aspect:ignis>, <aspect:terra>], <thaumadditions:adaminite_plate>, [<thaumadditions:adaminite_ingot>, <thermalfoundation:material:1027>, <thermalfoundation:material:328>, <thaumcraft:plate:3>]);
mods.thaumcraft.ArcaneWorkbench.registerShapelessRecipe("mithminite_plate", "", 20, [<aspect:ordo>, <aspect:ignis>, <aspect:terra>], <thaumadditions:mithminite_plate>, [<thaumadditions:mithminite_ingot>, <thermalfoundation:material:1027>, <thermalfoundation:material:328>, <thaumcraft:plate:3>]);


#make clay more reachable.
mods.thermalexpansion.Transposer.addFillRecipe(<minecraft:clay>, <minecraft:dirt>, <liquid:water> * 1000, 100);

#some spawners can still be mined but we have no use for them for now, let's use them
mods.actuallyadditions.AtomicReconstructor.addRecipe(<woot:endershard>, <enderio:item_broken_spawner>, 10000);




print("Initialized 'recipe_changes.zs'");
