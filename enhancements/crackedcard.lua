SMODS.Enhancement {
    key = 'crackedcard',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            XMult = 1.5,
            XChips = 1.5,
            odds = 15
        }
    },
    loc_txt = {
        name = 'Cracked Card',
        text = {
        [1] = '{C:inactive}oh you meant it literally{}',
        [2] = '{X:mult,C:white}X#1#{} Mult',
        [3] = '{X:chips,C:white}X#2#{} Chips',
        [4] = '{C:green}#3# in #4#{} chance of destroying itself'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    shatters = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 4,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'm_flush_crackedcard')
        return {vars = {numerator, denominator}}
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            if SMODS.pseudorandom_probability(card, 'group_0_1ff3f7eb', 1, card.ability.extra.odds, 'm_flush_crackedcard', false) then
                card.should_destroy = true
            end
            return { x_mult = card.ability.extra.XMult, x_chips = card.ability.extra.XChips }
        end
    end
}