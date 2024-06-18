-- ==================================================== --
--        Borrowed from Occupations Expertises          --
--                 Credit: Onkeen                       --
-- ==================================================== --

--- requires
require('NPCs/MainCreationMethods');

--- Create new traits
local function initOETraits()

    --- add new traits

    -- Sample trait--occupation (probably?)
    -- local sample = TraitFactory.addTrait("sample", getText("UI_Text_Sample"), 0, getText("UI_Text_Sampledesc"), true);
    local chemiststudent = TraitFactory.addTrait("chemiststudent", getText("UI_Text_ChemStudent"), 3, getText("UI_Text_ChemStudentdesc"), false);
    chemiststudent:addXPBoost(Perks.Biochemistry, 1);
    chemiststudent:getFreeRecipes():add("Make Glue");
    chemiststudent:getFreeRecipes():add("Make Wood Glue");
    chemiststudent:getFreeRecipes():add("Condense Gliceryn");
    chemiststudent:getFreeRecipes():add("Make Plaster Powder");
    chemiststudent:getFreeRecipes():add("Make Concrete Powder");
    chemiststudent:getFreeRecipes():add("Make Fertilizer");

    local chemistlabtech = TraitFactory.addTrait("chemistlabtech", getText("UI_Text_chemistlabtech"), 5, getText("UI_Text_chemistlabtechdesc"), false);
    chemistlabtech:addXPBoost(Perks.Biochemistry, 1);
    chemistlabtech:addXPBoost(Perks.MetalWelding, 1);
    chemistlabtech:getFreeRecipes():add("Cast Distiller");
    chemistlabtech:getFreeRecipes():add("Cast Industrial Press");
    chemistlabtech:getFreeRecipes():add("Cast Condenser");
    chemistlabtech:getFreeRecipes():add("Cast Mixer");
    chemistlabtech:getFreeRecipes():add("Cast and Fill Sulfuric Barrel");
    chemistlabtech:getFreeRecipes():add("Improvise Bunsen Burner");


    local chemmed = TraitFactory.addTrait("chemmed", getText("UI_Text_chemmed"), 6, getText("UI_Text_chemmeddesc"), false);
    chemmed:addXPBoost(Perks.Biochemistry, 1);
    chemmed:addXPBoost(Perks.Doctor, 1);
    chemmed:getFreeRecipes():add("Condense Disinfectant");
    chemmed:getFreeRecipes():add("Condense Antiviral");
    chemmed:getFreeRecipes():add("Make Energy Drink");
    chemmed:getFreeRecipes():add("Make Ephedrine");
    chemmed:getFreeRecipes():add("Make Analgesic Powder");
    chemmed:getFreeRecipes():add("Make Painkillers");
    chemmed:getFreeRecipes():add("Make Antiobiotics");
    chemmed:getFreeRecipes():add("Make Benzene");
    chemmed:getFreeRecipes():add("Condense Benzene");
    chemmed:getFreeRecipes():add("Synthesize Candy Pills");
    if getActivatedMods():contains("BiochemistryEdits") then
        chemmed:getFreeRecipes():add("Make Beta Blockers");       
    end
    if not getActivatedMods():contains("BiochemistryEdits") then    
        chemmed:getFreeRecipes():add("Powdered Sleeping Tablets");      
    end

        

    local chemmaster = TraitFactory.addTrait("chemmaster", getText("UI_Text_chemmaster"), 0, getText("UI_Text_chemmasterdesc"), true);
    chemmaster:getFreeRecipes():add("Make Glue");
    chemmaster:getFreeRecipes():add("Make Wood Glue");
    chemmaster:getFreeRecipes():add("Condense Gliceryn");
    chemmaster:getFreeRecipes():add("Make Plaster Powder");
    chemmaster:getFreeRecipes():add("Make Concrete Powder");
    chemmaster:getFreeRecipes():add("Make Fertilizer");
    chemmaster:getFreeRecipes():add("Distill Corn Oil");
    chemmaster:getFreeRecipes():add("Distill Bleach");
    chemmaster:getFreeRecipes():add("Distill Vinegar");
    chemmaster:getFreeRecipes():add("Distill Cleaning Liquid");
    chemmaster:getFreeRecipes():add("Distill Petrol");
    chemmaster:getFreeRecipes():add("Electrolysis Ethanol");
    chemmaster:getFreeRecipes():add("Condense Disinfectant");
    chemmaster:getFreeRecipes():add("Condense Propane Gas");
    chemmaster:getFreeRecipes():add("Condense Antiviral");
    chemmaster:getFreeRecipes():add("Make Energy Drink");
    chemmaster:getFreeRecipes():add("Compress Propane Gas");
