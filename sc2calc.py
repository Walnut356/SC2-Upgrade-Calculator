from math import ceil

#Simple calculator for shots/time to kill for starcraft 2 units 
#check faction comments for assumed upgrades
#zerg innate regen factored in.

#protoss units, numbers imply glaives upgrade researched
zealot = {"name" : "zealot", "faction" : "protoss",
"health" : 100, "shields" : 50, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 8, "attackspeed" : .86, "attackmult" : 2, "weaponsup" : 1, 
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological"]}

stalker = {"name" : "stalker", "faction" : "protoss",
"health" : 80, "shields" : 80, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 13, "attackspeed" : 1.34, "attackmult" : 1, "weaponsup" : 1, 
"bonusvs" : "armored", "bonusdmg" : 5, "bonusup" : 1, 
"tags" : ["armored", "mechanical"]}

adept = {"name" : "adept", "faction" : "protoss",
"health" : 70, "shields" : 70, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 10, "attackspeed" : 1.11, "attackmult" : 1, "weaponsup" : 1, 
"bonusvs" : "light", "bonusdmg" : 12, "bonusup" : 1, 
"tags" : ["light", "biological"]}

archon = {"name" : "archon", "faction" : "protoss",
"health" : 10, "shields" : 350, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 25, "attackspeed" : 1.25, "attackmult" : 1, "weaponsup" : 3, 
"bonusvs" : "biological", "bonusdmg" : 10, "bonusup" : 1, 
"tags" : ["psionic", "massive"]}

immortal = {"name" : "immortal", "faction" : "protoss",
"health" : 200, "shields" : 100, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 20, "attackspeed" : 1.04, "attackmult" : 1, "weaponsup" : 2, 
"bonusvs" : "armored", "bonusdmg" : 30, "bonusup" : 3, 
"tags" : ["armored", "mechanical"]}

colossus = {"name" : "colossus", "faction" : "protoss",
"health" : 200, "shields" : 150, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 10, "attackspeed" : 1.07, "attackmult" : 2, "weaponsup" : 1, 
"bonusvs" : "light", "bonusdmg" : 5, "bonusup" : 1, 
"tags" : ["armored", "massive", "mechanical"]}

cannon = {"name" : "cannon", "faction" : "protoss",
"health" : 150, "shields" : 150, "armor" : 1, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 1,
"attack" : 20, "attackspeed" : .89, "attackmult" : 1, "weaponsup" : 0, 
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "structure"]}


