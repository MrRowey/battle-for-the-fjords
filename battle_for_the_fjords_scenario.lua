version = 3 -- Lua Version. Dont touch this
ScenarioInfo = {
    name = "Battle for the Fjords",
    description = "As spring arrives, the ice and snow that keeps the Sirenukall river frozen begins to melt, and the river starts to flow again.",
    preview = '',
    map_version = 2,
    type = 'campaign_coop',
    starts = true,
    size = {1024, 1024},
    reclaim = {114457.5, 652640},
    map = '/maps/battle_for_the_fjords/battle_for_the_fjords.scmap',
    save = '/maps/battle_for_the_fjords/battle_for_the_fjords_save.lua',
    script = '/maps/battle_for_the_fjords/battle_for_the_fjords_script.lua',
    norushradius = 40,
    Configurations = {
        ['standard'] = {
            teams = {
                {
                    name = 'FFA',
                    armies = {'ARMY_1', 'UEFAlly', 'CYBRANEnemy'}
                },
            },
            customprops = {
                ['ExtraArmies'] = STRING( 'ARMY_17 NEUTRAL_CIVILIAN' ),
            },
        },
    },
}
