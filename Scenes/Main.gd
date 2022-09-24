extends Control

"""
TODO:

loaded bunker attack stats?
supply structures, town halls, stasis ward, auto turret, creep tumor, nydus, sensor tower
Shield battery on defending unit toggle
	-max +50.4 shields/s, max 3 per 1 energy, max 100 energy
	-2x rate on overcharge, no energy limits, 14 seconds
medivac healing? transfuse?

BW units/BW "physics"
possible "crazy mode" where anything can hit anything else
comparisons/multiple upgrades tests/multiple windows
dynamic window resizing that works properly?
'custom unit' (i.e. text entry) mode



"""

"""
class UnitData:
	var name:string
	var faction:string
	var tags
	var canHitGround:bool
	var canHitAir:bool

	var health:float
	var shields:float
	var armor:int
	var shieldarmor:int

	var attack:int
	var attackspeed:float
	var attackmult:int
	var bonusDmg:int
	var bonusUp:int
	var bonusVs

	var weaponsup:int
	var armorup:int
	var shieldup:int
"""

"""
var = {
"name" : "", "faction" : "", "flying" : , "hitground" : , "hitair" : ,
"health" : , "shields" : , "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : , "attackspeed" : , "attackmult" : 1, "weaponsup" : 0,
"ranged": , "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : [""]
}
"""
#---------------#
#---Unit Data---#
#---------------#

#---protoss units---#

var probe = {
"name" : "Probe", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : false,
"health" : 20, "shields" : 20, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 5, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 0,
"ranged" : false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["light", "mechanical"]
}

var zealot = {
"name" : "Zealot", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : false,
"health" : 100, "shields" : 50, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 8, "attackspeed" : .86, "attackmult" : 2, "weaponsup" : 1,
"ranged" : false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["light", "biological"]
}

var stalker = {
"name" : "Stalker", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : true,
"health" : 80, "shields" : 80, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 13, "attackspeed" : 1.34, "attackmult" : 1, "weaponsup" : 1,
"ranged" : true, "bonusvs" : "armored", "bonusdmg" : 5, "bonusup" : 1,
"tags" : ["armored", "mechanical"]
}

var sentry = {
"name" : "Sentry", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : true,
"health" : 40, "shields" : 40, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 6, "attackspeed" : .71, "attackmult" : 1, "weaponsup" : 1,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["light", "mechanical", "psionic"]
}

var adept = {
"name" : "Adept", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : false,
"health" : 70, "shields" : 70, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 10, "attackspeed" : 1.61, "attackmult" : 1, "weaponsup" : 1,
"ranged" : true, "bonusvs" : "light", "bonusdmg" : 12, "bonusup" : 1,
"tags" : ["light", "biological"]
}

var HT = {
"name" : "High Templar", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : false,
"health" : 40, "shields" : 40, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 4, "attackspeed" : 1.25, "attackmult" : 1, "weaponsup" : 1,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["biological", "light", "psionic"]
}

var DT = {
"name" : "Dark Templar", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : false,
"health" : 40, "shields" : 80, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 45, "attackspeed" : 1.21, "attackmult" : 1, "weaponsup" : 5,
"ranged": false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["biological", "light", "psionic"]
}

var archon = {
"name" : "Archon", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : true,
"health" : 10, "shields" : 350, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 25, "attackspeed" : 1.25, "attackmult" : 1, "weaponsup" : 3,
"ranged" : true, "bonusvs" : "biological", "bonusdmg" : 10, "bonusup" : 1,
"tags" : ["psionic", "massive"]
}

var observer = {
"name" : "Observer", "faction" : "protoss", "flying" : true, "hitground" : false, "hitair" : false,
"health" : 40, "shields" : 20, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null,
"tags" : ["light", "mechanical"]
}

var prism = {
"name" : "Warp Prism", "faction" : "protoss", "flying" : true, "hitground" : false, "hitair" : false,
"health" : 80, "shields" : 100, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null,
"tags" : ["armored", "mechanical", "psionic"]
}

var immortal = {
"name" : "Immortal", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : false,
"health" : 200, "shields" : 100, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 20, "attackspeed" : 1.04, "attackmult" : 1, "weaponsup" : 2,
"ranged" : true, "bonusvs" : "armored", "bonusdmg" : 30, "bonusup" : 3,
"tags" : ["armored", "mechanical"]
}

var colossus = {
"name" : "Colossus", "faction" : "protoss", "flying" : true, "hitground" : true, "hitair" : false,
"health" : 200, "shields" : 150, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 10, "attackspeed" : 1.07, "attackmult" : 2, "weaponsup" : 1,
"ranged" : true, "bonusvs" : "light", "bonusdmg" : 5, "bonusup" : 1,
"tags" : ["armored", "massive", "mechanical"]
}

var disruptor = {
"name" : "Disruptor", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : false,
"health" : 100, "shields" : 100, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 145, "attackspeed" : 2.1, "attackmult" : 1, "weaponsup" : 0,
"ranged": false, "bonusvs" : "", "bonusdmg" : 55, "bonusup" : 0,
"tags" : ["armored", "mechanical", "spell"]
}

var phoenix = {
"name" : "Phoenix", "faction" : "protoss", "flying" : true, "hitground" : false, "hitair" : true,
"health" : 120, "shields" : 60, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 5, "attackspeed" : .79, "attackmult" : 2, "weaponsup" : 1,
"ranged": true, "bonusvs" : "light", "bonusdmg" : 5, "bonusup" : 0,
"tags" : ["light", "mechanical"]
}

var voidray= {
"name" : "Void Ray", "faction" : "protoss", "flying" : true, "hitground" : true, "hitair" : true,
"health" : 150, "shields" : 100, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 6, "attackspeed" : .36, "attackmult" : 1, "weaponsup" : 1,
"ranged": true, "bonusvs" : "armored", "bonusdmg" : 4, "bonusup" : 0,
"tags" : ["armored", "mechanical"]
}

var oracle = {
"name" : "Oracle", "faction" : "protoss", "flying" : true, "hitground" : true, "hitair" : false,
"health" : 100, "shields" : 60, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 15, "attackspeed" : .61, "attackmult" : 1, "weaponsup" : 0,
"ranged": true, "bonusvs" : "light", "bonusdmg" : 7, "bonusup" : 0,
"tags" : ["mechanical", "armored", "psionic", "spell"]
}

var tempest = {
"name" : "Tempest", "faction" : "protoss", "flying" : true, "hitground" : true, "hitair" : true,
"health" : 200, "shields" : 100, "armor" : 2, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 40, "attackspeed" : 2.36, "attackmult" : 1, "weaponsup" : 4,
"ranged": true, "bonusvs" : "structure", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["armored", "mechanical", "massive"]
}

var carrier = {
"name" : "Carrier", "faction" : "protoss", "flying" : true, "hitground" : true, "hitair" : true,
"health" : 300, "shields" : 150, "armor" : 2, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 5, "attackspeed" : 2.14, "attackmult" : 16, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["armored", "mechanical", "massive"]
}

var interceptor = {
"name" : "Interceptor", "faction" : "protoss", "flying" : true, "hitground" : true, "hitair" : true,
"health" : 40, "shields" : 40, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 5, "attackspeed" : 2.14, "attackmult" : 2, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["light", "mechanical"]
}

var mothership = {
"name" : "Mothership", "faction" : "protoss", "flying" : true, "hitground" : true, "hitair" : true,
"health" : 350, "shields" : 350, "armor" : 2, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 6, "attackspeed" : 1.58, "attackmult" : 6, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["armored", "massive", "psionic", "mechanical", "heroic"]
}

