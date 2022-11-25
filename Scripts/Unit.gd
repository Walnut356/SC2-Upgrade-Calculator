extends Node

export var type:String
export var faction:String
export var tags:Array
export var cost:Array
export var flying:bool

export var health:float
export var shields:float
export var armor:float
export var shieldArmor:float

export var moveSpeed:float
"""
var turnRate:float
var acceleration:float
var buildColl:float
var unitColl:float
var buildTime:int(?)
"""

export var canAttack:bool
export var spell:bool
export var hitGround:bool
export var hitAir:bool
export var attackRange:float

export var attack:float
export var attackSpeed:float
export var attackMult:int
export var bonusDmg:float
export var bonusUp:float
export var bonusVs:String
export var weaponsUp:float
export var armorUp:float
export var shieldUp:float

func applyUpgrade(b:bool):
	pass

func changeWeapon(att:int):
	pass

func applyModifier(mod:int):
	pass

#func _init():
#	self.type = ""
#	self.faction = ""
#	self.tags = []
#	self.cost = []
#	self.flying = false
#	self.health = 0
#	self.shields = 0
#	self.armor = 0
#	self.shieldArmor = 0
#	self.moveSpeed = 0
#	self.canAttack = false
#	self.spell = false
#	self.hitGround = false
#	self.hitAir = false
#	self.attackRange = 0
#	self.attack = 0
#	self.attackSpeed = 0.0
#	self.attackMult = 0
#	self.bonusDmg = 0
#	self.bonusUp = 0
#	self.bonusVs = ""
#	self.weaponsUp = 0
#	self.armorUp = 0
#	self.shieldUp = 0
#
#"""func _init(type, faction, tags, cost, flying, health, shields, armor, shieldArmor, moveSpeed, spell, canAttack, canHitGround, canHitAir, attackRange, attack, attackSpeed, attackMult, bonusDmg, bonusUp, bonusVs, weaponsUp, armorUp, shieldUp):
#	self.type = type
#	self.faction = faction
#	self.tags = tags
#	self.cost = cost
#	self.flying = flying
#	self.health = health
#	self.shields = shields
#	self.armor = armor
#	self.shieldArmor = shieldArmor
#	self.moveSpeed = moveSpeed
#	self.canAttack = canAttack
#	self.spell = spell
#	self.hitGround = hitGround
#	self.hitAir = hitAir
#	self.attackRange = attackRange
#	self.attack = attack
#	self.attackSpeed = attackSpeed
#	self.attackMult = attackMult
#	self.bonusDmg = bonusDmg
#	self.bonusUp = bonusUp
#	self.bonusVs = bonusVs
#	self.weaponsUp = weaponsUp
#	self.armorUp = armorUp
#	self.shieldUp = shieldUp
#
#	var turnRate:float
#	var acceleration:float
#	var buildColl:float
#	var unitColl:float
#	var buildTime:int(?)
#	"""


