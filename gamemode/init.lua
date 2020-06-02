include("shared.lua")

function GM:PlayerInitialSpawn(ply)

    gloonz.database.insertToTable("players", ply:SteamID(), ply:Name(), 0, 0, 0)
    ply:SetTeam(1)
    ply:Lock()
    ply:ConCommand( "team_menu" )

end

function GM:PlayerSelectSpawn(ply)

    local entity = ents.FindByClass("base_spawn")

    for k, v in pairs(entity) do

        if v.team == ply:Team() then

            return v

        end
        
    end

end

function team_1( ply ) 
 
    ply:SetTeam( 2 )
    ply:Spawn()

end 

function team_2( ply ) 

    ply:SetTeam( 3 )
    ply:Spawn()

end 

concommand.Add( "team_1", team_1 )
concommand.Add( "team_2", team_2 )