var cannon = {
"name" : "Cannon", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : true,
"health" : 150, "shields" : 150, "armor" : 1, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 20, "attackspeed" : .89, "attackmult" : 1, "weaponsup" : 0,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["armored", "structure"]
}
var battery = {
"name" : "Shield battery", "faction" : "protoss", "flying" : false, "hitground" : false , "hitair" : false,
"health" : 150, "shields" : 150, "armor" : 0, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 1,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged" : null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null,
"tags" : ["armored", "structure"]
}


#---terran units---#

var scv = {
"name" : "SCV", "faction" : "terran",  "flying" : false, "hitground" : true, "hitair" : false,
"health" : 45, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 5, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 0,
"ranged" : false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["light", "biological", "mechanical"]
}

var mule = {
"name" : "MULE", "faction" : "terran", "flying" : false, "hitground" : false, "hitair" : false,
"health" : 60, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "null", "bonusdmg" : null, "bonusup" : null,
"tags" : ["light", "mechanical"]
}

var marine = {
"name" : "Marine", "faction" : "terran",  "flying" : false, "hitground" : true, "hitair" : true,
"health" : 45, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 6, "attackspeed" : .61, "attackmult" : 1, "weaponsup" : 1,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["light", "biological"]
}

var marauder = {
"name" : "Marauder", "faction" : "terran",  "flying" : false, "hitground" : true, "hitair" : false,
"health" : 125, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 10, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 1,
"ranged" : true, "bonusvs" : "armored", "bonusdmg" : 10, "bonusup" : 1,
"tags" : ["armored", "biological"]
}

var reaper = {
"name" : "Reaper", "faction" : "terran",  "flying" : false, "hitground" : true, "hitair" : false,
"health" : 60, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 4, "attackspeed" : .79, "attackmult" : 2, "weaponsup" : 1,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["light", "biological"]
}

var ghost = {
"name" : "Ghost", "faction" : "terran",  "flying" : false,  "hitground" : true, "hitair" : true,
"health" : 100, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 10, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 1,
"ranged" : true, "bonusvs" : "light", "bonusdmg" : 10, "bonusup" : 1,
"tags" : ["psionic", "biological"]
}

var hellion = {
"name" : "Hellion", "faction" : "terran",  "flying" : false,  "hitground" : true, "hitair" : false,
"health" : 90, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 8, "attackspeed" : 1.79, "attackmult" : 1, "weaponsup" : 1,
"ranged" : true, "bonusvs" : "light", "bonusdmg" : 6, "bonusup" : 1,
"tags" : ["light", "mechanical"]
}

var hellbat = {
"name" : "Hellbat", "faction" : "terran",  "flying" : false,  "hitground" : true, "hitair" : false,
"health" : 135, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 18, "attackspeed" : 1.43, "attackmult" : 1, "weaponsup" : 2,
"ranged" : true, "bonusvs" : "light", "bonusdmg" : 0, "bonusup" : 1,
"tags" : ["mechanical", "light", "biological"]
}

var mine = {
"name" : "Widowmine", "faction" : "terran", "flying" : false, "hitground" : true, "hitair" : true,
"health" : 90, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 125, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 0,
"ranged": true, "bonusvs" : "", "bonusdmg" : 35, "bonusup" : 0,
"tags" : ["light", "mechanical", "spell"]
}


var cyclone = {
"name" : "Cyclone", "faction" : "terran", "flying" : false, "hitground" : true, "hitair" : true,
"health" : 120, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 18, "attackspeed" : .71, "attackmult" : 1, "weaponsup" : 2,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["armored", "mechanical"]
}

var tank = {
"name" : "Siege Tank", "faction" : "terran",  "flying" : false,  "hitground" : true, "hitair" : false,
"health" : 175, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 15, "attackspeed" : .74, "attackmult" : 1, "weaponsup" : 2,
"ranged" : true, "bonusvs" : "armored", "bonusdmg" : 10, "bonusup" : 1,
"tags" : ["armored", "mechanical"]
}

var thor = {
"name" : "Thor", "faction" : "terran",  "flying" : false,  "hitground" : true, "hitair" : true,
"health" : 400, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 30, "attackspeed" : .91, "attackmult" : 2, "weaponsup" : 3,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["armored", "mechanical", "massive"]
}

var viking = {
"name" : "Viking", "faction" : "terran", "flying" : true, "hitground" : false, "hitair" : true,
"health" : 135, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 10, "attackspeed" : 1.43, "attackmult" : 2, "weaponsup" : 1,
"ranged": true, "bonusvs" : "armored", "bonusdmg" : 4, "bonusup" : 0,
"tags" : ["armored", "mechanical"]
}

var medivac = {
"name" : "Medivac", "faction" : "terran", "flying" : true, "hitground" : false, "hitair" : false,
"health" : 150, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null,
"tags" : ["armored", "mechanical"]
}

var liberator = {
"name" : "Liberator", "faction" : "terran", "flying" : true, "hitground" : false, "hitair" : true,
"health" : 180, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 5, "attackspeed" : 1.29, "attackmult" : 2, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["armored", "mechanical"]
}

var raven = {
"name" : "Raven", "faction" : "terran", "flying" : true, "hitground" : false, "hitair" : false,
"health" : 140, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null,
"tags" : ["light", "mechanical"]
}

var banshee = {
"name" : "Banshee", "faction" : "terran", "flying" : true, "hitground" : true, "hitair" : false,
"health" : 140, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 12, "attackspeed" : .89, "attackmult" : 2, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["light", "mechanical"]
}

var battlecruiser = {
"name" : "Battle Cruiser", "faction" : "terran", "flying" : true, "hitground" : true, "hitair" : true,
"health" : 550, "shields" : 0, "armor" : 3, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 8, "attackspeed" : .16, "attackmult" : 1, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["armored", "mechanical", "massive"]
}

var planetary = {
"name" : "Planetary Fortress", "faction" : "terran",  "flying" : false,  "hitground" : true, "hitair" : false,
"health" : 1500, "shields" : 0, "armor" : 3, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 40, "attackspeed" : 1.43, "attackmult" : 1, "weaponsup" : 0,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["armored", "mechanical", "structure"]
}

var turret = {
"name" : "Missile Turret", "faction" : "terran", "flying" : false, "hitground" : false, "hitair" : true,
"health" : 250, "shields" : 0, "armor" : 0, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 12, "attackspeed" : .61, "attackmult" : 2, "weaponsup" : 0,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["armored", "mechanical", "structure"]
}

var bunker = {
"name" : "Bunker", "faction" : "terran", "flying" : false, "hitground" : true, "hitair" : true,
"health" : 400, "shields" : 0, "armor" : 1, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 0, "attackspeed" : 0, "attackmult" : 1, "weaponsup" : 0,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["armored", "mechanical", "structure"]
}

var autoturret = {
"name" : "Auto Turret", "faction" : "terran", "flying" : false, "hitground" : true, "hitair" : true,
"health" : 150, "shields" : 0, "armor" : 1, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 18, "attackspeed" : .57, "attackmult" : 1, "weaponsup" : 0,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["armored", "mechanical", "structure"]
}



#---zerg units---#

var larva = {
"name" : "Larva", "faction" : "zerg", "flying" : false, "hitground" : false, "hitair" : false,
"health" : 25, "shields" : 0, "armor" : 10, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 0,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null,
"tags" : ["biological", "light"]
}

var egg = {
"name" : "Egg", "faction" : "zerg", "flying" : false, "hitground" : false, "hitair" : false,
"health" : 200, "shields" : 0, "armor" : 10, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 0,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null,
"tags" : ["biological", "light"]
}