--  chemmaster:getFreeRecipes():add("Make Toxic Bomb");
    chemmaster:getFreeRecipes():add("Make Ephedrine");
    chemmaster:getFreeRecipes():add("Make Dead Eye");
    chemmaster:getFreeRecipes():add("Make Fluorhidric Acid");
    chemmaster:getFreeRecipes():add("Make Analgesic Powder");
    chemmaster:getFreeRecipes():add("Make Painkillers");
    chemmaster:getFreeRecipes():add("Make Antiobiotics");
    chemmaster:getFreeRecipes():add("Make Benzene");
    chemmaster:getFreeRecipes():add("Condense Benzene");
--  chemmaster:getFreeRecipes():add("Make Fire Bomb");
    chemmaster:getFreeRecipes():add("Synthesize Candy Pills");
    chemmaster:getFreeRecipes():add("Make Heracles Drug");
    if getActivatedMods():contains("BiochemistryEdits") then
        chemmaster:getFreeRecipes():add("Distill Petrol in Bottle");
        chemmaster:getFreeRecipes():add("Make Gunpowder");
        chemmaster:getFreeRecipes():add("Make Beta Blockers");       
    end
    if not getActivatedMods():contains("BiochemistryEdits") then    
        chemmaster:getFreeRecipes():add("Powdered Sleeping Tablets");
    end 

    -- Exclusives
    -- x shouldn't show up on characters with this trait
    TraitFactory.setMutualExclusive("chemiststudent", "chemmaster");
    TraitFactory.setMutualExclusive("chemmed", "chemmaster");
    if getActivatedMods():contains("ProjectProfessions") then    
      TraitFactory.setMutualExclusive("chemiststudent", "Illiterate");
      TraitFactory.setMutualExclusive("chemmed", "Illiterate");
    end
    --- finish up traits list (not sure what this does)



    TraitFactory.sortList();
end

--Not sure what this does
local function OE_isTraitInList(traitsList, traitName)
    -- If traits list is empty, trait is not in it.
    if traitsList:size() == 0 then
        return false;
    end
    -- Search for trait in list.
    local trait = TraitFactory.getTrait(traitName)
    if traitsList:contains(trait:getType()) then
        return true;
    else
        return false;
    end
end

--- UPDATED PROFESSIONS

local function initOEProf()

--give sample trait to burger flipper

    -- BURGER FLIPPER
    
 --   local burgerflipper = ProfessionFactory.getProfession('burgerflipper');
 --    if not OE_isTraitInList(burgerflipper:getFreeTraits(), "sample") then
 --       burgerflipper:addFreeTrait("sample");
 --    end
         
 --    BaseGameCharacterDetails.SetProfessionDescription(burgerflipper);

--  CHEF
--  Cooking is Chemistry

    local chef = ProfessionFactory.getProfession('chef');
--  Yes, a bit redundant
    if getActivatedMods():contains("BioChemistryLife") then    
        chef:addXPBoost(Perks.Biochemistry, 1);
    end 
--    BaseGameCharacterDetails.SetProfessionDescription(chef);

--  DOCTOR
--  Doctors study chemistry

    local doctor = ProfessionFactory.getProfession('doctor');
    if getActivatedMods():contains("BioChemistryLife") then    
        doctor:addXPBoost(Perks.Biochemistry, 2);
    end 
--    BaseGameCharacterDetails.SetProfessionDescription(doctor);

--  ENGINEER
--  Engineers have to know some 

    local engineer = ProfessionFactory.getProfession('engineer');
    if getActivatedMods():contains("BioChemistryLife") then    
        engineer:addXPBoost(Perks.Biochemistry, 1);
        engineer:getFreeRecipes():add("Cast Industrial Press");
        engineer:getFreeRecipes():add("Cast Condenser");
        engineer:getFreeRecipes():add("Cast Mixer");
        engineer:getFreeRecipes():add("Improvise Bunsen Burner");
        engineer:getFreeRecipes():add("Cast and Fill Sulfuric Barrel");
        engineer:getFreeRecipes():add("Electrolysis Ethanol");
        engineer:getFreeRecipes():add("Compress Propane Gas");
        engineer:getFreeRecipes():add("Condense Benzene");
        engineer:getFreeRecipes():add("Make Benzene");
        engineer:getFreeRecipes():add("Make Toxic Bomb");
        engineer:getFreeRecipes():add("Make Fire Bomb");
    end 
--    BaseGameCharacterDetails.SetProfessionDescription(engineer);

