extends Node

var unitCode = {-1 : null, 0 : null, 101 : probe, 102 : zealot, 103 : stalker, 104 : sentry, 105 : adept, 106 : HT, 107 : DT, 108 : archon, 109 : observer, 110 : prism, 111 : immortal, 112 : colossus, 113 : disruptor, 114 : phoenix, 115 : voidray, 116 : oracle, 117 : tempest, 118 : carrier, 119 : interceptor, 120 : mothership, 121 : cannon, 122 : battery,
201 : scv, 202 : mule, 203 : marine, 204 : marauder, 205 : reaper, 206 : ghost, 207 : hellion, 208 : hellbat, 209 : mine, 210 : cyclone, 211 : tank, 212 : thor, 213 : viking, 214 : medivac, 215 : liberator, 216 : raven, 217 : banshee, 218 : battlecruiser, 219 : planetary, 220 : turret, 221 : bunker, 222 : autoturret,
301 : larva, 302 : egg, 303 : drone, 304 : overlord, 305 : queen, 306 : zergling, 307 : baneling, 308 : roach, 309 : ravager, 310 : hydralisk, 311 : lurker, 312 : mutalisk, 313 : corruptor, 314 : swarmhost, 315 : locust, 316 : infestor, 317 : viper, 318 : ultralisk, 319 : broodlord, 320 : broodling, 321 : spinecrawler, 322 : sporecrawler}

#---------------#
#---Unit Data---#
#---------------#

#---protoss units---#

var probe:Unit = Unit.new("Probe", "Protoss", ["light", "mechanical"], [50, 0, 1], false, 20, 20, 0, 0, 3.94, false, true, true, false, .1, 5, 1.07, 1, 0, 0, "", 0, 1, 1)

var zealot:Unit = Unit.new("Zealot", "Protoss", ["light", "biological"], [100, 0, 2], false, 100, 50, 1, 0, 3.15, false, true, true, false, .1, 8, .86, 2, 0, 0, "", 1, 1, 1)

var stalker:Unit = Unit.new("Stalker", "Protoss", ["armored", "mechanical"], [125, 50, 2], false, 80, 80, 1, 0, 4.13, false, true, true, true, 6, 13, 1.34, 1, 5, 1, "armored", 1, 1, 1)

var sentry:Unit = Unit.new("Sentry", "Protoss", ["light", "mechanical", "psionic"], [50, 100, 2], false, 40, 40, 1, 0, 3.15, false, true, true, true, 5, 6, .71, 1, 0, 0, "", 1, 1, 1)

class adept:
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

var HT:Unit = Unit.new("High Templar", "Protoss", ["biological", "light", "psionic"], [50, 150, 2], false, 40, 40, 0, 0, 2.62, true, false, true, false, 6, 4, 1.25, 1, 0, 0, "", 1, 1, 1)

var DT:Unit = Unit.new("Dark Templar", "Protoss", ["biological", "light", "psionic"], [125, 125, 2], false, 40, 80, 1, 0, 3.94, true, false, true, false, .1, 45, 1.21, 1, 0, 0, "", 5, 1, 1)

var archon:Unit = Unit.new("Archon", "Protoss", ["psionic", "massive"], [100, 300, 4], false, 10, 350, 0, 0, 3.94, true, false, true, true, 3, 25, 1.25, 1, 10, 1, "biological", 3, 1, 1)

var observer:Unit = Unit.new("Observer", "Protoss", ["light", "mechanical"], [25, 75, 1], true, 40, 20, 0, 0, 2.63, false, false, false, false, null, null, null, null, null, null, "", null, 1, 1)

var prism:Unit = Unit.new("Warp Prism", "Protoss", ["armored", "mechanical", "psionic"], [250, 0, 2], true, 80, 100, 0, 0, 4.13, false, false, false, false, null, null, null, null, null, null, "", null, 1, 1)

var immortal:Unit = Unit.new("Immortal", "Protoss", ["armored", "mechanical"], [275, 100, 4], false, 200, 100, 1, 0, 3.15, true, false, true, false, 6, 20, 1.04, 1, 30, 3, "armored", 2, 1, 1)

var colossus:Unit = Unit.new("Colossus", "Protoss", ["armored", "massive", "mechanical"], [300, 200, 6], false, 200, 150, 1, 0, 3.15, true, false, true, false, 7, 10, 1.07, 2, 5, 1, "light", 1, 1, 1)

var disruptor:Unit = Unit.new("Disruptor", "Protoss", ["armored", "mechanical", "spell"], [150, 150, 3], false, 100, 100, 1, 0, 3.15, true, true, true, false, 13.245, 145, 2.1, 1, 0, 0, "", 0, 1, 1)

var phoenix:Unit = Unit.new("Phoenix", "Protoss", ["light", "mechanical"], [150, 100, 2], true, 120, 60, 0, 0, 5.95, true, false, false, true, 5, 5, .79, 2, 5, 0, "light", 1, 1, 1)

var voidray:Unit = Unit.new("Void Ray", "Protoss", ["armored", "mechanical"], [250, 150, 4], true, 150, 100, 0, 0, 3.85, 

var oracle:Unit = Unit.new("Oracle", "Protoss", ["mechanical", "armored", "psionic", "spell"]

var tempest:Unit = Unit.new("Tempest", "Protoss", ["armored", "mechanical", "massive"]

var carrier:Unit = Unit.new("Carrier", "Protoss", ["armored", "mechanical", "massive"]

var interceptor:Unit = Unit.new("Interceptor", "Protoss", ["light", "mechanical"]

var mothership:Unit = Unit.new("Mothership", "Protoss", ["armored", "massive", "psionic", "mechanical", "heroic"]

var cannon:Unit = Unit.new("Cannon", "Protoss", ["armored", "structure"]

var battery:Unit = Unit.new("Shield battery", "Protoss", ["armored", "structure"]


#---terran units---#

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