var drone = {
"name" : "Drone", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false,
"health" : 40, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 5, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 0,
"ranged" : false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["light", "biological"]
}

var overlord = {
"name" : "Overlord", "faction" : "zerg",  "flying" : true,  "hitground" : false, "hitair" : false,
"health" : 200, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged" : null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null,
"tags" : ["armored", "biological"]
}

var queen = {
"name" : "Queen", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : true,
"health" : 175, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 4, "attackspeed" : .71, "attackmult" : 2, "weaponsup" : 1,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["psionic", "biological"]
}

var zergling = {
"name" : "Zergling", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false,
"health" : 35, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 5, "attackspeed" : .497, "attackmult" : 1, "weaponsup" : 1,
"ranged" : false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["light", "biological"]
}

var baneling = {
"name" : "Baneling", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false,
"health" : 30, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 16, "attackspeed" : .01, "attackmult" : 1, "weaponsup" : 2,
"ranged" : false, "bonusvs" : "light", "bonusdmg" : 19, "bonusup" : 2,
"tags" : ["biological"]
}

var roach = {
"name" : "Roach", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false,
"health" : 145, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 16, "attackspeed" : 1.43, "attackmult" : 1, "weaponsup" : 2,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["armored", "biological"]
}

var ravager = {
"name" : "Ravager", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false,
"health" : 120, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 16, "attackspeed" : 1.14, "attackmult" : 1, "weaponsup" : 2,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["biological"]
}

var hydralisk = {
"name" : "Hydralisk", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false,
"health" : 90, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 12, "attackspeed" : .59, "attackmult" : 1, "weaponsup" : 1,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["light", "biological"]
}

var lurker = {
"name" : "Lurker", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false,
"health" : 200, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 20, "attackspeed" : 1.43, "attackmult" : 1, "weaponsup" : 2,
"ranged" : true, "bonusvs" : "armored", "bonusdmg" : 10, "bonusup" : 1,
"tags" : ["armored", "biological"]
}

var mutalisk = {
"name" : "Mutalisk", "faction" : "zerg", "flying" : true, "hitground" : true, "hitair" : true,
"health" : 120, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 9, "attackspeed" : 1.09, "attackmult" : 1, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["biological", "light"]
}

var corruptor = {
"name" : "Corruptor", "faction" : "zerg", "flying" : true, "hitground" : false, "hitair" : true,
"health" : 200, "shields" : 0, "armor" : 2, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 14, "attackspeed" : 1.36, "attackmult" : 1, "weaponsup" : 1,
"ranged": true, "bonusvs" : "massive", "bonusdmg" : 6, "bonusup" : 1,
"tags" : ["biological", "armored"]
}

var swarmhost = {
"name" : "Swarmhost", "faction" : "zerg", "flying" : false, "hitground" : false, "hitair" : false,
"health" : 160, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null,
"tags" : ["biological", "armored"]
}

var locust = {
"name" : "Locust", "faction" : "zerg", "flying" : false, "hitground" : true, "hitair" : false,
"health" : 50, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 10, "attackspeed" : .43, "attackmult" : 1, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["biological", "light"]
}

var infestor = {
"name" : "Infestor", "faction" : "zerg", "flying" : false, "hitground" : true, "hitair" : true,
"health" : 90, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 1, "attackspeed" : .1, "attackmult" : 30, "weaponsup" : 0,
"ranged": false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["biological", "armored", "psionic", "spell"]
}

var viper = {
"name" : "Viper", "faction" : "zerg", "flying" : true, "hitground" : false, "hitair" : true,
"health" : 150, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 3, "attackspeed" : .175, "attackmult" : 40, "weaponsup" : 0,
"ranged": false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["biological", "biological", "psionic", "spell"]
}

var ultralisk = {
"name" : "Ultralisk", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false,
"health" : 500, "shields" : 0, "armor" : 2, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 35, "attackspeed" : .61, "attackmult" : 1, "weaponsup" : 3,
"ranged" : false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["armored", "biological", "massive"]
}

var broodlord = {
"name" : "Broodlord", "faction" : "zerg", "flying" : true, "hitground" : true, "hitair" : false,
"health" : 225, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 20, "attackspeed" : 1.79, "attackmult" : 1, "weaponsup" : 2,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["biological", "armored", "massive"]
}

var broodling = {
"name" : "Broodling", "faction" : "zerg", "flying" : false, "hitground" : true, "hitair" : false,
"health" : 30, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 4, "attackspeed" : .46, "attackmult" : 1, "weaponsup" : 1,
"ranged": false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0,
"tags" : ["biological", "light"]
}

var spinecrawler = {
"name" : "Spine Crawler", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false,
"health" : 300, "shields" : 0, "armor" : 2, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 25, "attackspeed" : 1.32, "attackmult" : 1, "weaponsup" : 0,
"ranged" : true, "bonusvs" : "armored", "bonusdmg" : 5, "bonusup" : 0,
"tags" : ["armored", "biological", "structure"]
}

var sporecrawler = {
"name" : "Spore Crawler", "faction" : "zerg",  "flying" : false,  "hitground" : false, "hitair" : true,
"health" : 400, "shields" : 0, "armor" : 1, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 15, "attackspeed" : .61, "attackmult" : 1, "weaponsup" : 0,
"ranged" : true, "bonusvs" : "biological", "bonusdmg" : 15, "bonusup" : 0,
"tags" : ["armored", "biological", "structure"]
}





#---Variables---#

var units:Array = [probe, zealot, stalker, adept, archon, immortal, colossus, cannon,
		 scv, marine, marauder, reaper, ghost, hellion, hellbat, tank, thor, planetary, turret, bunker,
		 drone, zergling, baneling, roach, ravager, queen, hydralisk, lurker, ultralisk, spinecrawler]

var attackUnit = null
var defendUnit = null

var attackboxUp:int = 0
var armorboxUp:int = 0
var shieldboxUp:int = 0

var aModeBox
var dModeBox
var sZoneBox

#---Process Functions---#
func _ready():
	aModeBox = $"%AModeChoice".get_popup()
	dModeBox = $"%DModeChoice".get_popup()
	sZoneBox = $"%SplashZone".get_popup()
	$"%InterceptorCount".get_line_edit().expand_to_text_length = true

