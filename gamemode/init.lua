include("shared.lua")

function GM:PlayerInitialSpawn(ply)

    gloonz.database.insertToTable("players", ply:SteamID(), ply:Name(), 0, 0, 0)

end