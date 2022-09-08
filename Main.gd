extends Control

#---Unit Data---#

#protoss units
var probe = {"name" : "probe", "faction" : "protoss",
"health" : 20, "shields" : 20, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 5, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 0, 
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "mechanical"]}

var zealot = {"name" : "zealot", "faction" : "protoss",
"health" : 100, "shields" : 50, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 8, "attackspeed" : .86, "attackmult" : 2, "weaponsup" : 1, 
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological"]}

var stalker = {"name" : "stalker", "faction" : "protoss",
"health" : 80, "shields" : 80, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 13, "attackspeed" : 1.34, "attackmult" : 1, "weaponsup" : 1, 
"bonusvs" : "armored", "bonusdmg" : 5, "bonusup" : 1, 
"tags" : ["armored", "mechanical", "ranged"]}

var adept = {"name" : "adept", "faction" : "protoss",
"health" : 70, "shields" : 70, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 10, "attackspeed" : 1.61, "attackmult" : 1, "weaponsup" : 1, 
"bonusvs" : "light", "bonusdmg" : 12, "bonusup" : 1, 
"tags" : ["light", "biological", "ranged"]}

var archon = {"name" : "archon", "faction" : "protoss",
"health" : 10, "shields" : 350, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 25, "attackspeed" : 1.25, "attackmult" : 1, "weaponsup" : 3, 
"bonusvs" : "biological", "bonusdmg" : 10, "bonusup" : 1, 
"tags" : ["psionic", "massive", "ranged"]}

var immortal = {"name" : "immortal", "faction" : "protoss",
"health" : 200, "shields" : 100, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 20, "attackspeed" : 1.04, "attackmult" : 1, "weaponsup" : 2, 
"bonusvs" : "armored", "bonusdmg" : 30, "bonusup" : 3, 
"tags" : ["armored", "mechanical", "ranged"]}

var colossus = {"name" : "colossus", "faction" : "protoss",
"health" : 200, "shields" : 150, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 10, "attackspeed" : 1.07, "attackmult" : 2, "weaponsup" : 1, 
"bonusvs" : "light", "bonusdmg" : 5, "bonusup" : 1, 
"tags" : ["armored", "massive", "mechanical", "ranged"]}

var cannon = {"name" : "cannon", "faction" : "protoss",
"health" : 150, "shields" : 150, "armor" : 1, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 20, "attackspeed" : .89, "attackmult" : 1, "weaponsup" : 0, 
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "structure", "ranged"]}


