extends Node

var unitCode = {-1 : null, 0 : null, 101 : Probe, 102 : Zealot, 103 : Stalker, 104 : Sentry, 105 : Adept, 106 : HT, 107 : DT, 108 : Archon, 109 : Observer, 110 : Prism, 111 : Immortal, 112 : Colossus, 113 : Disruptor, 114 : Phoenix, 115 : Voidray, 116 : Oracle, 117 : Tempest, 118 : Carrier, 119 : Interceptor, 120 : Mothership, 121 : Cannon, 122 : Battery,
201 : SCV, 202 : MULE, 203 : Marine, 204 : Marauder, 205 : Reaper, 206 : Ghost, 207 : Hellion, 208 : Hellbat, 209 : Widowmine, 210 : Cyclone, 211 : Tank, 212 : Thor, 213 : Viking, 214 : Medivac, 215 : Liberator, 216 : Raven, 217 : Banshee, 218 : Battlecruiser, 219 : Planetary, 220 : Turret, 221 : Bunker, 222 : Autoturret,
301 : Larva, 302 : Egg, 303 : Drone, 304 : Overlord, 305 : Queen, 306 : Zergling, 307 : Baneling, 308 : Roach, 309 : Ravager, 310 : Hydralisk, 311 : Lurker, 312 : Mutalisk, 313 : Corruptor, 314 : Swarmhost, 315 : Locust, 316 : Infestor, 317 : Viper, 318 : Ultralisk, 319 : Broodlord, 320 : Broodling, 321 : Spine, 322 : Spore}

#---------------#
#---Unit Data---#
#---------------#

#future changes:
#re-calc movespeed to match editor rather than liquipedia

#---protoss units---#

class Probe:
	extends Unit

	func _init():
		type = "Probe"
		faction = "Protoss"
		tags = ["light", "mechanical"]
		cost = [50, 0, 1]
		flying =  false
		health = 20
		shields = 20
		armor = 0
		shieldArmor = 0
		moveSpeed = 3.9382
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = .1
		attack = 5
		attackSpeed = 1.07143
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 1

class Zealot:
	extends Unit

	func _init():
		type = "Zealot"
		faction = "Protoss"
		tags = ["light", "biological"]
		cost = [100, 0, 2]
		flying = false
		health = 100
		shields = 50
		armor = 1
		shieldArmor = 0
		moveSpeed = 3.15
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = .1
		attack = 8
		attackSpeed = 0.857143
		attackMult = 2
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1
	func applyUpgrade(b:bool): #charge passive movespeed
		if b:
			moveSpeed = 4.725
		else:
			moveSpeed = 3.15

class Stalker:
	extends Unit

	func _init():
		type = "Stalker"
		faction = "Protoss"
		tags = ["armored", "mechanical"]
		cost = [125, 50, 2]
		flying = false
		health = 80
		shields = 80
		armor = 1
		shieldArmor = 0
		moveSpeed = 4.1342
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 6
		attack = 13
		attackSpeed = 1.33571
		attackMult = 1
		bonusDmg = 5
		bonusUp = 1
		bonusVs = "armored"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1

class Sentry:
	extends Unit

	func _init():
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
		attackSpeed = 0.714286
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1

class Adept:
	extends Unit

	func _init():
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
		attackSpeed = 1.60714
		attackMult = 1
		bonusDmg = 12
		bonusUp = 1
		bonusVs = "light"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1
	func applyUpgrade(b:bool): #glaives
		if b:
			attackSpeed = 1.10837
		else:
			attackSpeed = 1.60714

class HT:
	extends Unit

	func _init():
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
		attackSpeed = 1.25286
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1

	func changeWeapon(att:int):
		match att:
			0: #base attack
				attack = 4
				attackSpeed = 1.25286
				attackMult = 1
				spell = false
				hitAir = false
			1: #storm
				attack = 10
				attackSpeed = 0.357125
				attackMult = 8
				spell = true
				hitAir = true