#terran units, damage numbers imply always stimmed & blueflame when applicable
marine = {"name" : "marine", "faction" : "terran", 
"health" : 55, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 6, "attackspeed" : .407, "attackmult" : 1, "weaponsup" : 1, 
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological"]}

marauder = {"name" : "marauder", "faction" : "terran", 
"health" : 125, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 10, "attackspeed" : .71, "attackmult" : 1, "weaponsup" : 1, 
"bonusvs" : "armored", "bonusdmg" : 10, "bonusup" : 1, 
"tags" : ["armored", "biological"]}

reaper = {"name" : "reaper", "faction" : "terran", 
"health" : 60, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 4, "attackspeed" : .79, "attackmult" : 2, "weaponsup" : 1, 
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological"]}

ghost = {"name" : "ghost", "faction" : "terran", 
"health" : 100, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 10, "attackspeed" : 1.07, "attackmult" : 1, "weaponsup" : 1, 
"bonusvs" : "light", "bonusdmg" : 10, "bonusup" : 1, 
"tags" : ["psionic", "biological"]}

hellion = {"name" : "hellion", "faction" : "terran", 
"health" : 90, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 8, "attackspeed" : 1.79, "attackmult" : 1, "weaponsup" : 1, 
"bonusvs" : "light", "bonusdmg" : 11, "bonusup" : 1, 
"tags" : ["light", "mechanical"]}

hellbat = {"name" : "hellbat", "faction" : "terran", 
"health" : 135, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 18, "attackspeed" : 1.43, "attackmult" : 1, "weaponsup" : 2, 
"bonusvs" : "light", "bonusdmg" : 12, "bonusup" : 1, 
"tags" : ["mechanical", "light", "biological"]}

siegedtank = {"name" : "siegedtank", "faction" : "terran", 
"health" : 175, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 40, "attackspeed" : 2.14, "attackmult" : 1, "weaponsup" : 4, 
"bonusvs" : "armored", "bonusdmg" : 30, "bonusup" : 1, 
"tags" : ["armored", "mechanical"]}

tank = {"name" : "tank", "faction" : "terran", 
"health" : 175, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 15, "attackspeed" : .74, "attackmult" : 1, "weaponsup" : 2, 
"bonusvs" : "armored", "bonusdmg" : 10, "bonusup" : 1, 
"tags" : ["armored", "mechanical"]}

thor = {"name" : "thor", "faction" : "terran", 
"health" : 400, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 30, "attackspeed" : .91, "attackmult" : 2, "weaponsup" : 3, 
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "mechanical", "massive"]}

#zerg units, banes are assumed to have centrifugal hooks (bonus hp) ultralisks are assumed to have plating
zergling = {"name" : "zergling", "faction" : "zerg", 
"health" : 35, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 5, "attackspeed" : .497, "attackmult" : 1, "weaponsup" : 1,
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological"]}

baneling = {"name" : "baneling", "faction" : "zerg", 
"health" : 35, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 16, "attackspeed" : .01, "attackmult" : 1, "weaponsup" : 2,
"bonusvs" : "light", "bonusdmg" : 19, "bonusup" : 2, 
"tags" : ["biological"]}

roach = {"name" : "roach", "faction" : "zerg", 
"health" : 145, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 16, "attackspeed" : 1.43, "attackmult" : 1, "weaponsup" : 2,
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "biological"]}

ravager = {"name" : "ravager", "faction" : "zerg", 
"health" : 120, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 16, "attackspeed" : 1.14, "attackmult" : 1, "weaponsup" : 2,
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["biological"]} 

hydralisk = {"name" : "hydralisk", "faction" : "zerg", 
"health" : 90, "shields" : 0, "armor" : 0, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 12, "attackspeed" : .59, "attackmult" : 1, "weaponsup" : 1,
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["light", "biological"]}

queen = {"name" : "queen", "faction" : "zerg", 
"health" : 175, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 4, "attackspeed" : .71, "attackmult" : 2, "weaponsup" : 1,
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["psionic", "biological"]}

lurker = {"name" : "lurker", "faction" : "zerg", 
"health" : 200, "shields" : 0, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 20, "attackspeed" : 1.43, "attackmult" : 1, "weaponsup" : 2,
"bonusvs" : "armored", "bonusdmg" : 10, "bonusup" : 1, 
"tags" : ["armored", "biological"]}

ultralisk = {"name" : "ultralisk", "faction" : "zerg", 
"health" : 500, "shields" : 0, "armor" : 4, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 35, "attackspeed" : .61, "attackmult" : 1, "weaponsup" : 3,
"bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, 
"tags" : ["armored", "biological", "massive"]}

spinecrawler = {"name" : "spinecrawler", "faction" : "zerg", 
"health" : 300, "shields" : 0, "armor" : 2, "armorup" : 0, "shieldarmor" : 0, "shieldup" : 0,
"attack" : 25, "attackspeed" : 1.32, "attackmult" : 1, "weaponsup" : 0,
"bonusvs" : "armored", "bonusdmg" : 5, "bonusup" : 0, 
"tags" : ["light", "biological"]}

units = [zealot, stalker, adept, archon, immortal, colossus, cannon, 
         marine, marauder, reaper, ghost, hellion, hellbat, siegedtank, tank, thor, 
         zergling, baneling, roach, ravager, queen, hydralisk, lurker, ultralisk, spinecrawler] 
#for convenience
protossUnits = [zealot, stalker, adept, archon, immortal, colossus]

terranUnits = [marine, marauder]

zergUnits = [zergling, baneling, roach, ravager, queen, hydralisk, lurker]


#TODO add damage_stats object w/ initializer of DamageCalc()
#split DamageCalc into StatsCalc() and ToKillCount()

def DamageCalc(attacker, defender, plusW, plusA, plusS):
    #print(f'{attacker["name"]} -> {defender["name"]}')
    health = defender["health"]
    armor = defender["armor"]
    armorUp = defender["armorup"]

    attack = attacker["attack"]
    attackMult = attacker["attackmult"]
    weaponsUp = attacker["weaponsup"]
    bonusDmg = attacker["bonusdmg"]
    bonusUp = 0
    if attacker["bonusvs"] in defender["tags"]:
        attack += bonusDmg
        bonusUp = attacker["bonusup"]
    attackSpeed = attacker["attackspeed"]
    
    shotsToKill = 0

    shotTotals = {"Shots to Kill" : 0, "Time to Kill" : 0}
    
    health = defender["health"]
    Dmg = (attack + (weaponsUp * plusW) + (bonusUp * plusW))
    healthDmg = max([(Dmg - (armor + (armorUp * plusA))), .5])
    
    if defender["faction"] == "protoss":
        #protoss defender
        shieldUp = defender["shieldup"]
        shieldArmor = defender["shieldarmor"]
        health = defender["health"]
        shields = defender["shields"]
        shieldDmg = max([(Dmg - (shieldArmor + (shieldUp * plusS))), .5])
        while shields > 0:
            shields -= shieldDmg
            shotsToKill += 1

        shotTotals["Shots to Break Shield"] = (ceil(shotsToKill/attackMult))
        shotTotals["Time to Shield Break"] = (round(ceil(shotsToKill/attackMult) * attackSpeed, 3))

        health -= (shields * -1) - (armor + (armorUp * plusA))

        while health > 0:
            health -= healthDmg
            shotsToKill += 1
            
        shotTotals["Shots to Kill"] = (ceil(shotsToKill/attackMult))
        shotTotals["Time to Kill"] = (round(ceil(shotsToKill/attackMult) * attackSpeed, 3))
                
    else:
        #non-protoss defender
        while health > 0:
            health -= healthDmg
            shotsToKill += 1
            if defender["faction"] == "zerg": #zerg inherent regen, universal aside from muta
                health += .38 * attackSpeed
                
        shotTotals["Shots to Kill"] = (ceil(shotsToKill/attackMult))
        shotTotals["Time to Kill"] = (round(ceil(shotsToKill/attackMult) * attackSpeed, 3))

    

    return shotTotals



def loopMain():
    #Input & validation
    unit1 = input("Attacking unit: ").lower()
    unit1 = next((i for i in units if i["name"] == unit1), False)
    while unit1 == False:
        unit1 = input("That is not a valid unit name. Please try again: ").lower()
        unit1 = next((i for i in units if i["name"] == unit1), False)
        
    unit2 = input("Defending unit: ").lower()
    unit2 = next((i for i in units if i["name"] == unit2), False)
    while unit2 == False:
        unit2 = input("That is not a valid unit name. Please try again: ").lower()
        unit2 = next((i for i in units if i["name"] == unit2), False)

    
    plusW = input("Attack upgrade: ")
    while True:
        if plusW.isnumeric():
            if int(plusW) > 0 or int(plusW) < 3:
                break   
        plusW = input("Valid upgrade values are between 0 and 3 inclusive. Please try again: ")
    plusW = int(plusW)
        
    plusA = input("Armor upgrade: ")
    while True:
        if plusA.isnumeric():
            if int(plusA) > 0 or int(plusA) < 3:
                break    
        plusA = input("Valid upgrade values are between 0 and 3 inclusive. Please try again: ")
            
    plusA = int(plusA)
    
    if unit2["faction"] == "protoss":
        plusS = input("Shield upgrade: ")
        while True:
            if plusS.isnumeric():
                if int(plusS) > 0 or int(plusS) < 3:
                    break   
            plusS = input("Valid upgrade values are between 0 and 3 inclusive. Please try again: ")
        
        plusS = int(plusS)
        
        print(f'---\n+{plusW} weapons {unit1["name"]} attacking +{plusA} armor/+{plusS} shields {unit2["name"]}')
    
    else:
        plusS = 0
        print(f'--\n+{plusW} weapons {unit1["name"]} attacking +{plusA} armor {unit2["name"]}')
    
    killStats = DamageCalc(unit1, unit2, plusW, plusA, plusS)
    
    print(killStats)
    print("---\n")

    loopCheck = input("Would you like to continue? (y/n): ")
    if loopCheck == "y":
        loopCheck = True
    elif loopCheck == "n":
        loopCheck = False
    else:
        while loopCheck != ("y" or "n"):
            loopCheck = input("Would you like to continue? (y/n): ")
    print("\n---\n")
    return loopCheck

while loopMain():
    pass
