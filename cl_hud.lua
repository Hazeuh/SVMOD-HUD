--[[

Basic SVMod HUD By Haze 

]]
AddCSLuaFile()
-- Fonts
surface.CreateFont("HazeHUD:23", {size = 23, weight = 350, antialias = true, extended = true, font = "Roboto Condensed"})

-- Materials
local speed = Material("materials/h4z3/speed.png", "smooth mips")
local gazol = Material("materials/h4z3/fuel.png", "smooth mips")
local health = Material("materials/h4z3/health.png", "smooth mips")

-- Position Text & Icons
local HazeW, HazeH = ScrW(), ScrH()

local xIcons = HazeW * 0.965
local wIcons = HazeH * .04

local yHealth = HazeH * 0.780
local ySpeed = HazeH * 0.850
local yGazol = HazeH * 0.920

local xSpeedText = HazeW * 0.960
local ySpeedText = HazeH * 0.857

local xGazolText = HazeW * 0.962		
local yGazolText = HazeH * 0.930	

-------------SOON--------------
--local yHealthText = HazeH * 0.930
--local xHealthText = HazeH * 0.962
-------------SOON--------------

-- Color
local color_white = color_white
local color_black = color_black

-- HUD
local function SV_HUDPaint()
	local Vehicle = LocalPlayer():GetVehicle()

	-- Speed
	if Vehicle:SV_GetCachedSpeed() < 115 then
		draw.SimpleText(math.Round(Vehicle:SV_GetCachedSpeed()) .. " km/h", "HazeHUD:23", xSpeedText, ySpeedText, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
		surface.SetDrawColor(255, 255, 255)
	else
		draw.SimpleText(math.Round(Vehicle:SV_GetCachedSpeed()) .. " km/h", "HazeHUD:23", xSpeedText, ySpeedText, RealTime()%0.3 < 0.15 and Color(255, 0, 0) or color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
		surface.SetDrawColor(RealTime()%0.3 < 0.15 and Color(255, 0, 0) or color_white)
	end
		
	surface.SetMaterial(speed)
	surface.DrawTexturedRect(xIcons, ySpeed, wIcons, wIcons)

	--

	-- Gazol
	if Vehicle:SV_GetFuel() > 5 then
		draw.SimpleText(math.Round(Vehicle:SV_GetHealth()) .. " litres", "HazeHUD:23", xGazolText, yGazolText, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
		surface.SetDrawColor(255, 255, 255)
	else
		draw.SimpleText(math.Round(Vehicle:SV_GetHealth()) .. " litres", "HazeHUD:23", xGazolText, yGazolText, RealTime()%0.3 < 0.15 and Color(255, 0, 0) or color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
		surface.SetDrawColor(RealTime()%0.3 < 0.15 and Color(255, 0, 0) or color_white)
	end

	surface.SetMaterial(gazol)
	surface.DrawTexturedRect(xIcons, yGazol, wIcons, wIcons)
end

-- Hooks
hook.Add("SV_PlayerEnteredVehicle", "SV_EnableHUD", function(ply, veh)
	hook.Add("HUDPaint", "SV_HUDPaint")
end)

hook.Add("SV_PlayerEnteredVehicle", "SV_SendParts", function(ply, veh)
end)

hook.Add("SV_PlayerLeaveVehicle", "SV_DisableHUD", function()
	hook.Remove("HUDPaint", "SV_HUDPaint")
end)

--[[

For SVMod by TomLaVachette

]]