class DT:
	extends Unit

	func _init():
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

	func _init():
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
		attackSpeed = 1.25286
		attackMult = 1
		bonusDmg = 10
		bonusUp = 1
		bonusVs = "biological"
		weaponsUp = 3
		armorUp = 1
		shieldUp = 1
	func applyModifier(mod:int):
		match mod:
			0: #splash zone 1
				attack = 25
				bonusDmg = 10
				weaponsUp = 3
			1: #splash zone 2
				attack = 25 * .5
				bonusDmg = 10 * .5
				weaponsUp = 3 * .5
			2: #splash zone 3
				attack = 25 * .25
				bonusDmg = 10 * .25
				weaponsUp = 3 * .25


class Observer:
	extends Unit

	func _init():
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
	func applyUpgrade(b:bool): #obs speed upgrade
		if b:
			moveSpeed = 3.94
		else:
			moveSpeed = 2.63

class Prism:
	extends Unit

	func _init():
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

	func applyUpgrade(b:bool): #prism speed upgrade
		if b:
			moveSpeed = 5.36
		else:
			moveSpeed = 4.13

class Immortal:
	extends Unit

	func _init():
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
		attackSpeed = 1.03571
		attackMult = 1
		bonusDmg = 30
		bonusUp = 3
		bonusVs = "armored"
		weaponsUp = 2
		armorUp = 1
		shieldUp = 1

class Colossus:
	extends Unit

	func _init():
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
		attackSpeed = 1.07143
		attackMult = 2
		bonusDmg = 5
		bonusUp = 1
		bonusVs = "light"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1
		#add colossus range

class Disruptor:
	extends Unit

	func _init():
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

	func _init():
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
		hitGround = true
		hitAir = true
		attackRange = 5
		attack = 5
		attackSpeed = 0.785714
		attackMult = 2
		bonusDmg = 5
		bonusUp = 0
		bonusVs = "light"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1
		#add phoenix range

class Voidray:
	extends Unit

	func _init():
		type = "Voidray"
		faction = "Protoss"
		tags = ["armored", "mechanical"]
		cost = [250, 150, 4]
		flying = true
		health = 150
		shields = 100
		armor = 0
		shieldArmor = 0
		moveSpeed = 3.85
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 6
		attack = 6
		attackSpeed = 0.428571
		attackMult = 1
		bonusDmg = 4
		bonusUp = 0
		bonusVs = "armored"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1
	func applyUpgrade(b:bool): #prismatic alignment
		if b:
			bonusDmg = 10
		else:
			bonusDmg = 4

class Oracle:
	extends Unit

	func _init():
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
		attackSpeed = 0.614286
		attackMult = 1
		bonusDmg = 7
		bonusUp = 0
		bonusVs = "light"
		weaponsUp = 0
		armorUp = 1
		shieldUp = 1

class Tempest:
	extends Unit

	func _init():
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
		attackSpeed = 2.35714
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 4
		armorUp = 1
		shieldUp = 1
	func applyUpgrade(b:bool): #tectonic destabilizers
		if b:
			bonusDmg = 40
		else:
			bonusDmg = 0
	func changeWeapon(att:int):
		match att:
			0:#vs ground
				attackRange = 10
				attack = 40
				weaponsUp = 4
				bonusVs = "structure"
				bonusDmg = 0
				bonusUp = 0
			1:#vs air
				attackRange = 14
				attack = 30
				weaponsUp = 3
				bonusVs = "massive"
				bonusDmg = 22
				bonusUp = 2
#						"Tempest":
#			if index == 0:
#				$"%AttackerModifier".text = "Tectonic Destabilizers (vs Struct: +40)"
#				$"%AttackerModifier".visible = true
#				attack = 40
#				weaponsUp = 4
#				bonusVs = "structure"
#				bonusDmg = 0 if not $"%AttackerModifier".pressed else 40
#				bonusUp = 0
#			else:
#				$"%AttackerModifier".visible = false
#				attack = 30
#				weaponsUp = 3
#				bonusVs = "massive"
#				bonusDmg = 22
#				bonusUp = 2

class Carrier:
	extends Unit

	func _init():
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
		attackSpeed = 2.14286
		attackMult = 16
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1
	func applyModifier(mod:int):#interceptor count
		attackMult = mod * 2

class Interceptor:
	extends Unit

	func _init():
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
		attackSpeed = 2.14286
		attackMult = 2
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1

