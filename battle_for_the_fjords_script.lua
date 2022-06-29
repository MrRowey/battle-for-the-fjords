local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')
local BaseManager = import('/lua/AI/OpAI/BaseManager.lua')

-- Army Numbers
local Player1 = 1
local UEFAlly = 2

function OnPopulate()
    ScenarioUtils.InitializeScenarioArmies()
end

local UEFAllySouthBase = BaseManager.CreateBaseManager()

function StartMission1()

    -- Setting the Playable Area
    ScenarioFramework.SetPlayableArea('M1_Playable_Area', false)

    UEFAllySouthBase:Initialize(
        ArmyBrains[UEFAlly],
        'M1_South_Base',
        'M1_South_Base_Marker',
        80,
        {M1_South_Base = 100}
    )

    UEFAllySouthBase:StartNonZeroBase({{7,5,3}, {5,4,3}})
    UEFAllySouthBase:SetActive('AirScouting', true)

end

function OnStart(scenario)

    SetAlliance(Player1, UEFAlly, 'Ally')

    StartMission1()




end