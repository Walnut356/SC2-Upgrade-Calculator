extends Control

"""
TODO:
merge hellion and hellbat?
fix health regen on multi-part attacks (i.e. zealot -> zergling w/ +1)

loaded bunker attack stats?
supply structures, town halls, stasis ward, creep tumor, nydus, sensor tower
Shield battery on defending unit toggle
	-max +50.4 shields/s, max 3 per 1 energy, max 100 energy
	-2x rate on overcharge, no energy limits, 14 seconds
medivac healing? transfuse?

BW units/BW "physics"
possible "crazy mode" where anything can hit anything else
comparisons/multiple upgrades tests/multiple windows
dynamic window resizing that works properly?
'custom unit' (i.e. text entry) mode

var units:Array = [UnitData.probe, UnitData.zealot, UnitData.stalker, UnitData.adept, UnitData.archon, UnitData.immortal, UnitData.colossus, UnitData.cannon,
		 UnitData.scv, UnitData.marine, UnitData.marauder, UnitData.reaper, UnitData.ghost, UnitData.hellion, UnitData.hellbat, UnitData.tank, UnitData.thor, UnitData.planetary, UnitData.turret, UnitData.bunker,
		 UnitData.drone, UnitData.zergling, UnitData.baneling, UnitData.roach, UnitData.ravager, UnitData.queen, UnitData.hydralisk, UnitData.lurker, UnitData.ultralisk, UnitData.spinecrawler]
"""
#---Variables---#
var attackUnit = null
var defendUnit = null

var attackboxUp:int = 0
var armorboxUp:int = 0
var shieldboxUp:int = 0
var healing:float = 0

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
		if defendUnit.faction == "Protoss":
			$"%ShieldUpgrade".visible = true
			if attackUnit.spell:
				$"%Label".text = "Casts to Break Shields:\nTime to Break Shields:\n\nCasts to Kill:\nTime to Kill:"
			elif attackUnit.type == "Carrier":
				$"%Label".text = "Volleys to Break Shields:\nTime to Break Shields:\n\nVolleys to Kill:\nTime to Kill:"
			else:
				$"%Label".text = "Shots to Break Shields:\nTime to Break Shields:\n\nShots to Kill:\nTime to Kill:"
			if attackUnit.range > 1:
				$"%GuardianShield".visible = true
			else:
				$"%GuardianShield".visible = false
		else:
			$"%ShieldUpgrade".visible = false
			if attackUnit.spell:
				$"%Label".text = "Casts to Kill:\nTime to Kill:"
			elif attackUnit.type == "Carrier":
				$"%Label".text = "Volleys to Kill:\nTime to Kill:"
			else:
				$"%Label".text = "Shots to Kill:\nTime to Kill:"
			$"%GuardianShield".visible = false
			$"%GuardianShield".pressed = false

		if attackUnit.spell:
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

		match attackUnit.type:
			"High Templar":
				aModeBox.set_item_disabled(0, false)
				aModeBox.set_item_disabled(1, false)
				if defendUnit.flying:
					aModeBox.set_item_disabled(0, true)
				if "structure" in defendUnit.tags:
					aModeBox.set_item_disabled(1, true)
					$"%AModeChoice".select(0)
					$"%AModeChoice".emit_signal("item_selected", 0)
				if $"%AModeChoice".selected < 0 and (not "structure" in defendUnit.tags):
						$"%AModeChoice".select(1)
						$"%AModeChoice".emit_signal("item_selected", 1)
			"Phoenix":
				if !defendUnit.flying and !("massive" in defendUnit.tags or "structure" in defendUnit.tags):
					$"%AttackerModifier".pressed = true
					$"%AttackerModifier".disabled = true
				else:
					$"%AttackerModifier".disabled = true
					$"%AttackerModifier".pressed = false
			"Void Ray":
				pass
			"Tempest":
				if defendUnit.flying:
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
				if "biological" in defendUnit.tags:
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
				if $"%AModeChoice".selected == 1:
					$"%SplashZone".visible = true
					if $"%SplashZone".selected < 0: 
						$"%SplashZone".select(0)
						$"%SplashZone".emit_signal("item_selected", 0)
				else: 
					$"%SplashZone".visible = false
					$"%SplashZone".select(0)
					$"%SplashZone".emit_signal("item_selected", 0)
			"Thor":
				aModeBox.set_item_disabled(0, false)
				aModeBox.set_item_disabled(1, false)
				aModeBox.set_item_disabled(2, false)
				if defendUnit.type == "Colossus":
					aModeBox.set_item_disabled(1, true)
					if $"%AModeChoice".selected == 1 or $"%AModeChoice".selected == -1:
						$"%AModeChoice".select(0)
						$"%AModeChoice".emit_signal("item_selected", 0)
					$"%AModeChoice".disabled = false
				elif defendUnit.flying:
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
				if defendUnit.type in ["Viking", "Colossus"]:
					$"%AttackerModifier".disabled = false
					$"%AModeChoice".select($"%AttackerModifier".pressed)
				elif !defendUnit.flying:
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
				if defendUnit.type == "Viking":
					$"%AModeChoice".select(0 if defendUnit.flying else 1)
					$"%AModeChoice".emit_signal("item_selected", 0 if defendUnit.flying else 1)
				elif !defendUnit.flying:
					$"%AModeChoice".select(1)
					$"%AModeChoice".emit_signal("item_selected", 1)
				else:
					$"%AModeChoice".select(0)
					$"%AModeChoice".emit_signal("item_selected", 0)
			"Battle Cruiser":
				aModeBox.set_item_disabled(0, false)
				aModeBox.set_item_disabled(1, false)
				aModeBox.set_item_disabled(2, false)
				if !defendUnit.flying:
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
				if defendUnit.flying:
					$"%AModeChoice".select(1)
					$"%AModeChoice".emit_signal("item_selected", 1)
					$"%AModeChoice".disabled = true
					$"%AttackerModifier".visible = false
				else:
					$"%AModeChoice".select(0)
					$"%AModeChoice".emit_signal("item_selected", 0)
					$"%AModeChoice".disabled = true
		match defendUnit.type:
			"Colossus":
				if attackUnit.hitAir:
					defendUnit.flying = true
				else:
					defendUnit.flying = false
			"Viking":
				if (attackUnit.hitGround and attackUnit.hitAir) or (not attackUnit.hitGround and not attackUnit.hitAir) or attackUnit.type in ["Phoenix", "Queen", "Liberator"]:
					$"%DefenderModifier".disabled = false
				else:
					defendUnit.flying = attackUnit.hitAir
					$"%DefenderModifier".pressed = !attackUnit.hitAir
					$"%DefenderModifier".emit_signal("_on_DefenderModifier_toggled",!attackUnit.hitAir)
					$"%DefenderModifier".disabled = true



		CalcCheck()
	else:
			$VBoxContainer2/HBoxContainer.visible = false


