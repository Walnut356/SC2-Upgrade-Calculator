from math import ceil

#protoss units, numbers imply glaives upgrade researched
zealot = {"name" : "stalker", "faction" : "protoss",
"health" : 80, "shields" : 80, "armor" : 1, "armorup" : 1, "shieldarmor" : 0, "shieldup" : 1,
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

def DamageCalc(attacker, defender, unitFile):
    unitFile.write(f'{attacker["name"]} attacking {defender["name"]}\n---\n')
    health = defender["health"]
    armor = defender["armor"]
    armorup = defender["armorup"]

    attack = attacker["attack"]
    attackmult = attacker["attackmult"]
    weaponsup = attacker["weaponsup"]
    bonusdmg = attacker["bonusdmg"]
    bonusup = 0
    if attacker["bonusvs"] in defender["tags"]:
        attack += bonusdmg
        bonusup = attacker["bonusup"]
    attackspeed = attacker["attackspeed"]
    
    shotsToKill = 0
       
    if defender["faction"] == "protoss": 
        shieldarmor = defender["shieldarmor"]
        shieldup = defender["shieldup"]
        for i in range(0,4):
            for j in range(0,4):
                for k in range (0,4):
                    shotsToKill = 0
                    shields = defender["shields"]
                    health = defender["health"]
                    Dmg = (attack + (weaponsup * i) + (bonusup * i))
                    healthDmg = max([(Dmg - (armor + (armorup * j))), .5])
                    shieldDmg = max([(Dmg - (shieldarmor + (shieldup * k))), .5])
                    
                    while shields > 0:
                        shields -= shieldDmg
                        shotsToKill += 1
                            
                    health -= (shields * -1) - (armor + armorup)
                    
                    while health > 0:
                        health -= healthDmg
                        shotsToKill += 1
                    unitFile.write(f'+{i} att vs +{j} arm/+{k} sh:\t')
                    unitFile.write(f'{ceil(shotsToKill/attackmult)} shots | {round(ceil(shotsToKill/attackmult) * attackspeed, 3)}sec\n')
                unitFile.write("---\n")
            unitFile.write("---\n")
                    
    else:
        for i in range(0,4):
            for j in range(0,4):
                shotsToKill = 0
                health = defender["health"]
                Dmg = max([(attack + (weaponsup * i) + (bonusup * i)), .5])
                healthDmg = max([(Dmg - (armor + (armorup * j))), .5])
                    
                while health > 0:
                    health -= healthDmg
                    shotsToKill += 1
                    if defender["faction"] == "zerg":
                        health += .38 * attackspeed
                

                unitFile.write(f'+{i} att vs +{j} arm:     \t')
                unitFile.write(f'{ceil(shotsToKill/attackmult)} shots | {round(ceil(shotsToKill/attackmult) * attackspeed, 3)}sec\n')
            unitFile.write("---\n")
        unitFile.write("---\n")


                 
units = [zealot, stalker, adept, archon, immortal, colossus, cannon, 
         marine, marauder, reaper, ghost, hellion, hellbat, siegedtank, tank, thor, 
         zergling, baneling, roach, ravager, queen, hydralisk, lurker, ultralisk, spinecrawler]             


for unit in units:
    unitFile = open(f'.\datasheets\{unit["name"]} - attacking.txt', 'a')
    for unit2 in units:
        DamageCalc(unit, unit2, unitFile)
    unitFile.close()

for unit in units:
    unitFile = open(f'.\datasheets\{unit["name"]} - defending.txt', 'a')
    for unit2 in units:
        DamageCalc(unit2, unit, unitFile)
    unitFile.close()