class Mothership:
	extends Unit

	func _init():
		type = "Mothership"
		faction = "Protoss"
		tags = ["armored", "mechanical", "psionic", "massive", "heroic"]
		cost = [400, 400, 8]
		flying = true
		health = 350
		shields = 350
		armor = 2
		shieldArmor = 0
		moveSpeed = 2.62
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 7
		attack = 6
		attackSpeed = 1.57857
		attackMult = 6
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 1

class Cannon:
	extends Unit

	func _init():
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
		attackSpeed = 0.892857
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 0
		shieldUp = 1

class Battery:
	extends Unit

	func _init():
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

	func _init():
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
		attackSpeed = 1.07143
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 0

class MULE:
	extends Unit

	func _init():
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

	func _init():
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
		attackSpeed = 0.614857
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0
	func applyUpgrade(b:bool): #stim and combat shields
		if b:
			health = 55
			moveSpeed = 4.72
			attackSpeed = 0.409905
		else:
			health = 45
			moveSpeed = 3.15
			attackSpeed = 0.614857

class Reaper:
	extends Unit

	func _init():
		type = "Reaper"
		faction = "Terran"
		tags = ["light", "biological"]
		cost = [50, 50, 1]
		flying = false
		health = 60
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 5.25
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 5
		attack = 4
		attackSpeed = 0.785714
		attackMult = 2
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0

class Marauder:
	extends Unit

	func _init():
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
		attackSpeed = 1.07143
		attackMult = 1
		bonusDmg = 10
		bonusUp = 1
		bonusVs = "armored"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0
	func applyUpgrade(b:bool): #stim
		if b:
			moveSpeed = 4.72
			attackSpeed = 0.714286
		else:
			moveSpeed = 3.15
			attackSpeed = 1.07143

class Ghost:
	extends Unit

	func _init():
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
		attackSpeed = 1.07143
		attackMult = 1
		bonusDmg = 10
		bonusUp = 1
		bonusVs = "light"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0
	func changeWeapon(att:int):
		match att:
			0: #main weapon
				attack = 10
				attackSpeed = 1.07143
				bonusDmg = 10
				bonusVs = "light"
				spell = false
			1: #snipe
				attack = 170
				attackSpeed = 1.43
				bonusDmg = 0
				bonusVs = ""
				spell = true
			2: #nuke
				attack = 300
				attackSpeed = 14
				bonusDmg = 200
				bonusVs = "structure"
				spell = true
	func applyModifier(mod:int): #nuke splash
		match mod:
			0:
				attack = 300
				bonusDmg = 200
			1:
				attack = 150
				bonusDmg = 100
			2:
				attack = 75
				bonusDmg = 50

class Hellion:
	extends Unit

	func _init():
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
		attackSpeed = 1.78571
		attackMult = 1
		bonusDmg = 6
		bonusUp = 1
		bonusVs = "light"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0
	func applyUpgrade(b:bool): #blueflame
		if b:
			bonusDmg = 11
		else:
			bonusDmg = 6

class Hellbat:
	extends Unit

	func _init():
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
		attackSpeed = 1.42857
		attackMult = 1
		bonusDmg = 0
		bonusUp = 1
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 0
	func applyUpgrade(b:bool): #blueflame
		if b:
			bonusDmg = 12
		else:
			bonusDmg = 0


class Widowmine:
	extends Unit

	func _init():
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
	func applyModifier(mod:int):
		match mod:
				0: attack = 125
				1: attack = 40

class Cyclone:
	extends Unit

	func _init():
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
		attackSpeed = 0.714286
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 2
		armorUp = 1
		shieldUp = 0
	func applyUpgrade(b:bool):
		if b: bonusDmg = 20
		else: bonusDmg = 0
	func changeWeapon(att:int):#lockon
		match att:
			0:
				attack = 18
				attackSpeed = 0.714286
				attackMult = 1
				bonusVs = ""
				spell = false
			1:
				attack = 20
				attackSpeed = 0.71
				attackMult = 20
				bonusVs = "armored"
				spell = true

