extends Panel

var gndUnits = [UnitData.Zealot.new(), UnitData.Stalker.new(), UnitData.Adept.new(), UnitData.Immortal.new(), UnitData.Archon.new(), UnitData.Voidray.new(), UnitData.Marine.new(), UnitData.Marauder.new(), UnitData.Hellbat.new(), UnitData.Zergling.new(), UnitData.Queen.new(), UnitData.Roach.new(), UnitData.Ravager.new(), UnitData.Hydralisk.new()]
var stalker = UnitData.Stalker.new()
var dmgStats = []

var total = 0

func _ready():
#	for i in gndUnits:
#		dmgStats.append(DamageCalc.ToKill(UnitData.Stalker.new(), i, 0)["DPS"])
#	for i in dmgStats:
#		total += i
#	total /= dmgStats.size()
#
#	$"Label".text = str(total)
#
#	dmgStats = []
	for unit in gndUnits:
		$"Label".text += str(unit.type) + ": " + str(unit.dpsPerCost(false, true))
		if unit.bonusDmg > 0:
			$"Label".text += "-" + str(unit.dpsPerCost(true, true)) + "\n"
		else:
			$"Label".text += "\n"


