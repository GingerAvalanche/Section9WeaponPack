class X2DownloadableContentInfo_Section9WeaponPack extends X2DownloadableContentInfo;	

static event OnLoadedSavedGame()
{
	UpdateStorage();
}

static event OnLoadedSavedGameToStrategy()
{
	UpdateStorage();
}

static event OnPostTemplatesCreated()
{
	PatchTemplates();
}

static function UpdateStorage()
{
    local XComGameState NewGameState;
    local XComGameStateHistory History;
    local XComGameState_HeadquartersXCom XComHQ;
    local X2ItemTemplateManager ItemTemplateMgr;
    local X2DataTemplate ItemTemplate;
    local name TemplateName;
    local XComGameState_Item NewItemState;
    local array<name> AllTemplateNames;

    History = `XCOMHISTORY;
    NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Updating HQ Storage to add Section 9 Weapons");
    XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
    XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
    ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

    Templates.AddItem(ItemTemplateMgr.FindItemTemplate('RIF_SEBC30_CV'));
    Templates.AddItem(ItemTemplateMgr.FindItemTemplate('PIS_SEBM5_CV'));
    Templates.AddItem(ItemTemplateMgr.FindItemTemplate('SG_KSGG1_CV'));
    Templates.AddItem(ItemTemplateMgr.FindItemTemplate('MG_SEBMG_CV'));
    Templates.AddItem(ItemTemplateMgr.FindItemTemplate('SR_SEBSR_CV'));
    Templates.AddItem(ItemTemplateMgr.FindItemTemplate('SMG_SEBC26A_CV'));
	
	foreach Templates(Template)
	{
		if (!XComHQ.HasItem(X2ItemTemplate(ItemTemplate))) // Does XCOM NOT have the item?
		{
			`LOG("Adding to HQ" @ ItemTemplate.DataName,, 'Section9WeaponPack');
			NewItemState = X2ItemTemplate(ItemTemplate).CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
		}
	}
    History.AddGameStateToHistory(NewGameState);
    History.CleanupPendingGameState(NewGameState);
}

static function PatchTemplates()
{
	local X2ItemTemplateManager ItemTemplateMgr;
	local array<X2WeaponUpgradeTemplate> Templates;
	local X2WeaponUpgradeTemplate Template;
	
	// Laser Sights
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('CritUpgrade')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('CritUpgrade_Bsc')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('CritUpgrade_Adv')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('CritUpgrade_Sup')));
	
	foreach Templates(Template)
	{
		SetUpSection9CritUpgrade(Template);
	}
	
	// Scopes
	Templates.Length = 0;
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('AimUpgrade')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('AimUpgrade_Bsc')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('AimUpgrade_Adv')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('AimUpgrade_Sup')));
	
	foreach Templates(Template)
	{
		SetUpSection9AimUpgrade(Template);
	}
	
	// Expanded Mags
	Templates.Length = 0;
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('ClipSizeUpgrade')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('ClipSizeUpgrade_Bsc')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('ClipSizeUpgrade_Adv')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('ClipSizeUpgrade_Sup')));
	
	foreach Templates(Template)
	{
		SetUpSection9ClipSizeUpgrade(Template);
	}
	
	// Hair Triggers
	Templates.Length = 0;
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('FreeFireUpgrade')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('FreeFireUpgrade_Bsc')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('FreeFireUpgrade_Adv')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('FreeFireUpgrade_Sup')));
	
	foreach Templates(Template)
	{
		SetUpSection9FreeFireUpgrade(Template);
	}
	
	// Auto-Loaders
	Templates.Length = 0;
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('ReloadUpgrade')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('ReloadUpgrade_Bsc')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('ReloadUpgrade_Adv')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('ReloadUpgrade_Sup')));
	
	foreach Templates(Template)
	{
		SetUpSection9ReloadUpgrade(Template);
	}
	
	// Stocks
	Templates.Length = 0;
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('MissDamageUpgrade')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('MissDamageUpgrade_Bsc')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('MissDamageUpgrade_Adv')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('MissDamageUpgrade_Sup')));
	
	foreach Templates(Template)
	{
		SetUpSection9MissDamageUpgrade(Template);
	}
	
	// Repeaters
	Templates.Length = 0;
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('FreeKillUpgrade')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('FreeKillUpgrade_Bsc')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('FreeKillUpgrade_Adv')));
	Templates.AddItem(X2WeaponUpgradeTemplate(ItemTemplateMgr.FindItemTemplate('FreeKillUpgrade_Sup')));
	
	foreach Templates(Template)
	{
		SetUpSection9FreeKillUpgrade(Template);
	}
}

