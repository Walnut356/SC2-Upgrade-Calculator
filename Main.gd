extends Control

"""
TODO:
Shield battery on defending unit toggle 
	-max +50.4 shields/s, max 3 per 1 energy, max 100 energy
	-2x rate on overcharge, no energy limits, 14 seconds
Air units
Air unit logic
BW units/BW "physics"
Splash radii
Fix Ranged Logic (tags -> bool dict value)
Queen ground attack ranged or melee?
Disruptor/WM bonus shield damage before or after base damage?
phoenix lift "logic" (can't lift massive)
air unit modifiers
multiple weapons logic (thor, queen, tempest)
possible "crazy mode" where anything can hit anything else
comparisons/multiple upgrades tests/multiple windows
dynamic window resizing?
spell damage logic (if spell tag, ignore armor in damage calc)
carrier interceptor count (just increase attack multiplier?
'custom unit' (i.e. text entry) mode 
supply structures, town halls, stasis ward, auto turret, creep tumor, nydus, sensor tower
bunker (spinbox units?)
medivac healing? transfuse?
zerg, alternate cacoon types (overseer, brood, bane, lurker, ravager)
muta regen
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
"name" : "probe", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : false,
"health" : 20, "shields" : 20, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 5, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 0,
"ranged" : false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "mechanical"]
}

var zealot = {
"name" : "zealot", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : false, 
"health" : 100, "shields" : 50, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 8, "attackspeed" : .86, "attackmult" : 2, "weaponsup" : 1, 
"ranged" : false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological"]
}

var stalker = {
"name" : "stalker", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : true, 
"health" : 80, "shields" : 80, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 13, "attackspeed" : 1.34, "attackmult" : 1, "weaponsup" : 1, 
"ranged" : true, "bonusvs" : "armored", "bonusdmg" : 5, "bonusup" : 1, 
"tags" : ["armored", "mechanical"]
}

var sentry = {
"name" : "sentry", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : true,
"health" : 40, "shields" : 40, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 6, "attackspeed" : .71, "attackmult" : 1, "weaponsup" : 1, 
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "mechanical", "psionic"]
}

var adept = {
"name" : "adept", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : false, 
"health" : 70, "shields" : 70, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 10, "attackspeed" : 1.61, "attackmult" : 1, "weaponsup" : 1, 
"ranged" : true, "bonusvs" : "light", "bonusdmg" : 12, "bonusup" : 1, 
"tags" : ["light", "biological"]
}

var templar = {
"name" : "high templar", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : false,
"health" : 40, "shields" : 40, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 4, "attackspeed" : 1.25, "attackmult" : 1, "weaponsup" : 1,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["biological", "light", "psionic"]
}

var DT = {
"name" : "dark templar", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : false,
"health" : 40, "shields" : 80, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 45, "attackspeed" : 1.21, "attackmult" : 1, "weaponsup" : 5,
"ranged": false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["biological", "light", "psionic"]
}

var archon = {
"name" : "archon", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : true, 
"health" : 10, "shields" : 350, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 25, "attackspeed" : 1.25, "attackmult" : 1, "weaponsup" : 3, 
"ranged" : true "bonusvs" : "biological", "bonusdmg" : 10, "bonusup" : 1, 
"tags" : ["psionic", "massive"]
}

var observer = {
"name" : "observer", "faction" : "protoss", "flying" : true, "hitground" : false, "hitair" : false,
"health" : 40, "shields" : 20, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null, 
"tags" : ["light", "mechanical"]
}

var prism = {
"name" : "warp prism", "faction" : "protoss", "flying" : true, "hitground" : false, "hitair" : false,
"health" : 80, "shields" : 100, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null, 
"tags" : ["armored", "mechanical", "psionic"]
}

var immortal = {
"name" : "immortal", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : false, 
"health" : 200, "shields" : 100, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 20, "attackspeed" : 1.04, "attackmult" : 1, "weaponsup" : 2, 
"ranged" : true, "bonusvs" : "armored", "bonusdmg" : 30, "bonusup" : 3, 
"tags" : ["armored", "mechanical"]
}

var colossus = {
"name" : "colossus", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : false, 
"health" : 200, "shields" : 150, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 10, "attackspeed" : 1.07, "attackmult" : 2, "weaponsup" : 1, 
"ranged" : true, "bonusvs" : "light", "bonusdmg" : 5, "bonusup" : 1, 
"tags" : ["armored", "massive", "mechanical"]
}

var disruptor = {
"name" : "disruptor", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : false,
"health" : 100, "shields" : 100, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 145, "attackspeed" : 2.1, "attackmult" : 1, "weaponsup" : 0,
"ranged": false, "bonusvs" : "", "bonusdmg" : 55, "bonusup" : 0, 
"tags" : ["armored", "mechanical", "spell"]
}

var phoenix = {
"name" : "phoenix", "faction" : "protoss", "flying" : true, "hitground" : true, "hitair" : true,
"health" : 120, "shields" : 60, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 5, "attackspeed" : .79, "attackmult" : 2, "weaponsup" : 1,
"ranged": true, "bonusvs" : "light", "bonusdmg" : 5, "bonusup" : 0, 
"tags" : ["light", "mechanical"]
}

var voidray= {
"name" : "voidray", "faction" : "protoss", "flying" : true, "hitground" : true, "hitair" : true,
"health" : 150, "shields" : 100, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 6, "attackspeed" : .36, "attackmult" : 1, "weaponsup" : 1,
"ranged": true, "bonusvs" : "armored", "bonusdmg" : 4, "bonusup" : 0, 
"tags" : ["armored", "mechanical"]
}

var oracle = {
"name" : "oracle", "faction" : "protoss", "flying" : true, "hitground" : true, "hitair" : false,
"health" : 100, "shields" : 60, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 15, "attackspeed" : .61, "attackmult" : 1, "weaponsup" : 0,
"ranged": true, "bonusvs" : "light", "bonusdmg" : 7, "bonusup" : 0, 
"tags" : ["mechanical", "armored", "psionic", "spell"]
}

var tempest = {
"name" : "tempest", "faction" : "protoss", "flying" : true, "hitground" : true, "hitair" : true,
"health" : 200, "shields" : 100, "armor" : 2, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 40, "attackspeed" : 2.36, "attackmult" : 1, "weaponsup" : 4,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "mechanical", "massive"]
}

var carrier = {
"name" : "carrier", "faction" : "protoss", "flying" : true, "hitground" : true, "hitair" : true,
"health" : 300, "shields" : 150, "armor" : 2, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 5, "attackspeed" : 2.14, "attackmult" : 2, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "mechanical", "massive"]
}

var interceptor = {
"name" : "interceptor", "faction" : "protoss", "flying" : true, "hitground" : true, "hitair" : true,
"health" : 40, "shields" : 40, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 5, "attackspeed" : 2.14, "attackmult" : 2, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "mechanical"]
}

var mothership = {
"name" : "mothership", "faction" : "protoss", "flying" : true, "hitground" : true, "hitair" : true,
"health" : 350, "shields" : 350, "armor" : 2, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 6, "attackspeed" : 1.58, "attackmult" : 6, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "massive", "psionic", "mechanical", "heroic"]
}

var cannon = {
"name" : "cannon", "faction" : "protoss", "flying" : false, "hitground" : true, "hitair" : true, 
"health" : 150, "shields" : 150, "armor" : 1, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 20, "attackspeed" : .89, "attackmult" : 1, "weaponsup" : 0, 
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "structure"]
}
var battery = {
"name" : "shield battery", "faction" : "protoss", "flying" : false, "hitground" : false , "hitair" : false,
"health" : 150, "shields" : 150, "armor" : 0, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 1,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null, 
"ranged" : null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null, 
"tags" : ["armored", "structure"]
}


#---terran units---#

var scv = {
"name" : "scv", "faction" : "terran",  "flying" : false, "hitground" : true, "hitair" : false, 
"health" : 45, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 5, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 0, 
"ranged" : false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological", "mechanical"]
}

var mule = {
"name" : "mule", "faction" : "terran", "flying" : false, "hitground" : false, "hitair" : false,
"health" : 60, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "null", "bonusdmg" : null, "bonusup" : null, 
"tags" : ["light", "mechanical"]
}

var marine = {
"name" : "marine", "faction" : "terran",  "flying" : false, "hitground" : true, "hitair" : false, 
"health" : 55, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 6, "attackspeed" : .61, "attackmult" : 1, "weaponsup" : 1, 
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological"]
}

var marauder = {
"name" : "marauder", "faction" : "terran",  "flying" : false, "hitground" : true, "hitair" : false, 
"health" : 125, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 10, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 1, 
"ranged" : true, "bonusvs" : "armored", "bonusdmg" : 10, "bonusup" : 1, 
"tags" : ["armored", "biological"]
}

var reaper = {
"name" : "reaper", "faction" : "terran",  "flying" : false, "hitground" : true, "hitair" : false, 
"health" : 60, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 4, "attackspeed" : .79, "attackmult" : 2, "weaponsup" : 1, 
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological"]
}

var ghost = {
"name" : "ghost", "faction" : "terran",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 100, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 10, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 1, 
"ranged" : true, "bonusvs" : "light", "bonusdmg" : 10, "bonusup" : 1, 
"tags" : ["psionic", "biological"]
}

var hellion = {
"name" : "hellion", "faction" : "terran",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 90, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 8, "attackspeed" : 1.79, "attackmult" : 1, "weaponsup" : 1, 
"ranged" : true, "bonusvs" : "light", "bonusdmg" : 6, "bonusup" : 1, 
"tags" : ["light", "mechanical"]
}

var hellbat = {
"name" : "hellbat", "faction" : "terran",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 135, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 18, "attackspeed" : 1.43, "attackmult" : 1, "weaponsup" : 2, 
"ranged" : true, "bonusvs" : "light", "bonusdmg" : 0, "bonusup" : 1, 
"tags" : ["mechanical", "light", "biological"]
}

var mine = {
"name" : "widowmine", "faction" : "terran", "flying" : false, "hitground" : true, "hitair" : true,
"health" : 90, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 145, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 0,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "mechanical", "spell"]
}


var cyclone = {
"name" : "cyclone", "faction" : "terran", "flying" : false, "hitground" : true, "hitair" : true,
"health" : 120, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 18, "attackspeed" : .71, "attackmult" : 1, "weaponsup" : 2,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "mechanical"]
}

var siegedtank = {"name" : "siegedtank",  "flying" : false, "faction" : "terran",  "hitground" : true, "hitair" : false, 
"health" : 175, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 40, "attackspeed" : 2.14, "attackmult" : 1, "weaponsup" : 4, 
"ranged" : true, "bonusvs" : "armored", "bonusdmg" : 30, "bonusup" : 1, 
"tags" : ["armored", "mechanical"]}

var tank = {
"name" : "tank", "faction" : "terran",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 175, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 15, "attackspeed" : .74, "attackmult" : 1, "weaponsup" : 2, 
"ranged" : true, "bonusvs" : "armored", "bonusdmg" : 10, "bonusup" : 1, 
"tags" : ["armored", "mechanical"]
}

var thor = {
"name" : "thor", "faction" : "terran",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 400, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 30, "attackspeed" : .91, "attackmult" : 2, "weaponsup" : 3, 
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "mechanical", "massive"]
}

var viking = {
"name" : "viking", "faction" : "terran", "flying" : , "hitground" : false, "hitair" : true,
"health" : 135, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 10, "attackspeed" : 1.43, "attackmult" : 2, "weaponsup" : 1,
"ranged": true, "bonusvs" : "armored", "bonusdmg" : 4, "bonusup" : 0, 
"tags" : ["armored", "mechanical"]
}

var medivac = {
"name" : "medivac", "faction" : "terran", "flying" : true, "hitground" : false, "hitair" : false,
"health" : 150, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null, 
"tags" : ["armored", "mechanical"]
}

var liberator = {
"name" : "liberator", "faction" : "terran", "flying" : true, "hitground" : false, "hitair" : true,
"health" : 180, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 5, "attackspeed" : 1.29, "attackmult" : 2, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "mechanical"]
}

var raven = {
"name" : "raven", "faction" : "terran", "flying" : true, "hitground" : false, "hitair" : false,
"health" : 140, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null, 
"tags" : ["light", "mechanical"]
}

var banshee = {
"name" : "banshee", "faction" : "terran", "flying" : true, "hitground" : true, "hitair" : false,
"health" : 140, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 12, "attackspeed" : .89, "attackmult" : 2, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "mechanical"]
}

var battlecruiser = {
"name" : "battlecruiser", "faction" : "terran", "flying" : true, "hitground" : true, "hitair" : true,
"health" : 550, "shields" : 0, "armor" : 3, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 8, "attackspeed" : .16, "attackmult" : 1, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "mechanical", "massive"]
}

var planetary = {
"name" : "planetary", "faction" : "terran",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 1500, "shields" : 0, "armor" : 3, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 40, "attackspeed" : 1.43, "attackmult" : 1, "weaponsup" : 0, 
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "mechanical", "structure"]
}



#---zerg units---#

var larva = {
"name" : "larva", "faction" : "zerg", "flying" : false, "hitground" : false, "hitair" : false,
"health" : 25, "shields" : 0, "armor" : 10, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 0,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null, 
"tags" : ["biological", "light"]
}

var egg = {
"name" : "egg", "faction" : "zerg", "flying" : false, "hitground" : false, "hitair" : false,
"health" : 200, "shields" : 0, "armor" : 10, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 0,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null, 
"tags" : ["biological", "light"]
}

var drone = {
"name" : "drone", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 40, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 5, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 0,
"ranged" : false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological"]
}

var overlord = {
"name" : "overlord", "faction" : "zerg",  "flying" : true,  "hitground" : false, "hitair" : false, 
"health" : 200, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged" : null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null, 
"tags" : ["armored", "biological"]
}

var queen = {
"name" : "queen", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 175, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 4, "attackspeed" : .71, "attackmult" : 2, "weaponsup" : 1,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["psionic", "biological"]
}

var zergling = {
"name" : "zergling", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 35, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 5, "attackspeed" : .497, "attackmult" : 1, "weaponsup" : 1,
"ranged" : false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological"]
}

var baneling = {
"name" : "baneling", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 30, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 16, "attackspeed" : .01, "attackmult" : 1, "weaponsup" : 2,
"ranged" : false, "bonusvs" : "light", "bonusdmg" : 19, "bonusup" : 2, 
"tags" : ["biological"]
}

var roach = {
"name" : "roach", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 145, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 16, "attackspeed" : 1.43, "attackmult" : 1, "weaponsup" : 2,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "biological"]
}

var ravager = {
"name" : "ravager", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 120, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 16, "attackspeed" : 1.14, "attackmult" : 1, "weaponsup" : 2,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["biological"]
} 

var hydralisk = {
"name" : "hydralisk", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 90, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 12, "attackspeed" : .59, "attackmult" : 1, "weaponsup" : 1,
"ranged" : true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological"]
}

var lurker = {
"name" : "lurker", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 200, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 20, "attackspeed" : 1.43, "attackmult" : 1, "weaponsup" : 2,
"ranged" : true, "bonusvs" : "armored", "bonusdmg" : 10, "bonusup" : 1, 
"tags" : ["armored", "biological"]
}

var mutalisk = {
"name" : "mutalisk", "faction" : "zerg", "flying" : true, "hitground" : true, "hitair" : true,
"health" : 120, "shields" : , "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 9, "attackspeed" : 1.09, "attackmult" : 1, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["biological", "light"]
}

var corruptor = {
"name" : "corruptor", "faction" : "zerg", "flying" : true, "hitground" : false, "hitair" : true,
"health" : 200, "shields" : 0, "armor" : 2, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 14, "attackspeed" : 1.36, "attackmult" : 1, "weaponsup" : 1,
"ranged": true, "bonusvs" : "massive", "bonusdmg" : 6, "bonusup" : 1, 
"tags" : ["biological", "armored"]
}

var swarmhost = {
"name" : "swarmhost", "faction" : "zerg", "flying" : false, "hitground" : false, "hitair" : false,
"health" : 160, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null, 
"tags" : ["biological", "armored"]
}

var locust = {
"name" : "locust", "faction" : "zerg", "flying" : false, "hitground" : true, "hitair" : false,
"health" : 50, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 10, "attackspeed" : .43, "attackmult" : 1, "weaponsup" : 1,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["biological", "light"]
}

var infestor = {
"name" : "infestor", "faction" : "zerg", "flying" : false, "hitground" : false, "hitair" : false,
"health" : 90, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : null, "attackspeed" : null, "attackmult" : null, "weaponsup" : null,
"ranged": null, "bonusvs" : "", "bonusdmg" : null, "bonusup" : null, 
"tags" : ["biological", "armored", "psionic"]
}

var viper = {
"name" : "viper", "faction" : "zerg", "flying" : true, "hitground" : false, "hitair" : true,
"health" : 150, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 120, "attackspeed" : 7, "attackmult" : 1, "weaponsup" : 0,
"ranged": false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["biological", "biological", "psionic", "spell"]
}

var ultralisk = {
"name" : "ultralisk", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 500, "shields" : 0, "armor" : 2, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 35, "attackspeed" : .61, "attackmult" : 1, "weaponsup" : 3,
"ranged" : false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "biological", "massive"]
}

var broodlord = {
"name" : "broodlord", "faction" : "zerg", "flying" : true, "hitground" : true, "hitair" : false,
"health" : 225, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 20, "attackspeed" : 1.79, "attackmult" : 1, "weaponsup" : 2,
"ranged": true, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["biological", "armored", "massive"]
}

var broodling = {
"name" : "broodling", "faction" : "zerg", "flying" : false, "hitground" : true, "hitair" : false,
"health" : 30, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 4, "attackspeed" : .46, "attackmult" : 1, "weaponsup" : 1,
"ranged": false, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["biological", "light"]
}

var spinecrawler = {
"name" : "spinecrawler", "faction" : "zerg",  "flying" : false,  "hitground" : true, "hitair" : false, 
"health" : 300, "shields" : 0, "armor" : 2, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 25, "attackspeed" : 1.32, "attackmult" : 1, "weaponsup" : 0,
"ranged" : true, "bonusvs" : "armored", "bonusdmg" : 5, "bonusup" : 0, 
"tags" : ["light", "biological"]
}

#---Variables---#

var units = [probe, zealot, stalker, adept, archon, immortal, colossus, cannon, 
		 scv, marine, marauder, reaper, ghost, hellion, hellbat, siegedtank, tank, thor, planetary,
		 drone, zergling, baneling, roach, ravager, queen, hydralisk, lurker, ultralisk, spinecrawler]

var unit1Exists := false
var unit2Exists := false

var attackUnit = null
var defendUnit = null

var attackboxUp = 0
var armorboxUp = 0
var shieldboxUp = 0

#---Process Functions---#
func _ready():
	pass 
	
func CalcCheck():
	if attackUnit and defendUnit:
		$VBoxContainer2/HBoxContainer.visible = true
		$VBoxContainer2/HBoxContainer/Label2.text = DamageCalc(attackUnit, defendUnit, attackboxUp, armorboxUp, shieldboxUp)

#---Calculation Functions---X

func DamageCalc(attacker, defender, plusW, plusA, plusS):
	var health:float = defender["health"]
	var armor = defender["armor"]
	var armorUp = defender["armorup"]
	
	var attack = attacker["attack"]
	var attackMult = attacker["attackmult"]
	var weaponsUp = attacker["weaponsup"]
	var bonusDmg = attacker["bonusdmg"]
	var bonusUp = 0
	if attacker["bonusvs"] in defender["tags"]:
		attack += bonusDmg
		bonusUp = attacker["bonusup"]
	var attackSpeed = attacker["attackspeed"]
	var barrierCD:float = 0.0
	
	var shotsToKill = 0.0
	
	var shotTotals:String
	
	health = defender["health"]
	var Dmg = (attack + (weaponsUp * plusW) + (bonusUp * plusW))
	var healthDmg = max((Dmg - (armor + (armorUp * plusA))), .5)
	
	if defender["faction"] == "protoss":
		#protoss defender
		var shieldUp = defender["shieldup"]
		var shieldArmor = defender["shieldarmor"]
		health = defender["health"]
		var shields:float = defender["shields"]
		var shieldDmg = max((Dmg - (shieldArmor + (shieldUp * plusS))), .5)
		while shields > 0:
			shields -= shieldDmg
			shotsToKill += 1.0
			barrierCD -= attackSpeed
			#immortal barrier logic: kicks in AFTER first shot, bonus 100 shields for 
			#my best approx of 2 seconds, does take armor upgrades into account
			if defender["name"] == "immortal" and $VBoxContainer2/VBoxContainer2/CheckBox.pressed == true and barrierCD < 0:
				var barrier:float = 100
				barrierCD = 2 - attackSpeed
				while barrier > 0:
					barrier -= shieldDmg
					shotsToKill += 1.0
					barrierCD -= attackSpeed
					if barrierCD < attackSpeed:
						barrier = 0
						break
				barrierCD = 32.0
						
		shotTotals = str((ceil(shotsToKill/attackMult))) + "\n"
		shotTotals = shotTotals + str((ceil(shotsToKill/attackMult) * attackSpeed)) + "s\n"
		
		health -= (shields * -1) - (armor + (armorUp * plusA))
		
		while health > 0:
			health -= healthDmg
			shotsToKill += 1.0
			if defender["name"] == "immortal" and $VBoxContainer2/VBoxContainer2/CheckBox.pressed == true and barrierCD < 0:
				var barrier:float = 100
				barrierCD = 2.0
				while barrier > 0:
					barrier -= healthDmg
					shotsToKill += 1.0
					barrierCD -= attackSpeed
					if barrierCD < attackSpeed:
						barrier = 0
						barrierCD = 32.0
			
		shotTotals = shotTotals + str((ceil(shotsToKill/attackMult))) + "\n"
		shotTotals = shotTotals + str((ceil(shotsToKill/attackMult) * attackSpeed)) + "s\n"
				
	else:
		#non-protoss defender
		while health > 0:
			health -= healthDmg
			shotsToKill += 1.0
			if defender["faction"] == "zerg": #zerg inherent regen, universal aside from muta
				health += .38 * attackSpeed
				
		shotTotals = str(ceil(shotsToKill/attackMult)) + "\n"
		shotTotals = shotTotals + str(ceil(shotsToKill/attackMult) * attackSpeed) + "s\n"
	return shotTotals
	
#for future use when air units are added
func CanAttack(attacker, defender) -> bool:
	return true


#---UI input---#

#de-ID's the units into their dictionaries
var unitCode = {-1 : null, 0 : null, 101 : probe, 102 : zealot, 103 : stalker, 104 : adept, 105 : archon, 106 : immortal, 107 : colossus, 108 : cannon, 
201 : scv, 202 : marine, 203 : marauder, 204 : reaper, 205 : ghost, 206 : hellion, 207 : hellbat, 208 : siegedtank, 209 : tank, 210 : thor, 211 : planetary, 
301 : drone, 302 : zergling, 303 : baneling, 304 : roach, 305 : ravager, 306 : queen, 307 : hydralisk, 308 : lurker, 309 : ultralisk, 310 : spinecrawler}

#attackunit box logic
func _on_AttackUnit_item_selected(_index):
	$VBoxContainer2/VBoxContainer/CheckBox2.pressed = false
	unit1Exists = true
	attackUnit = $VBoxContainer2/VBoxContainer/AttackUnit.get_selected_id()
	attackUnit = unitCode[attackUnit]
	
	if defendUnit and defendUnit["faction"] == "protoss" and "ranged" in attackUnit["tags"]:
		$VBoxContainer2/VBoxContainer2/GuardianShield.visible = true
		$VBoxContainer2/VBoxContainer2/GuardianShield.text = "Guardian Shield (+2 armor vs ranged)"
		
	match attackUnit:
		adept:
			$VBoxContainer2/VBoxContainer/CheckBox2.visible = true
			$VBoxContainer2/VBoxContainer/CheckBox2.text = "Resonating Glaives (Attack Time: -.5s)"
		#tempest - vs building upgrade
		#voidray - charge ability
		marine:
			$VBoxContainer2/VBoxContainer/CheckBox2.visible = true
			$VBoxContainer2/VBoxContainer/CheckBox2.text = "Stim (Attack Time: -.203s)"
		marauder:
			$VBoxContainer2/VBoxContainer/CheckBox2.visible = true
			$VBoxContainer2/VBoxContainer/CheckBox2.text = "Stim (Attack Time: -.36s)"
		hellion:
			$VBoxContainer2/VBoxContainer/CheckBox2.visible = true
			$VBoxContainer2/VBoxContainer/CheckBox2.text = "Blueflame (vs Light: +5)"
		hellbat:
			$VBoxContainer2/VBoxContainer/CheckBox2.visible = true
			$VBoxContainer2/VBoxContainer/CheckBox2.text = "Blueflame (vs Light: +12)"
		zergling:
			$VBoxContainer2/VBoxContainer/CheckBox2.visible = true
			$VBoxContainer2/VBoxContainer/CheckBox2.text = "Adrenal Glands"
		_:
			$VBoxContainer2/VBoxContainer/CheckBox2.visible = false
			$VBoxContainer2/VBoxContainer/CheckBox2.text = ""
	CalcCheck()

#defendunit box logic
func _on_DefendUnit_item_selected(_index):
	$VBoxContainer2/VBoxContainer2/CheckBox.pressed = false
	unit1Exists = true
	defendUnit = $VBoxContainer2/VBoxContainer2/DefendUnit.get_selected_id()
	defendUnit = unitCode[defendUnit]
	
	if attackUnit and defendUnit["faction"] == "protoss" and "ranged" in attackUnit["tags"]:
		$VBoxContainer2/VBoxContainer2/GuardianShield.visible = true
		$VBoxContainer2/VBoxContainer2/GuardianShield.text = "Guardian Shield (+2 armor vs ranged)"
	
	match defendUnit:
		immortal:
			$VBoxContainer2/VBoxContainer2/CheckBox.visible = true
			$VBoxContainer2/VBoxContainer2/CheckBox.text = "Barrier (+100 Shields for 2s)"
		planetary:
			$VBoxContainer2/VBoxContainer2/CheckBox.visible = true
			$VBoxContainer2/VBoxContainer2/CheckBox.text = "Neosteel Armor (+2 Armor)"
		baneling:
			$VBoxContainer2/VBoxContainer2/CheckBox.visible = true
			$VBoxContainer2/VBoxContainer2/CheckBox.text = "Centrifugal Hooks (+5 hp)"
		ultralisk:
			$VBoxContainer2/VBoxContainer2/CheckBox.visible = true
			$VBoxContainer2/VBoxContainer2/CheckBox.text = "Chitinous Plating (+2 Armor)"
		_:
			$VBoxContainer2/VBoxContainer2/CheckBox.visible = false
			$VBoxContainer2/VBoxContainer2/CheckBox.text = ""
	#if protoss, display shield upgrade options
	if $VBoxContainer2/VBoxContainer2/DefendUnit.get_selected_id() > 100 and $VBoxContainer2/VBoxContainer2/DefendUnit.get_selected_id() < 200:
		$VBoxContainer2/VBoxContainer2/HBoxContainer/SpinBox3.visible = true
		$VBoxContainer2/HBoxContainer/Label.text = "Shots to Break Shields:\nTime to Break Shields:\nShots to Kill:\nTime to Kill:"
		
	else:
		$VBoxContainer2/VBoxContainer2/HBoxContainer/SpinBox3.visible = false
		$VBoxContainer2/HBoxContainer/Label.text = "Shots to Kill:\nTime to Kill:"
	CalcCheck()

#apply/remove upgrades dynamically based on checkbox
func _on_CheckBox2_toggled(button_pressed):
	if button_pressed:
		match attackUnit:
			adept:
				attackUnit["attackspeed"] = 1.11
			marine:
				attackUnit["attackspeed"] = .407
			marauder:
				attackUnit["attackspeed"] = .71
			hellion:
				attackUnit["bonusdmg"] = 11
			hellbat:
				attackUnit["bonusdmg"] = 12
			zergling:
				attackUnit["attackspeed"] = .354
	if not button_pressed:
		match attackUnit:
			adept:
				attackUnit["attackspeed"] = 1.61
			marine:
				attackUnit["attackspeed"] = .61
			marauder:
				attackUnit["attackspeed"] = 1.07
			hellion:
				attackUnit["bonusdmg"] = 6
			hellbat:
				attackUnit["bonusdmg"] = 0
			zergling:
				attackUnit["attackspeed"] = .497


func _on_CheckBox_toggled(button_pressed):
	if button_pressed:
		match defendUnit:
			immortal:
				pass #Handled in damage calculation for better accuracy to in-game values
			planetary:
				defendUnit["armor"] = 5
			baneling:
				defendUnit["health"] = 35
			ultralisk:
				defendUnit["armor"] = 4
	if not button_pressed:
		match defendUnit:
			immortal:
				pass #Handled in damage calculation for better accuracy to in-game values
			planetary:
				defendUnit["armor"] = 3
			baneling:
				defendUnit["health"] = 3
			ultralisk:
				defendUnit["armor"] = 2
	
#gather upgrade values from entry boxes
func _on_SpinBox_value_changed(value):
	attackboxUp = value


func _on_SpinBox2_value_changed(value):
	armorboxUp = value


func _on_SpinBox3_value_changed(value):
	shieldboxUp = value


func _on_GuardianShield_toggled(button_pressed):
	if button_pressed:
		defendUnit["armor"] += 2
		defendUnit["shieldarmor"] += 2
	if not button_pressed:
		defendUnit["armor"] -= 2
		defendUnit["shieldarmor"] -= 2

func _on_SplashZone_value_changed(value):
	#match attackUnit:
		
