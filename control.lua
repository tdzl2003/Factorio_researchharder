script.on_event({defines.events.on_research_finished},
    function (e)
        local value = game.difficulty_settings.technology_price_multiplier
        value = math.min(1000, math.floor(value * settings.global["research-price-multiplier"].value + settings.global["research-price-addition"].value));
        if (value ~= game.difficulty_settings.technology_price_multiplier) then
            game.difficulty_settings.technology_price_multiplier = value;
            for _, player in pairs(game.players) do
                player.print("[RH] Technology price multiplier now becomes " .. value)
            end
        end
    end
)