static function SetUpSection9CritUpgrade(out X2WeaponUpgradeTemplate Template)
{
	//Parameters: Name AttachSocket, Name UIArmoryCameraPointTag, string MeshName, string ProjectileName, name MatchWeaponTemplate, optional bool AttachToPawn, optional string IconName, optional string InventoryIconName, optional string InventoryCategoryIcon, optional delegate<X2TacticalGameRulesetDataStructures.CheckUpgradeStatus> ValidateAttachmentFn
	// Assault Rifles
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "S9_SEBUROPACK.MESH.SEBC30_laser", "", 'RIF_SEBC30_CV', , "img:///S9_SEBUROPACK.IMG.SEBC30_laser", "img:///S9_SEBUROPACK.IMG.SEBC30_laser_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "S9_SEBUROPACK.MESH.SEBC30_laser", "", 'RIF_SEBC30_MG', , "img:///S9_SEBUROPACK.IMG.SEBC30_laser", "img:///S9_SEBUROPACK.IMG.SEBC30_laser_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "S9_SEBUROPACK.MESH.SEBC30_laser", "", 'RIF_SEBC30_BM', , "img:///S9_SEBUROPACK.IMG.SEBC30_laser", "img:///S9_SEBUROPACK.IMG.SEBC30_laser_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	
	// Shotguns
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "S9_SEBUROPACK.MESH.KSGG1_laser", "", 'SG_KSGG1_CV', , "img:///S9_SEBUROPACK.IMG.KSGG1_laser", "img:///S9_SEBUROPACK.IMG.KSGG1_laser_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "S9_SEBUROPACK.MESH.KSGG1_laser", "", 'SG_KSGG1_MG', , "img:///S9_SEBUROPACK.IMG.KSGG1_laser", "img:///S9_SEBUROPACK.IMG.KSGG1_laser_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "S9_SEBUROPACK.MESH.KSGG1_laser", "", 'SG_KSGG1_BM', , "img:///S9_SEBUROPACK.IMG.KSGG1_laser", "img:///S9_SEBUROPACK.IMG.KSGG1_laser_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Cannons
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Cannon_Optic', "S9_SEBUROPACK.MESH.SEBMG_laser", "", 'MG_SEBMG_CV', , "img:///S9_SEBUROPACK.IMG.SEBMG_laser", "img:///S9_SEBUROPACK.IMG.SEBMG_laser_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Cannon_Optic', "S9_SEBUROPACK.MESH.SEBMG_laser", "", 'MG_SEBMG_MG', , "img:///S9_SEBUROPACK.IMG.SEBMG_laser", "img:///S9_SEBUROPACK.IMG.SEBMG_laser_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Cannon_Optic', "S9_SEBUROPACK.MESH.SEBMG_laser", "", 'MG_SEBMG_BM', , "img:///S9_SEBUROPACK.IMG.SEBMG_laser", "img:///S9_SEBUROPACK.IMG.SEBMG_laser_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Sniper Rifles
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Sniper_Optic', "S9_SEBUROPACK.MESH.SEBSR_laser", "", 'SR_SEBSR_CV', , "img:///S9_SEBUROPACK.IMG.SEBSR_laser", "img:///S9_SEBUROPACK.IMG.SEBSR_laser_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Sniper_Optic', "S9_SEBUROPACK.MESH.SEBSR_laser", "", 'SR_SEBSR_MG', , "img:///S9_SEBUROPACK.IMG.SEBSR_laser", "img:///S9_SEBUROPACK.IMG.SEBSR_laser_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Sniper_Optic', "S9_SEBUROPACK.MESH.SEBSR_laser", "", 'SR_SEBSR_BM', , "img:///S9_SEBUROPACK.IMG.SEBSR_laser", "img:///S9_SEBUROPACK.IMG.SEBSR_laser_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// SMGs
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "S9_SEBUROPACK.MESH.SEBC26A_laser", "", 'SMG_SEBC26A_CV', , "img:///S9_SEBUROPACK.IMG.SEBC26A_laser", "img:///S9_SEBUROPACK.IMG.SEBC26A_laser_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "S9_SEBUROPACK.MESH.SEBC26A_laser", "", 'SMG_SEBC26A_MG', , "img:///S9_SEBUROPACK.IMG.SEBC26A_laser", "img:///S9_SEBUROPACK.IMG.SEBC26A_laser_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "S9_SEBUROPACK.MESH.SEBC26A_laser", "", 'SMG_SEBC26A_BM', , "img:///S9_SEBUROPACK.IMG.SEBC26A_laser", "img:///S9_SEBUROPACK.IMG.SEBC26A_laser_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
}

