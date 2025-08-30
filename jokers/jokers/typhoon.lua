SMODS.Joker{ --Typhoon
    key = "typhoon",
    config = {
        extra = {
            MultX = 3,
            ChipX = 3.75,
            Incremental = 0.65
        }
    },
    loc_txt = {
        ['name'] = 'Typhoon',
        ['text'] = {
            [1] = '{C:attention,s:1.25}Typhoon Jimbo{} is on direct path towards our region,',
            [2] = 'Expect{C:attention} destructive winds{}, {C:attention}widespread torrential rainfall{},',
            [3] = 'and {C:attention}extremely dangerous storm surges{} along the coast.',
            [4] = '',
            [5] = '{X:mult,C:white}X#1#{} Mult and {X:chips,C:white}X#2#{} Chips',
            [6] = '',
            [7] = ']If a first hand is discarded, {C:attention}destroy{} hand and',
            [8] = '{X:attention,C:white}+#3#{} to {X:mult,C:white}XMult{} and {X:chips,C:white}XChips{} for each card {C:attention}discarded{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 21
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.MultX, card.ability.extra.ChipX, card.ability.extra.Incremental}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.MultX,
                    extra = {
                        x_chips = card.ability.extra.ChipX,
                        colour = G.C.DARK_EDITION
                        }
                }
        end
        if context.discard  then
            if G.GAME.current_round.discards_used <= 0 then
                return {
                    remove = true,
                  message = "Destroyed!",
                    extra = {
                        func = function()
                    card.ability.extra.MultX = (card.ability.extra.MultX) + card.ability.extra.MultX
                    return true
                end,
                            message = "Upgrade!",
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                    card.ability.extra.ChipX = (card.ability.extra.ChipX) + card.ability.extra.ChipX
                    return true
                end,
                            message = "Upgrade!",
                            colour = G.C.GREEN
                        }
                        }
                }
            end
        end
    end
}