class X2Item_Section9Schematics extends X2Item config(GameData_S9);

var config int SEBC30_MAGNETIC_SCHEMATIC_SUPPLYCOST;
var config int SEBC30_MAGNETIC_SCHEMATIC_ALLOYCOST;
var config int SEBC30_MAGNETIC_SCHEMATIC_ELERIUMCOST;

var config int SEBC30_BEAM_SCHEMATIC_SUPPLYCOST;
var config int SEBC30_BEAM_SCHEMATIC_ALLOYCOST;
var config int SEBC30_BEAM_SCHEMATIC_ELERIUMCOST;

var config int SEBM5_MAGNETIC_SCHEMATIC_SUPPLYCOST;
var config int SEBM5_MAGNETIC_SCHEMATIC_ALLOYCOST;
var config int SEBM5_MAGNETIC_SCHEMATIC_ELERIUMCOST;

var config int SEBM5_BEAM_SCHEMATIC_SUPPLYCOST;
var config int SEBM5_BEAM_SCHEMATIC_ALLOYCOST;
var config int SEBM5_BEAM_SCHEMATIC_ELERIUMCOST;

var config int KSGG1_MAGNETIC_SCHEMATIC_SUPPLYCOST;
var config int KSGG1_MAGNETIC_SCHEMATIC_ALLOYCOST;
var config int KSGG1_MAGNETIC_SCHEMATIC_ELERIUMCOST;

var config int KSGG1_BEAM_SCHEMATIC_SUPPLYCOST;
var config int KSGG1_BEAM_SCHEMATIC_ALLOYCOST;
var config int KSGG1_BEAM_SCHEMATIC_ELERIUMCOST;

var config int SEBMG_MAGNETIC_SCHEMATIC_SUPPLYCOST;
var config int SEBMG_MAGNETIC_SCHEMATIC_ALLOYCOST;
var config int SEBMG_MAGNETIC_SCHEMATIC_ELERIUMCOST;

var config int SEBMG_BEAM_SCHEMATIC_SUPPLYCOST;
var config int SEBMG_BEAM_SCHEMATIC_ALLOYCOST;
var config int SEBMG_BEAM_SCHEMATIC_ELERIUMCOST;

var config int SEBSR_MAGNETIC_SCHEMATIC_SUPPLYCOST;
var config int SEBSR_MAGNETIC_SCHEMATIC_ALLOYCOST;
var config int SEBSR_MAGNETIC_SCHEMATIC_ELERIUMCOST;

var config int SEBSR_BEAM_SCHEMATIC_SUPPLYCOST;
var config int SEBSR_BEAM_SCHEMATIC_ALLOYCOST;
var config int SEBSR_BEAM_SCHEMATIC_ELERIUMCOST;

var config int SEBC26A_MAGNETIC_SCHEMATIC_SUPPLYCOST;
var config int SEBC26A_MAGNETIC_SCHEMATIC_ALLOYCOST;
var config int SEBC26A_MAGNETIC_SCHEMATIC_ELERIUMCOST;

var config int SEBC26A_BEAM_SCHEMATIC_SUPPLYCOST;
var config int SEBC26A_BEAM_SCHEMATIC_ALLOYCOST;
var config int SEBC26A_BEAM_SCHEMATIC_ELERIUMCOST;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Schematics;
	
	Schematics.AddItem(CreateTemplate_Section9_AssaultRifle_Magnetic_Schematic());
	Schematics.AddItem(CreateTemplate_Section9_AssaultRifle_Beam_Schematic());
	
	Schematics.AddItem(CreateTemplate_Section9_Pistol_Magnetic_Schematic());
	Schematics.AddItem(CreateTemplate_Section9_Pistol_Beam_Schematic());

	Schematics.AddItem(CreateTemplate_Section9_Shotgun_Magnetic_Schematic());
	Schematics.AddItem(CreateTemplate_Section9_Shotgun_Beam_Schematic());
	
	Schematics.AddItem(CreateTemplate_Section9_Cannon_Magnetic_Schematic());
	Schematics.AddItem(CreateTemplate_Section9_Cannon_Beam_Schematic());
	
	Schematics.AddItem(CreateTemplate_Section9_SniperRifle_Magnetic_Schematic());
	Schematics.AddItem(CreateTemplate_Section9_SniperRifle_Beam_Schematic());
	
	Schematics.AddItem(CreateTemplate_Section9_SMG_Magnetic_Schematic());
	Schematics.AddItem(CreateTemplate_Section9_SMG_Beam_Schematic());

	return Schematics;
}

