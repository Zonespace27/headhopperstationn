/datum/antagonist/ert/proc/engi_ert_alert()
	if(prob(5))
		// You get a sudden urge to build a NEW state-of-the-art supermatter chamber!
		owner.current.playsound_local(get_turf(owner.current), 'fulp_modules/departmental_ert/sounds/home_depot.ogg', 100, FALSE, pressure_affected = FALSE)

/datum/antagonist/ert/proc/choose_medert_outfit()
	var/mob/living/carbon/human/H = owner.current
	var/normal_outfit = /datum/outfit/centcom/ert/medic/specialized
	var/alien_outfit = /datum/outfit/centcom/ert/medic/specialized/alien
	var/oath_outfit = /datum/outfit/centcom/ert/medic/specialized/oath
	var/specialty = pickweight(list("Default" = 85, "Alien" = 5, "Oath" = 10))
	H.delete_equipment() //To prevent double equipment shenanigans

	switch(specialty)
		if("Alien")
			H.set_species(/datum/species/abductor)
			H.equipOutfit(alien_outfit)
		if("Oath")
			H.equipOutfit(oath_outfit)
		else
			H.equipOutfit(normal_outfit)

/datum/antagonist/ert/proc/choose_commedert_outfit()
	var/mob/living/carbon/human/H = owner.current
	var/normal_outfit = /datum/outfit/centcom/ert/commander/medical
	var/alien_outfit = /datum/outfit/centcom/ert/commander/medical/alien
	var/oath_outfit = /datum/outfit/centcom/ert/commander/medical/oath
	var/specialty = pickweight(list("Default" = 85, "Alien" = 5, "Oath" = 10))
	H.delete_equipment()

	switch(specialty)
		if("Alien")
			H.set_species(/datum/species/abductor)
			H.equipOutfit(alien_outfit)
		if("Oath")
			H.equipOutfit(oath_outfit)
		else
			H.equipOutfit(normal_outfit)

/datum/antagonist/ert/proc/choose_secert_race()
	var/mob/living/carbon/human/H = owner.current
	var/synth = /datum/species/synth
	var/mil_synth = /datum/species/synth/military
	var/race = pickweight(list("Default" = 90, "Military" = 1, "Synth" = 9)) // VERY low chance to become a Military Synth, 1/10 chance to become a synth

	switch(race)
		if("Military")
			H.set_species(mil_synth)
		if("Synth")
			H.set_species(synth)
		else
			return FALSE

///safety moth

/datum/antagonist/ert/safety_moth/on_gain()
    forge_objectives()
    . = ..()
    equip_official()
    ADD_TRAIT(owner.current, TRAIT_PACIFISM, JOB_TRAIT)


/datum/antagonist/ert/safety_moth/greet()

	to_chat(owner, "<B><font size=3 color=green>You are the Safety Moth.</font></B>")
	to_chat(owner, "You are being sent on a mission to [station_name()] by Nanotrasen's Operational Safety Department. Ensure the crew is following all proper safety protocols. Board the shuttle when your team is ready.")


/datum/antagonist/ert/safety_moth/proc/equip_official()
    var/mob/living/carbon/human/H = owner.current
    if(!istype(H))
        return
    H.set_species(/datum/species/moth)