class Tank:
	extends Unit

	func _init():
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
		attackSpeed = 0.742857
		attackMult = 1
		bonusDmg = 10
		bonusUp = 1
		bonusVs = "armored"
		weaponsUp = 2
		armorUp = 1
		shieldUp = 0
	func changeWeapon(att:int): #siege mode
		match att:
			0:
				attack = 15
				weaponsUp = 2
				attackSpeed = .74
				bonusVs = "armored"
				bonusDmg = 10
				bonusUp = 1

			1:
				attack = 40
				weaponsUp = 4
				attackSpeed = 2.14
				bonusVs = "armored"
				bonusDmg = 30
				bonusUp = 1
	func applyModifier(mod:int): #siege splash
		match mod:
			0:
				attack = 40
				bonusDmg = 30
				weaponsUp = 4
			1:
				attack = 20
				bonusDmg = 15
				weaponsUp = 2
			2:
				attack = 10
				bonusDmg = 7.5
				weaponsUp = 1

class Thor:
	extends Unit

	func _init():
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
		attackSpeed = 0.914286
		attackMult = 2
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 3
		armorUp = 1
		shieldUp = 0
	func changeWeapon(att:int):
		match att:
			0: #vs ground
				attack = 30
				weaponsUp = 3
				attackMult = 2
				attackSpeed = .91
				bonusVs = ""
				bonusDmg = 0
				bonusUp = 0
			1: #explosive payload
				attack = 6
				weaponsUp = 1
				attackMult = 4
				attackSpeed = 2.14
				bonusVs = "light"
				bonusDmg = 6
				bonusUp = 1
			2: #high impact payload
				attack = 25
				weaponsUp = 3
				attackMult = 1
				attackSpeed = .91
				bonusVs = "massive"
				bonusDmg = 10
				bonusUp = 1

class Viking:
	extends Unit

	func _init():
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
		attackSpeed = 1.42857
		attackMult = 2
		bonusDmg = 4
		bonusUp = 0
		bonusVs = "armored"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0
	func applyUpgrade(b:bool): #ground toggle
		if b:
			hitAir = false
			hitGround = true
			attack = 12
			weaponsUp = 1
			attackMult = 1
			attackSpeed = .71
			bonusVs = "mechanical"
			bonusDmg = 8
			bonusUp = 1
		else:
			hitAir = true
			hitGround = false
			attack = 10
			weaponsUp = 1
			attackMult = 2
			attackSpeed = 1.42857
			bonusVs = "armored"
			bonusDmg = 4
			bonusUp = 0

class Medivac:
	extends Unit

	func _init():
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

	func _init():
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
		attackSpeed = 1.28571
		attackMult = 2
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0
	func changeWeapon(att:int): #siege mode
		match att:
			0:
				attack = 5
				weaponsUp = 1
				attackMult = 2
				attackSpeed = 1.29
				hitAir = true
				hitGround = false
			1:
				attack = 75
				weaponsUp = 5
				attackMult = 1
				attackSpeed = 1.14
				hitAir = false
				hitGround = true

class Raven:
	extends Unit

	func _init():
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

class Banshee:
	extends Unit

	func _init():
		type = "Banshee"
		faction = "Terran"
		tags = ["light", "mechanical"]
		cost = [150, 100, 3]
		flying = true
		health = 140
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 3.85
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 6
		attack = 12
		attackSpeed =  0.892857
		attackMult = 2
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0

class Battlecruiser:
	extends Unit

	func _init():
		type = "Battlecruiser"
		faction = "Terran"
		tags = ["armored", "mechanical", "massive"]
		cost = [400, 300, 6]
		flying = true
		health = 550
		shields = 0
		armor = 3
		shieldArmor = 0
		moveSpeed = 2.62
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 6
		attack = 8
		attackSpeed = 0.160714
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0
	func changeWeapon(att:int):
		match att:
			0:
				attack = 8
				attackSpeed = 0.160714
				spell = false
			1:
				attack = 5
				attackSpeed = 0.160714
				spell = false
			2:
				attack = 240
				attackSpeed = 2
				spell = true

class Planetary:
	extends Unit

	func _init():
		type = "Planetary Fortress"
		faction = "Terran"
		tags = ["armored", "mechanical", "structure"]
		cost = [150, 150]
		flying = false
		health = 1500
		shields = 0
		armor = 3
		shieldArmor = 0
		moveSpeed = 0
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 6
		attack = 40
		attackSpeed = 1.42857
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 0
		shieldUp = 0
	func applyUpgrade(b:bool): #plating and auto tracking
		if b: armor = 5
		else: armor = 3
	func applyModifier(mod:int): #splash damage
		match mod:
			0: attack = 40
			1: attack = 30
			2: attack = 15