func _input(_event):
	if attackUnit and defendUnit:
		$VBoxContainer2/HBoxContainer.visible = true
		if defendUnit["faction"] == "protoss":
			$"%ShieldUpgrade".visible = true
			if "spell" in attackUnit["tags"]:
				$"%Label".text = "Casts to Break Shields:\nTime to Break Shields:\n\nCasts to Kill:\nTime to Kill:"
			elif attackUnit["name"] == "Carrier":
				$"%Label".text = "Volleys to Break Shields:\nTime to Break Shields:\n\nVolleys to Kill:\nTime to Kill:"
			else:
				$"%Label".text = "Shots to Break Shields:\nTime to Break Shields:\n\nShots to Kill:\nTime to Kill:"
			if attackUnit["ranged"]:
				$"%GuardianShield".visible = true
			else:
				$"%GuardianShield".visible = false
		else:
			$"%ShieldUpgrade".visible = false
			if "spell" in attackUnit["tags"]:
				$"%Label".text = "Casts to Kill:\nTime to Kill:"
			elif attackUnit["name"] == "Carrier":
				$"%Label".text = "Volleys to Kill:\nTime to Kill:"
			else:
				$"%Label".text = "Shots to Kill:\nTime to Kill:"
			$"%GuardianShield".visible = false
			$"%GuardianShield".pressed = false

		if "spell" in attackUnit["tags"]:
			$"%AttackUpgrade".get_line_edit().text = "0"
			$"%ArmorUpgrade".get_line_edit().text = "0"
			$"%ShieldUpgrade".get_line_edit().text = "0"
			$"%AttackUpgrade".apply()
			$"%ArmorUpgrade".apply()
			$"%ShieldUpgrade".apply()
			$"%AttackUpgrade".set_editable(false)
			$"%ArmorUpgrade".set_editable(false)
			$"%ShieldUpgrade".set_editable(false)
		else:

			$"%AttackUpgrade".set_editable(true)
			$"%ArmorUpgrade".set_editable(true)
			$"%ShieldUpgrade".set_editable(true)

		match attackUnit["name"]:
			"High Templar":
				aModeBox.set_item_disabled(0, false)
				aModeBox.set_item_disabled(1, false)
				if defendUnit["flying"]:
					aModeBox.set_item_disabled(0, true)
				if "structure" in defendUnit["tags"]:
					aModeBox.set_item_disabled(1, true)
					$"%AModeChoice".select(0)
					$"%AModeChoice".emit_signal("item_selected", 0)
				if $"%AModeChoice".selected < 0 and (not "structure" in defendUnit["tags"]):
						$"%AModeChoice".select(1)
						$"%AModeChoice".emit_signal("item_selected", 1)
			"Phoenix":
				if !defendUnit["flying"] and !("massive" in defendUnit["tags"] or "structure" in defendUnit["tags"]):
					$"%AttackerModifier".pressed = true
					$"%AttackerModifier".disabled = true
				else:
					$"%AttackerModifier".disabled = true
					$"%AttackerModifier".pressed = false
			"Void Ray":
				pass
			"Tempest":
				if defendUnit["flying"]:
					$"%AModeChoice".select(1)
					$"%AModeChoice".emit_signal("item_selected", 1)
					$"%AModeChoice".disabled = true
					$"%AttackerModifier".visible = false
				else:
					$"%AModeChoice".select(0)
					$"%AModeChoice".emit_signal("item_selected", 0)
					$"%AModeChoice".disabled = true

				if $"%AModeChoice".selected == 0:
					$"%AttackerModifier".visible = true
					$"%AttackerModifier".text = "Tectonic Destabilizers (vs Struct: +40)"
			"Ghost":
				aModeBox.set_item_disabled(1, true)
				$"%SplashZone".disabled = false
				if $"%AModeChoice".selected < 0:
					$"%AModeChoice".select(0)
					$"%AModeChoice".emit_signal("item_selected", 0)
				if $"%AModeChoice".selected < 2:
					$"%SplashZone".disabled = true
					$"%SplashZone".select(0)
					$"%SplashZone".emit_signal("item_selected", 0)
				if "biological" in defendUnit["tags"]:
					aModeBox.set_item_disabled(1, false)
				elif $"%AModeChoice".selected == 1:
					$"%AModeChoice".select(0)
					$"%AModeChoice".emit_signal("item_selected", 0)
			"Cyclone":
				$"%AttackerModifier".disabled = false
				if $"%AModeChoice".selected < 0:
					$"%AModeChoice".select(1)
					$"%AModeChoice".emit_signal("item_selected", 1)
				if $"%AModeChoice".selected == 0:
					$"%AttackerModifier".disabled = true
					$"%AttackerModifier".pressed = false
			"Siege Tank":
				if $"%AModeChoice".selected < 0:
					$"%AModeChoice".select(1)
					$"%AModeChoice".emit_signal("item_selected", 1)
			"Thor":
				aModeBox.set_item_disabled(0, false)
				aModeBox.set_item_disabled(1, false)
				aModeBox.set_item_disabled(2, false)
				if defendUnit["name"] == "Colossus":
					aModeBox.set_item_disabled(1, true)
					if $"%AModeChoice".selected == 1 or $"%AModeChoice".selected == -1:
						$"%AModeChoice".select(0)
						$"%AModeChoice".emit_signal("item_selected", 0)
					$"%AModeChoice".disabled = false
				elif defendUnit["flying"]:
					aModeBox.set_item_disabled(0, true)
					#automatically selects air attack and emits signal when attacking air unit
					if $"%AModeChoice".selected <= 0:
						$"%AModeChoice".select(1)
						$"%AModeChoice".emit_signal("item_selected", 1)
					$"%AModeChoice".disabled = false
				else:
					aModeBox.set_item_disabled(1, true)
					aModeBox.set_item_disabled(2, true)
					if $"%AModeChoice".selected != 0:
						$"%AModeChoice".select(0)
						$"%AModeChoice".emit_signal("item_selected", 0)
					$"%AModeChoice".disabled = true
			"Viking":
				$"%AModeChoice".disabled = true
				if defendUnit["name"] in ["Viking", "Colossus"]:
					$"%AttackerModifier".disabled = false
					$"%AModeChoice".select($"%AttackerModifier".pressed)
				elif !defendUnit["flying"]:
					$"%AttackerModifier".pressed = true
					$"%AttackerModifier".disabled = true
					$"%AModeChoice".select(1)
					$"%AModeChoice".emit_signal("item_selected", 1)
				else:
					$"%AttackerModifier".disabled = true
					$"%AttackerModifier".pressed = false
					$"%AModeChoice".select(0)
					$"%AModeChoice".emit_signal("item_selected", 0)
			"Liberator":
				$"%AModeChoice".disabled = true
				if defendUnit["name"] == "Viking":
					$"%AModeChoice".select(0 if defendUnit["flying"] else 1)
					$"%AModeChoice".emit_signal("item_selected", 0 if defendUnit["flying"] else 1)
				elif !defendUnit["flying"]:
					$"%AModeChoice".select(1)
					$"%AModeChoice".emit_signal("item_selected", 1)
				else:
					$"%AModeChoice".select(0)
					$"%AModeChoice".emit_signal("item_selected", 0)
			"Battle Cruiser":
				aModeBox.set_item_disabled(0, false)
				aModeBox.set_item_disabled(1, false)
				aModeBox.set_item_disabled(2, false)
				if !defendUnit["flying"]:
					aModeBox.set_item_disabled(1, true)
					if $"%AModeChoice".selected < 0 or $"%AModeChoice".selected == 1: 
						$"%AModeChoice".select(0)
						$"%AModeChoice".emit_signal("item_selected", 0)
				else:
					aModeBox.set_item_disabled(0, true)
					if $"%AModeChoice".selected <= 0: 
						$"%AModeChoice".select(1)
						$"%AModeChoice".emit_signal("item_selected", 1)
					
			"Queen":
				if defendUnit["flying"]:
					$"%AModeChoice".select(1)
					$"%AModeChoice".emit_signal("item_selected", 1)
					$"%AModeChoice".disabled = true
					$"%AttackerModifier".visible = false
				else:
					$"%AModeChoice".select(0)
					$"%AModeChoice".emit_signal("item_selected", 0)
					$"%AModeChoice".disabled = true
		match defendUnit["name"]:
			"Colossus":
				if attackUnit["hitair"]:
					defendUnit["flying"] = true
				else:
					defendUnit["flying"] = false
			"Viking":
				if (attackUnit["hitground"] and attackUnit["hitair"]) or (not attackUnit["hitground"] and not attackUnit["hitair"]) or attackUnit["name"] in ["Phoenix", "Queen", "Liberator"]:
					$"%DefenderModifier".disabled = false
				else:
					defendUnit["flying"] = attackUnit["hitair"]
					$"%DefenderModifier".pressed = !attackUnit["hitair"]
					$"%DefenderModifier".emit_signal("_on_DefenderModifier_toggled",!attackUnit["hitair"])
					$"%DefenderModifier".disabled = true



		CalcCheck()
	else:
			$VBoxContainer2/HBoxContainer.visible = false


