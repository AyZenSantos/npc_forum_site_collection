include('shared.lua')

surface.CreateFont( "HUDNumber5", {
    font = "HudNumbers",
    size = 13,
    weight = 500,
} )

function byayzen () 

	local FrameSite = vgui.Create( "DFrame" )
    FrameSite:SetPos( ScrW()/2-150, ScrH()/2-150 )
    FrameSite:SetSize( 350, 350 ) 
    FrameSite:SetTitle( "" )
    FrameSite:SetVisible( true )
    FrameSite:MakePopup()
    FrameSite:ShowCloseButton( false )
    local MainPanel = vgui.Create("DPanel", FrameSite)
    MainPanel:SetSize(FrameSite:GetWide(), FrameSite:GetTall())
    MainPanel.Paint = function(self)

        draw.RoundedBox( 4, 0, 0, MainPanel:GetWide(), MainPanel:GetTall(), Color( 52, 57, 62, 250))
end		
local CloseButton = vgui.Create("DButton", FrameSite)
CloseButton:SetSize(FrameSite:GetWide() / 10, FrameSite:GetTall() / 10- 5) 
CloseButton:AlignRight(8)
CloseButton:AlignTop(8)
CloseButton:SetText("")
CloseButton.DoClick = function()

FrameSite:Close()

end
CloseButton.Paint = function(self)

draw.RoundedBox(0,0,0,CloseButton:GetWide(),CloseButton:GetTall(),Color(255,0,0,255))

draw.DrawText("X ","Trebuchet24",CloseButton:GetWide() / 4+1,CloseButton:GetTall() / 11,Color(255,255,255,255),TEXT_ALIGN_LEFT) 

if CloseButton:IsHovered() then

draw.DrawText("X ","Trebuchet24",CloseButton:GetWide() / 4+1,CloseButton:GetTall() / 11-2,Color(255,255,255,255),TEXT_ALIGN_LEFT) 
end

end
DermaButton = vgui.Create("DButton",FrameSite) 
DermaButton:SetText("Site") --<<<<<-- Nom du Boutton A modifier Si Vous Le Souhaitez 
DermaButton:SetParent( FrameSite )	
DermaButton:SetPos(100,50) 
DermaButton:SetTextColor( Color( 255, 255, 255, 255 ) )
DermaButton:SetFont("Trebuchet24") 
DermaButton:SetSize(150,75)
DermaButton.Paint = function( self, w, h )
	draw.RoundedBox( 4, 0, 0, w, h, Color( 207, 97, 0, 225 ) )
end	
DermaButton.DoClick = function() 
	local frame = vgui.Create( "DFrame" ) 
frame:SetSize( 800, 600 )
frame:SetTitle( "Site Web" ) --<<<<<-- Nom du Boutton A modifier Si Vous Le Souhaitez 
frame:Center()
frame:MakePopup()
FrameSite:Close()

local window = vgui.Create( "DHTML", frame )
window:SetSize( 750, 500 )
window:Center()

local ctrls = vgui.Create( "DHTMLControls", frame ) 
ctrls:SetWide( 750 )
ctrls:SetPos( 25, 40 )
ctrls:SetHTML( window ) 
ctrls.AddressBar:SetText( "http://eternalcommunaute.wordpress.com" ) --<<<<<-- Mettez Votre URL a la Place de Celui que j'ai mis de base(lien de mon site)

window:MoveBelow( ctrls ) 
window:OpenURL( "http://eternalcommunaute.wordpress.com" )  --<<<<<-- Mettez Votre URL a la Place de Celui que j'ai mis de base(lien de mon site)

end
DermaButton = vgui.Create("DButton",FrameSite) 
DermaButton:SetText("Forum")   --<<<<<-- Nom du Boutton A modifier Si Vous Le Souhaitez 
DermaButton:SetParent( FrameSite )	
DermaButton:SetPos(100,150)
DermaButton:SetFont("Trebuchet24")  
DermaButton:SetTextColor( Color( 255, 255, 255, 255 ) )
DermaButton:SetSize(150,75)
DermaButton.Paint = function( self, w, h )
	draw.RoundedBox( 4, 0, 0, w, h, Color( 207, 97, 0, 225 ) )
end	
DermaButton.DoClick = function() 
	local frame = vgui.Create( "DFrame" )
frame:SetSize( 800, 600 )
frame:SetTitle( "Forum" )
frame:Center()
frame:MakePopup()
FrameSite:Close()

local window = vgui.Create( "DHTML", frame )
window:SetSize( 750, 500 )
window:Center()

local ctrls = vgui.Create( "DHTMLControls", frame ) 
ctrls:SetWide( 750 )
ctrls:SetPos( 25, 40 )
ctrls:SetHTML( window ) 
ctrls.AddressBar:SetText( "http://eternalsandbox.livehost.fr" ) --<<<<<-- Mettez Votre URL a la Place de Celui que j'ai mis de base(lien de mon site)

window:MoveBelow( ctrls ) 
window:OpenURL( "http://eternalsandbox.livehost.fr" ) --<<<<<-- Mettez Votre URL a la Place de Celui que j'ai mis de base(lien de mon site)  
end
DermaButton = vgui.Create("DButton",FrameSite) 
DermaButton:SetText("Collection")  
DermaButton:SetParent( FrameSite )	
DermaButton:SetPos(100,250)
DermaButton:SetFont("Trebuchet24")
DermaButton:SetTextColor( Color( 255, 255, 255, 255 ) )
DermaButton:SetSize(150,75)
DermaButton.Paint = function( self, w, h )
	draw.RoundedBox( 4, 0, 0, w, h, Color( 207, 97, 0, 225 ) )
end
DermaButton.DoClick = function() 
	 gui.OpenURL("http://steamcommunity.com/sharedfiles/filedetails/?id=827155348")
FrameSite:Close()
end
end

usermessage.Hook("byayzen", byayzen) 

hook.Add("PostDrawOpaqueRenderables", "byayzen", function() 
	for _, ent in pairs (ents.FindByClass("npc_ayzen")) do 
		if ent:GetPos():Distance(LocalPlayer():GetPos()) < 1000 then
			local Ang = ent:GetAngles()

			Ang:RotateAroundAxis( Ang:Forward(), 90)
			Ang:RotateAroundAxis( Ang:Right(), -90)
		
			cam.Start3D2D(ent:GetPos()+ent:GetUp()*79, Ang, 0.20)
				draw.SimpleTextOutlined( 'NPC Site', "HUDNumber5", 0, 0, Color( 255, 0, 0, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0, 0, 0, 255))			
			cam.End3D2D()
		end
	end
end)
