extends Node

func ToKill(attackUnit, defendUnit, attackboxUp, armorboxUp, shieldboxUp, healing):
	
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
		zergRegen = .38 if defendUnit.type != "Mutalisk" else 1.4

	var shotsToKill = 0.0

	var shotTotals:String

	var Dmg = (attack + (weaponsUp * attackboxUp) + (bonusUp * attackboxUp))
	var healthDmg = max((Dmg - (armor + (armorUp * armorboxUp))), .5)
	var shieldDmg = max((Dmg - (shieldArmor + (shieldUp * shieldboxUp))), .5)
	
	#single instance spell damage bypasses traditional calculation to handle bonus shield damage
	#DoT spells calculate based on proper instances of damageand use the traditional calculation instead
	if attackUnit.spell attackUnit.type in ["Ghost", "Disruptor", "Widowmine", "Battlecruiser"]:
		if defendUnit.type == "Protoss":
			shields -= bonusDmg
		shotsToKill = (health + max(shields, 0))/attack
		shotTotals = str(ceil(shotsToKill)) + "\n"
		shotTotals = shotTotals + str(attackSpeed*shotsToKill) + "s\n\n"
		return shotTotals


	if defendUnit.faction == "Protoss":
		while shields > 0:
			shields -= shieldDmg
			shotsToKill += 1.0
			barrierCD -= attackSpeed
			#immortal barrier logic: kicks in AFTER first shot, bonus 100 shields for my best approx of 2 seconds.
			#Armor comes from shields if there are shields underneath the barrier, otherwise hull armor
			if defendUnit.type == "Immortal" and $"%DefenderModifier".pressed == true and barrierCD < 0:
				var barrier:float = 100
				barrierCD = 2 - attackSpeed
				while barrier > 0:
					barrier -= shieldDmg
					shotsToKill += 1.0
					barrierCD -= attackSpeed
					if barrierCD < attackSpeed:
						barrier = 0
						break
				barrierCD = 30.0
		var timeToKill = ceil(shotsToKill/attackMult) * attackSpeed
		if attackUnit.spell:
				timeToKill = shotsToKill * attackSpeed
		shotTotals = str(ceil(shotsToKill/attackMult)) + "\n"
		shotTotals = shotTotals + str(timeToKill) + "s\n\n"

		health -= (shields * -1) - (armor + (armorUp * armorboxUp))

		while health > 0:
			health -= healthDmg
			shotsToKill += 1.0
			barrierCD -= attackSpeed
			if defendUnit.type == "Immortal" and $"%DefenderModifier".pressed == true and barrierCD < 0:
				var barrier:float = 100
				barrierCD = 2.0
				while barrier > 0:
					barrier -= healthDmg
					shotsToKill += 1.0
					barrierCD -= attackSpeed
					if barrierCD < attackSpeed:
						barrier = 0
				barrierCD = 30.0
		timeToKill = ceil(shotsToKill/attackMult) * attackSpeed
		if attackUnit.spell:
			timeToKill = shotsToKill * attackSpeed
		shotTotals = shotTotals + str(ceil(shotsToKill/attackMult)) + "\n"
		shotTotals = shotTotals + str(timeToKill) + "s\n"


	else: #non-protoss defender	
		while health > 0:
			health -= healthDmg
			shotsToKill += 1.0
			if shotsToKill > 1:
				health += zergRegen * (attackSpeed/attackMult)
				health += healing * (attackSpeed/attackMult)
			if shotsToKill >= 10000:
				break
		if shotsToKill < 10000:
			var timeToKill = ceil(shotsToKill/attackMult) * attackSpeed
			if attackUnit.spell:
				timeToKill = shotsToKill * attackSpeed
			shotTotals = str(ceil(shotsToKill/attackMult)) + "\n"
			shotTotals = shotTotals + str(timeToKill) + "s\n"
		else:
			shotTotals = ">10,000 (Infinite?)\nInfinite?"
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

