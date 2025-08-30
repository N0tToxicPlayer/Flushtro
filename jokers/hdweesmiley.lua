SMODS.Joker{ --HD Wee Smiley
    key = "hdweesmiley",
    config = {
        extra = {
            jokerslots = 2
        }
    },
    loc_txt = {
        ['name'] = 'HD Wee Smiley',
        ['text'] = {
            [1] = 'look at the HD smiley :D',
            [2] = '{C:attention}+#1#{} {C:inactive}joker slot{}',
            [3] = '{C:inactive}(art by: Creechie){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_smiley"] = true },
    soul_pos = {
        x = 3,
        y = 10
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.jokerslots}}
    end,

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokerslots
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.jokerslots
    end
}
