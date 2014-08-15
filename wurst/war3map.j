//===========================================================================
// 
// Noch eine WARCRAFT-III-Karte
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Fri Aug 15 22:51:25 2014
//   Map Author: Unbekannt
// 
//===========================================================================

//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************

globals
    // Generated
    rect                    gg_rct_Gebiet_000          = null
    trigger                 gg_trg_Nahkampf_Initialisierung = null
endglobals

function InitGlobals takes nothing returns nothing
endfunction

//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************

//===========================================================================
function CreateBuildingsForPlayer0 takes nothing returns nothing
    local player p = Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u = CreateUnit( p, 'hcas', 128.0, -3584.0, 270.000 )
endfunction

//===========================================================================
function CreateUnitsForPlayer0 takes nothing returns nothing
    local player p = Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u = CreateUnit( p, 'Hblm', 601.6, 3357.9, 154.582 )
    set u = CreateUnit( p, 'Hblm', 227.8, 2703.9, 61.196 )
    set u = CreateUnit( p, 'Hblm', 634.9, 2728.3, 240.355 )
    set u = CreateUnit( p, 'Hblm', 962.7, 2763.4, 327.227 )
    set u = CreateUnit( p, 'Hblm', 776.1, 3065.3, 335.829 )
    set u = CreateUnit( p, 'Hblm', 411.0, 3041.0, 218.019 )
endfunction

//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
    call CreateBuildingsForPlayer0(  )
endfunction

//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
    call CreateUnitsForPlayer0(  )
endfunction

//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreatePlayerBuildings(  )
    call CreatePlayerUnits(  )
endfunction

//***************************************************************************
//*
//*  Regions
//*
//***************************************************************************

function CreateRegions takes nothing returns nothing
    local weathereffect we

    set gg_rct_Gebiet_000 = Rect( -256.0, 4480.0, 544.0, 5024.0 )
endfunction

//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************

//===========================================================================
// Trigger: Nahkampf-Initialisierung
//
// Vorgegebene Nahkampf-Spielinitialisierung für alle Spieler
//===========================================================================
function Trig_Nahkampf_Initialisierung_Actions takes nothing returns nothing
    call MeleeStartingVisibility(  )
    call MeleeStartingHeroLimit(  )
    call MeleeGrantHeroItems(  )
    call MeleeStartingResources(  )
    call MeleeClearExcessUnits(  )
    call MeleeStartingUnits(  )
    call MeleeStartingAI(  )
    call MeleeInitVictoryDefeat(  )
endfunction

//===========================================================================
function InitTrig_Nahkampf_Initialisierung takes nothing returns nothing
    set gg_trg_Nahkampf_Initialisierung = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Nahkampf_Initialisierung, function Trig_Nahkampf_Initialisierung_Actions )
endfunction

//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_Nahkampf_Initialisierung(  )
endfunction

//===========================================================================
function RunInitializationTriggers takes nothing returns nothing
    call ConditionalTriggerExecute( gg_trg_Nahkampf_Initialisierung )
endfunction

//***************************************************************************
//*
//*  Players
//*
//***************************************************************************

function InitCustomPlayerSlots takes nothing returns nothing

    // Player 0
    call SetPlayerStartLocation( Player(0), 0 )
    call SetPlayerColor( Player(0), ConvertPlayerColor(0) )
    call SetPlayerRacePreference( Player(0), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(0), true )
    call SetPlayerController( Player(0), MAP_CONTROL_USER )

endfunction

function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_002
    call SetPlayerTeam( Player(0), 0 )

endfunction

//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************

//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds( -7424.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -7680.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 7424.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 7168.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -7424.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 7168.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 7424.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -7680.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM) )
    call SetDayNightModels( "Environment\\DNC\\DNCDungeon\\DNCDungeonTerrain\\DNCDungeonTerrain.mdl", "Environment\\DNC\\DNCDungeon\\DNCDungeonUnit\\DNCDungeonUnit.mdl" )
    call NewSoundEnvironment( "Default" )
    call SetAmbientDaySound( "DungeonDay" )
    call SetAmbientNightSound( "DungeonNight" )
    call SetMapMusic( "Music", true, 0 )
    call CreateRegions(  )
    call CreateAllUnits(  )
    call InitBlizzard(  )
    call InitGlobals(  )
    call InitCustomTriggers(  )
    call RunInitializationTriggers(  )

endfunction

//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************

function config takes nothing returns nothing
    call SetMapName( "Noch eine WARCRAFT-III-Karte" )
    call SetMapDescription( "Unbeschrieben" )
    call SetPlayers( 1 )
    call SetTeams( 1 )
    call SetGamePlacement( MAP_PLACEMENT_USE_MAP_SETTINGS )

    call DefineStartLocation( 0, -768.0, 4544.0 )

    // Player setup
    call InitCustomPlayerSlots(  )
    call SetPlayerSlotAvailable( Player(0), MAP_CONTROL_USER )
    call InitGenericPlayerSlots(  )
endfunction