#terran units
var scv = {"name" : "scv", "faction" : "terran", 
"health" : 45, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 5, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 0, 
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological", "mechanical"]}

var marine = {"name" : "marine", "faction" : "terran", 
"health" : 55, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 6, "attackspeed" : .61, "attackmult" : 1, "weaponsup" : 1, 
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological", "ranged"]}

var marauder = {"name" : "marauder", "faction" : "terran", 
"health" : 125, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 10, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 1, 
"bonusvs" : "armored", "bonusdmg" : 10, "bonusup" : 1, 
"tags" : ["armored", "biological", "ranged"]}

var reaper = {"name" : "reaper", "faction" : "terran", 
"health" : 60, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 4, "attackspeed" : .79, "attackmult" : 2, "weaponsup" : 1, 
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological", "ranged"]}

var ghost = {"name" : "ghost", "faction" : "terran", 
"health" : 100, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 10, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 1, 
"bonusvs" : "light", "bonusdmg" : 10, "bonusup" : 1, 
"tags" : ["psionic", "biological", "ranged"]}

var hellion = {"name" : "hellion", "faction" : "terran", 
"health" : 90, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 8, "attackspeed" : 1.79, "attackmult" : 1, "weaponsup" : 1, 
"bonusvs" : "light", "bonusdmg" : 6, "bonusup" : 1, 
"tags" : ["light", "mechanical", "ranged"]}

var hellbat = {"name" : "hellbat", "faction" : "terran", 
"health" : 135, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 18, "attackspeed" : 1.43, "attackmult" : 1, "weaponsup" : 2, 
"bonusvs" : "light", "bonusdmg" : 0, "bonusup" : 1, 
"tags" : ["mechanical", "light", "biological", "ranged"]}

var siegedtank = {"name" : "siegedtank", "faction" : "terran", 
"health" : 175, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 40, "attackspeed" : 2.14, "attackmult" : 1, "weaponsup" : 4, 
"bonusvs" : "armored", "bonusdmg" : 30, "bonusup" : 1, 
"tags" : ["armored", "mechanical", "ranged"]}

var tank = {"name" : "tank", "faction" : "terran", 
"health" : 175, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 15, "attackspeed" : .74, "attackmult" : 1, "weaponsup" : 2, 
"bonusvs" : "armored", "bonusdmg" : 10, "bonusup" : 1, 
"tags" : ["armored", "mechanical", "ranged"]}

var thor = {"name" : "thor", "faction" : "terran", 
"health" : 400, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 30, "attackspeed" : .91, "attackmult" : 2, "weaponsup" : 3, 
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "mechanical", "massive", "ranged"]}

var planetary = {"name" : "planetary", "faction" : "terran", 
"health" : 1500, "shields" : 0, "armor" : 3, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 40, "attackspeed" : 1.43, "attackmult" : 1, "weaponsup" : 0, 
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "mechanical", "structure", "ranged"]}


#zerg units
var drone = {"name" : "drone", "faction" : "zerg", 
"health" : 40, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 5, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 0,
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological"]}

var zergling = {"name" : "zergling", "faction" : "zerg", 
"health" : 35, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 5, "attackspeed" : .497, "attackmult" : 1, "weaponsup" : 1,
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological"]}

var baneling = {"name" : "baneling", "faction" : "zerg", 
"health" : 30, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 16, "attackspeed" : .01, "attackmult" : 1, "weaponsup" : 2,
"bonusvs" : "light", "bonusdmg" : 19, "bonusup" : 2, 
"tags" : ["biological"]}

var roach = {"name" : "roach", "faction" : "zerg", 
"health" : 145, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 16, "attackspeed" : 1.43, "attackmult" : 1, "weaponsup" : 2,
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "biological", "ranged"]}

var ravager = {"name" : "ravager", "faction" : "zerg", 
"health" : 120, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 16, "attackspeed" : 1.14, "attackmult" : 1, "weaponsup" : 2,
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["biological", "ranged"]} 

var hydralisk = {"name" : "hydralisk", "faction" : "zerg", 
"health" : 90, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 12, "attackspeed" : .59, "attackmult" : 1, "weaponsup" : 1,
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological", "ranged"]}

var queen = {"name" : "queen", "faction" : "zerg", 
"health" : 175, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 4, "attackspeed" : .71, "attackmult" : 2, "weaponsup" : 1,
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["psionic", "biological", "ranged"]}

var lurker = {"name" : "lurker", "faction" : "zerg", 
"health" : 200, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 20, "attackspeed" : 1.43, "attackmult" : 1, "weaponsup" : 2,
"bonusvs" : "armored", "bonusdmg" : 10, "bonusup" : 1, 
"tags" : ["armored", "biological", "ranged"]}

var ultralisk = {"name" : "ultralisk", "faction" : "zerg", 
"health" : 500, "shields" : 0, "armor" : 2, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 35, "attackspeed" : .61, "attackmult" : 1, "weaponsup" : 3,
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "biological", "massive"]}

var spinecrawler = {"name" : "spinecrawler", "faction" : "zerg", 
"health" : 300, "shields" : 0, "armor" : 2, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 25, "attackspeed" : 1.32, "attackmult" : 1, "weaponsup" : 0,
"bonusvs" : "armored", "bonusdmg" : 5, "bonusup" : 0, 
"tags" : ["light", "biological", "ranged"]}

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
