extends Node

var unitCode = {-1 : null, 0 : null, 101 : Probe, 102 : Zealot, 103 : Stalker, 104 : Sentry, 105 : Adept, 106 : HT, 107 : DT, 108 : Archon, 109 : Observer, 110 : Prism, 111 : Immortal, 112 : Colossus, 113 : Disruptor, 114 : Phoenix, 115 : Voidray, 116 : Oracle, 117 : Tempest, 118 : Carrier, 119 : Interceptor, 120 : Mothership, 121 : Cannon, 122 : Battery,
201 : SCV, 202 : MULE, 203 : Marine, 204 : Marauder, 205 : Reaper, 206 : Ghost, 207 : Hellion, 208 : Hellbat, 209 : Widowmine, 210 : Cyclone, 211 : Tank, 212 : Thor, 213 : Viking, 214 : Medivac, 215 : Liberator, 216 : Raven, 217 : Banshee, 218 : Battlecruiser, 219 : Planetary, 220 : Turret, 221 : Bunker, 222 : Autoturret,
301 : Larva, 302 : Egg, 303 : Drone, 304 : Overlord, 305 : Queen, 306 : Zergling, 307 : Baneling, 308 : Roach, 309 : Ravager, 310 : Hydralisk, 311 : Lurker, 312 : Mutalisk, 313 : Corruptor, 314 : Swarmhost, 315 : Locust, 316 : Infestor, 317 : Viper, 318 : Ultralisk, 319 : Broodlord, 320 : Broodling, 321 : Spinecrawler, 322 : Sporecrawler}

#---------------#
#---Unit Data---#
#---------------#

"""
class :
	extends Unit
	
	func _ready():
		type = 
		faction = ""
		tags = [""]
		cost = []
		flying = 
		health = 
		shields = 
		armor = 
		shieldArmor = 
		moveSpeed = 
		canAttack = 
		spell = 
		hitGround = 
		hitAir = 
		attackRange = 
		attack = 
		attackSpeed = 
		attackMult = 
		bonusDmg = 
		bonusUp = 
		bonusVs = 
		weaponsUp = 
		armorUp = 
		shieldUp =
 """

#---protoss units---#

class Probe:
	extends Unit
	
	func _ready():
		type = "Probe"
		faction = "Protoss"
		tags = ["light", "mechanical"]
		cost = [50, 0, 1]
		flying =  false
		health = 20
		shields = 20
		armor = 0
		shieldArmor = 0
		moveSpeed = 3.94
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = .1
		attack = 5
		attackSpeed = 1.07
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 1

class Zealot:
	extends Unit
	
	func _ready():
		type = "Zealot"
		faction = "Protoss"
		tags = ["light", "biological"]
		cost = [100, 0, 2]
		flying = false
		health = 100
		shields = 50
		armor = 1
		shieldArmor =  0
		moveSpeed = 3.15
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = .1
		attack = 8
		attackSpeed = .86
		attackMult = 2
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1
		
	func applyUpgrade(b:bool):
		if b:
			moveSpeed = 4.725
		else:
			moveSpeed = 3.15

class Stalker:
	extends Unit
	
	func _ready():
		type = "Stalker"
		faction = "Protoss"
		tags = ["armored", "mechanical"]
		cost = [125, 50, 2]
		flying = false
		health = 80
		shields = 80
		armor = 1
		shieldArmor = 1 
		moveSpeed = 4.13
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 6
		attack = 13
		attackSpeed = 1.34
		attackMult = 1
		bonusDmg = 5
		bonusUp = 1
		bonusVs = "armored"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1

class Sentry:
	extends Unit
	
	func _ready():
		type = "Sentry"
		faction = "Protoss"
		tags = ["light", "mechanical", "psionic"]
		cost = [50, 100, 2]
		flying = false
		health = 40
		shields = 40
		armor = 1
		shieldArmor = 0 
		moveSpeed = 3.14
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 5 
		attack = 6
		attackSpeed = .71
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1

class Adept:
	extends Unit
	
	func _ready():
		type = "Adept"
		faction = "Protoss"
		tags = ["light", "biological"]
		cost = [125, 25, 2]
		flying =  false
		health = 70
		shields = 70
		armor = 1
		shieldArmor = 0
		moveSpeed = 3.5
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 4
		attack = 10
		attackSpeed = 1.61
		attackMult = 1
		bonusDmg = 12
		bonusUp = 1
		bonusVs = "light"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1
	
	func applyUpgrade(b:bool):
		if b:
			self.attackspeed = 1.11
		else:
			self.attackSpeed = 1.61

