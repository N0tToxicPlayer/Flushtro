SMODS.Enhancement {
    key = 'alternatecard',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            x_mult = 0.9,
            x_chips = 0.9,
            dollars = 1,
            retrigger_times = 1
        }
    },
    loc_txt = {
        name = 'Alternate Card',
        text = {
        [1] = '{X:red,C:white}{X:mult,C:white}X0.9{}{} Mult',
        [2] = '{X:chips,C:white}X0.9{} Chips,',
        [3] = 'Deducts {C:gold}$1{} when scored',
        [4] = 'Retriggers {C:attention}once{}'
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
    weight = 0,
    calculate = function(self, card, context)
        if context.repetition and card.should_retrigger then
            return { repetitions = card.ability.extra.retrigger_times }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = false
            card.should_retrigger = true
            SMODS.calculate_effect({x_mult = card.ability.extra.x_mult}, card)
            SMODS.calculate_effect({x_chips = card.ability.extra.x_chips}, card)
            SMODS.calculate_effect({dollars = -lenient_bignum(card.ability.extra.dollars)}, card)
        end
    end
}