static function X2DataTemplate CreateTemplate_Section9_AssaultRifle_Magnetic_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'RIF_SEBC30_MG_Schematic');

	Template.ItemCat = 'weapon';
	//Template.strImage = "img:///S9_SEBUROPACK.IMG.SEBC30_sch";
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'RIF_SEBC30_MG';
	Template.HideIfPurchased = 'RIF_SEBC30_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	if (default.SEBC30_MAGNETIC_SCHEMATIC_SUPPLYCOST > 0) {
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SEBC30_MAGNETIC_SCHEMATIC_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	if (default.SEBC30_MAGNETIC_SCHEMATIC_ALLOYCOST > 0) {
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.SEBC30_MAGNETIC_SCHEMATIC_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	if (default.SEBC30_MAGNETIC_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SEBC30_MAGNETIC_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Section9_AssaultRifle_Beam_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'RIF_SEBC30_BM_Schematic');

	Template.ItemCat = 'weapon';
	//Template.strImage = "img:///S9_SEBUROPACK.IMG.SEBC30_sch";
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'RIF_SEBC30_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');
	Template.Requirements.RequiredEngineeringScore = 20;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	if (default.SEBC30_BEAM_SCHEMATIC_SUPPLYCOST > 0) {
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SEBC30_BEAM_SCHEMATIC_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	if (default.SEBC30_BEAM_SCHEMATIC_ALLOYCOST > 0) {
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.SEBC30_BEAM_SCHEMATIC_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	if (default.SEBC30_BEAM_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SEBC30_BEAM_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Section9_Pistol_Magnetic_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'PIS_SEBM5_MG_Schematic');

	Template.ItemCat = 'weapon';
	//Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Mag_Pistol";
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'PIS_SEBM5_MG';
	Template.HideIfPurchased = 'PIS_SEBM5_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	if (default.SEBM5_MAGNETIC_SCHEMATIC_SUPPLYCOST > 0) {
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SEBM5_MAGNETIC_SCHEMATIC_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	if (default.SEBM5_MAGNETIC_SCHEMATIC_ALLOYCOST > 0) {
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.SEBM5_MAGNETIC_SCHEMATIC_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	if (default.SEBM5_MAGNETIC_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SEBM5_MAGNETIC_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Section9_Pistol_Beam_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'PIS_SEBM5_BM_Schematic');

	Template.ItemCat = 'weapon';
	//Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Beam_Pistol";
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'PIS_SEBM5_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');
	Template.Requirements.RequiredEngineeringScore = 20;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	if (default.SEBM5_BEAM_SCHEMATIC_SUPPLYCOST > 0) {
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SEBM5_BEAM_SCHEMATIC_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	if (default.SEBM5_BEAM_SCHEMATIC_ALLOYCOST > 0) {
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.SEBM5_BEAM_SCHEMATIC_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	if (default.SEBM5_BEAM_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SEBM5_BEAM_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Section9_Shotgun_Magnetic_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'SG_KSGG1_MG_Schematic');

	Template.ItemCat = 'weapon';
	//Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Mag_Shotgun";
	Template.PointsToComplete = 0;
	Template.Tier = 2;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'SG_KSGG1_MG';
	Template.HideIfPurchased = 'SG_KSGG1_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.Requirements.RequiredEngineeringScore = 15;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	if (default.KSGG1_MAGNETIC_SCHEMATIC_SUPPLYCOST > 0) {
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.KSGG1_MAGNETIC_SCHEMATIC_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	if (default.KSGG1_MAGNETIC_SCHEMATIC_ALLOYCOST > 0) {
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.KSGG1_MAGNETIC_SCHEMATIC_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	if (default.KSGG1_MAGNETIC_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.KSGG1_MAGNETIC_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Section9_Shotgun_Beam_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'SG_KSGG1_BM_Schematic');

	Template.ItemCat = 'weapon';
	//Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Beam_Shotgun";
	Template.PointsToComplete = 0;
	Template.Tier = 4;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'SG_KSGG1_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AlloyCannon');
	Template.Requirements.RequiredEngineeringScore = 25;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	if (default.KSGG1_BEAM_SCHEMATIC_SUPPLYCOST > 0) {
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.KSGG1_BEAM_SCHEMATIC_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	if (default.KSGG1_BEAM_SCHEMATIC_ALLOYCOST > 0) {
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.KSGG1_BEAM_SCHEMATIC_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	if (default.KSGG1_BEAM_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.KSGG1_BEAM_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Section9_Cannon_Magnetic_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'MG_SEBMG_MG_Schematic');

	Template.ItemCat = 'weapon';
	//Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Mag_Cannon";
	Template.PointsToComplete = 0;
	Template.Tier = 2;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'MG_SEBMG_MG';
	Template.HideIfPurchased = 'MG_SEBMG_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('GaussWeapons');
	Template.Requirements.RequiredEngineeringScore = 15;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	if (default.SEBMG_MAGNETIC_SCHEMATIC_SUPPLYCOST > 0) {
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SEBMG_MAGNETIC_SCHEMATIC_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	if (default.SEBMG_MAGNETIC_SCHEMATIC_ALLOYCOST > 0) {
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.SEBMG_MAGNETIC_SCHEMATIC_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	if (default.SEBMG_MAGNETIC_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SEBMG_MAGNETIC_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Section9_Cannon_Beam_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'MG_SEBMG_BM_Schematic');

	Template.ItemCat = 'weapon';
	//Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Beam_Lmg";
	Template.PointsToComplete = 0;
	Template.Tier = 4;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'MG_SEBMG_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('HeavyPlasma');
	Template.Requirements.RequiredEngineeringScore = 25;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	if (default.SEBMG_BEAM_SCHEMATIC_SUPPLYCOST > 0) {
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SEBMG_BEAM_SCHEMATIC_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	if (default.SEBMG_BEAM_SCHEMATIC_ALLOYCOST > 0) {
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.SEBMG_BEAM_SCHEMATIC_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	if (default.SEBMG_BEAM_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SEBMG_BEAM_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Section9_SniperRifle_Magnetic_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'SR_SEBSR_MG_Schematic');

	Template.ItemCat = 'weapon';
	//Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Mag_Sniper_Rifle";
	Template.PointsToComplete = 0;
	Template.Tier = 2;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'SR_SEBSR_MG';
	Template.HideIfPurchased = 'SR_SEBSR_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('GaussWeapons');
	Template.Requirements.RequiredEngineeringScore = 15;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	if (default.SEBSR_MAGNETIC_SCHEMATIC_SUPPLYCOST > 0) {
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SEBSR_MAGNETIC_SCHEMATIC_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	if (default.SEBSR_MAGNETIC_SCHEMATIC_ALLOYCOST > 0) {
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.SEBSR_MAGNETIC_SCHEMATIC_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	if (default.SEBSR_MAGNETIC_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SEBSR_MAGNETIC_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Section9_SniperRifle_Beam_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'SR_SEBSR_BM_Schematic');

	Template.ItemCat = 'weapon';
	//Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Beam_Sniper_Rifle";
	Template.PointsToComplete = 0;
	Template.Tier = 4;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'SR_SEBSR_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('PlasmaSniper');
	Template.Requirements.RequiredEngineeringScore = 25;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	if (default.SEBSR_BEAM_SCHEMATIC_SUPPLYCOST > 0) {
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SEBSR_BEAM_SCHEMATIC_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	if (default.SEBSR_BEAM_SCHEMATIC_ALLOYCOST > 0) {
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.SEBSR_BEAM_SCHEMATIC_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	if (default.SEBSR_BEAM_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SEBSR_BEAM_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Section9_SMG_Magnetic_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'SMG_SEBC26A_MG_Schematic');

	Template.ItemCat = 'weapon';
	//Template.strImage = "img:///UILibrary_SMG.magnetic.Inv_LWMagSMG"; 
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Items being created
	Template.ReferenceItemTemplate = 'SMG_SEBC26A_MG';
	Template.HideIfPurchased = 'SMG_SEBC26A_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	if (default.SEBC26A_MAGNETIC_SCHEMATIC_SUPPLYCOST > 0) {
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SEBC26A_MAGNETIC_SCHEMATIC_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	if (default.SEBC26A_MAGNETIC_SCHEMATIC_ALLOYCOST > 0) {
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.SEBC26A_MAGNETIC_SCHEMATIC_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}
	
	if (default.SEBC26A_MAGNETIC_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SEBC26A_MAGNETIC_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Section9_SMG_Beam_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'SMG_SEBC26A_BM_Schematic');

	Template.ItemCat = 'weapon';
	//Template.strImage = "img:///UILibrary_SMG.Beam.Inv_LWBeamSMG"; 
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	//Items being created
	Template.ReferenceItemTemplate = 'SMG_SEBC26A_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');
	Template.Requirements.RequiredEngineeringScore = 20;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	if (default.SEBC26A_BEAM_SCHEMATIC_SUPPLYCOST > 0) {
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SEBC26A_BEAM_SCHEMATIC_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	if (default.SEBC26A_BEAM_SCHEMATIC_ALLOYCOST > 0) {
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.SEBC26A_BEAM_SCHEMATIC_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	if (default.SEBC26A_BEAM_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SEBC26A_BEAM_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}