func CalcCheck():
	if not DamageCalc.CanAttack(attackUnit, defendUnit):
		$"%Label".visible = false
		#there literally has to be a better way to do this
		var dumb
		var dumb2
		match attackUnit.type[0]:
			"A", "E", "I", "O", "U":
				 dumb = "An"
			_:
				 dumb = "A"
		match defendUnit.type[0]:
			"A", "E", "I", "O", "U":
				dumb2 = "an"
			_:
				dumb2 = "a"

		$"%Label2".text = "%s %s cannot attack %s %s" % [dumb, attackUnit.type, dumb2, defendUnit.type]
	else:
		$"%Label".visible = true
		$"%Label2".text = DamageCalc.ToKill(attackUnit, defendUnit, attackboxUp, armorboxUp, shieldboxUp, healing)

#---UI input---#


#de-ID's the units into their dictionaries



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
	attackUnit = UnitData.unitCode[attackUnit].duplicate()

	#Per unit logic
	if defendUnit and defendUnit.faction == "Protoss" and attackUnit.range > 1:
		$"%GuardianShield".visible = true
	else:
		$"%GuardianShield".visible = false
		$"%GuardianShield".pressed = false
	
	if attackUnit.faction == "terran":
		$"%AntiArmor".visible = true
	else:
		$"%AntiArmor".visible = false
		$"%AntiArmor".pressed = false

	match attackUnit.type:
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
			attackUnit.attackMult = 2 * $"%InterceptorCount".value
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
			$"%SplashZone".visible = false
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
	defendUnit = UnitData.unitCode[defendUnit].duplicate()
	
	if defendUnit.faction == "terran" and "biological" in defendUnit.tags:
		$"%Healing".visible = true
	else:
		$"%Healing".visible = false
		$"%Healing".pressed = false

	#per-unit logic
	match defendUnit.type:
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
	match attackUnit.type:
		"Adept":
			if button_pressed: attackUnit.attackSpeed = 1.11
			else: attackUnit.attackSpeed = UnitData.adept.attackSpeed
		"Phoenix":
			if defendUnit:
				if button_pressed: attackUnit.hitGround = true
				else: attackUnit.hitGround = false
		"Void Ray":
			if button_pressed: attackUnit.bonusDmg = 10
			else: attackUnit.bonusDmg = UnitData.voidray.bonusDmg
		"Tempest":
			if button_pressed: attackUnit.bonusDmg = 40
			else: attackUnit.bonusDmg = UnitData.tempest.bonusDmg
		"Marine":
			if button_pressed: attackUnit.attackSpeed = .407
			else: attackUnit.attackSpeed = UnitData.marine.attackSpeed
		"Marauder":
			if button_pressed: attackUnit.attackSpeed = .71
			else: attackUnit.attackSpeed = UnitData.marauder.attackSpeed
		"Hellion":
			if button_pressed: attackUnit.bonusDmg = 11
			else: attackUnit.bonusDmg = UnitData.hellion.bonusDmg
		"Hellbat":
			if button_pressed: attackUnit.bonusDmg = 12
			else: attackUnit.bonusDmg = UnitData.hellbat.bonusDmg
		"Cyclone":
			if button_pressed: attackUnit.bonusDmg = 20
			else: attackUnit.bonusDmg = UnitData.hellbat.bonusDmg
		"Viking":
			if button_pressed:
				attackUnit.hitAir = false
				attackUnit.hitGround = true
				attackUnit.attack = 12
				attackUnit.weaponsUp = 1
				attackUnit.attackMult = 1
				attackUnit.attackSpeed = .71
				attackUnit.bonusVs = "mechanical"
				attackUnit.bonusDmg = 8
				attackUnit.bonusUp = 1
			else:
				attackUnit.hitAir = UnitData.viking.hitAir
				attackUnit.hitGround = UnitData.viking.hitGround
				attackUnit.attack = UnitData.viking.attack
				attackUnit.weaponsUp = UnitData.viking.weaponsUp
				attackUnit.attackMult = UnitData.viking.attackMult
				attackUnit.attackSpeed = UnitData.viking.attackSpeed
				attackUnit.bonusVs = UnitData.viking.bonusVs
				attackUnit.bonusDmg = UnitData.viking.bonusDmg
				attackUnit.bonusUp = UnitData.viking.bonusUp
		"Zergling":
			if button_pressed: attackUnit.attackSpeed = .354
			else : attackUnit.attackSpeed = UnitData.zergling.attackSpeed

