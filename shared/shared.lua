ltd = {
    itemMax = 5, -- Article max dans le panier.
    description = "Cliquer sur l'article pour le retirer",
    blips = {-- Blips.
		{pos = vector3(-48.519, -1757.514, 29.421), sprite = 52, scale = 0.8, colour = 2, nom = "Supérette"}, -- LTD Ballas
        {pos = vector3(-1820.3865966797, 792.61242675781, 138.10966491699), sprite = 52, scale = 0.8, colour = 2, nom = "Supérette"}, -- LTD Richman Glen
    },
    stand = {
        [1] = {
            pos = vector3(-48.519, -1757.514, 29.421), -- LTD Ballas
            valid = true -- Ne pas toucher
        },
        [2] = {
            pos = vector3(-1820.3865966797, 792.61242675781, 138.10966491699), -- LTD Richman Glen
            valid = true -- Ne pas toucher
        },

        [10] = {
            pos = vector3(-50.464179992676, -1754.7628173828, 29.420997619629),
            label = "Pain",
            item = 'bread',
            prix = 3.5,
            poid = 1,
            message = "Appuyez sur ~INPUT_CONTEXT~ pour ajouter ~y~un donuts~s~", -- LTD Ballas
            notif = "+ 1 Pain",
            valid = false -- Ne pas toucher
        },
        [11] = {
            pos = vector3(-45.269901275635, -1754.2990722656, 29.421010971069),
            label = "Café",
            item = 'coffee',
            prix = 1.0,
            poid = 1,
            message = "Appuyez sur ~INPUT_CONTEXT~ pour ajouter ~y~un café~s~", -- LTD Ballas
            notif = "+ 1 Café",
            valid = false -- Ne pas toucher
        },
        [12] = {
            pos = vector3(-55.68318939209, -1750.0692138672, 29.420997619629),
            label = "Bière",
            item = 'biere',
            prix = 1.5,
            poid = 1,
            message = "Appuyez sur ~INPUT_CONTEXT~ pour ajouter ~y~une bière~s~", -- LTD Ballas
            notif = "+ 1 Bierre",
            valid = false -- Ne pas toucher
        },
        [13] = {
            pos = vector3(-1823.6790771484, 796.18597412109, 138.1268157959),
            label = "Café",
            item = 'coffee',
            prix = 1.0,
            poid = 1,
            message = "Appuyez sur ~INPUT_CONTEXT~ pour ajouter ~y~un café~s~", -- LTD Richman Glen
            notif = "+ 1 Café",
            valid = false -- Ne pas toucher
        },
    },

}