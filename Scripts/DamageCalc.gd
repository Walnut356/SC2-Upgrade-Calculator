extends Node

func ToKill(attackUnit, defendUnit, attackboxUp = 0, armorboxUp = 0, shieldboxUp = 0, healing = 0):
	var health:float = defendUnit.health
	var shields:float = defendUnit.shields

	var armor = defendUnit.armor
	var armorUp = defendUnit.armorUp
	var shieldUp = defendUnit.shieldUp
	var shieldArmor = defendUnit.shieldArmor
	if attackUnit.spell:
		armor = 0
		armorUp = 0
		shieldUp = 0
		shieldArmor = 0

	var attack = attackUnit.attack
	var attackMult = attackUnit.attackMult
	var weaponsUp = attackUnit.weaponsUp
	var bonusDmg = attackUnit.bonusDmg
	var bonusUp = 0
	if attackUnit.bonusVs in defendUnit.tags:
		attack += bonusDmg
		bonusUp = attackUnit.bonusUp
	var attackSpeed = attackUnit.attackSpeed
	var barrierCD:float = 0.0
	var zergRegen = 0
	if defendUnit.faction == "Zerg":
		zergRegen = .3822 if defendUnit.type != "Mutalisk" else 1.4

	var shotsToKill = 0.0

	var Dmg = (attack + (weaponsUp * attackboxUp) + (bonusUp * attackboxUp))
	var healthDmg = max((Dmg - (armor + (armorUp * armorboxUp))), .5)
	var shieldDmg = 0
	if defendUnit.faction == "Protoss":
		shieldDmg = max((Dmg - (shieldArmor + (shieldUp * shieldboxUp))), .5)


	var shotTotals:Dictionary = {"STK" : "-", "TTK" : "-", "SSHB" : "-", "TSHB" : "-", "totaldmg" : 0, "DPS": 0,
	"totalhealing" : 0, "overkill" : 0, "shotdmg" : str(healthDmg) + " | " + str(shieldDmg)}

	if attackUnit.type in ["Ghost", "Disruptor", "Widowmine", "Battlecruiser"]:
		if defendUnit.type == "Protoss":
			shields -= bonusDmg
		shotsToKill = (health + max(shields, 0))/attack
		shotTotals["STK"] = shotsToKill
		shotTotals["TTK"] = attackSpeed*shotsToKill
		shotTotals["totaldmg"] = (shotsToKill * attack) + bonusDmg
		return shotTotals

	if defendUnit.faction == "Protoss":
		while shields > 0:
			shields -= shieldDmg
			shotTotals["totaldmg"] += shieldDmg
			shotsToKill += 1.0
			barrierCD -= attackSpeed
			#immortal barrier logic: kicks in AFTER first shot, bonus 100 shields for
			#my best approx of 2 seconds, does take armor upgrades into account
			if defendUnit.type == "Immortal" and get_tree().get_root().get_node("Control/AspectRatioContainer/MainArea/DefendSelectionArea/DefenderModifier").pressed == true and barrierCD < 0:
				var barrier:float = 100
				barrierCD = 2.14286 - attackSpeed
				while barrier > 0:
					barrier -= shieldDmg
					shotTotals["totaldmg"] += shieldDmg
					shotsToKill += 1.0
					barrierCD -= attackSpeed
					if barrierCD < attackSpeed:
						barrier = 0
						break
				barrierCD = 30.0
		var timeToKill = ceil(shotsToKill/attackMult) * attackSpeed
		if attackUnit.spell:
				timeToKill = shotsToKill * attackSpeed
		shotTotals["SSHB"] = ceil(shotsToKill/attackMult)
		shotTotals["TSHB"] = timeToKill
		
		if shields < 0:
			health -= (shields * -1) - (armor + (armorUp * armorboxUp))
			shields = 0

		while health > 0:
			health -= healthDmg
			shotTotals["totaldmg"] += healthDmg
			shotsToKill += 1.0
			barrierCD -= attackSpeed
			if defendUnit.type == "Immortal" and get_tree().get_root().get_node("Control/AspectRatioContainer/MainArea/DefendSelectionArea/DefenderModifier").pressed == true and barrierCD < 0:
				var barrier:float = 100
				barrierCD = 2.14286
				while barrier > 0:
					barrier -= healthDmg
					shotTotals["totaldmg"] += healthDmg
					shotsToKill += 1.0
					barrierCD -= attackSpeed
					if barrierCD < attackSpeed:
						barrier = 0
				barrierCD = 30.0
	else:
		#non-protoss defender
		while health > 0:
			health -= healthDmg
			shotTotals["totaldmg"] += healthDmg
			shotsToKill += 1.0
			if shotsToKill > 1:
				health += zergRegen * (attackSpeed/attackMult)
				health += healing * (attackSpeed/attackMult)
				shotTotals["totalhealing"] += (zergRegen * (attackSpeed/attackMult)) + (healing * (attackSpeed/attackMult))
			if shotsToKill >= 10000:
				break
	if shotsToKill < 10000:
		var timeToKill = ceil(shotsToKill/attackMult) * attackSpeed
		if attackUnit.spell:
			timeToKill = shotsToKill * attackSpeed
		shotTotals["STK"] = ceil(shotsToKill/attackMult)
		shotTotals["TTK"] = timeToKill
		shotTotals["DPS"] = (defendUnit.health + defendUnit.shields + shotTotals["totalhealing"]) / timeToKill
		shotTotals["overkill"] = abs(health)
	else:
		shotTotals["STK"] = ">10,000 (Infinite?)"
	return shotTotals

func CanAttack(attackUnit, defendUnit) -> bool:
	if attackUnit.canAttack:
		if (attackUnit.type in ["Liberator", "Viper", "Widowmine", "Infestor"]) and "structure" in defendUnit.tags:
			return false
		if attackUnit.hitAir and attackUnit.hitGround:
			return true
		elif attackUnit.hitAir and defendUnit.flying:
			return true
		elif attackUnit.hitGround and not defendUnit.flying:
			return true
		else:
			return false
	else:
		return false