func _on_DefenderModifier_toggled(button_pressed):
		match defendUnit.type:
			"Immortal":
				pass #Handled in damage calculation for better accuracy to in-game values
			"Marine":
				if button_pressed: defendUnit.health = 55
				else: defendUnit.health = UnitData.marine.health
			"Viking":
				if button_pressed: defendUnit.flying = false
				else: defendUnit.flying = UnitData.viking.flying
			"Planetary Fortress":
				if button_pressed: defendUnit.armor = 5
				else: defendUnit.armor = UnitData.planetary.armor
			"Missile Turret":
				if button_pressed: defendUnit.armor = 2
				else: defendUnit.armor = UnitData.turret.armor
			"Bunker":
				if button_pressed: defendUnit.armor = 3
				else: defendUnit.armor = UnitData.bunker.armor
			"Auto Turret":
				if button_pressed: defendUnit.armor = 3
				else: defendUnit.armor = UnitData.autoturret.armor
			"Baneling":
				if button_pressed: defendUnit.health = 35
				else: defendUnit.health = UnitData.baneling.health
			"Overlord":
				if button_pressed: defendUnit.armor = 1
				else: defendUnit.armor = UnitData.overlord.armor
			"Ultralisk":
				if button_pressed: defendUnit.armor = 4
				else: defendUnit.armor = UnitData.ultralisk.armor


