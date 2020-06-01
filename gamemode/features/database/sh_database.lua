hook.Add("PostGamemodeLoaded", "CreatePlayerTable", function()
    gloonz.database.createTable("players", 

        {

            {
                name = "steamid",
                type = "int"
            },

            {
                name = "name",
                type = "varchar"
            },

            {
                name = "level",
                type = "int"
            },

            {
                name = "xp",
                type = "int"
            },

            {
                name = "money",
                type = "int"
            }

        }

    )
end)

