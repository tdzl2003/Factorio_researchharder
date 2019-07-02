script.on_event({defines.events.on_research_finished},
    function (e)
        if not global.difficulty then
          global.difficulty = game.difficulty_settings.technology_price_multiplier;
        end
        local value = global.difficulty
        value = value * settings.global["research-price-multiplier"].value + settings.global["research-price-addition"].value;
        value = math.min(value, 1000)

        if (math.floor(global.difficulty) ~= math.floor(value)) then
          game.difficulty_settings.technology_price_multiplier = math.floor(value);
          for _, player in pairs(game.players) do
              player.print("[RH] Technology price multiplier now becomes " .. math.floor(value))
          end
        end
        global.difficulty = value
    end
)