func _on_AModeChoice_item_selected(index):
	match attackUnit.type:
		"Tempest":
			if index == 0:
				$"%AttackerModifier".text = "Tectonic Destabilizers (vs Struct: +40)"
				$"%AttackerModifier".visible = true
				attackUnit.attack = 40
				attackUnit.weaponsUp = 4
				attackUnit.bonusVs = "structure"
				attackUnit.bonusDmg = 0 if not $"%AttackerModifier".pressed else 40
				attackUnit.bonusUp = 0
			else:
				$"%AttackerModifier".visible = false
				attackUnit.attack = 30
				attackUnit.weaponsUp = 3
				attackUnit.bonusVs = "massive"
				attackUnit.bonusDmg = 22
				attackUnit.bonusUp = 2
		"High Templar":
			attackUnit.changeWeapon(index)
		"Ghost":
			match index:
				0:
					attackUnit.attack = UnitData.ghost.attack
					attackUnit.attackSpeed = UnitData.ghost.attackSpeed
					attackUnit.bonusDmg = UnitData.ghost.bonusDmg
					attackUnit.bonusVs = UnitData.ghost.bonusVs
					attackUnit.spell = false
				1:
					attackUnit.attack = 170
					attackUnit.attackSpeed = 1.43
					attackUnit.bonusDmg = 0
					attackUnit.bonusVs = ""
					attackUnit.spell = false
					attackUnit.spell = true
				2:
					attackUnit.attack = 300
					attackUnit.attackSpeed = 14
					attackUnit.bonusDmg = 200
					attackUnit.bonusVs = "structure"
					attackUnit.spell = false #I could also just check if there is "spell" already
					attackUnit.spell = true #but this is easier
		"Cyclone":
			if index == 0:
				attackUnit.attack = UnitData.cyclone.attack
				attackUnit.attackSpeed = UnitData.cyclone.attackSpeed
				attackUnit.attackMult = UnitData.cyclone.attackMult
				attackUnit.bonusVs = UnitData.cyclone.bonusVs
				attackUnit.spell = false
			else:
				attackUnit.attack = 20
				attackUnit.attackSpeed = 0.71
				attackUnit.attackMult = 20
				attackUnit.bonusVs = "armored"
				attackUnit.spell = true
		"Siege Tank":
			if index == 0:
				attackUnit.attack = 15
				attackUnit.weaponsUp = 2
				attackUnit.attackSpeed = .74
				attackUnit.bonusVs = "armored"
				attackUnit.bonusDmg = 10
				attackUnit.bonusUp = 1
				
			else:
				attackUnit.attack = 40
				attackUnit.weaponsUp = 4
				attackUnit.attackSpeed = 2.14
				attackUnit.bonusVs = "armored"
				attackUnit.bonusDmg = 30
				attackUnit.bonusUp = 1
		"Thor":
			match index:
				0:
					attackUnit.attack = 30
					attackUnit.weaponsUp = 3
					attackUnit.attackMult = 2
					attackUnit.attackSpeed = .91
					attackUnit.bonusVs = ""
					attackUnit.bonusDmg = 0
					attackUnit.bonusUp = 0
				1:
					attackUnit.attack = 6
					attackUnit.weaponsUp = 1
					attackUnit.attackMult = 4
					attackUnit.attackSpeed = 2.14
					attackUnit.bonusVs = "light"
					attackUnit.bonusDmg = 6
					attackUnit.bonusUp = 1
				2:
					attackUnit.attack = 25
					attackUnit.weaponsUp = 3
					attackUnit.attackMult = 1
					attackUnit.attackSpeed = .91
					attackUnit.bonusVs = "massive"
					attackUnit.bonusDmg = 10
					attackUnit.bonusUp = 1
		"Liberator":
			if index == 0:
				attackUnit.attack = 5
				attackUnit.weaponsUp = 1
				attackUnit.attackMult = 2
				attackUnit.attackSpeed = 1.29
				attackUnit.hitAir = true
				attackUnit.hitGround = false
			if index == 1:
				attackUnit.attack = 75
				attackUnit.weaponsUp = 5
				attackUnit.attackMult = 1
				attackUnit.attackSpeed = 1.14
				attackUnit.hitAir = false
				attackUnit.hitGround = true
		"Battle Cruiser":
			match index:
				0:
					attackUnit.attack = UnitData.battlecruiser.attack
					attackUnit.attackSpeed = UnitData.battlecruiser.attackSpeed
					attackUnit.spell = false
				1:
					attackUnit.attack = 5
					attackUnit.attackSpeed = UnitData.battlecruiser.attackSpeed
					attackUnit.spell = false
				2:
					attackUnit.attack = 240
					attackUnit.attackSpeed = 2
					attackUnit.spell = true
		"Queen":
			if index == 0:
				attackUnit.attack = 4
				attackUnit.attackMult = 2
			else:
				attackUnit.attack = 9
				attackUnit.attackMult = 1
		"Ravager":
			if index == 0:
				attackUnit.attack = 16
				attackUnit.attackSpeed = 1.14
				attackUnit.spell = false
				attackUnit.hitAir = false
			else:
				attackUnit.attack = 60
				attackUnit.attackSpeed = 2.5
				attackUnit.spell = true
				attackUnit.hitAir = true



