SMODS.Joker{ --Fedora Smiley
    key = "fedorasmiley",
    config = {
        extra = {
            XChips = 1.5,
            XMult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Fedora Smiley',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1#{} Chips, {X:chips,C:white}X#2#{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_smiley"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.XChips, card.ability.extra.XMult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.XChips,
                    extra = {
                        Xmult = card.ability.extra.XMult
                        }
                }
        end
    end
}
