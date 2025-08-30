SMODS.Enhancement {
    key = 'zfightingcard',
    pos = { x = 5, y = 0 },
    config = {
        extra = {
            Chance = 1,
            XMult = 2,
            XChips = 2
        }
    },
    loc_txt = {
        name = 'Z-Fighting Card',
        text = {
        [1] = '{X:mult,C:white}X#2#{} Mult or {X:chips,C:white}X#3#{} Chips'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 4,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.ability.extra.Chance = pseudorandom('Chance_8a267c76', 1, 2)
        end
        if context.main_scoring and context.cardarea == G.play and (card.ability.extra.Chance or 0) == 1 then
            return { x_mult = card.ability.extra.XMult }
        end
        if context.main_scoring and context.cardarea == G.play and (card.ability.extra.Chance or 0) == 2 then
            return { x_chips = card.ability.extra.XChips }
        end
    end
}