static function SetUpSection9AimUpgrade(out X2WeaponUpgradeTemplate Template)
{
	//Parameters: Name AttachSocket, Name UIArmoryCameraPointTag, string MeshName, string ProjectileName, name MatchWeaponTemplate, optional bool AttachToPawn, optional string IconName, optional string InventoryIconName, optional string InventoryCategoryIcon, optional delegate<X2TacticalGameRulesetDataStructures.CheckUpgradeStatus> ValidateAttachmentFn
	// Assault Rifles
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "S9_SEBUROPACK.MESH.SEBC30_scope", "", 'RIF_SEBC30_CV', , "img:///S9_SEBUROPACK.IMG.SEBC30_scope", "img:///S9_SEBUROPACK.IMG.SEBC30_scope_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "S9_SEBUROPACK.MESH.SEBC30_scope", "", 'RIF_SEBC30_MG', , "img:///S9_SEBUROPACK.IMG.SEBC30_scope", "img:///S9_SEBUROPACK.IMG.SEBC30_scope_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "S9_SEBUROPACK.MESH.SEBC30_scope", "", 'RIF_SEBC30_BM', , "img:///S9_SEBUROPACK.IMG.SEBC30_scope", "img:///S9_SEBUROPACK.IMG.SEBC30_scope_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Shotguns
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "S9_SEBUROPACK.MESH.KSGG1_scope", "", 'SG_KSGG1_CV', , "img:///S9_SEBUROPACK.IMG.KSGG1_scope", "img:///S9_SEBUROPACK.IMG.KSGG1_scope_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "S9_SEBUROPACK.MESH.KSGG1_scope", "", 'SG_KSGG1_MG', , "img:///S9_SEBUROPACK.IMG.KSGG1_scope", "img:///S9_SEBUROPACK.IMG.KSGG1_scope_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "S9_SEBUROPACK.MESH.KSGG1_scope", "", 'SG_KSGG1_BM', , "img:///S9_SEBUROPACK.IMG.KSGG1_scope", "img:///S9_SEBUROPACK.IMG.KSGG1_scope_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Cannons
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Cannon_Optic', "S9_SEBUROPACK.MESH.SEBMG_scope", "", 'MG_SEBMG_CV', , "img:///S9_SEBUROPACK.IMG.SEBMG_scope", "img:///S9_SEBUROPACK.IMG.SEBMG_scope_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Cannon_Optic', "S9_SEBUROPACK.MESH.SEBMG_scope", "", 'MG_SEBMG_MG', , "img:///S9_SEBUROPACK.IMG.SEBMG_scope", "img:///S9_SEBUROPACK.IMG.SEBMG_scope_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Cannon_Optic', "S9_SEBUROPACK.MESH.SEBMG_scope", "", 'MG_SEBMG_BM', , "img:///S9_SEBUROPACK.IMG.SEBMG_scope", "img:///S9_SEBUROPACK.IMG.SEBMG_scope_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	
	// Sniper Rifles
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Sniper_Optic', "S9_SEBUROPACK.MESH.SEBSR_scope", "", 'SR_SEBSR_CV', , "img:///S9_SEBUROPACK.IMG.SEBSR_scope", "img:///S9_SEBUROPACK.IMG.SEBSR_scope_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Sniper_Optic', "S9_SEBUROPACK.MESH.SEBSR_scope", "", 'SR_SEBSR_MG', , "img:///S9_SEBUROPACK.IMG.SEBSR_scope", "img:///S9_SEBUROPACK.IMG.SEBSR_scope_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Sniper_Optic', "S9_SEBUROPACK.MESH.SEBSR_scope", "", 'SR_SEBSR_BM', , "img:///S9_SEBUROPACK.IMG.SEBSR_scope", "img:///S9_SEBUROPACK.IMG.SEBSR_scope_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// SMGs
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "S9_SEBUROPACK.MESH.SEBC26A_scope", "", 'SMG_SEBC26A_CV', , "img:///S9_SEBUROPACK.IMG.SEBC26A_scope", "img:///S9_SEBUROPACK.IMG.SEBC26A_scope_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "S9_SEBUROPACK.MESH.SEBC26A_scope", "", 'SMG_SEBC26A_MG', , "img:///S9_SEBUROPACK.IMG.SEBC26A_scope", "img:///S9_SEBUROPACK.IMG.SEBC26A_scope_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "S9_SEBUROPACK.MESH.SEBC26A_scope", "", 'SMG_SEBC26A_BM', , "img:///S9_SEBUROPACK.IMG.SEBC26A_scope", "img:///S9_SEBUROPACK.IMG.SEBC26A_scope_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
}

