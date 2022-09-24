extends OptionButton

var mainPop = get_popup()
var subProtoss = PopupMenu.new()
var subTerran = PopupMenu.new()
var subZerg = PopupMenu.new()
var subMenus = [subProtoss, subTerran, subZerg]

var protossUnits = ["Probe", "Zealot", "Stalker", "Sentry", "Adept", "High Templar",  "Dark Templar", "Archon", "Observer", "Warp Prism", "Immortal", "Colossus", "Disruptor", "Phoenix", "Void Ray", "Oracle", "Tempest", "Carrier", "Interceptor", "Mothership", "Photon Cannon", "Shield Battery"]
var terranUnits = ["SCV", "MULE", "Marine", "Marauder", "Reaper", "Ghost", "Hellion", "Hellbat", "Widowmine", "Cyclone", "Siege Tank", "Thor", "Viking", "Medivac", "Liberator", "Raven", "Banshee", "Battle Cruiser", "Planetary Fortress", "Missile Turret", "Bunker", "Auto Turret"]
var zergUnits = ["Larva", "Egg", "Drone", "Overlord", "Queen", "Zergling", "Baneling", "Roach", "Ravager", "Hydralisk", "Lurker", "Mutalisk", "Corruptor", "Swarm Host", "Locust", "Infestor", "Viper", "Ultralisk", "Broodlord", "Broodling", "Spine Scrawler", "Spore Crawler"]

func _ready():
	mainPop = get_popup()
	mainPop.set_submenu_popup_delay(0.05)
	#print(mainPop.get_h_size_flags())

	subProtoss.set_name("subProtoss")
	subTerran.set_name("subTerran")
	subZerg.set_name("subZerg")

	mainPop.add_item("Attacking Unit", 1000)
	mainPop.set_item_disabled(0, true)
	mainPop.add_separator()

	for i in subMenus:
		mainPop.add_child(i)
		i.allow_search = true
		i.set_h_size_flags(8)

	for i in range(0, protossUnits.size()):
		subProtoss.add_item(protossUnits[i], i + 101)

	for i in range(0, terranUnits.size()):
		subTerran.add_item(terranUnits[i], i + 201)

	for i in range(0, zergUnits.size()):
		subZerg.add_item(zergUnits[i], i + 301)

	mainPop.add_submenu_item("Protoss", "subProtoss")
	mainPop.add_submenu_item("Terran", "subTerran")
	mainPop.add_submenu_item("Zerg", "subZerg")

#the pains we go through to have submenus work with option buttons
	subProtoss.connect("id_pressed", self, "_on_id_pressed")
	subTerran.connect("id_pressed", self, "_on_id_pressed")
	subZerg.connect("id_pressed", self, "_on_id_pressed")


func _on_id_pressed(id): #on submenu button press
	var index
	var subX
	#check which submenu the click came from using unique IDs
	for i in range(0, subProtoss.get_item_count()):
		if subProtoss.get_item_id(i) == id:
			index = i
			subX = subProtoss
	for i in range(0, subTerran.get_item_count()):
		if subTerran.get_item_id(i) == id:
			index = i
			subX = subTerran
	for i in range(0, subZerg.get_item_count()):
		if subZerg.get_item_id(i) == id:
			index = i
			subX = subZerg

	#new mainPop entry is necessary for selector to display the text of the selection
	#i played with deleting the option, but that only worked if you deleted the option
	#when the user pressed the button to select another unit. If i do that, it deselects
	#it when you click the box again, which means you HAVE to select something new once you
	#click the optionbutton. As a result, i chose to place the unit at the top and have
	#it persist. I find it the best solution for aesthetics and practicality
	mainPop.set_item_text(0, subX.get_item_text(index))
	mainPop.set_item_id(0, id)

	#you can't select the same option twice, and it doesn't update the selected text
	#except on selection, so i have to "click off" then "click back on"
	select(1)
	select(0)
	#selecting through code does not automatically emit signal
	emit_signal("item_selected", 0)