func _on_DModeChoice_item_selected(index):
	match defendUnit.type:
		"Egg":
			match index:
				0:
					defendUnit.health = 200
					defendUnit.armor = 10
					defendUnit.armorUp = 0
					defendUnit.tags.erase("massive")
					defendUnit.flying = false
				1: 
					defendUnit.health = 200
					defendUnit.armor = 2
					defendUnit.armorUp = 1
					defendUnit.tags.erase("massive")
					defendUnit.flying = true
				2:
					defendUnit.health = 50
					defendUnit.armor = 2
					defendUnit.armorUp = 1
					defendUnit.tags.erase("massive")
					defendUnit.flying = false
				3:
					defendUnit.health = 100
					defendUnit.armor = 5
					defendUnit.armorUp = 1
					defendUnit.tags.erase("massive")
					defendUnit.flying = false
				4:
					defendUnit.health = 100
					defendUnit.armor = 1
					defendUnit.armorUp = 1
					defendUnit.tags.erase("massive")
					defendUnit.flying = false
				5:
					defendUnit.health = 200
					defendUnit.armor = 2
					defendUnit.armorUp = 1
					defendUnit.tags.append("massive")
					defendUnit.flying = true

#---Signal Processing---#

func _on_AttackUpgrade_value_changed(value):
	attackboxUp = value



func _on_ArmorUpgrade_value_changed(value):
	armorboxUp = value



func _on_ShieldUpgrade_value_changed(value):
	shieldboxUp = value


func _on_GuardianShield_toggled(button_pressed):
	if button_pressed:
		defendUnit.armor += 2
		defendUnit.shieldArmor += 2
	if not button_pressed:
		defendUnit.armor -= 2
		defendUnit.shieldArmor -= 2

func _on_AntiArmor_toggled(button_pressed):
	if button_pressed:
		defendUnit.armor -= 3
		defendUnit.shieldArmor -= 3
	if not button_pressed:
		defendUnit.armor += 3
		defendUnit.shieldArmor += 3

func _on_InterceptorCount_value_changed(value):
	if attackUnit.type == "Carrier":
		attackUnit.attackMult = 2 * value

func _on_SplashZone_item_selected(index):
	match attackUnit.type:
		"Archon":
			attackUnit.applyModifier(index)
		"Ghost":
			match index:
				0: attackUnit.attack = UnitData.ghost.attack
				1: attackUnit.attack = UnitData.ghost.attack * .5
				2: attackUnit.attack = UnitData.ghost.attack * .25
		"Widowmine":
			match index:
				0: attackUnit.attack = UnitData.mine.attack
				1: attackUnit.attack = 40
		"Siege Tank":
			match index:
				0: 
					attackUnit.attack = UnitData.tank.attack
					attackUnit.bonusDmg = UnitData.tank.bonusDmg
					attackUnit.weaponsUp = UnitData.tank.weaponsUp
				1: 
					attackUnit.attack = UnitData.tank.attack * .5
					attackUnit.bonusDmg = UnitData.tank.bonusDmg * .5
					attackUnit.weaponsUp = UnitData.tank.weaponsUp * .5
				2: 
					attackUnit.attack = UnitData.tank.attack * .25
					attackUnit.bonusDmg = UnitData.tank.bonusDmg * .25
					attackUnit.weaponsUp = UnitData.tank.weaponsUp * .25
		"Planetary Fortress":
			match index:
				0: attackUnit.attack = UnitData.planetary.attack
				1: attackUnit.attack = UnitData.planetary.attack * .75
				2: attackUnit.attack = UnitData.planetary.attack * .375
		"Mutalisk":
			match index:
				0: 
					attackUnit.attack = UnitData.mutalisk.attack
					attackUnit.weaponsUp = UnitData.mutalisk.weaponsUp
				1: 
					attackUnit.attack = UnitData.mutalisk.attack * .33
					attackUnit.weaponsUp = UnitData.mutalisk.weaponsUp * .33
				2: 
					attackUnit.attack = UnitData.mutalisk.attack * .11
					attackUnit.weaponsUp = UnitData.mutalisk.weaponsUp * .11
		"Ultralisk":
			match index:
				0: 
					attackUnit.attack = UnitData.ultralisk.attack
					attackUnit.weaponsUp = UnitData.ultralisk.weaponsUp
				1: 
					attackUnit.attack = UnitData.ultralisk.attack * .33
					attackUnit.weaponsUp = UnitData.ultralisk.weaponsUp * .33


func _on_Healing_toggled(button_pressed):
	match defendUnit.faction:
		"terran":
			if button_pressed: healing = 12.6
			else: healing = 0