static function SetUpSection9ClipSizeUpgrade(out X2WeaponUpgradeTemplate Template)
{
	//Parameters: Name AttachSocket, Name UIArmoryCameraPointTag, string MeshName, string ProjectileName, name MatchWeaponTemplate, optional bool AttachToPawn, optional string IconName, optional string InventoryIconName, optional string InventoryCategoryIcon, optional delegate<X2TacticalGameRulesetDataStructures.CheckUpgradeStatus> ValidateAttachmentFn
	// Assault Rifles
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "S9_SEBUROPACK.MESH.SEBC30_expmag", "", 'RIF_SEBC30_CV', , "img:///S9_SEBUROPACK.IMG.SEBC30_expmag", "img:///S9_SEBUROPACK.IMG.SEBC30_expmag_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "S9_SEBUROPACK.MESH.SEBC30_expmag", "", 'RIF_SEBC30_MG', , "img:///S9_SEBUROPACK.IMG.SEBC30_expmag", "img:///S9_SEBUROPACK.IMG.SEBC30_expmag_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "S9_SEBUROPACK.MESH.SEBC30_expmag", "", 'RIF_SEBC30_BM', , "img:///S9_SEBUROPACK.IMG.SEBC30_expmag", "img:///S9_SEBUROPACK.IMG.SEBC30_expmag_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// Shotguns
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "S9_SEBUROPACK.MESH.KSGG1_expmag", "", 'SG_KSGG1_CV', , "img:///S9_SEBUROPACK.IMG.KSGG1_expmag", "img:///S9_SEBUROPACK.IMG.KSGG1_expmag_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "S9_SEBUROPACK.MESH.KSGG1_expmag", "", 'SG_KSGG1_MG', , "img:///S9_SEBUROPACK.IMG.KSGG1_expmag", "img:///S9_SEBUROPACK.IMG.KSGG1_expmag_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "S9_SEBUROPACK.MESH.KSGG1_expmag", "", 'SG_KSGG1_BM', , "img:///S9_SEBUROPACK.IMG.KSGG1_expmag", "img:///S9_SEBUROPACK.IMG.KSGG1_expmag_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// Cannons
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "S9_SEBUROPACK.MESH.SEBMG_expmag", "", 'MG_SEBMG_CV', , "img:///S9_SEBUROPACK.IMG.SEBMG_expmag", "img:///S9_SEBUROPACK.IMG.SEBMG_expmag_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "S9_SEBUROPACK.MESH.SEBMG_expmag", "", 'MG_SEBMG_MG', , "img:///S9_SEBUROPACK.IMG.SEBMG_expmag", "img:///S9_SEBUROPACK.IMG.SEBMG_expmag_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "S9_SEBUROPACK.MESH.SEBMG_expmag", "", 'MG_SEBMG_BM', , "img:///S9_SEBUROPACK.IMG.SEBMG_expmag", "img:///S9_SEBUROPACK.IMG.SEBMG_expmag_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// Sniper Rifles
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "S9_SEBUROPACK.MESH.SEBSR_expmag", "", 'SR_SEBSR_CV', , "img:///S9_SEBUROPACK.IMG.SEBSR_expmag", "img:///S9_SEBUROPACK.IMG.SEBSR_expmag_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "S9_SEBUROPACK.MESH.SEBSR_expmag", "", 'SR_SEBSR_MG', , "img:///S9_SEBUROPACK.IMG.SEBSR_expmag", "img:///S9_SEBUROPACK.IMG.SEBSR_expmag_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "S9_SEBUROPACK.MESH.SEBSR_expmag", "", 'SR_SEBSR_BM', , "img:///S9_SEBUROPACK.IMG.SEBSR_expmag", "img:///S9_SEBUROPACK.IMG.SEBSR_expmag_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// SMGs
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "S9_SEBUROPACK.MESH.SEBC26A_expmag", "", 'SMG_SEBC26A_CV', , "img:///S9_SEBUROPACK.IMG.SEBC26A_expmag", "img:///S9_SEBUROPACK.IMG.SEBC26A_expmag_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "S9_SEBUROPACK.MESH.SEBC26A_expmag", "", 'SMG_SEBC26A_MG', , "img:///S9_SEBUROPACK.IMG.SEBC26A_expmag", "img:///S9_SEBUROPACK.IMG.SEBC26A_expmag_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "S9_SEBUROPACK.MESH.SEBC26A_expmag", "", 'SMG_SEBC26A_BM', , "img:///S9_SEBUROPACK.IMG.SEBC26A_expmag", "img:///S9_SEBUROPACK.IMG.SEBC26A_expmag_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
}