func CalcCheck():
	if not CanAttack():
		$"%Label".visible = false
		#there literally has to be a better way to do this
		var dumb
		var dumb2
		match attackUnit["name"][0]:
			"A", "E", "I", "O", "U":
				 dumb = "An"
			_:
				 dumb = "A"
		match defendUnit["name"][0]:
			"A", "E", "I", "O", "U":
				dumb2 = "an"
			_:
				dumb2 = "a"

		$"%Label2".text = "%s %s cannot attack %s %s" % [dumb, attackUnit["name"], dumb2, defendUnit["name"]]
	else:
		$"%Label".visible = true
		$"%Label2".text = DamageCalc()


func CanAttack() -> bool:
	if (attackUnit["name"] in ["Liberator", "Viper", "Widowmine", "Infestor"]) and "structure" in defendUnit["tags"]:
		return false
	if attackUnit["hitair"] and attackUnit["hitground"]:
		return true
	elif attackUnit["hitair"] and defendUnit["flying"]:
		return true
	elif attackUnit["hitground"] and not defendUnit["flying"]:
		return true
	else:
		return false

#---Calculation Functions---X

func DamageCalc():
	var health:float = defendUnit["health"]
	var shields:float = defendUnit["shields"]
	
	var armor = defendUnit["armor"]
	var armorUp = defendUnit["armorup"]
	var shieldUp = defendUnit["shieldup"]
	var shieldArmor = defendUnit["shieldarmor"]
	if "spell" in attackUnit["tags"]:
		armor = 0
		armorUp = 0
		shieldUp = 0
		shieldArmor = 0

	var attack = attackUnit["attack"]
	var attackMult = attackUnit["attackmult"]
	var weaponsUp = attackUnit["weaponsup"]
	var bonusDmg = attackUnit["bonusdmg"]
	var bonusUp = 0
	if attackUnit["bonusvs"] in defendUnit["tags"]:
		attack += bonusDmg
		bonusUp = attackUnit["bonusup"]
	var attackSpeed = attackUnit["attackspeed"]
	var barrierCD:float = 0.0
	var zergRegen = 0
	if defendUnit["faction"] == "zerg":
		zergRegen = .38 if defendUnit["name"] != "Mutalisk" else 1.4

	var shotsToKill = 0.0

	var shotTotals:String

	var Dmg = (attack + (weaponsUp * attackboxUp) + (bonusUp * attackboxUp))
	var healthDmg = max((Dmg - (armor + (armorUp * armorboxUp))), .5)
	var shieldDmg = max((Dmg - (shieldArmor + (shieldUp * shieldboxUp))), .5)

	if attackUnit["name"] in ["ghost", "disruptor", "widowmine", "battlecruiser"]:
		if defendUnit["faction"] == "protoss":
			shields -= bonusDmg
		shotsToKill = (health + max(shields, 0))/attack
		shotTotals = str(ceil(shotsToKill)) + "\n"
		shotTotals = shotTotals + str(attackSpeed*shotsToKill) + "s\n\n"
		return shotTotals

	if defendUnit["faction"] == "protoss":
		while shields > 0:
			shields -= shieldDmg
			shotsToKill += 1.0
			barrierCD -= attackSpeed
			#immortal barrier logic: kicks in AFTER first shot, bonus 100 shields for
			#my best approx of 2 seconds, does take armor upgrades into account
			if defendUnit["name"] == "Immortal" and $"%DefenderModifier".pressed == true and barrierCD < 0:
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
		if "spell" in attackUnit["tags"]:
				timeToKill = shotsToKill * attackSpeed
		shotTotals = str(ceil(shotsToKill/attackMult)) + "\n"
		shotTotals = shotTotals + str(timeToKill) + "s\n\n"

		health -= (shields * -1) - (armor + (armorUp * armorboxUp))

		while health > 0:
			health -= healthDmg
			shotsToKill += 1.0
			barrierCD -= attackSpeed
			if defendUnit["name"] == "Immortal" and $"%DefenderModifier".pressed == true and barrierCD < 0:
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
		if "spell" in attackUnit["tags"]:
			timeToKill = shotsToKill * attackSpeed
		shotTotals = shotTotals + str(ceil(shotsToKill/attackMult)) + "\n"
		shotTotals = shotTotals + str(timeToKill) + "s\n"


	else:
		#non-protoss defender
		while health > 0:
			health -= healthDmg
			shotsToKill += 1.0
			health += zergRegen * attackSpeed
			if shotsToKill >= 10000:
				break
		if shotsToKill < 10000:
			var timeToKill = ceil(shotsToKill/attackMult) * attackSpeed
			if "spell" in attackUnit["tags"]:
				timeToKill = shotsToKill * attackSpeed
			shotTotals = str(ceil(shotsToKill/attackMult)) + "\n"
			shotTotals = shotTotals + str(timeToKill) + "s\n"
		else:
			shotTotals = ">10,000 (Infinite?)\nInfinite?"
	return shotTotals



#---UI input---#


#de-ID's the units into their dictionaries
var unitCode = {-1 : null, 0 : null, 101 : probe, 102 : zealot, 103 : stalker, 104 : sentry, 105 : adept, 106 : HT, 107 : DT, 108 : archon, 109 : observer, 110 : prism, 111 : immortal, 112 : colossus, 113 : disruptor, 114 : phoenix, 115 : voidray, 116 : oracle, 117 : tempest, 118 : carrier, 119 : interceptor, 120 : mothership, 121 : cannon, 122 : battery,
201 : scv, 202 : mule, 203 : marine, 204 : marauder, 205 : reaper, 206 : ghost, 207 : hellion, 208 : hellbat, 209 : mine, 210 : cyclone, 211 : tank, 212 : thor, 213 : viking, 214 : medivac, 215 : liberator, 216 : raven, 217 : banshee, 218 : battlecruiser, 219 : planetary, 220 : turret, 221 : bunker, 222 : autoturret,
301 : larva, 302 : egg, 303 : drone, 304 : overlord, 305 : queen, 306 : zergling, 307 : baneling, 308 : roach, 309 : ravager, 310 : hydralisk, 311 : lurker, 312 : mutalisk, 313 : corruptor, 314 : swarmhost, 315 : locust, 316 : infestor, 317 : viper, 318 : ultralisk, 319 : broodlord, 320 : broodling, 321 : spinecrawler, 322 : sporecrawler}


