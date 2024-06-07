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
    local sample = TraitFactory.addTrait("sample", getText("UI_Text_Sample"), 0, getText("UI_Text_Sampledesc"), true);

    --Exclusives
    --outdoorsman shouldn't show up on characters with this trait
    TraitFactory.setMutualExclusive("Outdoorsman", "sample");

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

--- Update Professions
local function initOEProf()

--give sample trait to burger flipper

    -- BURGER FLIPPER
    
    local burgerflipper = ProfessionFactory.getProfession('burgerflipper');
          burgerflipper:addFreeTrait("sample")
    BaseGameCharacterDetails.SetProfessionDescription(burgerflipper);


--  This is where I would replace pseudo traits with the actual traits (I think)
    local profList = ProfessionFactory.getProfessions()
    for i=1,profList:size() do
        local prof = profList:get(i-1)
        if prof:getType() == "unemployed" then
            prof:setDescription(getText("UI_profdesc_unemployed") .. "\nCan slack off on a chair, couch or bed to reduce boredom.\nSlacker trait will appear in game after character creation.");
        else
            BaseGameCharacterDetails.SetProfessionDescription(prof)
        end
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