static function SetUpSection9FreeFireUpgrade(out X2WeaponUpgradeTemplate Template)
{
	//Parameters: Name AttachSocket, Name UIArmoryCameraPointTag, string MeshName, string ProjectileName, name MatchWeaponTemplate, optional bool AttachToPawn, optional string IconName, optional string InventoryIconName, optional string InventoryCategoryIcon, optional delegate<X2TacticalGameRulesetDataStructures.CheckUpgradeStatus> ValidateAttachmentFn
	// Assault Rifles
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "S9_SEBUROPACK.MESH.SEBC30_hairtrigger", "", 'RIF_SEBC30_CV', , "img:///S9_SEBUROPACK.IMG.SEBC30_hairtrigger", "img:///S9_SEBUROPACK.IMG.SEBC30_hairtrigger_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "S9_SEBUROPACK.MESH.SEBC30_hairtrigger", "", 'RIF_SEBC30_MG', , "img:///S9_SEBUROPACK.IMG.SEBC30_hairtrigger", "img:///S9_SEBUROPACK.IMG.SEBC30_hairtrigger_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "S9_SEBUROPACK.MESH.SEBC30_hairtrigger", "", 'RIF_SEBC30_BM', , "img:///S9_SEBUROPACK.IMG.SEBC30_hairtrigger", "img:///S9_SEBUROPACK.IMG.SEBC30_hairtrigger_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
		
	// Shotguns
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "S9_SEBUROPACK.MESH.KSGG1_hairtrigger", "", 'SG_KSGG1_CV', , "img:///S9_SEBUROPACK.IMG.KSGG1_hairtrigger", "img:///S9_SEBUROPACK.IMG.KSGG1_hairtrigger_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "S9_SEBUROPACK.MESH.KSGG1_hairtrigger", "", 'SG_KSGG1_MG', , "img:///S9_SEBUROPACK.IMG.KSGG1_hairtrigger", "img:///S9_SEBUROPACK.IMG.KSGG1_hairtrigger_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "S9_SEBUROPACK.MESH.KSGG1_hairtrigger", "", 'SG_KSGG1_BM', , "img:///S9_SEBUROPACK.IMG.KSGG1_hairtrigger", "img:///S9_SEBUROPACK.IMG.KSGG1_hairtrigger_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	// Cannons
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Cannon_Stock', "S9_SEBUROPACK.MESH.SEBMG_hairtrigger", "", 'MG_SEBMG_CV', , "img:///S9_SEBUROPACK.IMG.SEBMG_hairtrigger", "img:///S9_SEBUROPACK.IMG.SEBMG_hairtrigger_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Cannon_Stock', "S9_SEBUROPACK.MESH.SEBMG_hairtrigger", "", 'MG_SEBMG_MG', , "img:///S9_SEBUROPACK.IMG.SEBMG_hairtrigger", "img:///S9_SEBUROPACK.IMG.SEBMG_hairtrigger_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Cannon_Stock', "S9_SEBUROPACK.MESH.SEBMG_hairtrigger", "", 'MG_SEBMG_BM', , "img:///S9_SEBUROPACK.IMG.SEBMG_hairtrigger", "img:///S9_SEBUROPACK.IMG.SEBMG_hairtrigger_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	
	// Sniper Rifles
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "S9_SEBUROPACK.MESH.SEBSR_hairtrigger", "", 'SR_SEBSR_CV', , "img:///S9_SEBUROPACK.IMG.SEBSR_hairtrigger", "img:///S9_SEBUROPACK.IMG.SEBSR_hairtrigger_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "S9_SEBUROPACK.MESH.SEBSR_hairtrigger", "", 'SR_SEBSR_MG', , "img:///S9_SEBUROPACK.IMG.SEBSR_hairtrigger", "img:///S9_SEBUROPACK.IMG.SEBSR_hairtrigger_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "S9_SEBUROPACK.MESH.SEBSR_hairtrigger", "", 'SR_SEBSR_BM', , "img:///S9_SEBUROPACK.IMG.SEBSR_hairtrigger", "img:///S9_SEBUROPACK.IMG.SEBSR_hairtrigger_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	// SMGs
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "S9_SEBUROPACK.MESH.SEBC26A_hairtrigger", "", 'SMG_SEBC26A_CV', , "img:///S9_SEBUROPACK.IMG.SEBC26A_hairtrigger", "img:///S9_SEBUROPACK.IMG.SEBC26A_hairtrigger_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "S9_SEBUROPACK.MESH.SEBC26A_hairtrigger", "", 'SMG_SEBC26A_MG', , "img:///S9_SEBUROPACK.IMG.SEBC26A_hairtrigger", "img:///S9_SEBUROPACK.IMG.SEBC26A_hairtrigger_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "S9_SEBUROPACK.MESH.SEBC26A_hairtrigger", "", 'SMG_SEBC26A_BM', , "img:///S9_SEBUROPACK.IMG.SEBC26A_hairtrigger", "img:///S9_SEBUROPACK.IMG.SEBC26A_hairtrigger_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
}

