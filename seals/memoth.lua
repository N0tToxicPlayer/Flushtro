SMODS.Seal {
    key = 'memoth',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            retrigger_times = 10
        }
    },
    badge_colour = HEX('864b1c'),
   loc_txt = {
        name = 'memoth',
        label = 'memoth',
        text = {
        [1] = '{C:attention}+10{} retriggers... ahem i mean {E:0.25,C:attention}mamoth{}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.repetition and card.should_retrigger then
            return { repetitions = card.ability.seal.extra.retrigger_times }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_retrigger = false
            card.should_retrigger = true
            card.ability.seal.extra.retrigger_times = 10
        end
    end
}