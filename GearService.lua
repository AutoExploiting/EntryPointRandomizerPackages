local GearService = {}
GearService.SelectedGear = {}
GearService.ValidGear = {
"Crowbar";
"FirstAid";
"Drill";
"FragGrenade";
"KeycardScrambler";
"BreachingCharge";
"Claymore";
"Blowtorch";
"Microcam";
"SilentDrill";
"C4";
"KeycardHS";
"Propane";
"BlackDuskBomb";
"KeycardSecurity";
"KeycardMaster";
"LockpickKit";
}
local lp = game.Players.LocalPlayer

function GearService:SetGear(loadout)
if loadout == nil then loadout = 1 end
for i,v in pairs(lp.PlayerData.Loadout["1"].Gear:GetChildren()) do v:Destroy() end

for i,v in pairs(self.CurrentGear) do
local s = getsenv(lp.PlayerGui.LoadoutGui.Loadout.LoadoutRunner)
func = s.GearItemAddRemote
func:InvokeServer(lp.PlayerData.Loadout["1"].Gear, v)
end
end

function GearService:RerollGear()
self.CurrentGear = {}
local Num = math.random(1, 3)
for i = 1, Num do
gear = self.ValidGear[math.random(1, #self.ValidGear)]
table.insert(self.CurrentGear, gear)
end
warn("GEAR REROLLED")
table.foreach(self.CurrentGear, print)
self:SetGear()
end


return GearService