class HT:
	extends Unit
	
	func _ready():
		type = "High Templar"
		faction = "Protoss"
		tags = ["light", "biological", "psionic"]
		cost = [50, 150, 2]
		flying = false
		health = 40
		shields = 40
		armor = 0
		shieldArmor = 0
		moveSpeed = 2.62
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 6
		attack = 4
		attackSpeed = 1.25 
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1
		
	func changeWeapon(att:int):
		match att:
			0:
				attackUnit.attack = 4
				attackUnit.attackSpeed = 1.25
				attackUnit.attackMult = 1
				attackUnit.spell = false
				attackUnit.hitAir = false
			1:
				attackUnit.attack = 10
				attackUnit.attackSpeed = 0.357125
				attackUnit.attackMult = 8
				attackUnit.spell = true
				attackUnit.hitAir = true

class DT:
	extends Unit
	
	func _ready():
		type = "Dark Templar"
		faction = "Protoss"
		tags = ["light", "biological", "psionic"]
		cost = [125, 125, 2]
		flying = false
		health = 40
		shields = 80
		armor = 1
		shieldArmor = 0
		moveSpeed = 3.94
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = .1
		attack = 45
		attackSpeed = 1.21 
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 5
		armorUp = 1
		shieldUp = 1

class Archon:
	extends Unit
	
	func _ready():
		type = "Archon" 
		faction = "Protoss"
		tags = ["psionic", "massive"]
		cost = [100, 300, 4]
		flying = false
		health = 10
		shields = 350
		armor = 0
		shieldArmor = 0 
		moveSpeed = 3.94
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 3
		attack = 25
		attackSpeed = 1.25
		attackMult = 1
		bonusDmg = 10
		bonusUp = 1
		bonusVs = "biological"
		weaponsUp = 3
		armorUp = 1
		shieldUp = 1
	func applyModifier(mod:int):
		match mod:
			0: 
				attack = 25
				bonusDmg = 10
				weaponsUp = 3
			1: 
				attackUnit.attack = UnitData.archon.attack * .5
				attackUnit.bonusDmg = UnitData.archon.bonusDmg * .5
				attackUnit.weaponsUp = UnitData.archon.weaponsUp * .5
			2: 
				attackUnit.attack = UnitData.archon.attack * .25
				attackUnit.bonusDmg = UnitData.archon.bonusDmg * .25
				attackUnit.weaponsUp = UnitData.archon.weaponsUp * .25
				

class Observer:
	extends Unit
	
	func _ready():
		type = "Observer" 
		faction = "Protoss"
		tags = ["light", "mechanical"]
		cost = [25, 75, 1]
		flying = true
		health = 40
		shields = 20
		armor = 0
		shieldArmor = 0 
		moveSpeed = 2.63
		canAttack = false
		spell = false
		hitGround = false
		hitAir = false
		attackRange = 0
		attack = 0
		attackSpeed = 1
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 1

class Prism:
	extends Unit
	
	func _ready():
		type = "Warp Prism"
		faction = "Protoss"
		tags = ["armored", "mechanical", "psionic"]
		cost = [250, 0, 2]
		flying = true
		health = 80
		shields = 100
		armor = 0
		shieldArmor = 0
		moveSpeed = 4.13
		canAttack = false
		spell = false
		hitGround = false
		hitAir = false
		attackRange = 0
		attack = 0
		attackSpeed = 1
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 1
		
	func applyUpgrade(b:bool):
		if b:
			moveSpeed = 5.36
		else:
			moveSpeed = 4.13

class Immortal:
	extends Unit
	
	func _ready():
		type = "Immortal" 
		faction = "Protoss"
		tags = ["armored", "mechanical"]
		cost = [275, 100, 4]
		flying = false
		health = 200
		shields = 100
		armor = 1
		shieldArmor = 0 
		moveSpeed = 3.15
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 6
		attack = 20
		attackSpeed = 1.04
		attackMult = 1
		bonusDmg = 30
		bonusUp = 3
		bonusVs = "armored"
		weaponsUp = 2
		armorUp = 1
		shieldUp = 1

class Colossus:
	extends Unit
	
	func _ready():
		type = "Colossus"
		faction = "Protoss"
		tags = ["armored", "mechanical", "massive"]
		cost = [300, 200]
		flying = false
		health = 200
		shields = 150
		armor = 1
		shieldArmor = 0 
		moveSpeed = 3.15
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 7
		attack = 10
		attackSpeed = 1.07 
		attackMult = 2
		bonusDmg = 5
		bonusUp = 1
		bonusVs = "light"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1