static function SetUpSection9ReloadUpgrade(out X2WeaponUpgradeTemplate Template)
{
	//Parameters: Name AttachSocket, Name UIArmoryCameraPointTag, string MeshName, string ProjectileName, name MatchWeaponTemplate, optional bool AttachToPawn, optional string IconName, optional string InventoryIconName, optional string InventoryCategoryIcon, optional delegate<X2TacticalGameRulesetDataStructures.CheckUpgradeStatus> ValidateAttachmentFn
	// Assault Rifles
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "S9_SEBUROPACK.MESH.SEBC30_loader", "", 'RIF_SEBC30_CV', , "img:///S9_SEBUROPACK.IMG.SEBC30_loader", "img:///S9_SEBUROPACK.IMG.SEBC30_loader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "S9_SEBUROPACK.MESH.SEBC30_loader", "", 'RIF_SEBC30_MG', , "img:///S9_SEBUROPACK.IMG.SEBC30_loader", "img:///S9_SEBUROPACK.IMG.SEBC30_loader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "S9_SEBUROPACK.MESH.SEBC30_loader", "", 'RIF_SEBC30_BM', , "img:///S9_SEBUROPACK.IMG.SEBC30_loader", "img:///S9_SEBUROPACK.IMG.SEBC30_loader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	
	// Shotguns
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "S9_SEBUROPACK.MESH.KSGG1_loader", "", 'SG_KSGG1_CV', , "img:///S9_SEBUROPACK.IMG.KSGG1_loader", "img:///S9_SEBUROPACK.IMG.KSGG1_loader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "S9_SEBUROPACK.MESH.KSGG1_loader", "", 'SG_KSGG1_MG', , "img:///S9_SEBUROPACK.IMG.KSGG1_loader", "img:///S9_SEBUROPACK.IMG.KSGG1_loader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "S9_SEBUROPACK.MESH.KSGG1_loader", "", 'SG_KSGG1_BM', , "img:///S9_SEBUROPACK.IMG.KSGG1_loader", "img:///S9_SEBUROPACK.IMG.KSGG1_loader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// Cannons
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "S9_SEBUROPACK.MESH.SEBMG_loader", "", 'MG_SEBMG_CV', , "img:///S9_SEBUROPACK.IMG.SEBMG_loader", "img:///S9_SEBUROPACK.IMG.SEBMG_loader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "S9_SEBUROPACK.MESH.SEBMG_loader", "", 'MG_SEBMG_MG', , "img:///S9_SEBUROPACK.IMG.SEBMG_loader", "img:///S9_SEBUROPACK.IMG.SEBMG_loader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "S9_SEBUROPACK.MESH.SEBMG_loader", "", 'MG_SEBMG_BM', , "img:///S9_SEBUROPACK.IMG.SEBMG_loader", "img:///S9_SEBUROPACK.IMG.SEBMG_loader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// Sniper Rifles
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "S9_SEBUROPACK.MESH.SEBSR_loader", "", 'SR_SEBSR_CV', , "img:///S9_SEBUROPACK.IMG.SEBSR_loader", "img:///S9_SEBUROPACK.IMG.SEBSR_loader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "S9_SEBUROPACK.MESH.SEBSR_loader", "", 'SR_SEBSR_MG', , "img:///S9_SEBUROPACK.IMG.SEBSR_loader", "img:///S9_SEBUROPACK.IMG.SEBSR_loader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "S9_SEBUROPACK.MESH.SEBSR_loader", "", 'SR_SEBSR_BM', , "img:///S9_SEBUROPACK.IMG.SEBSR_loader", "img:///S9_SEBUROPACK.IMG.SEBSR_loader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// SMGs
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "S9_SEBUROPACK.MESH.SEBC26A_loader", "", 'SMG_SEBC26A_CV', , "img:///S9_SEBUROPACK.IMG.SEBC26A_loader", "img:///S9_SEBUROPACK.IMG.SEBC26A_loader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "S9_SEBUROPACK.MESH.SEBC26A_loader", "", 'SMG_SEBC26A_MG', , "img:///S9_SEBUROPACK.IMG.SEBC26A_loader", "img:///S9_SEBUROPACK.IMG.SEBC26A_loader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "S9_SEBUROPACK.MESH.SEBC26A_loader", "", 'SMG_SEBC26A_BM', , "img:///S9_SEBUROPACK.IMG.SEBC26A_loader", "img:///S9_SEBUROPACK.IMG.SEBC26A_loader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
}

