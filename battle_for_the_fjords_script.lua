local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')
local BaseManager = import('/lua/AI/OpAI/BaseManager.lua')
local SPAIFileName = '/lua/scenarioplatoonai.lua'

local ScenarioPlatioonAI = import('/lua/ScenarioPlatoonAI.lua')
local Difficulty = ScenarioInfo.Options.Difficulty

-- Army Numbers
local Player1 = 1
local UEFAlly = 2

function OnPopulate()
    ScenarioUtils.InitializeScenarioArmies()
end

local UEFAllyAlliedBase = BaseManager.CreateBaseManager()

function StartMission1()
    local opai = nil
    local quantity = {}
    local trigger = {}

    -- Setting the Playable Area
    ScenarioFramework.SetPlayableArea('M1_Playable_Area', false)

    UEFAllyAlliedBase:InitializeDifficultyTables(
        ArmyBrains[UEFAlly],
        'M1_Allied_Base',
        'M1_Allied_Base_Marker',
        80,
        {M1_Allied_Base = 100}
    )

    UEFAllyAlliedBase:StartNonZeroBase({{7,5,3}, {5,4,3}})
    UEFAllyAlliedBase:SetActive('AirScouting', true)


    -- # Basic bomming routes
    -- Bombers
    quantity = {6, 4, 2}

    ---@type OpAI
    opai = UEFAllyAlliedBase:AddOpAI('AirAttacks', 'M1_UEFAlly_Bommber_Attack',
     {
         MasterPlatoonFunction = {SPAIFileName, 'PatrolThread'},
         PlatoonData = {
             PatrolChains = 'M1_UEFAlly_Attack_East_A'
         },
         Priority = 100,
     }
    )
    opai:SetChildQuantity('Bombers', quantity[Difficulty])
    --opai:SetLockingStyle() --'BuildTimer, {LockTimer = 1}'


    -- Interceptors

    -- #  Adds Some Baic Patrols for Interceptors to uses for defening the base
    quantity = {4,3,2}
    opai = UEFAllyAlliedBase:AddOpAI('AirAttacks', 'M1_UEFAlly_Interceptor_Defence',
     {
         MasterPlatoonFunction = {SPAIFileName, 'PatrolChainPickerThread'},
         PlatoonData = {
             PatrolChains = {
                'M1_UEFAlly_Initi_Patrol' -- cann Add mulipla Patrols chains here
             }
         },
         Priority = 100,
     }
    )
    opai:SetChildQuantity('Interceptors', quantity[Difficulty])
    opai:SetLockingStyle('None')

end

function OnStart(scenario)

    SetAlliance(Player1, UEFAlly, 'Ally')

    StartMission1()

end