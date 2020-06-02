include("shared.lua")

function set_team() 
 
    frame = vgui.Create( "DFrame" ) 
    frame:SetPos( 100, ScrH() / 2 )
    frame:SetSize( 200, 210 ) 
    frame:SetTitle( "Change Team" )
    frame:SetVisible( true ) 
    frame:SetDraggable( false ) 
    frame:ShowCloseButton( true ) 
    frame:MakePopup() 
    
    team_1 = vgui.Create( "DButton", frame ) 
    team_1:SetPos( 30, 30 )
    team_1:SetSize( 100, 50 ) 
    team_1:SetText( "Team 1" ) 
    team_1.DoClick = function()
    
        RunConsoleCommand( "team_1" ) 
    
    end 
    
    team_2 = vgui.Create( "DButton", frame ) 
    team_2:SetPos( 30, 85 )
    team_2:SetSize( 100, 50 ) 
    team_2:SetText( "Team 2" ) 
    team_2.DoClick = function() 
    
        RunConsoleCommand( "team_2" ) 
    
    end 
    
end 
concommand.Add( "team_menu", set_team ) 