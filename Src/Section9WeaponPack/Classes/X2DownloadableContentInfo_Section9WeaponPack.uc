class X2DownloadableContentInfo_Section9WeaponPack extends X2DownloadableContentInfo;	

static event OnLoadedSavedGame()
{
	UpdateStorage();
}

static event OnLoadedSavedGameToStrategy()
{
	UpdateStorage();
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

    Templates[0] = ItemTemplateMgr.FindItemTemplate('RIF_SEBC30_CV');
    Templates[1] = ItemTemplateMgr.FindItemTemplate('PIS_SEBM5_CV');
    Templates[2] = ItemTemplateMgr.FindItemTemplate('SG_KSGG1_CV');
    Templates[3] = ItemTemplateMgr.FindItemTemplate('MG_SEBMG_CV');
    Templates[4] = ItemTemplateMgr.FindItemTemplate('SR_SEBSR_CV');
    Templates[5] = ItemTemplateMgr.FindItemTemplate('SMG_SEBC26A_CV');
	
	foreach Templates(Template)
	{
		if (!XComHQ.HasItem(X2ItemTemplate(ItemTemplate))) // Does XCOM NOT have the Paired item?
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