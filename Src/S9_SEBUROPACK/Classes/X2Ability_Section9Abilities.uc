class X2Ability_Section9Abilities extends X2Ability
	dependson (XComGameStateContext_Ability) config(GameData_S9);
	
var config int SEBC26A_CONVENTIONAL_MOBILITY_BONUS;
var config int SEBC26A_MAGNETIC_MOBILITY_BONUS;
var config int SEBC26A_BEAM_MOBILITY_BONUS;

var config float SEBC26A_CONVENTIONAL_DETECTIONRADIUSMODIFER;
var config float SEBC26A_MAGNETIC_DETECTIONRADIUSMODIFER;
var config float SEBC26A_BEAM_DETECTIONRADIUSMODIFER;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(AddSEBC26AConventionalBonusAbility());
	Templates.AddItem(AddSEBC26AMagneticBonusAbility());
	Templates.AddItem(AddSEBC26ABeamBonusAbility());

	return Templates;
}

// ******************* Stat Bonuses **********************

static function X2AbilityTemplate AddSEBC26AConventionalBonusAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SMG_SEBC26A_CV_StatBonus');
	Template.IconImage = "img:///gfxXComIcons.NanofiberVest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to Mobility and DetectionRange stat effects
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.SEBC26A_CONVENTIONAL_MOBILITY_BONUS);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.SEBC26A_CONVENTIONAL_DETECTIONRADIUSMODIFER);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddSEBC26AMagneticBonusAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SMG_SEBC26A_MG_StatBonus');
	Template.IconImage = "img:///gfxXComIcons.NanofiberVest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to Mobility and DetectionRange stat effects
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.SEBC26A_MAGNETIC_MOBILITY_BONUS);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.SEBC26A_MAGNETIC_DETECTIONRADIUSMODIFER);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddSEBC26ABeamBonusAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SMG_SEBC26A_BM_StatBonus');
	Template.IconImage = "img:///gfxXComIcons.NanofiberVest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Bonus to Mobility and DetectionRange stat effects
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.SEBC26A_BEAM_MOBILITY_BONUS);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.SEBC26A_BEAM_DETECTIONRADIUSMODIFER);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}
