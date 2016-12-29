    if SERVER then
       AddCSLuaFile( "shared.lua" )
    end
	
    if CLIENT then
       SWEP.PrintName    = "Plantifier"
       SWEP.Slot         = 6
     
       SWEP.ViewModelFlip = true
       SWEP.ViewModelFOV                    = 64
       
       SWEP.EquipMenuData = {
          type = "item_weapon",
          desc = [[Man, I fucking love trees]]
       }
	   
      -- SWEP.Icon = "YOUR CHOICE YO"
    end
	
	
	
	SWEP.HoldType                           = "normal"
	SWEP.Base = "weapon_tttbase"
	 
    SWEP.ViewModel                          = "models/weapons/v_crowbar.mdl"   -- Weapon view model
    SWEP.WorldModel                         = "models/props_lab/huladoll.mdl"   -- Weapon world model
    SWEP.FiresUnderwater = false
     
    SWEP.Primary.Sound                      = Sound("")             -- Script that calls the primary fire sound
    SWEP.Primary.Delay                      = 1                    -- This is in Rounds Per Minute
    SWEP.Primary.ClipSize                   = -1             -- Size of a clip
    SWEP.Primary.DefaultClip                = -1             -- Bullets you start with
    SWEP.Primary.Automatic                  = false         -- Automatic = true; Semi Auto = false
    SWEP.Primary.Ammo                       = "none"
	SWEP.LimitedStock = true
	
	SWEP.NoSights = true
     
    SWEP.AllowDrop = false
    SWEP.Kind = WEAPON_EQUIP1
    SWEP.CanBuy = {ROLE_TRAITOR}
     
	
	function SWEP:PrimaryAttack()
		if not (OldModel) then
			OldModel = self.Owner:GetModel()
		end
		self.Owner:SetModel("models/props/cs_office/plant01.mdl")
		if CLIENT then
			chat.AddText("You're a plant!")
		end
	end

     
    function SWEP:SecondaryAttack()
		if (OldModel) then
			self.Owner:SetModel(OldModel)
			if CLIENT then
				chat.AddText("You're a human!")
			end
		end
	end
	 
	 
	 
	 
	 
	 
	 
	function SWEP:OnRemove()
		if CLIENT and IsValid(self.Owner) and self.Owner == LocalPlayer() and self.Owner:Alive() then
			RunConsoleCommand("lastinv")
		end
	end
     
	function SWEP:Reload()
		return false
	end