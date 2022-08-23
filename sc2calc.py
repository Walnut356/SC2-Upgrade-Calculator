


zealot = {"faction" : "protoss", "health" : 100, "shields" : 50, "armor" : 1, "shieldarmor" : 0, "shieldup" : 0, "attack" : 8, "attackspeed" : .86, "attackmult" : 2, "weaponsup" : 1, "armorup" : 1, "bonusvs" : "", "bonusdmg" : 0, "bonusup" : 0, "tags" : ["light", "biological"]}
stalker = {"faction" : "protoss", }
adept = {"faction" : "protoss", }
archon = {"faction" : "protoss", }
immortal = {"faction" : "protoss", }
colossus = {"faction" : "protoss", }
cannon = {"faction" : "protoss", }

marine = []
marauder = []
reaper = []
ghost = []
hellion = []
hellbat = []
siegedtank = []
tank = []
thor = []

zergling = []
baneling = []
roach = []
ravager = [] 
hydralisk = []
lurker = []
ultralisk = []

def DamageCalc(attacker, defender):
    if defender["faction"] == "protoss":
        shields = defender["shields"]
        shieldarmor = defender["shieldarmor"]
        shieldup = defender["shieldup"]
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
    attackSpeed = attacker["attackspeed"]
        
    shotsToKill = 0

    for i in range(0,4):
        for j in range(0,4):
            for k in range (0,4):
                Dmg = (attack + (weaponsup * i) + (bonusup * i))
                if defender["faction"] == "protoss":
                    shieldDmg = Dmg - (shieldarmor + (shieldup * k))
                shieldDmg *= attackmult
                
                
                
                
                while shields > 0:
                    shields -= shieldDmg
                    shotsToKill += 1
                health -= (shields * -1) - (armor + armorup)
                
                while health > 0:
                    health -= 
                 
                
    
DamageCalc(zealot, zealot)