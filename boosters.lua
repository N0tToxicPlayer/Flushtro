SMODS.Booster {
    key = 'alerto_pack',
    loc_txt = {
        name = "Alerto Pack",
        text = {
            "Choose 1 of up to 2 Alerto Jokers."
        },
        group_name = "Alerto Pack"
    },
    config = { extra = 2, choose = 1 },
    cost = 8,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "Joker",
        rarity = "flush_alerto",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "flush_alerto_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("4a4a4a"))
        ease_background_colour({ new_colour = HEX('4a4a4a'), special_colour = HEX("9b9b9b"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'alerto_pack2',
    loc_txt = {
        name = "Alerto Pack",
        text = {
            "Choose 1 of up to 2 Alerto Jokers."
        },
        group_name = "Alerto Pack"
    },
    config = { extra = 2, choose = 1 },
    cost = 8,
    atlas = "CustomBoosters",
    pos = { x = 1, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "Joker",
        rarity = "flush_alerto",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "flush_alerto_pack2"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("4a4a4a"))
        ease_background_colour({ new_colour = HEX('4a4a4a'), special_colour = HEX("9b9b9b"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'bundle_pack',
    loc_txt = {
        name = "Bundle Pack",
        text = {
            "Choose 1 of up to 2 Bundles"
        },
        group_name = "Bundle Pack"
    },
    config = { extra = 2, choose = 1 },
    cost = 6,
    atlas = "CustomBoosters",
    pos = { x = 2, y = 0 },
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "bundle",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "flush_bundle_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("4a90e2"))
        ease_background_colour({ new_colour = HEX('4a90e2'), special_colour = HEX("50e3c2"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'glaggleland_pack',
    loc_txt = {
        name = "Glaggleland Pack",
        text = {
            "Choose 1 of up to 2 Glaggleland Cards"
        },
        group_name = "Glaggleland Pack"
    },
    config = { extra = 2, choose = 1 },
    cost = 6,
    weight = 0.9,
    atlas = "CustomBoosters",
    pos = { x = 3, y = 0 },
    draw_hand = true,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local selected_index = pseudorandom('flush_glaggleland_pack_card', 1, 2)
        if selected_index == 1 then
            return {
            set = "glaggleland",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_glaggleland_pack"
            }
        elseif selected_index == 2 then
            return {
            key = "c_flush_theperipheralglag",
            set = "glaggleland",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_glaggleland_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("f8e71c"))
        ease_background_colour({ new_colour = HEX('f8e71c'), special_colour = HEX("f5a623"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'glaggleland_pack2',
    loc_txt = {
        name = "Glaggleland Pack",
        text = {
            "Choose 1 of up to 2 Glaggleland Cards"
        },
        group_name = "Glaggleland Pack"
    },
    config = { extra = 2, choose = 1 },
    cost = 6,
    weight = 0.9,
    atlas = "CustomBoosters",
    pos = { x = 4, y = 0 },
    draw_hand = true,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local selected_index = pseudorandom('flush_glaggleland_pack2_card', 1, 2)
        if selected_index == 1 then
            return {
            set = "glaggleland",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_glaggleland_pack2"
            }
        elseif selected_index == 2 then
            return {
            key = "c_flush_theperipheralglag",
            set = "glaggleland",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_glaggleland_pack2"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("f8e71c"))
        ease_background_colour({ new_colour = HEX('f8e71c'), special_colour = HEX("f5a623"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'alerto_pack_jumbo2',
    loc_txt = {
        name = "Jumbo Alerto Pack",
        text = {
            "Choose 1 of up to 4 Alerto Jokers."
        },
        group_name = "Jumbo Alerto Pack"
    },
    config = { extra = 4, choose = 1 },
    cost = 10,
    weight = 0.8,
    atlas = "CustomBoosters",
    pos = { x = 5, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1,
            0.1
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('flush_alerto_pack_jumbo2_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "Joker",
            rarity = "flush_alerto",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_alerto_pack_jumbo2"
            }
        elseif selected_index == 2 then
            return {
            key = "j_flush_early2024n0tn1ght",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_alerto_pack_jumbo2"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("4a4a4a"))
        ease_background_colour({ new_colour = HEX('4a4a4a'), special_colour = HEX("9b9b9b"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'alerto_pack_jumbo',
    loc_txt = {
        name = "Jumbo Alerto Pack",
        text = {
            "Choose 1 of up to 4 Alerto Jokers."
        },
        group_name = "Jumbo Alerto Pack"
    },
    config = { extra = 4, choose = 1 },
    cost = 10,
    weight = 0.8,
    atlas = "CustomBoosters",
    pos = { x = 6, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1,
            0.1
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('flush_alerto_pack_jumbo_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "Joker",
            rarity = "flush_alerto",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_alerto_pack_jumbo"
            }
        elseif selected_index == 2 then
            return {
            key = "j_flush_early2024n0tn1ght",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_alerto_pack_jumbo"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("4a4a4a"))
        ease_background_colour({ new_colour = HEX('4a4a4a'), special_colour = HEX("9b9b9b"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'jumbo_bundle_pack',
    loc_txt = {
        name = "Jumbo Bundle Pack",
        text = {
            "Choose 1 of up to 4 Bundles"
        },
        group_name = "Jumbo Bundle Pack"
    },
    config = { extra = 4, choose = 1 },
    cost = 8,
    atlas = "CustomBoosters",
    pos = { x = 7, y = 0 },
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "bundle",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "flush_jumbo_bundle_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("4a90e2"))
        ease_background_colour({ new_colour = HEX('4a90e2'), special_colour = HEX("50e3c2"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'glaggleland_pack_jumbo',
    loc_txt = {
        name = "Jumbo Glaggleland Pack",
        text = {
            "Choose 1 of up to 4 Glaggleland Cards"
        },
        group_name = "Jumbo Glaggleland Pack"
    },
    config = { extra = 4, choose = 1 },
    cost = 10,
    weight = 0.7,
    atlas = "CustomBoosters",
    pos = { x = 8, y = 0 },
    draw_hand = true,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1,
            0.1
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('flush_glaggleland_pack_jumbo_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "glaggleland",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_glaggleland_pack_jumbo"
            }
        elseif selected_index == 2 then
            return {
            key = "c_flush_theperipheralglag",
            set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_glaggleland_pack_jumbo"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("f8e71c"))
        ease_background_colour({ new_colour = HEX('f8e71c'), special_colour = HEX("f5a623"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'glaggleland_pack_jumbo2',
    loc_txt = {
        name = "Jumbo Glaggleland Pack",
        text = {
            "Choose 1 of up to 4 Glaggleland Cards"
        },
        group_name = "Jumbo Glaggleland Pack"
    },
    config = { extra = 4, choose = 1 },
    cost = 10,
    weight = 0.7,
    atlas = "CustomBoosters",
    pos = { x = 9, y = 0 },
    draw_hand = true,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1,
            0.1
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('flush_glaggleland_pack_jumbo2_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "glaggleland",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_glaggleland_pack_jumbo2"
            }
        elseif selected_index == 2 then
            return {
            key = "c_flush_theperipheralglag",
            set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_glaggleland_pack_jumbo2"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("f8e71c"))
        ease_background_colour({ new_colour = HEX('f8e71c'), special_colour = HEX("f5a623"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'jumbo_smiley_pack',
    loc_txt = {
        name = "Jumbo Smiley Pack",
        text = {
            "Choose 1 of up to 6 Smileys"
        },
        group_name = "Jumbo Smiley Pack"
    },
    config = { extra = 6, choose = 1 },
    cost = 7,
    weight = 0.8,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 1 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "flush_smiley",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "flush_jumbo_smiley_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("f8e71c"))
        ease_background_colour({ new_colour = HEX('f8e71c'), special_colour = HEX("f5a623"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'jumbo_smiley_pack2',
    loc_txt = {
        name = "Jumbo Smiley Pack",
        text = {
            "Choose 1 of up to 6 Smileys"
        },
        group_name = "Jumbo Smiley Pack"
    },
    config = { extra = 6, choose = 1 },
    cost = 7,
    weight = 0.8,
    atlas = "CustomBoosters",
    pos = { x = 1, y = 1 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "flush_smiley",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "flush_jumbo_smiley_pack2"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("f8e71c"))
        ease_background_colour({ new_colour = HEX('f8e71c'), special_colour = HEX("f5a623"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'alerto_pack_mega',
    loc_txt = {
        name = "Mega Alerto Pack",
        text = {
            "Choose 2 of up to 6 Alerto Jokers."
        },
        group_name = "Mega Alerto Pack"
    },
    config = { extra = 6, choose = 2 },
    cost = 14,
    weight = 0.8,
    atlas = "CustomBoosters",
    pos = { x = 2, y = 1 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1,
            0.3
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('flush_alerto_pack_mega_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "Joker",
            rarity = "flush_alerto",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_alerto_pack_mega"
            }
        elseif selected_index == 2 then
            return {
            key = "j_flush_early2024n0tn1ght",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_alerto_pack_mega"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("4a4a4a"))
        ease_background_colour({ new_colour = HEX('4a4a4a'), special_colour = HEX("9b9b9b"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'alerto_pack_mega2',
    loc_txt = {
        name = "Mega Alerto Pack",
        text = {
            "Choose 2 of up to 6 Alerto Jokers."
        },
        group_name = "Mega Alerto Pack"
    },
    config = { extra = 6, choose = 2 },
    cost = 14,
    weight = 0.8,
    atlas = "CustomBoosters",
    pos = { x = 3, y = 1 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1,
            0.3
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('flush_alerto_pack_mega2_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "Joker",
            rarity = "flush_alerto",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_alerto_pack_mega2"
            }
        elseif selected_index == 2 then
            return {
            key = "j_flush_early2024n0tn1ght",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_alerto_pack_mega2"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("4a4a4a"))
        ease_background_colour({ new_colour = HEX('4a4a4a'), special_colour = HEX("9b9b9b"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'mega_bundle_pack',
    loc_txt = {
        name = "Mega Bundle Pack",
        text = {
            "Choose 2 of up to 6 Bundles"
        },
        group_name = "Mega Bundle Pack"
    },
    config = { extra = 6, choose = 2 },
    cost = 12,
    atlas = "CustomBoosters",
    pos = { x = 4, y = 1 },
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "bundle",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "flush_mega_bundle_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("4a90e2"))
        ease_background_colour({ new_colour = HEX('4a90e2'), special_colour = HEX("50e3c2"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'glaggleland_pack_mega2',
    loc_txt = {
        name = "Mega Glaggleland Pack",
        text = {
            "Choose 2 of up to 4 Glaggleland Cards"
        },
        group_name = "Mega Glaggleland Pack"
    },
    config = { extra = 4, choose = 2 },
    cost = 14,
    weight = 0.5,
    atlas = "CustomBoosters",
    pos = { x = 5, y = 1 },
    draw_hand = true,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1,
            0.5
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('flush_glaggleland_pack_mega2_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "glaggleland",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_glaggleland_pack_mega2"
            }
        elseif selected_index == 2 then
            return {
            key = "c_flush_theperipheralglag",
            set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_glaggleland_pack_mega2"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("f8e71c"))
        ease_background_colour({ new_colour = HEX('f8e71c'), special_colour = HEX("f5a623"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'glaggleland_pack_mega',
    loc_txt = {
        name = "Mega Glaggleland Pack",
        text = {
            "Choose 2 of up to 4 Glaggleland Cards"
        },
        group_name = "Mega Glaggleland Pack"
    },
    config = { extra = 4, choose = 2 },
    cost = 14,
    weight = 0.5,
    atlas = "CustomBoosters",
    pos = { x = 6, y = 1 },
    draw_hand = true,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            1,
            0.5
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('flush_glaggleland_pack_mega_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            set = "glaggleland",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_glaggleland_pack_mega"
            }
        elseif selected_index == 2 then
            return {
            key = "c_flush_theperipheralglag",
            set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "flush_glaggleland_pack_mega"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("f8e71c"))
        ease_background_colour({ new_colour = HEX('f8e71c'), special_colour = HEX("f5a623"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'mega_smiley_pack',
    loc_txt = {
        name = "Mega Smiley Pack",
        text = {
            "Choose 2 of up to 6 Smileys"
        },
        group_name = "Mega Smiley Pack"
    },
    config = { extra = 6, choose = 2 },
    cost = 9,
    weight = 0.8,
    atlas = "CustomBoosters",
    pos = { x = 7, y = 1 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "flush_smiley",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "flush_mega_smiley_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("f8e71c"))
        ease_background_colour({ new_colour = HEX('f8e71c'), special_colour = HEX("f5a623"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'mega_smiley_pack2',
    loc_txt = {
        name = "Mega Smiley Pack",
        text = {
            "Choose 2 of up to 6 Smileys"
        },
        group_name = "Mega Smiley Pack"
    },
    config = { extra = 6, choose = 2 },
    cost = 9,
    weight = 0.8,
    atlas = "CustomBoosters",
    pos = { x = 8, y = 1 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "flush_smiley",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "flush_mega_smiley_pack2"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("f8e71c"))
        ease_background_colour({ new_colour = HEX('f8e71c'), special_colour = HEX("f5a623"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'smiley_pack',
    loc_txt = {
        name = "Smiley Pack",
        text = {
            "Choose 1 of up to 4 Smileys"
        },
        group_name = "Smiley Pack"
    },
    config = { extra = 4, choose = 1 },
    cost = 5,
    atlas = "CustomBoosters",
    pos = { x = 9, y = 1 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "flush_smiley",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "flush_smiley_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("f8e71c"))
        ease_background_colour({ new_colour = HEX('f8e71c'), special_colour = HEX("f5a623"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'smiley_pack2',
    loc_txt = {
        name = "Smiley Pack",
        text = {
            "Choose 1 of up to 4 Smileys"
        },
        group_name = "Smiley Pack"
    },
    config = { extra = 4, choose = 1 },
    cost = 5,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 2 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "flush_smiley",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "flush_smiley_pack2"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("f8e71c"))
        ease_background_colour({ new_colour = HEX('f8e71c'), special_colour = HEX("f5a623"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}