func _on_AttackUnit_item_selected(_index):
	#Garbage  collection
	$"%AttackerModifier".pressed = false
	$"%AttackerModifier".visible = false
	$"%AttackerModifier".disabled = false
	$"%InterceptorCount".visible = false
	$"%AModeChoice".disabled = false
	$"%AModeChoice".visible = false
	$"%AModeChoice".select(-1)
	$"%SplashZone".visible = false
	$"%SplashZone".select(-1)
	for i in range (0, sZoneBox.get_item_count()):
		sZoneBox.remove_item(0)
	for i in range (0, aModeBox.get_item_count()):
		aModeBox.remove_item(0)
	attackUnit = $"%AttackUnit".get_selected_id()
	attackUnit = unitCode[attackUnit].duplicate()

	#Per unit logic
	if defendUnit and defendUnit["faction"] == "protoss" and attackUnit["ranged"]:
		$"%GuardianShield".visible = true
	else:
		$"%GuardianShield".visible = false
		$"%GuardianShield".pressed = false
	
	if attackUnit["faction"] == "terran":
		$"%AntiArmor".visible = true
	else:
		$"%AntiArmor".visible = false
		$"%AntiArmor".pressed = false

	match attackUnit["name"]:
		"Adept":
			$"%AttackerModifier".visible = true
			$"%AttackerModifier".text = "Resonating Glaives (Attack Time: -.5s)"
		"High Templar":
			$"%AModeChoice".visible = true
			aModeBox.add_item("Psi Blast", 0)
			aModeBox.add_item("Psi Storm (Spell)", 1)
		"Archon":
			$"%SplashZone".visible = true
			sZoneBox.add_item(".25u (100% dmg)", 0)
			sZoneBox.add_item(".5u (50% dmg)", 1)
			sZoneBox.add_item("1u (25% dmg)", 2)
			$"%SplashZone".select(0)
		"Phoenix":
			$"%AttackerModifier".visible = true
			$"%AttackerModifier".text = "Graviton Beam"
			$"%AttackerModifier".disabled = true
		"Void Ray":
			$"%AttackerModifier".visible = true
			$"%AttackerModifier".text = "Prismatic Alignment (vs Armored +6)"
		"Tempest":
			$"%AModeChoice".visible = true
			aModeBox.add_item("Resonance Coil (AtG)", 0)
			aModeBox.add_item("Kinetic Overload (AtA)", 1)
		"Carrier":
			$"%InterceptorCount".visible = true
			attackUnit["attackmult"] = 2 * $"%InterceptorCount".value
		#voidray - charge ability
		"Marine":
			$"%AttackerModifier".visible = true
			$"%AttackerModifier".text = "Stim (Attack Time: -.203s)"
		"Marauder":
			$"%AttackerModifier".visible = true
			$"%AttackerModifier".text = "Stim (Attack Time: -.36s)"
		"Ghost":
			$"%AModeChoice".visible = true
			aModeBox.add_item("C-10 Canister Rifle", 0)
			aModeBox.add_item("Snipe (Spell)", 1)
			aModeBox.add_item("Nuke (Spell)", 2)
			$"%SplashZone".visible = true
			sZoneBox.add_item("4u (100% dmg)", 0)
			sZoneBox.add_item("6u (50% dmg)", 1)
			sZoneBox.add_item("8u (25% dmg)", 2)
			$"%SplashZone".select(0)
		"Hellion":
			$"%AttackerModifier".visible = true
			$"%AttackerModifier".text = "Blueflame (vs Light: +5)"
		"Hellbat":
			$"%AttackerModifier".visible = true
			$"%AttackerModifier".text = "Blueflame (vs Light: +12)"
		"Widowmine":
			$"%SplashZone".visible = true
			sZoneBox.add_item("Direct Hit (120 dmg)", 0)
			sZoneBox.add_item("1.75u (40 dmg)", 1)
			$"%SplashZone".select(0)
		"Cyclone":
			$"%AModeChoice".visible = true
			aModeBox.add_item("Typhoon Missile Pods", 0)
			aModeBox.add_item("Lock On (Spell)", 1)
			$"%AttackerModifier".visible = true
			$"%AttackerModifier".text = "Mag-Field Accel. (vs Armored: +400)"
		"Siege Tank":
			$"%AModeChoice".visible = true
			aModeBox.add_item("90mm Cannons", 0)
			aModeBox.add_item("Crucio Shock Cannon (AoE)", 1)
			$"%SplashZone".visible = true
			sZoneBox.add_item(".4687u (100% dmg)", 0)
			sZoneBox.add_item(".6812u (50% dmg)", 1)
			sZoneBox.add_item("1.25u (25% dmg)", 2)
		"Thor":
			$"%AModeChoice".visible = true
			aModeBox.add_item("Thor's Hammer (AtG)", 0)
			aModeBox.add_item("Javelin Missles (AtA)", 1)
			aModeBox.add_item("250mm Punisher Cannons (AtA)", 2)
		"Viking":
			$"%AModeChoice".visible = true
			aModeBox.add_item("Lanzer Torpedoes (AtA)", 0)
			aModeBox.add_item("Gatling Cannon (GtG)", 1)
			$"%AttackerModifier".visible = true
			$"%AttackerModifier".text = "Assault Mode"
		"Liberator":
			$"%AModeChoice".visible = true
			aModeBox.add_item("Lexington Rockets (AtA)", 0)
			aModeBox.add_item("Concord Cannon (AtG)", 1)
		"Battle Cruiser":
			$"%AModeChoice".visible = true
			aModeBox.add_item("Laser Battery (AtG)", 0)
			aModeBox.add_item("Laser Battery (AtA)", 1)
			aModeBox.add_item("Yamato Cannon (Spell)", 2)
		"Planetary Fortress":
			$"%SplashZone".visible = true
			sZoneBox.add_item(".5u (100% dmg)", 0)
			sZoneBox.add_item(".8u (75% dmg)", 1)
			sZoneBox.add_item("1.25u (37.5% dmg)", 2)
			$"%SplashZone".select(0)
		"Zergling":
			$"%AttackerModifier".visible = true
			$"%AttackerModifier".text = "Adrenal Glands"
		"Queen":
			$"%AModeChoice".visible = true
			aModeBox.add_item("Talons (GtG)", 0)
			aModeBox.add_item("Acid Spines (GtA)", 1)
		"Ravager":
			$"%AModeChoice".visible = true
			aModeBox.add_item("Plasma Discharge", 0)
			aModeBox.add_item("Corrosive Bile (Spell)", 1)
			$"%AModeChoice".select(0)
		"Infestor":
			$"%AModeChoice".visible = true
			$"%AModeChoice".disabled = true
			aModeBox.add_item("Fungal Growth", 0)
			$"%AModeChoice".select(0)
		"Mutalisk":
			$"%SplashZone".visible = true
			sZoneBox.add_item("Direct Hit", 0)
			sZoneBox.add_item("Bounce 1 (33% dmg)", 1)
			sZoneBox.add_item("Bounce 2 (11% dmg)", 2)
			$"%SplashZone".select(0)
		"Viper":
			$"%AModeChoice".visible = true
			$"%AModeChoice".disabled = true
			aModeBox.add_item("Parasitic Bomb", 0)
			$"%AModeChoice".select(0)
		"Ultralisk":
			$"%SplashZone".visible = true
			sZoneBox.add_item("Direct Hit (100% dmg)", 0)
			sZoneBox.add_item("2 unit Semi-Circle (33% dmg)", 1)
			$"%SplashZone".select(0)

		_:
			$"%AttackerModifier".visible = false
			$"%AttackerModifier".text = ""


