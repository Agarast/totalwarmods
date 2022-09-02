-- common.trigger_soundevent(string sound event name) => when all players have finished but you, when someone send a diplomacy request, when someone attacks

-- Turns, Rework => 1/ end should listen on click of endturn button, and start should also listen on unticking end turn button

core:add_listener(
    "bs_player_turn",
    "FactionTurnStart",
    function(context)
        return context:faction():is_human()
    end,
    function(context)
        core:set_boolean_preference('audio_mute_in_background',true)
    end,
    true
)

core:add_listener(
    "bs_player_turn",
    "FactionTurnEnd",
    function(context)
        return context:faction():is_human()
    end,
    function(context)
        core:set_boolean_preference('audio_mute_in_background',true)
    end,
    true
)

-- Diplomacy



--Battles, Rework => 1/ check if a player is involved 2/ switch to uitrigger

core:add_listener(
    "bs_pending_battle",
    "PendingBattle",
    true,
    function(context)
        core:set_boolean_preference('audio_mute_in_background',false)
    end,
    true
)

core:add_listener(
    "bs_pending_battle",
    "BattleCompleted",
    true,
    function(context)
        core:set_boolean_preference('audio_mute_in_background',true)
    end,
    true
)