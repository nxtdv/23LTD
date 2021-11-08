ltd = {
    itemMax = 5, -- Article max dans le panier.
    description = "Cliquer sur l'article pour le retirer",
    blips = {-- Blips.
		{pos = vector3(-48.519, -1757.514, 29.421), sprite = 52, scale = 0.4, colour = 2, nom = "Supérette"},
    },
    stand = {
        [1] = {
            pos = vector3(-48.519, -1757.514, 29.421),
            valid = true -- Ne pas toucher
        },
        [2] = {
            pos = vector3(-50.464179992676, -1754.7628173828, 29.420997619629),
            label = "Pain",
            item = 'bread',
            prix = 3.5,
            poid = 1,
            message = "Appuyez sur ~INPUT_CONTEXT~ pour ajouter ~y~un donuts~s~",
            notif = "+ 1 Pain",
            valid = false -- Ne pas toucher
        },
        [3] = {
            pos = vector3(-45.269901275635, -1754.2990722656, 29.421010971069),
            label = "Café",
            item = 'coffee',
            prix = 1.0,
            poid = 1,
            message = "Appuyez sur ~INPUT_CONTEXT~ pour ajouter ~y~un café~s~",
            notif = "+ 1 Café",
            valid = false -- Ne pas toucher
        },
        [4] = {
            pos = vector3(-55.68318939209, -1750.0692138672, 29.420997619629),
            label = "Bière",
            item = 'biere',
            prix = 1.5,
            poid = 1,
            message = "Appuyez sur ~INPUT_CONTEXT~ pour ajouter ~y~une bière~s~",
            notif = "+ 1 Bierre",
            valid = false -- Ne pas toucher
        },
    },

}