class Disruptor:
	extends Unit
	
	func _ready():
		type = "Disruptor"
		faction = "Protoss"
		tags = ["armored", "mechanical"]
		cost = [150, 150, 3]
		flying = false
		health = 100
		shields = 100
		armor = 1
		shieldArmor = 0 
		moveSpeed = 3.15
		canAttack = true
		spell = true
		hitGround = true
		hitAir = false
		attackRange = 13.245
		attack = 145
		attackSpeed = 2.1
		attackMult = 1
		bonusDmg = 55
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 1

class Phoenix:
	extends Unit
	
	func _ready():
		type = "Phoenix" 
		faction = "Protoss"
		tags = ["light", "mechanical"]
		cost = [150, 100, 2]
		flying = true
		health = 120
		shields = 60
		armor = 0
		shieldArmor = 0 
		moveSpeed = 5.95
		canAttack = true
		spell = false
		hitGround = false
		hitAir = true
		attackRange = 5 
		attack = 5
		attackSpeed = .79
		attackMult = 2
		bonusDmg = 5
		bonusUp = 0
		bonusVs = "light"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1

class Voidray:
	extends Unit
	
	func _ready():
		type = "Voidray"
		faction = "Protoss"
		tags = ["armored", "mechanical"]
		cost = [250, 150, 4]
		flying = true
		health = 150
		shields = 100
		armor = 0
		shieldArmor = 1
		moveSpeed = 3.85
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 6
		attack = 6
		attackSpeed = .36 
		attackMult = 1
		bonusDmg = 4
		bonusUp = 0
		bonusVs = "armored"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1
		
	func applyUpgrade(b:bool):
		if b:
			bonusDmg = 10
		else:
			bonusDmg = 4

class Oracle:
	extends Unit
	
	func _ready():
		type = "Oracle" 
		faction = "Protoss"
		tags = ["armored", "mechanical", "psionic"]
		cost = [150, 150, 3]
		flying = true
		health = 100
		shields = 60
		armor = 0
		shieldArmor = 0
		moveSpeed = 5.6
		canAttack = true
		spell = true
		hitGround = true
		hitAir = false
		attackRange = 4
		attack = 15
		attackSpeed = .61 
		attackMult = 1
		bonusDmg = 7
		bonusUp = 0
		bonusVs = "light"
		weaponsUp = 0
		armorUp = 1
		shieldUp = 1

class Tempest:
	extends Unit
	
	func _ready():
		type = "Tempest"
		faction = "Protoss"
		tags = ["armored", "mechanical", "massive"]
		cost = [250, 175, 5]
		flying = true
		health = 200
		shields = 100
		armor = 2
		shieldArmor = 0 
		moveSpeed = 3.15
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 10
		attack = 40
		attackSpeed = 2.36
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = 0
		weaponsUp = 4 
		armorUp = 1
		shieldUp = 1
	func applyUpgrade(b:bool):
		if b:
			bonusDmg = 40
			bonusVs = "structure"
	func changeWeapon(att:int):
		match att:
			0:
				attackRange = 10
				attack = 40
				weaponsUp = 4
				bonusVs = "structure"
				bonusDmg = 0
				bonusUp = 0
			1:
				attackRange = 14
				attack = 30
				weaponsUp = 3
				bonusVs = "massive"
				bonusDmg = 22
				bonusUp = 2

class Carrier:
	extends Unit
	
	func _ready():
		type = "Carrier"
		faction = "Protoss"
		tags = ["armored", "mechanical", "massive"]
		cost = [350, 250, 6]
		flying = true
		health = 300
		shields = 150
		armor = 2
		shieldArmor = 0 
		moveSpeed = 2.62
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange =  8
		attack = 5
		attackSpeed = 2.14 
		attackMult = 16
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1

class Interceptor:
	extends Unit
	
	func _ready():
		type = "Interceptor"
		faction = "Protoss"
		tags = ["light", "mechanical"]
		cost = [15, 0, 0]
		flying = true
		health = 40
		shields = 40
		armor = 0
		shieldArmor = 0 
		moveSpeed = 10.5
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 2
		attack = 5
		attackSpeed = 2.14 
		attackMult = 2
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1

