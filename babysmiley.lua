SMODS.Joker{ --Baby Smiley
    key = "babysmiley",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Baby Smiley',
        ['text'] = {
            [1] = 'awww look at the baby :D',
            [2] = '{C:inactive}does nothing other than{}',
            [3] = '{C:inactive}being a pet in your run{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_smiley"] = true },
    soul_pos = {
        x = 7,
        y = 1
    },

    set_ability = function(self, card, initial)
        card:set_edition("e_negative", true)
    end
}