--  NURSE
--  Nurses study some chemistry

    local nurse = ProfessionFactory.getProfession('nurse');
    if getActivatedMods():contains("BioChemistryLife") then    
        nurse:addXPBoost(Perks.Biochemistry, 1);
    end 
--    BaseGameCharacterDetails.SetProfessionDescription(nurse);

--  NEW OCCUPATIONS --
--  CHEMIST
--  Vanilla version (non-SOTO, not PP)
    if (not getActivatedMods():contains("SimpleOverhaulTraitsAndOccupations")) and (not getActivatedMods():contains("ProjectProfessions")) then    

        local chemist = ProfessionFactory.addProfession("chemist", getText("UI_prof_chemist"), "icon_chemist", 4, getText("UI_profdesc_chemist"))
        chemist:addXPBoost(Perks.Biochemistry, 3)
        chemist:addFreeTrait("chemmaster");
    end 
--  SOTO version
    if getActivatedMods():contains("SimpleOverhaulTraitsAndOccupations") then    
        local chemist = ProfessionFactory.addProfession("chemist", getText("UI_prof_chemist"), "icon_chemist", 6, getText("UI_profdesc_chemist"))
        chemist:addXPBoost(Perks.Biochemistry, 4)
        chemist:addFreeTrait("chemmaster");
     end 

--  PP version
    if getActivatedMods():contains("ProjectProfessions") then    
        local chemist = ProfessionFactory.addProfession("chemist", getText("UI_prof_chemist"), "icon_chemist", 8, getText("UI_profdesc_chemist"))
        chemist:addXPBoost(Perks.Biochemistry, 4)       
        chemist:addFreeTrait("literateprof")         
        chemist:addFreeTrait("chemmaster");       
    end 

    local profList = ProfessionFactory.getProfessions()
        for i=1,profList:size() do
            local prof = profList:get(i-1)
--            BaseGameCharacterDetails.SetProfessionDescription(prof)
        end
    
end

-- If I want to change trait costs
local sourceAddTrait = TraitFactory.addTrait
function TraitFactory.addTrait(name, trans, cost, ...)
    local TRAIT_COST = {
--        Athletic = 12,
--        WeakStomach = -1,
--        ["Out of Shape"] = -6,
    }
    local new_cost = TRAIT_COST[name]
    if new_cost then
        cost = new_cost
    end
    return sourceAddTrait(name, trans, cost, ...)
end

-- Old ways of adding traits / proffessions that did not work with server
-- Events.OnGameBoot.Add(initOccupationsExpertisesTraits);
-- Events.OnGameBoot.Add(initOccupationsExpertisesProfessions);
-- Events.OnCreateSurvivor.Add(initOccupationsExpertisesTraits);

Events.OnGameBoot.Add(initOETraits);
Events.OnGameBoot.Add(initOEProf);
Events.OnCreateLivingCharacter.Add(initOEProf);
--Events.OnCreateLivingCharacter.Add(initOEProf);

--adding traits at world creation (I think)
function manageOccupationExpertiseTraits(player)
    
    if player then
        -- Add slacker trait on character init to avoid game crash when unemployed has trait and preset is reloaded
 --       if player:getDescriptor():getProfession() == "unemployed" and not (player:HasTrait("slacker")) then
--            player:getTraits():add("slacker")
 --       end

        -- Add traits to occupations that lacks them

 --       if player:getDescriptor():getProfession() == "securityguard" and not (player:HasTrait("shakeitoff")) then
 --           player:getTraits():add("shakeitoff")
 --       end

        -- Add recipes to occupations with traits that lacks them

--        if player:HasTrait("firearmstechnician") then
--            if not player:getKnownRecipes():contains("Restore Handgun to Full Condition") then
--                player:getKnownRecipes():add("Restore Handgun to Full Condition");
--            end
--            if not player:getKnownRecipes():contains("Restore Shotgun to Full Condition") then
--                player:getKnownRecipes():add("Restore Shotgun to Full Condition");
--            end
--            if player:HasTrait("Outdoorsman2") then
--                player:getTraits():remove("Outdoorsman2");
--                player:getTraits():add("Outdoorsman");
--            end
--        end
    end

end

--
function onNewGameSlacker(survivorDesc)
    manageOccupationExpertiseTraits(getPlayer())
end


local function onCreatePlayerSlacker(playerIndex, player)
    manageOccupationExpertiseTraits(player)
end

-- Backward compatibility with old versions of this mod
function giveNewRecipesToOldProfessions(player, square)
    manageOccupationExpertiseTraits(player)
end

Events.OnNewGame.Add(onNewGameSlacker);
Events.OnCreatePlayer.Add(onCreatePlayerSlacker);
Events.OnGameStart.Add(giveNewRecipesToOldProfessions);