class Mothership:
	extends Unit
	
	func _ready():
		type = "Mothership"
		faction = "Protoss"
		tags = ["armored", "mechanical", "psionic", "massive", "heroic"]
		cost = [400, 400, 8]
		flying = true
		health = 350
		shields = 350
		armor = 2
		shieldArmor = 2 
		moveSpeed = 2.62
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 7 
		attack = 6
		attackSpeed = 1.58 
		attackMult = 6
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1

class Cannon:
	extends Unit
	
	func _ready():
		type = "Photon Cannon"
		faction = "Protoss"
		tags = ["armored", "structure"]
		cost = [150, 0, 0]
		flying = false
		health = 150
		shields = 150
		armor = 1
		shieldArmor = 0 
		moveSpeed = 0
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 7 
		attack = 20
		attackSpeed = .89 
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 0
		shieldUp = 1

class Battery:
	extends Unit
	
	func _ready():
		type = "Shield Battery"
		faction = "Protoss"
		tags = ["armored", "structure"]
		cost = [100, 0, 0]
		flying = false
		health = 150
		shields = 150
		armor = 1
		shieldArmor = 0 
		moveSpeed = 0
		canAttack = false
		spell = false
		hitGround = false
		hitAir = false
		attackRange = 0
		attack = 0
		attackSpeed = 1 
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 0
		shieldUp = 1

#---terran units---#

class SCV:
	extends Unit
	
	func _ready():
		type = "SCV"
		faction = "Terran"
		tags = ["light", "biological", "mechanical"]
		cost = [50, 0, 1]
		flying = false
		health = 45
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 3.94 
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = .1
		attack = 5
		attackSpeed = 1.07 
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 0

class MULE:
	extends Unit
	
	func _ready():
		type = "MULE"
		faction = "Terran"
		tags = ["light", "mechanical"]
		cost = [0, 0, 0]
		flying = false
		health = 60
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 3.94 
		canAttack = false
		spell = false
		hitGround = false
		hitAir = false
		attackRange = 0
		attack = 0
		attackSpeed = 1 
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 0

class Marine:
	extends Unit
	
	func _ready():
		type = "Marine" 
		faction = "Terran"
		tags = ["light", "biological"]
		cost = [50, 0, 1]
		flying = false
		health = 45
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 3.15 
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 5 
		attack = 6
		attackSpeed = .61 
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0
		
	func applyUpgrade(b:bool):
		if b:
			health = 55
			speed = 4.72
			attackSpeed = .61/1.5
		else:
			health = 45
			speed = 3.15
			attackSpeed = .61

class Reaper:
	extends Unit
	
	func _ready():
		type = "Reaper"
		faction = "Terran"
		tags = ["light", "biological"]
		cost = [50, 50, 1]
		flying = false
		health = 60
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 3.75 
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 5
		attack = 4
		attackSpeed = .79 
		attackMult = 2
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0

class Marauder:
	extends Unit
	
	func _ready():
		type = "Marauder"
		faction = "Terran"
		tags = ["armored", "biological"]
		cost = [100, 25, 2]
		flying = false
		health = 125
		shields = 0
		armor = 1
		shieldArmor = 0
		moveSpeed = 3.15 
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 6
		attack = 10
		attackSpeed = 1.07 
		attackMult = 1
		bonusDmg = 10
		bonusUp = 1
		bonusVs = "armored"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0
	func applyUpgrade(b:bool):
		if b:
			speed = 4.72
			attackSpeed = 1.07/1.5
		else:
			speed = 3.15
			attackSpeed = 1.07

class Ghost:
	extends Unit
	
	func _ready():
		type = "Ghost"
		faction = "Terran"
		tags = ["biological", "psionic"]
		cost = [150, 125]
		flying = false
		health = 100
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 3.94 
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 6 
		attack = 10
		attackSpeed = 1.07 
		attackMult = 1
		bonusDmg = 10
		bonusUp = 1
		bonusVs = "light"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0
	func changeWeapon(att:int):
		match index:
			0:
				attack = 10
				attackSpeed = 1.07
				bonusDmg = 10
				bonusVs = "light"
				spell = false
			1:
				attackUnit.attack = 170
				attackUnit.attackSpeed = 1.43
				attackUnit.bonusDmg = 0
				attackUnit.bonusVs = ""
				attackUnit.spell = true
			2:
				attackUnit.attack = 300
				attackUnit.attackSpeed = 14
				attackUnit.bonusDmg = 200
				attackUnit.bonusVs = "structure"
				attackUnit.spell = true