func _on_DefendUnit_item_selected(_index):
	#Garbage Collection
	$"%DefenderModifier".pressed = false
	$"%DefenderModifier".visible = false
	$"%DefenderModifier".pressed = false
	$"%DModeChoice".visible = false
	defendUnit = $"%DefendUnit".get_selected_id()
	defendUnit = unitCode[defendUnit].duplicate()

	#per-unit logic
	match defendUnit["name"]:
		"Immortal":
			$"%DefenderModifier".visible = true
			$"%DefenderModifier".text = "Barrier (+100 Shields for 2s)"
		"Marine":
			$"%DefenderModifier".visible = true
			$"%DefenderModifier".text = "Combat Shields (+10hp)"
		"Viking":
			$"%DefenderModifier".visible = true
			$"%DefenderModifier".text = "Assault Mode (Grounded)"
		"Planetary Fortress":
			$"%DefenderModifier".visible = true
			$"%DefenderModifier".text = "Neosteel Armor (+2 Armor)"
		"Missile Turret":
			$"%DefenderModifier".visible = true
			$"%DefenderModifier".text = "Neosteel Armor (+2 Armor)"
		"Bunker":
			$"%DefenderModifier".visible = true
			$"%DefenderModifier".text = "Neosteel Armor (+2 Armor)"
		"Auto Turret":
			$"%DefenderModifier".visible = true
			$"%DefenderModifier".text = "Neosteel Armor (+2 Armor)"
		"Egg":
			$"%DModeChoice".visible = true
			dModeBox.add_item("Larva", 0)
			dModeBox.add_item("Overseer/Dropperlord", 1)
			dModeBox.add_item("Baneling", 2)
			dModeBox.add_item("Ravager", 3)
			dModeBox.add_item("Lurker", 4)
			dModeBox.add_item("Broodlord", 5)
			
		"Baneling":
			$"%DefenderModifier".visible = true
			$"%DefenderModifier".text = "Centrifugal Hooks (+5 hp)"
		"Overlord":
			$"%DefenderModifier".visible = true
			$"%DefenderModifier".text = "Overseer (+1 armor)"
		"Ultralisk":
			$"%DefenderModifier".visible = true
			$"%DefenderModifier".text = "Chitinous Plating (+2 Armor)"
		_:
			$"%DefenderModifier".visible = false
			$"%DefenderModifier".text = ""

#apply/remove upgrades dynamically based on checkbox
func _on_AttackerModifier_toggled(button_pressed):
	match attackUnit["name"]:
		"Adept":
			if button_pressed: attackUnit["attackspeed"] = 1.11
			else: attackUnit["attackspeed"] = adept["attackspeed"]
		"Phoenix":
			if defendUnit:
				if button_pressed: attackUnit["hitground"] = true
				else: attackUnit["hitground"] = false
		"Void Ray":
			if button_pressed: attackUnit["bonusdmg"] = 10
			else: attackUnit["bonusdmg"] = voidray["bonusdmg"]
		"Tempest":
			if button_pressed: attackUnit["bonusdmg"] = 40
			else: attackUnit["bonusdmg"] = tempest["bonusdmg"]
		"Marine":
			if button_pressed: attackUnit["attackspeed"] = .407
			else: attackUnit["attackspeed"] = marine["attackspeed"]
		"Marauder":
			if button_pressed: attackUnit["attackspeed"] = .71
			else: attackUnit["attackspeed"] = marauder["attackspeed"]
		"Hellion":
			if button_pressed: attackUnit["bonusdmg"] = 11
			else: attackUnit["bonusdmg"] = hellion["bonusdmg"]
		"Hellbat":
			if button_pressed: attackUnit["bonusdmg"] = 12
			else: attackUnit["bonusdmg"] = hellbat["bonusdmg"]
		"Cyclone":
			if button_pressed: attackUnit["bonusdmg"] = 20
			else: attackUnit["bonusdmg"] = hellbat["bonusdmg"]
		"Viking":
			if button_pressed:
				attackUnit["hitair"] = false
				attackUnit["hitground"] = true
				attackUnit["attack"] = 12
				attackUnit["weaponsup"] = 1
				attackUnit["attackmult"] = 1
				attackUnit["attackspeed"] = .71
				attackUnit["bonusvs"] = "mechanical"
				attackUnit["bonusdmg"] = 8
				attackUnit["bonusup"] = 1
			else:
				attackUnit["hitair"] = viking["hitair"]
				attackUnit["hitground"] = viking["hitground"]
				attackUnit["attack"] = viking["attack"]
				attackUnit["weaponsup"] = viking["weaponsup"]
				attackUnit["attackmult"] = viking["attackmult"]
				attackUnit["attackspeed"] = viking["attackspeed"]
				attackUnit["bonusvs"] = viking["bonusvs"]
				attackUnit["bonusdmg"] = viking["bonusdmg"]
				attackUnit["bonusup"] = viking["bonusup"]
		"Zergling":
			if button_pressed: attackUnit["attackspeed"] = .354
			else : attackUnit["attackspeed"] = zergling["attackspeed"]

func _on_DefenderModifier_toggled(button_pressed):
		match defendUnit["name"]:
			"Immortal":
				pass #Handled in damage calculation for better accuracy to in-game values
			"Marine":
				if button_pressed: defendUnit["health"] = 55
				else: defendUnit["health"] = marine["health"]
			"Viking":
				if button_pressed: defendUnit["flying"] = false
				else: defendUnit["flying"] = viking["flying"]
			"Planetary Fortress":
				if button_pressed: defendUnit["armor"] = 5
				else: defendUnit["armor"] = planetary["armor"]
			"Missile Turret":
				if button_pressed: defendUnit["armor"] = 2
				else: defendUnit["armor"] = turret["armor"]
			"Bunker":
				if button_pressed: defendUnit["armor"] = 3
				else: defendUnit["armor"] = bunker["armor"]
			"Auto Turret":
				if button_pressed: defendUnit["armor"] = 3
				else: defendUnit["armor"] = autoturret["armor"]
			"Baneling":
				if button_pressed: defendUnit["health"] = 35
				else: defendUnit["health"] = baneling["health"]
			"Overlord":
				if button_pressed: defendUnit["armor"] = 1
				else: defendUnit["armor"] = overlord["armor"]
			"Ultralisk":
				if button_pressed: defendUnit["armor"] = 4
				else: defendUnit["armor"] = ultralisk["armor"]


