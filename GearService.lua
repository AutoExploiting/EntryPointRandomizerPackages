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

function GearService:SetGear()
for i,v in pairs(self.CurrentGear) do
local lp = game.Players.LocalPlayer
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
GearService:RerollGear()


return GearService
