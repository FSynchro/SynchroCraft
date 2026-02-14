// Animania Farm Animals Thaumcraft Aspects
// Adds aspects to all animals and items from Animania Farm mod
// Uses ONLY valid Thaumcraft aspects

import mods.thaumcraft.Aspects;

// ===== GOAT ENTITIES (All Breeds) =====
// Does - Female Goats
<entity:animania:doe_alpine>.setAspects(<aspect:bestia>*4, <aspect:terra>*2, <aspect:victus>*2);
<entity:animania:doe_angora>.setAspects(<aspect:bestia>*4, <aspect:terra>*2, <aspect:victus>*2, <aspect:fabrico>*2);
<entity:animania:doe_fainting>.setAspects(<aspect:bestia>*4, <aspect:terra>*2, <aspect:victus>*2, <aspect:perditio>*1);
<entity:animania:doe_kiko>.setAspects(<aspect:bestia>*4, <aspect:terra>*2, <aspect:victus>*3);
<entity:animania:doe_kinder>.setAspects(<aspect:bestia>*4, <aspect:terra>*2, <aspect:victus>*2);
<entity:animania:doe_nigerian_dwarf>.setAspects(<aspect:bestia>*3, <aspect:terra>*2, <aspect:victus>*2);
<entity:animania:doe_pygmy>.setAspects(<aspect:bestia>*3, <aspect:terra>*2, <aspect:victus>*2);

// Bucks - Male Goats
<entity:animania:buck_alpine>.setAspects(<aspect:bestia>*5, <aspect:terra>*2, <aspect:victus>*2, <aspect:potentia>*1);
<entity:animania:buck_angora>.setAspects(<aspect:bestia>*5, <aspect:terra>*2, <aspect:victus>*2, <aspect:fabrico>*2, <aspect:potentia>*1);
<entity:animania:buck_fainting>.setAspects(<aspect:bestia>*5, <aspect:terra>*2, <aspect:victus>*2, <aspect:perditio>*1, <aspect:potentia>*1);
<entity:animania:buck_kiko>.setAspects(<aspect:bestia>*5, <aspect:terra>*2, <aspect:victus>*3, <aspect:potentia>*1);
<entity:animania:buck_kinder>.setAspects(<aspect:bestia>*5, <aspect:terra>*2, <aspect:victus>*2, <aspect:potentia>*1);
<entity:animania:buck_nigerian_dwarf>.setAspects(<aspect:bestia>*4, <aspect:terra>*2, <aspect:victus>*2, <aspect:potentia>*1);
<entity:animania:buck_pygmy>.setAspects(<aspect:bestia>*4, <aspect:terra>*2, <aspect:victus>*2, <aspect:potentia>*1);

// Kids - Baby Goats
<entity:animania:kid_alpine>.setAspects(<aspect:bestia>*2, <aspect:terra>*1, <aspect:victus>*1);
<entity:animania:kid_angora>.setAspects(<aspect:bestia>*2, <aspect:terra>*1, <aspect:victus>*1, <aspect:fabrico>*1);
<entity:animania:kid_fainting>.setAspects(<aspect:bestia>*2, <aspect:terra>*1, <aspect:victus>*1);
<entity:animania:kid_kiko>.setAspects(<aspect:bestia>*2, <aspect:terra>*1, <aspect:victus>*1);
<entity:animania:kid_kinder>.setAspects(<aspect:bestia>*2, <aspect:terra>*1, <aspect:victus>*1);
<entity:animania:kid_nigerian_dwarf>.setAspects(<aspect:bestia>*2, <aspect:terra>*1, <aspect:victus>*1);
<entity:animania:kid_pygmy>.setAspects(<aspect:bestia>*2, <aspect:terra>*1, <aspect:victus>*1);

// ===== DRAFT HORSE ENTITIES =====
// Mares - Female Horses
<entity:animania:mare_draft>.setAspects(<aspect:bestia>*8, <aspect:terra>*3, <aspect:motus>*4, <aspect:potentia>*3);

// Stallions - Male Horses
<entity:animania:stallion_draft>.setAspects(<aspect:bestia>*10, <aspect:terra>*3, <aspect:motus>*5, <aspect:potentia>*5);

// Foals - Baby Horses
<entity:animania:foal_draft>.setAspects(<aspect:bestia>*4, <aspect:terra>*2, <aspect:motus>*2, <aspect:victus>*2);

// ===== GOAT PRODUCTS =====
// Goat Milk
<animania:goat_milk>.setAspects(<aspect:aqua>*3, <aspect:victus>*3, <aspect:bestia>*1);

// Goat Cheese
<animania:goat_cheese>.setAspects(<aspect:victus>*4, <aspect:bestia>*2, <aspect:permutatio>*1);

// Goat Meat
<animania:raw_chevon>.setAspects(<aspect:bestia>*4, <aspect:victus>*4);
<animania:cooked_chevon>.setAspects(<aspect:bestia>*4, <aspect:victus>*6, <aspect:ignis>*1);

// Goat Horn
<animania:goat_horn>.setAspects(<aspect:bestia>*2, <aspect:instrumentum>*1, <aspect:sonus>*1);

// Mohair (from Angora goats)
<animania:mohair>.setAspects(<aspect:fabrico>*3, <aspect:bestia>*2);

// ===== HORSE PRODUCTS =====
// Draft Horse specific items would go here if they exist in the mod

print("Animania Farm Animals Thaumcraft Aspects loaded successfully!");
