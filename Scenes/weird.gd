extends Panel

var gndUnits = [UnitData.Zealot.new(), UnitData.Zergling.new(), UnitData.Marine.new(), UnitData.Stalker.new(),
	UnitData.Adept.new(), UnitData.Marauder.new(), UnitData.Roach.new(), UnitData.Ravager.new(), UnitData.Hydralisk.new()]
var stalker = UnitData.Stalker.new()
var dmgStats = []

var total = 0

func _ready():
	print(UnitData.protossUnits.back().new().type)
	print(UnitData.terranUnits.back().new().type)
	print(UnitData.zergUnits.back().new().type)
	
func _process(delta):
#	for i in gndUnits:
#		dmgStats.append(DamageCalc.ToKill(UnitData.Stalker.new(), i, 0)["DPS"])
#	for i in dmgStats:
#		total += i
#	total /= dmgStats.size()
#
#	$"Label".text = str(total)
#
#	dmgStats = []

	var eef = stalker.perCost()
	
	$"Label".text = str(eef["health"]) + "\n"
	$"Label".text += str(eef["DPS"])