static function SetUpSection9MissDamageUpgrade(out X2WeaponUpgradeTemplate Template)
{
	//Parameters: Name AttachSocket, Name UIArmoryCameraPointTag, string MeshName, string ProjectileName, name MatchWeaponTemplate, optional bool AttachToPawn, optional string IconName, optional string InventoryIconName, optional string InventoryCategoryIcon, optional delegate<X2TacticalGameRulesetDataStructures.CheckUpgradeStatus> ValidateAttachmentFn
	// Assault Rifles
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "S9_SEBUROPACK.MESH.SEBC30_stock", "", 'RIF_SEBC30_CV', , "img:///S9_SEBUROPACK.IMG.SEBC30_stock", "img:///S9_SEBUROPACK.IMG.SEBC30_stock_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "S9_SEBUROPACK.MESH.SEBC30_stock", "", 'RIF_SEBC30_MG', , "img:///S9_SEBUROPACK.IMG.SEBC30_stock", "img:///S9_SEBUROPACK.IMG.SEBC30_stock_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "S9_SEBUROPACK.MESH.SEBC30_stock", "", 'RIF_SEBC30_BM', , "img:///S9_SEBUROPACK.IMG.SEBC30_stock", "img:///S9_SEBUROPACK.IMG.SEBC30_stock_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	
	// Shotguns
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "S9_SEBUROPACK.MESH.KSGG1_stock", "", 'SG_KSGG1_CV', , "img:///S9_SEBUROPACK.IMG.KSGG1_stock", "img:///S9_SEBUROPACK.IMG.KSGG1_stock_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "S9_SEBUROPACK.MESH.KSGG1_stock", "", 'SG_KSGG1_MG', , "img:///S9_SEBUROPACK.IMG.KSGG1_stock", "img:///S9_SEBUROPACK.IMG.KSGG1_stock_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "S9_SEBUROPACK.MESH.KSGG1_stock", "", 'SG_KSGG1_BM', , "img:///S9_SEBUROPACK.IMG.KSGG1_stock", "img:///S9_SEBUROPACK.IMG.KSGG1_stock_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");

	// Cannons
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Cannon_Stock', "S9_SEBUROPACK.MESH.SEBMG_stock", "", 'MG_SEBMG_CV', , "img:///S9_SEBUROPACK.IMG.SEBMG_stock", "img:///S9_SEBUROPACK.IMG.SEBMG_stock_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Cannon_Stock', "S9_SEBUROPACK.MESH.SEBMG_stock", "", 'MG_SEBMG_MG', , "img:///S9_SEBUROPACK.IMG.SEBMG_stock", "img:///S9_SEBUROPACK.IMG.SEBMG_stock_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Cannon_Stock', "S9_SEBUROPACK.MESH.SEBMG_stock", "", 'MG_SEBMG_BM', , "img:///S9_SEBUROPACK.IMG.SEBMG_stock", "img:///S9_SEBUROPACK.IMG.SEBMG_stock_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");

	// Sniper Rifles
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Sniper_Stock', "S9_SEBUROPACK.MESH.SEBSR_stock", "", 'SR_SEBSR_CV', , "img:///S9_SEBUROPACK.IMG.SEBSR_stock", "img:///S9_SEBUROPACK.IMG.SEBSR_stock_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Sniper_Stock', "S9_SEBUROPACK.MESH.SEBSR_stock", "", 'SR_SEBSR_MG', , "img:///S9_SEBUROPACK.IMG.SEBSR_stock", "img:///S9_SEBUROPACK.IMG.SEBSR_stock_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Sniper_Stock', "S9_SEBUROPACK.MESH.SEBSR_stock", "", 'SR_SEBSR_BM', , "img:///S9_SEBUROPACK.IMG.SEBSR_stock", "img:///S9_SEBUROPACK.IMG.SEBSR_stock_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");

	// SMGs
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "S9_SEBUROPACK.MESH.SEBC26A_stock", "", 'SMG_SEBC26A_CV', , "img:///S9_SEBUROPACK.IMG.SEBC26A_stock", "img:///S9_SEBUROPACK.IMG.SEBC26A_stock_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "S9_SEBUROPACK.MESH.SEBC26A_stock", "", 'SMG_SEBC26A_MG', , "img:///S9_SEBUROPACK.IMG.SEBC26A_stock", "img:///S9_SEBUROPACK.IMG.SEBC26A_stock_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "S9_SEBUROPACK.MESH.SEBC26A_stock", "", 'SMG_SEBC26A_BM', , "img:///S9_SEBUROPACK.IMG.SEBC26A_stock", "img:///S9_SEBUROPACK.IMG.SEBC26A_stock_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
}