class Hellion:
	extends Unit
	
	func _ready():
		type = "Hellion"
		faction = "Terran"
		tags = ["light", "mechanical"]
		cost = [100, 0, 2]
		flying = false
		health = 90
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 5.95 
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 5 
		attack = 8
		attackSpeed = 1.79 
		attackMult = 1
		bonusDmg = 6
		bonusUp = 1
		bonusVs = "light"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0
	func applyUpgrade(b:bool):
		if b:
			bonusDmg = 11
		else:
			bonusDmg = 6

class Hellbat:
	extends Unit
	
	func _ready():
		type = "Hellbat"
		faction = "Terran"
		tags = ["light", "biological", "mechanical"]
		cost = [100, 0, 2]
		flying = false
		health = 135
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 3.15 
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 2
		attack = 18
		attackSpeed = 1.43 
		attackMult = 1
		bonusDmg = 0
		bonusUp = 1
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 0
	func applyUpgrade(b:bool):
		if b:
			bonusDmg = 12
		else:
			bonusDmg = 0

class Widowmine:
	extends Unit
	
	func _ready():
		type = "Widowmine"
		faction = "Terran"
		tags = ["light", "mechanical"]
		cost = [75, 25, 2]
		flying = false
		health = 90
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 3.94 
		canAttack = true
		spell = true
		hitGround = true
		hitAir = true
		attackRange = 5
		attack = 125
		attackSpeed = 1.07 
		attackMult = 1
		bonusDmg = 35
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 0

class Cyclone:
	extends Unit
	
	func _ready():
		type = "Cyclone"
		faction = "Terran"
		tags = ["armored", "mechanical"]
		cost = [150, 100, 3]
		flying = false
		health = 120
		shields = 0
		armor = 1
		shieldArmor = 0
		moveSpeed = 4.73 
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 5
		attack = 18
		attackSpeed = .71 
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 2
		armorUp = 1
		shieldUp = 0
	func changeWeapon(att:int):
		pass

class Tank:
	extends Unit
	
	func _ready():
		type = "Siege Tank"
		faction = "Terran"
		tags = ["armored", "mechanical"]
		cost = [150, 125, 3]
		flying = false
		health = 175
		shields = 0
		armor = 1
		shieldArmor = 0
		moveSpeed = 3.15 
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 7
		attack = 15
		attackSpeed = .74 
		attackMult = 1
		bonusDmg = 10
		bonusUp = 1
		bonusVs = "armored"
		weaponsUp = 2
		armorUp = 1
		shieldUp = 0
	func changeWeapon(att:int):
		pass

class Thor:
	extends Unit
	
	func _ready():
		type = "Thor"
		faction = "Terran"
		tags = ["armored", "mechanical", "massive"]
		cost = [300, 200, 6]
		flying = false
		health = 400
		shields = 0
		armor = 1
		shieldArmor = 0
		moveSpeed = 2.62
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 7
		attack = 30
		attackSpeed = .91 
		attackMult = 2
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 3
		armorUp = 1
		shieldUp = 0
	func changeWeapon(att:int):
		pass

class Viking:
	extends Unit
	
	func _ready():
		type = "Viking"
		faction = "Terran"
		tags = ["armored", "mechanical"]
		cost = [150, 75, 2]
		flying = true
		health = 135
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 3.85 
		canAttack = true
		spell = false
		hitGround = false
		hitAir = true
		attackRange = 9
		attack = 10
		attackSpeed = 1.43 
		attackMult = 2
		bonusDmg = 4
		bonusUp = 0
		bonusVs = "armored"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0

class Medivac:
	extends Unit
	
	func _ready():
		type = "Medivac"
		faction = "Terran"
		tags = ["armored", "mechanical"]
		cost = [100, 100, 2]
		flying = true
		health = 150
		shields = 0
		armor = 1
		shieldArmor = 0
		moveSpeed = 3.5 
		canAttack = false
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 0
		attack = 0
		attackSpeed = 1 
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 0

class Liberator:
	extends Unit
	
	func _ready():
		type = "Liberator"
		faction = "Terran"
		tags = ["armored", "mechanical"]
		cost = [150, 150, 3]
		flying = true
		health = 180
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 4.72
		canAttack = true
		spell = false
		hitGround = false
		hitAir = true
		attackRange = 5
		attack = 5
		attackSpeed = 1.29 
		attackMult = 2
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0

class Raven:
	extends Unit
	
	func _ready():
		type = "Raven"
		faction = "Terran"
		tags = ["light", "mechanical"]
		cost = [100, 200, 2]
		flying = false
		health = 140
		shields = 0
		armor = 1
		shieldArmor = 0
		moveSpeed = 4.13 
		canAttack = false
		spell = false
		hitGround = false
		hitAir = false
		attackRange = 0
		attack = 0
		attackSpeed = 1
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 0

