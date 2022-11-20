extends Control

#Current:
#Interface damage calc with new UI
# -better damage -> label interaface, maybe func returns array of strings or array of values?
#fix warning/info for
#add "custom" unit


#TODO:
#fix health regen on multi-part attacks (i.e. zealot -> zergling w/ +1)
#fix locust air/ground interaction
#add some kind of logic for broodling attack, since it'll usually attack twice the first time
#fix phoenix hitting ground
#does guardian shield .pressed(false) in func input affect unit stats?

#loaded bunker attack stats?
#supply structures, town halls, stasis ward, creep tumor, nydus, sensor tower
#Shield battery on defending unit toggle
#	-max +50.4 shields/s, max 3 per 1 energy, max 100 energy
#	-2x rate on overcharge, no energy limits, 14 seconds
#medivac healing? transfuse?
#
#BW units/BW "physics"
#possible "crazy mode" where anything can hit anything else
#comparisons/multiple upgrades tests/multiple windows
#dynamic window resizing that works properly?
#'custom unit' (i.e. text entry) mode


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
	OS.min_window_size = Vector2(550, 600)
	#OS.max_window_size = Vector2(max_x, max_y)
	aModeBox = $"%AModeChoice".get_popup()
	dModeBox = $"%DModeChoice".get_popup()
	sZoneBox = $"%SplashZone".get_popup()
	$"%InterceptorCount".get_line_edit().expand_to_text_length = true

func _input(_event):
	if attackUnit and defendUnit:
		if attackUnit.spell:
			$"%ToKillLabels".set_item_text(0, "Casts to Kill")
			$"%ToKillLabels".set_item_text(2, "Shield Break Casts")
		else:
			$"%ToKillLabels".set_item_text(0, "Shots to Kill")
			$"%ToKillLabels".set_item_text(2, "Shield Break Shots")

		if defendUnit.faction == "Protoss":
			$"%ShieldUpgrade".visible = true
			if attackUnit.attackRange > 1:
				$"%GuardianShield".visible = true
			else:
				$"%GuardianShield".visible = false
		else:
			$"%ShieldUpgrade".visible = false
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
		pass
			#$VBoxContainer2/HBoxContainer.visible = false


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


func _on_AttackUnit_item_selected(_index):
	#Garbage  collection
	if attackUnit:
		attackUnit.queue_free()
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
	attackUnit = UnitData.unitCode[attackUnit].new()

	#Per unit logic
	if defendUnit and defendUnit.faction == "Protoss" and attackUnit.attackRange > 1:
		$"%GuardianShield".visible = true
	else:
		$"%GuardianShield".visible = false
		$"%GuardianShield".pressed = false

	if attackUnit.faction == "Terran":
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
	if defendUnit:
		defendUnit.queue_free()
	$"%DefenderModifier".pressed = false
	$"%DefenderModifier".visible = false
	$"%DefenderModifier".pressed = false
	$"%DModeChoice".visible = false
	defendUnit = $"%DefendUnit".get_selected_id()
	defendUnit = UnitData.unitCode[defendUnit].new()

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
	if attackUnit: attackUnit.applyUpgrade(button_pressed)

#---Toggles---#
func _on_DefenderModifier_toggled(button_pressed):
	if defendUnit: defendUnit.applyUpgrade(button_pressed)

func _on_AModeChoice_item_selected(index):
	attackUnit.changeWeapon(index)

func _on_DModeChoice_item_selected(index):
	defendUnit.applyModifier(index)

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

func _on_Healing_toggled(button_pressed):
	match defendUnit.faction:
		"terran":
			if button_pressed: healing = 12.6
			else: healing = 0


#---Spin Boxes---#
func _on_InterceptorCount_value_changed(value):
	if attackUnit.type == "Carrier":
		attackUnit.applyModifier(value)

func _on_SplashZone_item_selected(index):
	attackUnit.applyModifier(index)

func _on_AttackUpgrade_value_changed(value):
	attackboxUp = value

func _on_ArmorUpgrade_value_changed(value):
	armorboxUp = value

func _on_ShieldUpgrade_value_changed(value):
	shieldboxUp = value


