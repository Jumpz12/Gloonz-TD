include("shared.lua")

function GM:PlayerInitialSpawn(ply)

    gloonz.database.connect()

    local run = gloonz_database:query("INSERT INTO players VALUES(" .. ply:SteamID() .. ", " .. ply:Name() .. ", " .. 0 .. ", " .. 0 .. ", " .. 0 .. ")")
    run.onSuccess = function(q, data) print("Query: " .. q .. " was successful") print(data) gloonz.database.disconnect() end
    run.onError = function(q, e) print("An error happened with query: " .. q .. "\n".. e) gloonz.database.disconnect() end
    run:start()

end