func _on_AModeChoice_item_selected(index):
	match attackUnit["name"]:
		"Tempest":
			if index == 0:
				$"%AttackerModifier".text = "Tectonic Destabilizers (vs Struct: +40)"
				$"%AttackerModifier".visible = true
				attackUnit["attack"] = 40
				attackUnit["weaponsup"] = 4
				attackUnit["bonusvs"] = "structure"
				attackUnit["bonusdmg"] = 0 if not $"%AttackerModifier".pressed else 40
				attackUnit["bonusup"] = 0
			else:
				$"%AttackerModifier".visible = false
				attackUnit["attack"] = 30
				attackUnit["weaponsup"] = 3
				attackUnit["bonusvs"] = "massive"
				attackUnit["bonusdmg"] = 22
				attackUnit["bonusup"] = 2
		"High Templar":
			if index == 0:
				attackUnit["attack"] = 4
				attackUnit["attackspeed"] = 1.25
				attackUnit["attackmult"] = 1
				attackUnit["tags"].erase("spell")
				attackUnit["hitair"] = false
			else:
				attackUnit["attack"] = 10
				attackUnit["attackspeed"] = 0.357125
				attackUnit["attackmult"] = 8
				attackUnit["tags"].append("spell")
				attackUnit["hitair"] = true
		"Ghost":
			match index:
				0:
					attackUnit["attack"] = ghost["attack"]
					attackUnit["attackspeed"] = ghost["attackspeed"]
					attackUnit["bonusdmg"] = ghost["bonusdmg"]
					attackUnit["bonusvs"] = ghost["bonusvs"]
					attackUnit["tags"].erase("spell")
				1:
					attackUnit["attack"] = 170
					attackUnit["attackspeed"] = 1.43
					attackUnit["tags"].erase("spell")
					attackUnit["tags"].append("spell")
				2:
					attackUnit["attack"] = 300
					attackUnit["attackspeed"] = 14
					attackUnit["bonusdmg"] = 200
					attackUnit["bonusvs"] = "structure"
					attackUnit["tags"].erase("spell") #I could also just check if there is "spell" already
					attackUnit["tags"].append("spell") #but this is easier
		"Cyclone":
			if index == 0:
				attackUnit["attack"] = cyclone["attack"]
				attackUnit["attackspeed"] = cyclone["attackspeed"]
				attackUnit["attackmult"] = cyclone["attackmult"]
				attackUnit["bonusvs"] = cyclone["bonusvs"]
				attackUnit["tags"].erase("spell")
			else:
				attackUnit["attack"] = 20
				attackUnit["attackspeed"] = 0.71
				attackUnit["attackmult"] = 20
				attackUnit["bonusvs"] = "armored"
				attackUnit["tags"].append("spell")
		"Siege Tank":
			if index == 0:
				attackUnit["attack"] = 15
				attackUnit["weaponsup"] = 2
				attackUnit["attackspeed"] = .74
				attackUnit["bonusvs"] = "armored"
				attackUnit["bonusdmg"] = 10
				attackUnit["bonusup"] = 1
				
			else:
				attackUnit["attack"] = 40
				attackUnit["weaponsup"] = 4
				attackUnit["attackspeed"] = 2.14
				attackUnit["bonusvs"] = "armored"
				attackUnit["bonusdmg"] = 30
				attackUnit["bonusup"] = 1
		"Thor":
			match index:
				0:
					attackUnit["attack"] = 30
					attackUnit["weaponsup"] = 3
					attackUnit["attackmult"] = 2
					attackUnit["attackspeed"] = .91
					attackUnit["bonusvs"] = ""
					attackUnit["bonusdmg"] = 0
					attackUnit["bonusup"] = 0
				1:
					attackUnit["attack"] = 6
					attackUnit["weaponsup"] = 1
					attackUnit["attackmult"] = 4
					attackUnit["attackspeed"] = 2.14
					attackUnit["bonusvs"] = "light"
					attackUnit["bonusdmg"] = 6
					attackUnit["bonusup"] = 1
				2:
					attackUnit["attack"] = 25
					attackUnit["weaponsup"] = 3
					attackUnit["attackmult"] = 1
					attackUnit["attackspeed"] = .91
					attackUnit["bonusvs"] = "massive"
					attackUnit["bonusdmg"] = 10
					attackUnit["bonusup"] = 1
		"Liberator":
			if index == 0:
				attackUnit["attack"] = 5
				attackUnit["weaponsup"] = 1
				attackUnit["attackmult"] = 2
				attackUnit["attackspeed"] = 1.29
				attackUnit["hitair"] = true
				attackUnit["hitground"] = false
			if index == 1:
				attackUnit["attack"] = 75
				attackUnit["weaponsup"] = 5
				attackUnit["attackmult"] = 1
				attackUnit["attackspeed"] = 1.14
				attackUnit["hitair"] = false
				attackUnit["hitground"] = true
		"Battle Cruiser":
			match index:
				0:
					attackUnit["attack"] = battlecruiser["attack"]
					attackUnit["attackspeed"] = battlecruiser["attackspeed"]
					attackUnit["tags"].erase("spell")
				1:
					attackUnit["attack"] = 5
					attackUnit["attackspeed"] = battlecruiser["attackspeed"]
					attackUnit["tags"].erase("spell")
				2:
					attackUnit["attack"] = 240
					attackUnit["attackspeed"] = 2
					attackUnit["tags"].append("spell")
		"Queen":
			if index == 0:
				attackUnit["attack"] = 4
				attackUnit["attackmult"] = 2
			else:
				attackUnit["attack"] = 9
				attackUnit["attackmult"] = 1
		"Ravager":
			if index == 0:
				attackUnit["attack"] = 16
				attackUnit["attackspeed"] = 1.14
				attackUnit["tags"].erase("spell")
				attackUnit["hitair"] = false
			else:
				attackUnit["attack"] = 60
				attackUnit["attackspeed"] = 2.5
				attackUnit["tags"].append("spell")
				attackUnit["hitair"] = true



func _on_DModeChoice_item_selected(index):
	match defendUnit["name"]:
		"Egg":
			match index:
				0:
					defendUnit["health"] = 200
					defendUnit["armor"] = 10
					defendUnit["armorup"] = 0
					defendUnit["tags"].erase("massive")
					defendUnit["flying"] = false
				1: 
					defendUnit["health"] = 200
					defendUnit["armor"] = 2
					defendUnit["armorup"] = 1
					defendUnit["tags"].erase("massive")
					defendUnit["flying"] = true
				2:
					defendUnit["health"] = 50
					defendUnit["armor"] = 2
					defendUnit["armorup"] = 1
					defendUnit["tags"].erase("massive")
					defendUnit["flying"] = false
				3:
					defendUnit["health"] = 100
					defendUnit["armor"] = 5
					defendUnit["armorup"] = 1
					defendUnit["tags"].erase("massive")
					defendUnit["flying"] = false
				4:
					defendUnit["health"] = 100
					defendUnit["armor"] = 1
					defendUnit["armorup"] = 1
					defendUnit["tags"].erase("massive")
					defendUnit["flying"] = false
				5:
					defendUnit["health"] = 200
					defendUnit["armor"] = 2
					defendUnit["armorup"] = 1
					defendUnit["tags"].append("massive")
					defendUnit["flying"] = true

#---Signal Processing---#

func _on_AttackUpgrade_value_changed(value):
	attackboxUp = value



func _on_ArmorUpgrade_value_changed(value):
	armorboxUp = value



func _on_ShieldUpgrade_value_changed(value):
	shieldboxUp = value


func _on_GuardianShield_toggled(button_pressed):
	if button_pressed:
		defendUnit["armor"] += 2
		defendUnit["shieldarmor"] += 2
	if not button_pressed:
		defendUnit["armor"] -= 2
		defendUnit["shieldarmor"] -= 2

func _on_AntiArmor_toggled(button_pressed):
	if button_pressed:
		defendUnit["armor"] -= 3
		defendUnit["shieldarmor"] -= 3
	if not button_pressed:
		defendUnit["armor"] += 3
		defendUnit["shieldarmor"] += 3

func _on_InterceptorCount_value_changed(value):
	if attackUnit["name"] == "Carrier":
		attackUnit["attackmult"] = 2 * value

func _on_SplashZone_item_selected(index):
	match attackUnit["name"]:
		"Archon":
			match index:
				0: attackUnit["attack"] = archon["attack"]
				1: attackUnit["attack"] = archon["attack"] * .5
				2: attackUnit["attack"] = archon["attack"] * .25
		"Ghost":
			match index:
				0: attackUnit["attack"] = ghost["attack"]
				1: attackUnit["attack"] = ghost["attack"] * .5
				2: attackUnit["attack"] = ghost["attack"] * .25
		"Widowmine":
			match index:
				0: attackUnit["attack"] = mine["attack"]
				1: attackUnit["attack"] = 40
		"Siege Tank":
			match index:
				0: attackUnit["attack"] = tank["attack"]
				1: attackUnit["attack"] = tank["attack"]
				2: attackUnit["attack"] = tank["attack"]
		"Planetary Fortress":
			match index:
				0: attackUnit["attack"] = planetary["attack"]
				1: attackUnit["attack"] = planetary["attack"] * .75
				2: attackUnit["attack"] = planetary["attack"] * .375
		"Mutalisk":
			match index:
				0: attackUnit["attack"] = mutalisk["attack"]
				1: attackUnit["attack"] = mutalisk["attack"] * .33
				2: attackUnit["attack"] = mutalisk["attack"] * .11
		"Ultralisk":
			match index:
				0: attackUnit["attack"] = ultralisk["attack"]
				1: attackUnit["attack"] = ultralisk["attack"] * .33