class Turret:
	extends Unit

	func _init():
		type = "Missile Turret"
		faction = "Terran"
		tags = ["armored", "mechanical", "structure"]
		cost = [100, 0, 0]
		flying = false
		health = 250
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 0
		canAttack = true
		spell = false
		hitGround = false
		hitAir = true
		attackRange = 7
		attack = 12
		attackSpeed = 0.614857
		attackMult = 2
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 0
		shieldUp = 0
	func applyUpgrade(b:bool): #building armor and auto tracking
		if b: armor = 2
		else: armor = 0

class Bunker:
	extends Unit

	func _init():
		type = "Bunker"
		faction = "Terran"
		tags = ["armored", "mechanical", "structure"]
		cost = [100, 0, 0]
		flying = false
		health = 400
		shields = 0
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
		shieldUp = 0
	func applyUpgrade(b:bool): #building armor
		if b: armor = 3
		else: armor = 1

class Autoturret:
	extends Unit

	func _init():
		type = "Auto Turret"
		faction = "Terran"
		tags = ["armored", "mechanical", "structure"]
		cost = [0, 0, 0]
		flying = false
		health = 150
		shields = 0
		armor = 1
		shieldArmor = 0
		moveSpeed = 0
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 6
		attack = 18
		attackSpeed = 0.571429
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 0
		shieldUp = 0
	func applyUpgrade(b:bool): #auto tracking and building armor
		if b: armor = 3
		else: armor = 1




#---zerg units---#

class Larva:
	extends Unit

	func _init():
		type = "Larva"
		faction = "Zerg"
		tags = ["light", "biological"]
		cost = [0, 0, 0]
		flying = false
		health = 25
		shields = 0
		armor = 10
		shieldArmor = 0
		moveSpeed = .79
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
		shieldUp = 0

class Egg:
	extends Unit

	func _init():
		type = "Egg"
		faction = "Zerg"
		tags = ["biological"]
		cost = [0, 0, 0]
		flying = false
		health = 200
		shields = 0
		armor = 10
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
		shieldUp = 0
	func applyModifier(mod:int): #egg types
		match mod:
			0: #default
				health = 200
				armor = 10
				armorUp = 0
				tags.erase("massive")
				flying = false
			1: #overseer
				health = 200
				armor = 2
				armorUp = 1
				tags.erase("massive")
				flying = true
			2: #baneling
				health = 50
				armor = 2
				armorUp = 1
				tags.erase("massive")
				flying = false
			3: #ravager
				health = 100
				armor = 5
				armorUp = 1
				tags.erase("massive")
				flying = false
			4: #lurker
				health = 100
				armor = 1
				armorUp = 1
				tags.erase("massive")
				flying = false
			5: #broodlord
				health = 200
				armor = 2
				armorUp = 1
				tags.append("massive")
				flying = true

class Drone:
	extends Unit

	func _init():
		type = "Drone"
		faction = "Zerg"
		tags = ["light", "biological"]
		cost = [50, 0, 1]
		flying = false
		health = 40
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
		attackSpeed = 1.07143
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 0

class Overlord:
	extends Unit

	func _init():
		type = "Overlord"
		faction = "Zerg"
		tags = ["armored", "biological"]
		cost = [100, 0, 0]
		flying = true
		health = 200
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = .902
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
	func applyUpgrade(b:bool): #overseer morph
		if b: armor = 1
		else: armor = 0

class Queen:
	extends Unit

	func _init():
		type = "Queen"
		faction = "Zerg"
		tags = ["psionic", "biological"]
		cost = [150, 0, 2]
		flying = false
		health = 175
		shields = 0
		armor = 1
		shieldArmor = 0
		moveSpeed = 1.31
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 5
		attack = 4
		attackSpeed = 0.714286
		attackMult = 2
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0
	func changeWeapon(att:int): #anti air attack
		match att:
			0:
				attack = 4
				attackMult = 2
			1:
				attack = 9
				attackMult = 1

