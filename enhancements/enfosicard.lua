SMODS.Enhancement {
    key = 'enfosicard',
    pos = { x = 3, y = 0 },
    config = {
        bonus = 30,
        mult = 4,
        extra = {
            x_mult = 1.5,
            x_mult = 1.25,
            dollars = 12
        }
    },
    loc_txt = {
        name = 'Enfosi Card',
        text = {
        [1] = 'Always scores. works as any suit.',
        [2] = '{C:chips}+35{} Chips',
        [3] = '{C:mult}+15{} Mult',
        [4] = '{X:mult,C:white}X1.5{} Mult',
        [5] = '{X:mult,C:white}X1.25{} Mult while this card is held',
        [6] = '{C:money}$12{} if this card is held at',
        [7] = 'the end of the round',
        [8] = ''
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = true,
    replace_base_card = true,
    no_rank = false,
    no_suit = false,
    always_scores = true,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 1,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { x_mult = card.ability.extra.x_mult }
        end
        if context.cardarea == G.hand and context.main_scoring then
            return { x_mult = card.ability.extra.x_mult }
        end
        if context.end_of_round and context.cardarea == G.hand and context.other_card == card and context.individual then
            return { dollars = lenient_bignum(card.ability.extra.dollars) }
        end
    end
}