static function SetUpSection9FreeKillUpgrade(out X2WeaponUpgradeTemplate Template)
{
	//Parameters: Name AttachSocket, Name UIArmoryCameraPointTag, string MeshName, string ProjectileName, name MatchWeaponTemplate, optional bool AttachToPawn, optional string IconName, optional string InventoryIconName, optional string InventoryCategoryIcon, optional delegate<X2TacticalGameRulesetDataStructures.CheckUpgradeStatus> ValidateAttachmentFn
	// Assault Rifles
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "S9_SEBUROPACK.MESH.SEBC30_repeater", "", 'RIF_SEBC30_CV', , "img:///S9_SEBUROPACK.IMG.SEBC30_repeater", "img:///S9_SEBUROPACK.IMG.SEBC30_repeater_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "S9_SEBUROPACK.MESH.SEBC30_repeater", "", 'RIF_SEBC30_MG', , "img:///S9_SEBUROPACK.IMG.SEBC30_repeater", "img:///S9_SEBUROPACK.IMG.SEBC30_repeater_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "S9_SEBUROPACK.MESH.SEBC30_repeater", "", 'RIF_SEBC30_BM', , "img:///S9_SEBUROPACK.IMG.SEBC30_repeater", "img:///S9_SEBUROPACK.IMG.SEBC30_repeater_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Shotguns
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Shotgun_Suppressor', "S9_SEBUROPACK.MESH.KSGG1_repeater", "", 'SG_KSGG1_CV', , "img:///S9_SEBUROPACK.IMG.KSGG1_repeater", "img:///S9_SEBUROPACK.IMG.KSGG1_repeater_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Shotgun_Suppressor', "S9_SEBUROPACK.MESH.KSGG1_repeater", "", 'SG_KSGG1_MG', , "img:///S9_SEBUROPACK.IMG.KSGG1_repeater", "img:///S9_SEBUROPACK.IMG.KSGG1_repeater_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Shotgun_Suppressor', "S9_SEBUROPACK.MESH.KSGG1_repeater", "", 'SG_KSGG1_BM', , "img:///S9_SEBUROPACK.IMG.KSGG1_repeater", "img:///S9_SEBUROPACK.IMG.KSGG1_repeater_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Cannons
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Cannon_Suppressor', "S9_SEBUROPACK.MESH.SEBMG_repeater", "", 'MG_SEBMG_CV', , "img:///S9_SEBUROPACK.IMG.SEBMG_repeater", "img:///S9_SEBUROPACK.IMG.SEBMG_repeater_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Cannon_Suppressor', "S9_SEBUROPACK.MESH.SEBMG_repeater", "", 'MG_SEBMG_MG', , "img:///S9_SEBUROPACK.IMG.SEBMG_repeater", "img:///S9_SEBUROPACK.IMG.SEBMG_repeater_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Cannon_Suppressor', "S9_SEBUROPACK.MESH.SEBMG_repeater", "", 'MG_SEBMG_BM', , "img:///S9_SEBUROPACK.IMG.SEBMG_repeater", "img:///S9_SEBUROPACK.IMG.SEBMG_repeater_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Sniper Rifles
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Sniper_Suppressor', "S9_SEBUROPACK.MESH.SEBSR_repeater", "", 'SR_SEBSR_CV', , "img:///S9_SEBUROPACK.IMG.SEBSR_repeater", "img:///S9_SEBUROPACK.IMG.SEBSR_repeater_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Sniper_Suppressor', "S9_SEBUROPACK.MESH.SEBSR_repeater", "", 'SR_SEBSR_MG', , "img:///S9_SEBUROPACK.IMG.SEBSR_repeater", "img:///S9_SEBUROPACK.IMG.SEBSR_repeater_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Sniper_Suppressor', "S9_SEBUROPACK.MESH.SEBSR_repeater", "", 'SR_SEBSR_BM', , "img:///S9_SEBUROPACK.IMG.SEBSR_repeater", "img:///S9_SEBUROPACK.IMG.SEBSR_repeater_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// SMGs
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Shotgun_Suppressor', "S9_SEBUROPACK.MESH.SEBC26A_repeater", "", 'SMG_SEBC26A_CV', , "img:///S9_SEBUROPACK.IMG.SEBC26A_repeater", "img:///S9_SEBUROPACK.IMG.SEBC26A_repeater_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Shotgun_Suppressor', "S9_SEBUROPACK.MESH.SEBC26A_repeater", "", 'SMG_SEBC26A_MG', , "img:///S9_SEBUROPACK.IMG.SEBC26A_repeater", "img:///S9_SEBUROPACK.IMG.SEBC26A_repeater_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Shotgun_Suppressor', "S9_SEBUROPACK.MESH.SEBC26A_repeater", "", 'SMG_SEBC26A_BM', , "img:///S9_SEBUROPACK.IMG.SEBC26A_repeater", "img:///S9_SEBUROPACK.IMG.SEBC26A_repeater_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
}