class Zergling:
	extends Unit

	func _init():
		type = "Zergling"
		faction = "Zerg"
		tags = ["light", "biological"]
		cost = [25, 0, .5]
		flying = false
		health = 35
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 4.13
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = .1
		attack = 5
		attackSpeed = 0.497143
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0
	func applyUpgrade(b:bool): #speed and adrenal
		if b: attackSpeed = 0.355102
		else: attackSpeed = 0.497143

class Baneling:
	extends Unit

	func _init():
		type = "Baneline"
		faction = "Zerg"
		tags = ["biological"]
		cost = [25, 25, .5]
		flying = false
		health = 30
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 3.5
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = .25
		attack = 16
		attackSpeed = .25
		attackMult = 1
		bonusDmg = 19
		bonusUp = 2
		bonusVs = "light"
		weaponsUp = 2
		armorUp = 1
		shieldUp = 0
	func applyUpgrade(b:bool): #hooks speed/hp
		if b: health = 35
		else: health = 30
	func applyModifier(mod:int): #vs structure bonus dmg
		pass

class Roach:
	extends Unit

	func _init():
		type = "Roach"
		faction = "Zerg"
		tags = ["armored", "biological"]
		cost = [75, 25, 2]
		flying = false
		health = 145
		shields = 0
		armor = 1
		shieldArmor = 0
		moveSpeed = 3.15
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 4
		attack = 16
		attackSpeed = 1.42857
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 2
		armorUp = 1
		shieldUp = 0

class Ravager:
	extends Unit

	func _init():
		type = "Ravager"
		faction = "Zerg"
		tags = ["biological"]
		cost = [25, 75, 1]
		flying = false
		health = 120
		shields = 0
		armor = 1
		shieldArmor = 0
		moveSpeed = 3.85
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 6
		attack = 16
		attackSpeed = 1.14286
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 2
		armorUp = 1
		shieldUp = 0
	func changeWeapon(att:int):
		match att:
			0:
				attack = 16
				attackSpeed = 1.14286
				spell = false
				hitAir = false
			1:
				attack = 60
				attackSpeed = 2.5
				spell = true
				hitAir = true

class Hydralisk:
	extends Unit

	func _init():
		type = "Hydralisk"
		faction = "Zerg"
		tags = ["light", "biological"]
		cost = [100, 50, 2]
		flying = false
		health = 90
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 3.15
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 5
		attack = 12
		attackSpeed = 0.589286
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0

class Lurker:
	extends Unit

	func _init():
		type = "Lurker"
		faction = "Zerg"
		tags = ["armored", "biological"]
		cost = [50, 100, 1]
		flying = false
		health = 200
		shields = 0
		armor = 1
		shieldArmor = 0
		moveSpeed = 4.13
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 8
		attack = 20
		attackSpeed = 1.42857
		attackMult = 1
		bonusDmg = 10
		bonusUp = 1
		bonusVs = "armored"
		weaponsUp = 2
		armorUp = 1
		shieldUp = 0

class Mutalisk:
	extends Unit

	func _init():
		type = "Mutalisk"
		faction = "Zerg"
		tags = ["light", "biological"]
		cost = [100, 100, 2]
		flying = true
		health = 120
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 5.6
		canAttack = true
		spell = false
		hitGround = true
		hitAir = true
		attackRange = 3
		attack = 9
		attackSpeed = 1.089
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0
	func applyModifier(mod:int): #attack bounces
		match mod:
			0:
				attack = 9
				weaponsUp = 1
			1:
				attack = 2.97
				weaponsUp = 0.33
			2:
				attack = 0.99
				weaponsUp = 0.11

class Corruptor:
	extends Unit

	func _init():
		type = "Corruptor"
		faction = "Zerg"
		tags = ["armored", "biological"]
		cost = [150, 100, 2]
		flying = true
		health = 200
		shields = 0
		armor = 2
		shieldArmor = 0
		moveSpeed = 4.725
		canAttack = true
		spell = false
		hitGround = false
		hitAir = true
		attackRange = 6
		attack = 14
		attackSpeed = 1.35714
		attackMult = 1
		bonusDmg = 6
		bonusUp = 1
		bonusVs = "massive"
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0

class Swarmhost:
	extends Unit

	func _init():
		type = "Swarm Host"
		faction = "Zerg"
		tags = ["armored", "biological"]
		cost = [100, 75]
		flying = false
		health = 160
		shields = 0
		armor = 1
		shieldArmor = 0
		moveSpeed = 3.15
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