"""
var scv:Unit = Unit.new("SCV", "Terran", ["light", "biological", "mechanical"]

var mule:Unit = Unit.new("MULE", "Terran", ["light", "mechanical"]

var marine:Unit = Unit.new("Marine", "Terran", ["light", "biological"]

var marauder:Unit = Unit.new("Marauder", "Terran", ["armored", "biological"]

var reaper:Unit = Unit.new("Reaper", "Terran", ["light", "biological"]

var ghost:Unit = Unit.new("Ghost", "Terran", ["psionic", "biological"]

var hellion:Unit = Unit.new("Hellion", "Terran", ["light", "mechanical"]

var hellbat:Unit = Unit.new("Hellbat", "Terran", ["mechanical", "light", "biological"]

var mine:Unit = Unit.new("Widowmine", "Terran", ["light", "mechanical", "spell"]


var cyclone:Unit = Unit.new("Cyclone", "Terran", ["armored", "mechanical"]

var tank:Unit = Unit.new("Siege Tank", "Terran", ["armored", "mechanical"]

var thor:Unit = Unit.new("Thor", "Terran", ["armored", "mechanical", "massive"]


var viking:Unit = Unit.new("Viking", "Terran", ["armored", "mechanical"]

var medivac:Unit = Unit.new("Medivac", "Terran", ["armored", "mechanical"]

var liberator:Unit = Unit.new("Liberator", "Terran", ["armored", "mechanical"]

var raven:Unit = Unit.new("Raven", "Terran", ["light", "mechanical"]

var banshee:Unit = Unit.new("Banshee", "Terran", ["light", "mechanical"]

var battlecruiser:Unit = Unit.new("Battle Cruiser", "Terran", ["armored", "mechanical", "massive"]

var planetary:Unit = Unit.new("Planetary Fortress", "Terran", ["armored", "mechanical", "structure"]

var turret:Unit = Unit.new("Missile Turret", "Terran", ["armored", "mechanical", "structure"]
}

var bunker:Unit = Unit.new("Bunker", "Terran", ["armored", "mechanical", "structure"]

var autoturret:Unit = Unit.new("Auto Turret", "Terran", ["armored", "mechanical", "structure"]



#---zerg units---#

var larva:Unit = Unit.new("Larva", "Zerg", ["biological", "light"]

var egg:Unit = Unit.new("Egg", "Zerg", ["biological", "light"]

var drone:Unit = Unit.new("Drone", "Zerg", ["light", "biological"]
var overlord:Unit = Unit.new("Overlord", "Zerg", ["armored", "biological"]

var queen:Unit = Unit.new("Queen", "Zerg", ["psionic", "biological"]

var zergling:Unit = Unit.new("Zergling", "Zerg", ["light", "biological"]

var baneling:Unit = Unit.new("Baneling", "Zerg", ["biological"]

var roach:Unit = Unit.new("Roach", "Zerg", ["armored", "biological"]

var ravager:Unit = Unit.new("Ravager", "Zerg", ["biological"]

var hydralisk:Unit = Unit.new("Hydralisk", "Zerg", ["light", "biological"]

var lurker:Unit = Unit.new("Lurker", "Zerg", ["armored", "biological"]

var mutalisk:Unit = Unit.new("Mutalisk", "Zerg", ["biological", "light"]

var corruptor:Unit = Unit.new("Corruptor", "Zerg", ["biological", "armored"]

var swarmhost:Unit = Unit.new("Swarmhost", "Zerg", ["biological", "armored"]

var locust:Unit = Unit.new("Locust", "Zerg", ["biological", "light"]

var infestor:Unit = Unit.new("Infestor", "Zerg", ["biological", "armored", "psionic", "spell"]

var viper:Unit = Unit.new("Viper", "Zerg", ["biological", "biological", "psionic", "spell"]

var ultralisk:Unit = Unit.new("Ultralisk", "Zerg", ["armored", "biological", "massive"]

var broodlord:Unit = Unit.new("Broodlord", "Zerg", ["biological", "armored", "massive"]

var broodling:Unit = Unit.new("Broodling", "Zerg", ["biological", "light"]

var spinecrawler:Unit = Unit.new("Spine Crawler", "Zerg", ["armored", "biological", "structure"]

var sporecrawler:Unit = Unit.new("Spore Crawler", "Zerg", ["armored", "biological", "structure"]
}
"""