class Locust:
	extends Unit

	func _init():
		type = "Locust"
		faction = "Zerg"
		tags = ["light", "biological"]
		cost = [0, 0, 0]
		flying = false
		health = 50
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 2.62
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 3
		attack = 10
		attackSpeed = 0.428571
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0

class Infestor:
	extends Unit

	func _init():
		type = "Infestor"
		faction = "Zerg"
		tags = ["armored", "biological", "psionic"]
		cost = [100, 150, 2]
		flying = false
		health = 90
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 3.15
		canAttack = true
		spell = true
		hitGround = true
		hitAir = true
		attackRange = 11.125
		attack = 1.5
		attackSpeed = .2
		attackMult = 15
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 0

class Viper:
	extends Unit

	func _init():
		type = "Viper"
		faction = "Zerg"
		tags = ["armored", "biological", "psionic"]
		cost = [100, 200, 3]
		flying = true
		health = 150
		shields = 0
		armor = 1
		shieldArmor = 0
		moveSpeed = 4.13
		canAttack = true
		spell = true
		hitGround = false
		hitAir = true
		attackRange = 11
		attack = 3
		attackSpeed = .175
		attackMult = 40
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 0
		armorUp = 1
		shieldUp = 0

class Ultralisk:
	extends Unit

	func _init():
		type = "Ultralisk"
		faction = "Zerg"
		tags = ["armored", "biological", "massive"]
		cost = [300, 200, 6]
		flying = false
		health = 500
		shields = 0
		armor = 2
		shieldArmor = 0
		moveSpeed = 4.13
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 1
		attack = 35
		attackSpeed = 0.614286
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 3
		armorUp = 1
		shieldUp = 0
	func applyUpgrade(b:bool): #plating
		if b: armor = 4
		else: armor = 2
	func applyModifier(mod:int): #splash
		match mod:
			0:
				attack = 35
				weaponsUp = 3
			1:
				attack = 11.55
				weaponsUp = 1

class Broodlord:
	extends Unit

	func _init():
		type = "Broodlord"
		faction = "Zerg"
		tags = ["armored", "biological", "massive"]
		cost = [150, 150, 4]
		flying = true
		health = 225
		shields = 0
		armor = 1
		shieldArmor = 0
		moveSpeed = 1.97
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 10
		attack = 20
		attackSpeed = 1.78571
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 2
		armorUp = 1
		shieldUp = 0

class Broodling:
	extends Unit

	func _init():
		type = "Broodling"
		faction = "Zerg"
		tags = ["light", "biological"]
		cost = [0, 0, 0]
		flying = false
		health = 30
		shields = 0
		armor = 0
		shieldArmor = 0
		moveSpeed = 5.37
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = .1
		attack = 4
		attackSpeed = 0.461071
		attackMult = 1
		bonusDmg = 0
		bonusUp = 0
		bonusVs = ""
		weaponsUp = 1
		armorUp = 1
		shieldUp = 0

class Spine:
	extends Unit

	func _init():
		type = "Spine Crawler"
		faction = "Zerg"
		tags = ["armored", "biological", "structure"]
		cost = [100, 0, 0]
		flying = false
		health = 300
		shields = 0
		armor = 2
		shieldArmor = 0
		moveSpeed = 0
		canAttack = true
		spell = false
		hitGround = true
		hitAir = false
		attackRange = 7
		attack = 25
		attackSpeed = 1.32143
		attackMult = 1
		bonusDmg = 5
		bonusUp = 0
		bonusVs = "armored"
		weaponsUp = 0
		armorUp = 0
		shieldUp = 0

class Spore:
	extends Unit

	func _init():
		type = "Spore Crawler"
		faction = "Zerg"
		tags = ["armored", "biological", "structure"]
		cost = [75, 0, 0]
		flying = false
		health = 400
		shields = 0
		armor = 1
		shieldArmor = 0
		moveSpeed = 0
		canAttack = true
		spell = false
		hitGround = false
		hitAir = true
		attackRange = 7
		attack = 15
		attackSpeed = 0.614857
		attackMult = 1
		bonusDmg = 15
		bonusUp = 0
		bonusVs = "biological"
		weaponsUp = 0
		armorUp = 0
		shieldUp = 0

