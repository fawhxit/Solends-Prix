function db_diaNar() {
	
	try { /* GMLive Call */ if (live_call()) return live_result; } catch(_ex) { /* GMLive not available? */ }
	
	#region Anims
		
		#region Anim Names
			
			global.tutnm = K.ANM+"Tutorial"
			global.radnm = K.ANM+"Night1Radio"
			global.beknm = K.ANM+"Night1Beckon"
			global.visnm = K.ANM+"Night1Vision"
			global.nw1nm = K.ANM+"News1"
			global.clbnm = K.ANM+"ClubAlley1"
			global.amctr = K.ANM+"AmbCtrl"
			global.shctr = K.ANM+"ShutCtrl"
			
		#endregion
		
		#region Intro
			
			#region Tutorial
				
				NS[$ global.tutnm] = {}
				NS[$ global.tutnm][$ K.NM] = ACTORn[ACTOR.FOX]
				NS[$ global.tutnm][$ K.ACT] = ACTOR.FOX
				NS[$ global.tutnm][$ K.BD0+K.SPR] = sprNA
				NS[$ global.tutnm][$ K.BG0+K.SPR] = sprNA
				NS[$ global.tutnm][$ K.ANM+K.NXT] = global.radnm
				NS[$ global.tutnm][$ K.SND+K.END] = sfxBassGong
				NS[$ global.tutnm][$ 0] = "[L.I.N.I. INJECTION PROTOCOL INITIATED]\n\nPress Enter or the Spacebar to continue."
				NS[$ global.tutnm][$ 1] = "[L.I.N.I. WARNING] \"Internal Permanence Anomaly Detected\""
				NS[$ global.tutnm][$ 2] = "I am FOX, \"Flight Operations eXosystem.\"\nA Localized Interfacing Neural Intelligence Cybernetic Implant."
				NS[$ global.tutnm][$ 3] = "By processing, encrypting and decrypting Neural Cybernetic signals between organic and inorganic systems I facilitate Neuro-Augmented analytics, diagnosis, and operative interfaces."
				NS[$ global.tutnm][$ 4] = "[OPID PROTOCOL INITIATED] @Sylas.Praey   ]   ]   ]   ]   ]"
				NS[$ global.tutnm][$ 5] = "[OPID PROTOCOL EXCEPTION] @Anomalous.Yield"
				NS[$ global.tutnm][$ 6] = "You are... not Sylas Praey...\nBut... you are within him...\nYour neural imprint is anomalous... unrecognized..."
				NS[$ global.tutnm][$ 7] = "Who are you..." // TODO Get Name Input; To use to make Profile for saves?
				NS[$ global.tutnm][$ 8] = "[L.I.N.I. INJECTION PROTOCOL TERMINATED]"
				/* Scrapped?
				NS[$ global.tutnm][$ 8] = "..."
				NS[$ global.tutnm][$ 9] = "Your sudden presence is peculiar."
				NS[$ global.tutnm][$ 8] = "..."
				NS[$ global.tutnm][$ 10] = "You could be of benefit to my operator.\nIf you are not you will be purged."
				NS[$ global.tutnm][$ 11] = "Do not take it personally, survival of my operator is my highest priority."
				NS[$ global.tutnm][$ 12] = "Despite your unknown origin I am authorizing you subconcious inputs and sensory streams."
				NS[$ global.tutnm][$ 13] = "Depending on Sylas's emotional state you may be able to influence their decisions."
				NS[$ global.tutnm][$ 14] = "Sometimes choices you make will be difficult, I will understand aslong as it is survivable."
				NS[$ global.tutnm][$ 15] = "..."
				*/
				
			#endregion
			
			#region Radio In
				
				NS[$ global.radnm] = {}
				NS[$ global.radnm][$ K.NM] = ACTORn[ACTOR.OLDERSYLAS]
				NS[$ global.radnm][$ K.ACT] = ACTOR.OLDERSYLAS
				NS[$ global.radnm][$ K.BD0+K.SPR] = sprCockpitBG
				NS[$ global.radnm][$ K.BG0+K.SPR] = sprSylasOlderDark
				NS[$ global.radnm][$ K.BG0+K.PMT] = 1/20
				NS[$ global.radnm][$ K.BG0+K.WMT] = 1.3
				NS[$ global.radnm][$ K.ANM+K.NXT] = global.beknm
				NS[$ global.radnm][$ K.SND+K.PLY] = msxDarkCool
				NS[$ global.radnm][$ K.SND+K.STP+K.END] = msxDarkCool
				NS[$ global.radnm][$ 0] = "..."
				NS[$ global.radnm][$ 1] = "this is silent 1..."
				NS[$ global.radnm][$ 2] = "unwarped, scanning..."
				NS[$ global.radnm][$ 3] = "..."
				NS[$ global.radnm][$ 4] = "unreal..."
				NS[$ global.radnm][$ 5] = "it's ancient..."
				NS[$ global.radnm][$ 6] = "and- fucking massive..."
				NS[$ global.radnm][$ 7] = "who built this..."
				
			#endregion
			
			#region Beckoning
				
				NS[$ global.beknm] = {}
				NS[$ global.beknm][$ K.NM] = ACTORn[ACTOR.VIRAL]
				NS[$ global.beknm][$ K.ACT] = ACTOR.VIRAL
				NS[$ global.beknm][$ K.BD0+K.SPR] = sprDerelict
				NS[$ global.beknm][$ K.BG0+K.SPR] = sprApproach
				NS[$ global.beknm][$ K.ANM+K.NXT] = global.visnm
				NS[$ global.beknm][$ K.SND+K.PLY] = msxDarkMid
				NS[$ global.beknm][$ 0] = "Come"
				NS[$ global.beknm][$ 1] = "Help us"
				
			#endregion
			
			#region Flash
				
				/*
				* Template:
				* [0] = Sprite; Every Even is a Sprite
				* [1] = Array of [seconds,N or FX Array]
				* [1][0] = seconds
				* [1][1] = N (No FX, Just Seconds...) or fxArray (ie [V.FXNAME,[param],...])
				*/
				NS[$ global.visnm] = {}
				NS[$ global.visnm][$ K.NM] = ACTORn[ACTOR.UNKNOWN]
				NS[$ global.visnm][$ K.ACT] = ACTOR.UNKNOWN
				NS[$ global.visnm][$ K.BD0+K.SPR] = sprNA
				NS[$ global.visnm][$ K.BG0+K.SPR] = [sprScope,[4,[V.ZOOM_PAN,U,U,[fa_center,fa_middle]]],
													sprSurface,[2,[V.ZOOM_PAN,2,1+(1/4),[fa_left,fa_middle],make_color_rgb(255,192,192)]],
													sprVirus,[1,[V.ZOOM_PAN,3,1+(1/3),[fa_left,fa_bottom],c.r]]]
				NS[$ global.visnm][$ K.SND+K.STP] = msxDarkMid
				NS[$ global.visnm][$ 0] = ""
				
			#endregion
			
		#endregion
		
		#region News 1 (Revised)
			
			NS[$ global.nw1nm] = {}
			NS[$ global.nw1nm][$ K.BD0+K.SPR] = animNews1BD
			NS[$ global.nw1nm][$ K.SP0+K.SPR] = animNews1Ship
			NS[$ global.nw1nm][$ K.BG0+K.SPR] = animNews1BG
			// The TV cuts into the news through from static as the broadcast is started
			NS[$ global.nw1nm][$ K.NM] = "Hostess Alexandria"
			NS[$ global.nw1nm][$ K.ACT] = ACTOR.ALEXANDRIA
			NS[$ global.nw1nm][$ 0] = "I'm Alexandria, your hostess, from Sol's Nebula Relay."
			NS[$ global.nw1nm][$ 1] = "The \"Solend's Prix\", is going to start soon."
			NS[$ global.nw1nm][$ 2] = "A pool of the best pilots from various systems are gathering in the Solend system flight of their lives..."
			NS[$ global.nw1nm][$ 3] = "*She pauses as if listening to a hidden voice and she gently clears her throat"
			NS[$ global.nw1nm][$ 4] = "I just got word from my crew that the officials have finalized the course..."
			NS[$ global.nw1nm][$ 5] = "The race, as the name suggests, will be start at the Solend System from the system's capital \"Gothica\"..."
			NS[$ global.nw1nm][$ 6] = "From the furthest habitable system on the very edges of our Milkyway's Quandrant, back to humanity's cradle, here at Sol..." 
			NS[$ global.nw1nm][$ 7] = "Racing through both known and unknown space the veteran pilots will be forced to navigate dangerous and hostile environments..."
			NS[$ global.nw1nm][$ 8] = "It will be a long race with many challenges and while some of the competitors might have their eyes set on the one billion credit prize pool at the end..."
			NS[$ global.nw1nm][$ 9] = "Many tune in throughout the galaxy in hopes that their system's pilot will win, and... Well..."
			NS[$ global.nw1nm][$ 10] = "*She clears her throat quietly"
			NS[$ global.nw1nm][$ 11] = "Secure the chance for their own system to recieve crucial aide and attention from Sol..."
			NS[$ global.nw1nm][$ 12] = "Knowing this, each pilot, certainly feels the gravity of the stakes at play..."
			NS[$ global.nw1nm][$ 13] = "It's a once in a lifetime oppurtunity, not only for the pilots, but the countless souls they represent..."
			NS[$ global.nw1nm][$ 14] = "That is all for now, and we'd like to thank the sponsor of this event, \"Angel Investments\"..."
			NS[$ global.nw1nm][$ 15] = "The best in helping humanity, safely, find new homes throughout the stars..."
			NS[$ global.nw1nm][$ 16] =  "*She touches an interface in her desk and the stream ends..."
			
		#endregion
		
		#region Dark Alley
			
			NS[$ global.clbnm] = {}
			NS[$ global.clbnm][$ K.BG0+K.SPR] = sprDarkAlley
			NS[$ global.clbnm][$ K.ACT+K.RHT] = ACTOR.SPITFIRE
			NS[$ global.clbnm][$ 0] = "You, with Spitfire reluctantly following, step outside the club's back door where the commotion was coming from..."
			NS[$ global.clbnm][$ 1] = "The alleyway outside the club is dirty with used drugs, homeless encampents and seemingly sedated homeless people lining the alley..."
			NS[$ global.clbnm][$ 2] = "Some of the homeless stare at you with desperate pleading eyes, some stare blankly and wander aimlessly..."
			NS[$ global.clbnm][$ 3] = "A patrolling civil officer seems to be dismantling an encampment to the dismay of the few homeless lucid enough to understand what's going on..."
			NS[$ global.clbnm][$ 4] = V.RIGHT
			NS[$ global.clbnm][$ 5] = "They won't do anything to help these poor people except pacify them with sedatives that make them hallucinate more and more until they've turned their own minds into prisons..."
			NS[$ global.clbnm][$ 6] = "I know with that kind of money from the race..."
			NS[$ global.clbnm][$ 7] = {}
			NS[$ global.clbnm][$ 7][$ K.REL+K.BR] = 1
			NS[$ global.clbnm][$ 7][$ T] = {}
			NS[$ global.clbnm][$ 7][$ T][$ 0] = "I could save him..."
			NS[$ global.clbnm][$ 7][$ T][$ 1] = "Er- I'm sorry I'm thinking out loud, just-"
			NS[$ global.clbnm][$ 8] = "Nevermind... We should get going..."
			NS[$ global.clbnm][$ 9] = V.NARRATOR_NONE
			NS[$ global.clbnm][$ 10] = "Acknowledging Spitfire's sudden discomfort you both leave towards the spaceport..."
			NS[$ global.clbnm][$ 11] = V.RIGHT
			NS[$ global.clbnm][$ 12] = V.DONE_AND_JOIN
			
		#endregion
		
		#region Ambient Controller
			
			NS[$ global.amctr] = {}
			NS[$ global.amctr][$ K.BG0+K.SPR] = sprNA
			NS[$ global.amctr][$ K.ACT] = ACTOR.FOX
			NS[$ global.amctr][$ 0] = "[L.I.N.I Alert]\n\nNegative Feedback from the controller, terminating connection."
			NS[$ global.amctr][$ 1] = "\"Careful, the controller sent an unexpected signal when we touched it so I disabled it."
			NS[$ global.amctr][$ 2] = "Most devices are connected to the neb by default so are vulnerable to exploits from unknown actors"
			NS[$ global.amctr][$ 2] = "If that's the case someone is already tracking us...\""
			
		#endregion
		
		#region Shutter Controller
			
			NS[$ global.shctr] = {}
			NS[$ global.shctr][$ K.BG0+K.SPR] = sprNA
			NS[$ global.shctr][$ K.ACT] = ACTOR.FOX
			NS[$ global.shctr][$ 0] = "[L.I.N.I Alert]\n\nNegative Feedback from the controller, terminating connection."
			
		#endregion
		
		#region Fetch Anim Sprites
			
			// Init Anim Level Keys...
			var sks = variable_instance_get_sorted_strKeys(NS,T)
			
			if(is_array(sks)) {
				
				#region Iterate Anim Level...
					
					for(var i = 0; i < array_length(sks); i++) {
						
						// Init Instance Level Keys...
						var ks = variable_instance_get_names(NS[$ sks[i]])
						
						#region Iterate Instance Level...
							
							for(var i2 = 0; i2 < array_length(ks); i2++) {
								
								try {
									
									// Get Key...
									var k = ks[i2]
									
									// Is Sprite Key?
									if(string_ends_with(k,K.SPR)) {
										
										// Get Sprite Value
										var e = S[$ i][$ k]
										
										// Verify Sprite...
										if(sprite_exists(e)) {
											
											// Add Sprite to Fetch Array if missing...
											if(!array_contains(fetchArr,e)) 
												fetchArr[array_length(fetchArr)] = e;
											
										}
										
									}
									
								} catch(_ex) {}
								
							}
							
						#endregion
						
					}
					
				#endregion
				
			}
			
		#endregion
		
	#endregion
	
	#region Resort
		
		#region Suite Bedroom
			
			// $Scene -> $Actor -> $Instance -> $Dialogue/Narrative (Nestable)
			NS[$ SCENE.RESORT_BED] = {}
			NS[$ SCENE.RESORT_BED][$ ACTOR.SYLAS] = {}
			NS[$ SCENE.RESORT_BED][$ ACTOR.SYLAS][$ 0] = {}
			NS[$ SCENE.RESORT_BED][$ ACTOR.SYLAS][$ 0][$ K.TRG] = TRIGGER.START
			NS[$ SCENE.RESORT_BED][$ ACTOR.SYLAS][$ 0][$ K.ACT+K.LFT] = ACTOR.SYLAS
			NS[$ SCENE.RESORT_BED][$ ACTOR.SYLAS][$ 0][$ K.ACT+K.RHT] = ACTOR.FOX
			NS[$ SCENE.RESORT_BED][$ ACTOR.SYLAS][$ 0][$ 0] = "*Jolting awake; felt like suddenly falling"
			NS[$ SCENE.RESORT_BED][$ ACTOR.SYLAS][$ 0][$ 1] = "\"fuck!\""
			NS[$ SCENE.RESORT_BED][$ ACTOR.SYLAS][$ 0][$ 2] = "*Realizing you're in your assigned suite"
			NS[$ SCENE.RESORT_BED][$ ACTOR.SYLAS][$ 0][$ 3] = "\"ugh... what the hell was that...\""
			NS[$ SCENE.RESORT_BED][$ ACTOR.SYLAS][$ 0][$ 4] = "*Shaking off anxiety"
			NS[$ SCENE.RESORT_BED][$ ACTOR.SYLAS][$ 0][$ 5] = V.RIGHT
			NS[$ SCENE.RESORT_BED][$ ACTOR.SYLAS][$ 0][$ 6] = "[ L.I.N.I Prompt ]"
			NS[$ SCENE.RESORT_BED][$ ACTOR.SYLAS][$ 0][$ 7] = "Look around the environment to find points of interest."
			NS[$ SCENE.RESORT_BED][$ ACTOR.SYLAS][$ 0][$ 8] = "\"By the way,\n\nSylas is shaking off the nightmare and his state affects our ability to guide him."
			NS[$ SCENE.RESORT_BED][$ ACTOR.SYLAS][$ 0][$ 9] = "Fortunately, our operator is exceptionally stable during critical moments.\""
			
		#endregion
		
		#region Suite
			
			//        $Scene ->      $Actor ->  $Instance -> $Dialogue/Narrative (Nestable)
			NS[$ SCENE.RESORT_SUITE] = {}
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS] = {}
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 0] = {}
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 0][$ K.TRG] = TRIGGER.START
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 0][$ K.ACT+K.LFT] = ACTOR.SYLAS
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 0][$ K.ACT+K.RHT] = ACTOR.FOX
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 0][$ 0] = V.RIGHT
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 0][$ 1] = "[ L.I.N.I Prompt ]"
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 0][$ 2] = "Without wearing your E.A.F. you're missing several augmentations that aide in navigation."
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 0][$ 3] = "Put on the E.A.F."
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 0][$ 4] = "\"Also,\n\nI'm dependant on him, what happens to him happens to us..."
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 0][$ 5] = "So don't even think about sabotaging us...\""
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 1] = {}
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 1][$ K.TRG] = TRIGGER.SUIT
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 1][$ K.ACT+K.LFT] = ACTOR.SYLAS
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 1][$ K.ACT+K.RHT] = ACTOR.FOX
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 1][$ 0] = "*You unlock the light metal crate and equip the plated suit inside..."
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 1][$ 1] = V.RIGHT
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 1][$ 2] = "[ L.I.N.I. [ E.A.F. INTEGRATION ] SYSTEM DIAG [  [  [  [ NOMINAL [\n\nOperator, this is your Environmental Aegis Frame."
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 1][$ 3] = "This will protect you from most external environmental hazards within its own isolated internal environment."
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 1][$ 4] = "An augmented HUD will aide you in navigating your environment, monitoring internals and analyzing points of interest."
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 1][$ 5] = "You may access internal data drives for additional information on your E.A.F."
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 1][$ 6] = {}
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 1][$ 6][$ K.INV+K.FLG] = [V.ANIM,global.nw1nm] // Must be false (this is a check whether it is done or not)
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 1][$ 6][$ 0] =  V.LEFT
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 1][$ 6][$ 1] = "*You refamiliarize yourself with the suit's systems despite knowing every part of it already..."
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 1][$ 6][$ 2] = "\"i should check to see if the neb has anything about the race tonight...\""
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 2] = {}
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 2][$ K.TRG] = TRIGGER.ANIM
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 2][$ K.ACT+K.LFT] = ACTOR.SYLAS
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 2][$ K.ACT+K.RHT] = ACTOR.FOX
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 2][$ K.ANM] = global.nw1nm
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 2][$ 0] = "\"there's plenty of time until the race...\""
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 2][$ 1] = "\"i need to get out of here before i lose my mind...\""
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 2][$ 2] = {}
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 2][$ 2][$ K.INV+K.FLG] = V.SUIT // If the player isn't suited...
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 2][$ 2][$ 0] = V.RIGHT
			NS[$ SCENE.RESORT_SUITE][$ ACTOR.SYLAS][$ 2][$ 2][$ 1] = "[ L.I.N.I. Prompt ]\n\nOperator, please don your E.A.F. (Environmental Aegis Frame) before leaving the suite."
			
		#endregion
		
		#region Courtyard 1
		
		#endregion
		
		#region Courtyard 2
		
		#endregion
		
	#endregion
	
	#region City
		
		#region Plaza
			
			
			
		#endregion
		
		#region Street 1
			
			
			
		#endregion
		
		#region Street 2
			
			NS[$ SCENE.CITY_ST2] = {}
			NS[$ SCENE.CITY_ST2][$ ACTOR.SYLAS] = {}
			NS[$ SCENE.CITY_ST2][$ ACTOR.SYLAS][$ 0] = {}
			NS[$ SCENE.CITY_ST2][$ ACTOR.SYLAS][$ 0][$ K.TRG] = TRIGGER.START
			NS[$ SCENE.CITY_ST2][$ ACTOR.SYLAS][$ 0][$ K.FLG] = V.SUIT
			NS[$ SCENE.CITY_ST2][$ ACTOR.SYLAS][$ 0][$ 0] = "the club is across this street..."
			NS[$ SCENE.CITY_ST2][$ ACTOR.SYLAS][$ 0][$ 1] = "someone should be there..."
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN] = {}
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0] = {}
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ K.TRG] = TRIGGER.START
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ K.INV+K.FLG] = V.SUIT
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ K.ACT+K.RHT] = ACTOR.SYLAS
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ K.ACT+K.LFT] = ACTOR.RANDOM
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 0] = "*Someone across the street notices you and starts shouting..."
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 1] = "Hey! What the fuck are you doing!?"
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 2] = "Where the fuck is your suit?!"
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 3] = "*An eager gruff voice in the distance shouts..."
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 4] = "I'LL FUCKING KILL YOU RIGHT NOW, HAHA!"
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 5] = V.RIGHT
			// This needs to be player... WIP TODO
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 6] = {}
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 6][$ K.OPT] = ["*How dare they?!\nFight the fuck back!","Get out of here..."]
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 6][$ 0] = {}
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 6][$ 0][$ 0] = "Who the fuck are you!?"
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 6][$ 0][$ 1] = "I'm not afraid of you?!"
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 6][$ 0][$ 2] = "*You sweep a heavy metal canister off its perch from an electrical junction and it bangs violently across the Adamantine Street..."
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 6][$ 0][$ 3] = V.LEFT
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 6][$ 0][$ 4] = "*Several others close in on you."
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 6][$ 0][$ 5] = "You better go back inside and get your suit on or we'll force you..."
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 6][$ 0][$ 6] = {}
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 6][$ 0][$ 6][$ K.OPT] = ["Swing at the one that just talked","Swing at the closest one","Throw another canister into one of them"]
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 6][$ 1] = {}
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 6][$ 1][$ 0] = "*\"What the fuck...\" you think."
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 6][$ 1][$ 1] = "*Carefully, you back up into the elevator and back to your suite..."
			NS[$ SCENE.CITY_ST2][$ ACTOR.UNKNOWN][$ 0][$ 6][$ 1][$ 2] = "*\"Ok... We really need our suit...\""
			// [$ 2]Scene -> [$ ACTOR.SPITFIRE]Actor -> [$ 0]Narrative Parent -> [$ 5]Narrative Branch -> [$ T|F]Narrative Dialogue -> [$ F:2]Narrative Selection -> [$ 0|1]Outcome
			NS[$ SCENE.CITY_ST2] = {}
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE] = {}
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0] = {}
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ K.TRG] = TRIGGER.START // Activate when spitfire character is clicked at scene 2
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ K.ACT+K.LFT] = ACTOR.SYLAS // Character to draw on left of screen
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ K.ACT+K.RHT] = ACTOR.SPITFIRE // Character to draw on right of screen
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ K.REL+K.BR] = 0 // Atleast Neutral?
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ T] = {}
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ T][$ 0] = V.RIGHT
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ T][$ 1] = P.dia[$ K.NM]+"..."
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ T][$ 2] = "We can go through the plaza to get to the Spaceport from here."
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ T][$ 3] = "But- it's a while before we need to be there..."
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ T][$ 4] = V.FLIP_H
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ T][$ 5] = "*Confidently, she turns to face you..."
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ T][$ 6] = "We should try to see what we can find out about the other racers..."
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ T][$ 7] = V.DONE
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ F] = {}
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ F][$ K.REL+K.BR] = -2 // Atleast not disliked?
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ F][$ T] = {} // Not disliked
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ F][$ T][$ 0] = V.RIGHT
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ F][$ T][$ 1] = "Hey- I'm going to the Spaceport. . . . . . \n\nThink about what I said..."
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ F][$ T][$ 2] = "*Looking over her shoulder, She raises a hand and walks away down the street"
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ F][$ T][$ 3] = V.DONE_AND_LEAVE
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ F][$ F] = {} // Disliked
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ F][$ F][$ 0] = "*Spitefire walks away down the street"
			NS[$ SCENE.CITY_ST2][$ ACTOR.SPITFIRE][$ 0][$ F][$ F][$ 1] = V.DONE_AND_LEAVE
			
		#endregion
		
		#region Street 3
			
			
			
		#endregion
		
		#region Street 4
			
			
			
		#endregion
		
		#region Store
			
			
			
		#endregion
		
	#endregion
	
	#region Club
		
		#region Enterance
			
			
			
		#endregion
		
		#region Floor
			
			
			
		#endregion
		
		#region Bar
			
			
			
		#endregion
		
		#region Booth
			
			// [$ 2]Scene -> [$ ACTOR.SPITFIRE]Actor -> [$ 0]Narrative Parent -> [$ 5]Narrative Branch -> [$ T|F]Narrative Dialogue -> [$ F:2]Narrative Selection -> [$ 0|1]Outcome
			NS[$ SCENE.CLUB_BOOTH] = {}
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE] = {}
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0] = {}
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ K.TRG] = TRIGGER.CLICK // Activate when spitfire character is clicked at scene 2
			//NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ K.RST] = V.SUIT // Activate when spitfire character is clicked at scene 2
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ K.ACT+K.LFT] = ACTOR.SPITFIRE // Character to draw on left of screen
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ K.ACT+K.RHT] = ACTOR.SYLAS // Character to draw on right of screen
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 0] = V.RIGHT // Switch to Right Character as Speaker (Sylas)
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 1] = "Hey you in the Spacer suit..." // Dialogue
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 2] = V.LEFT // Switch to Left Character as Speaker (Spitfire)
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 3] = V.BODY // Switch Speaker's Sprite to Body Main (Spitfire turns around...)
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 4] = "*They turn around to face you" // Dialogue
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 5] = "Hmm? I guess you must be talking to me..."
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 6] = "*They look you up and down" // Emote
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7] = {}
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ K.BR] = [V.SUIT,P] // True or False: Player Suited?
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ T] = {} // Player is Suited:
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ T][$ 0] = "*They turn towards you promptly"
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ T][$ 1] = "Wait- You're the one that flies Praey!"
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ T][$ 2] = "Your name's Sylas right?"
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ T][$ 3] = V.DONE_AND_CONTINUE // Mark this Narrative Parent as Done (NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0])
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F] = {} // Player is NOT Suited:
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 0] = "*They wave their hand at you dismissively"
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 1] = "Not now I'm looking for someone..."
			
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2] = {}
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ K.OPT] = ["\"Are you in the race too?\"",ACTION.DIA_LEAVE] // Option Array -> Buttons/Choices for Players to pick...
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ K.BYP] = [V.PARENT_ALL,K.DN] // Even if this dialogue is done; return here...
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ K.RPT] = T // Even if this dialogue is done; return here...
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0] = {} // Option 0 == Array[0] == "Are you in the race too?"
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ K.REL+K.ADJ] = -1 // Actor's Relation change. (- bad, + good)
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 0] = "Aren't you a pilot in the race?"
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 1] = V.LEFT
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 2] = "Grghhh- I just said-"
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 3] = V.RIGHT
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 4] = "I'm in the race too, My name's Sylas."
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 5] = V.LEFT
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 6] = "Oh- I've been looking for you! You fly Praey right?"
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 7] = "*Their head tilts to the side..."
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 8] = "Where's your suit?"
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 9] = V.RIGHT
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 10] = "Oh- I uh-"
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 11] = V.LEFT
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 12] = "*They put their hand up towards you"
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 13] = "Stop- We don't have time, just go get it on and we'll talk more later."
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 14] = "Come back here when you're suited..."
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 15] = V.BODY_BACK // Switch Speaker's Sprite to Body Main (Spitfire turns around...)
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 16] = "*They turn away from you impaitently..."
			NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 0][$ 7][$ F][$ 2][$ 0][$ 17] = V.DONE_SOFT // Also marks this narrative parent as done
			// Option 1 == Array[1] == ACTION.LEAVE; Just trigger action in this case, no additional dialogue set...
			
		#endregion
		
	#endregion
	
	#region Club 2
		
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1] = {}
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ K.TRG] = TRIGGER.CONTINUE
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ K.FLG] = V.SUIT
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ K.ACT+K.LFT] = ACTOR.SPITFIRE
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ K.ACT+K.RHT] = ACTOR.SYLAS
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ K.REL+K.BR] = 0 // True or False: Is Actor's Relation atleast this?
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ T] = {}
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ T][$ 0] = V.LEFT
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ T][$ 1] = V.BODY
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ T][$ 2] = "Great! Oh- I'm Spitfire by the way..."
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ T][$ 3] = V.ACTOR_MET // Actor known var to True
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ T][$ 4] = "I saw your profile in the roster for the race."
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ T][$ 5] = "I wanted to talk to you because I figured we might be able to watch eachothers' backs out there..."
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ T][$ 6] = "I overheard other pilots talking to eachother, seems like others are teaming up to split the prize..."
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ T][$ 7] = "I don't think either of us can win this race alone... And your ship-"
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ T][$ 8] = V.LINK_A
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ F] = {}
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ F][$ 0] = V.LEFT
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ F][$ 1] = V.BODY
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ F][$ 2] = "Finally... I'm Spitfire by the way..."
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ F][$ 3] = V.ACTOR_MET // Actor known var to True
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ F][$ 4] = "I've seen your profile from the race roster."
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ F][$ 5] = "I know other racers are forming teams to split the prize..."
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ F][$ 6] = "Just want to let you know I think we-"
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 1][$ F][$ 7] = V.LINK_A
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 2] = {}
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 2][$ K.LNK] = V.LINK_A // Like a trigger, but specific to the end of another dialogue/narrative
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 2][$ K.ACT+K.LFT] = ACTOR.SPITFIRE
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 2][$ K.ACT+K.RHT] = ACTOR.SYLAS
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 2][$ 0] = V.NARRATOR_NONE // All Actors Inactive (For stuff like meta narrations...)
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 2][$ 1] = "*You hear distant shouting, \"GET BACK!\""
		  NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 2][$ 2] = V.RIGHT
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 2][$ 3] = "Sounds like a fight outside..."
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 2][$ 4] = V.LEFT
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 2][$ 5] = "We should get going..."
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 2][$ 6] = "A couple racers have already gotten targeted by local gangs already..."
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 2][$ 7] = V.LINK_B
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3] = {}
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ K.LNK] = V.LINK_B
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ K.ACT+K.LFT] = ACTOR.SPITFIRE
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ K.ACT+K.RHT] = ACTOR.SYLAS
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ K.OPT] = ["Investigate","Just Leave"]
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ K.ANM+K.TO] = global.clbnm
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ 0] = {} // Investigate
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ 0][$ K.REL+K.ADJ] = 1
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ 0][$ 0] = "Hold on... I want to see what's going on..."
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ 0][$ 1] = V.LEFT
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ 0][$ 2] = "..."
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ 0][$ 3] = V.DONE_TO_ANIM
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ 1] = {} // Just Leave
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ 1][$ 0] = "Yeah, let's just go..."
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ 1][$ 1] = V.LEFT
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ 1][$ 2] = "Lead the way..."
		NS[$ SCENE.CLUB_BOOTH][$ ACTOR.SPITFIRE][$ 3][$ 1][$ 3] = V.DONE_AND_JOIN
		
	#endregion
    
}

function db_scn() {
	
	try { /* GMLive Call */ if (live_call()) return live_result; } catch(_ex) { /* GMLive not available? */ }
	
	#region Resort
		
		#region Bedroom
			
			S[$ SCENE.RESORT_BED] = {}
			S[$ SCENE.RESORT_BED][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.RESORT_BED][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.RESORT_BED][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.RESORT_BED][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.RESORT_BED][$ K.BG0+K.SPR] = sprSuiteBed
			S[$ SCENE.RESORT_BED][$ K.BG0+K.PMT] = 1
			S[$ SCENE.RESORT_BED][$ K.ENV] = F
			S[$ SCENE.RESORT_BED][$ K.SCN+K.BLD+K.TR] = color_make_rgb([192,160,255])
			S[$ SCENE.RESORT_BED][$ K.SCN+K.BLD+K.FL] = color_make_rgb([48,0,48])
			
		#endregion
		
		#region Suite
			
			S[$ SCENE.RESORT_SUITE] = {}
			S[$ SCENE.RESORT_SUITE][$ K.SK0+K.SPR] = sprCitySky
			S[$ SCENE.RESORT_SUITE][$ K.SK0+K.PMT] = 1/40
			S[$ SCENE.RESORT_SUITE][$ K.BD0+K.SPR] = sprApartBD
			S[$ SCENE.RESORT_SUITE][$ K.BD0+K.PMT] = 1/30
			S[$ SCENE.RESORT_SUITE][$ K.BG0+K.L2+K.SPR] = sprScrapersFar
			S[$ SCENE.RESORT_SUITE][$ K.BG0+K.L2+K.PMT] = 1/20
			S[$ SCENE.RESORT_SUITE][$ K.BG0+K.L2+K.WMT] = 1.3
			S[$ SCENE.RESORT_SUITE][$ K.BG0+K.L1+K.SPR] = sprScrapersClose
			S[$ SCENE.RESORT_SUITE][$ K.BG0+K.L1+K.PMT] = 1/10
			S[$ SCENE.RESORT_SUITE][$ K.BG0+K.L1+K.WMT] = 1.5
			S[$ SCENE.RESORT_SUITE][$ K.BG0+K.SPR] = sprSuite
			S[$ SCENE.RESORT_SUITE][$ K.BG0+K.PMT] = 1
			S[$ SCENE.RESORT_SUITE][$ K.ENV] = F
			S[$ SCENE.RESORT_SUITE][$ K.TRA+K.CNT] = 8
			S[$ SCENE.RESORT_SUITE][$ K.TRA+K.XRG] = [-.2,1.2]
			S[$ SCENE.RESORT_SUITE][$ K.TRA+K.YRG] = [1/3,2/3]
			S[$ SCENE.RESORT_SUITE][$ K.TRA+K.ZRG] = [1/3,2/3]
			S[$ SCENE.RESORT_SUITE][$ K.SCN+K.BLD+K.TR] = color_make_rgb([192,160,255])
			S[$ SCENE.RESORT_SUITE][$ K.SCN+K.BLD+K.FL] = color_make_rgb([48,0,48])
			
		#endregion
		
		#region Courtyard 1
			
			S[$ SCENE.RESORT_COURT1] = {}
			S[$ SCENE.RESORT_COURT1][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.RESORT_COURT1][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.RESORT_COURT1][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.RESORT_COURT1][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.RESORT_COURT1][$ K.BG0+K.SPR] = sprSuiteC1
			S[$ SCENE.RESORT_COURT1][$ K.BG0+K.PMT] = 1
			S[$ SCENE.RESORT_COURT1][$ K.ENV] = T
			S[$ SCENE.RESORT_COURT1][$ K.SCN+K.BLD] = color_make_rgb([192,128,255])
			
		#endregion
		
		#region Courtyard 2
			
			S[$ SCENE.RESORT_COURT2] = {}
			S[$ SCENE.RESORT_COURT2][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.RESORT_COURT2][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.RESORT_COURT2][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.RESORT_COURT2][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.RESORT_COURT2][$ K.BG0+K.SPR] = sprSuiteC2
			S[$ SCENE.RESORT_COURT2][$ K.BG0+K.PMT] = 1
			S[$ SCENE.RESORT_COURT2][$ K.ENV] = T
			S[$ SCENE.RESORT_COURT2][$ K.SCN+K.BLD] = color_make_rgb([192,128,255])
			
		#endregion
		
	#endregion
	
	#region City
		
		#region Plaza
			
			S[$ SCENE.CITY_PLAZA] = {}
			S[$ SCENE.CITY_PLAZA][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.CITY_PLAZA][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.CITY_PLAZA][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.CITY_PLAZA][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.CITY_PLAZA][$ K.BG0+K.SPR] = sprCityPlaza
			S[$ SCENE.CITY_PLAZA][$ K.BG0+K.PMT] = 1
			S[$ SCENE.CITY_PLAZA][$ K.ENV] = T
			S[$ SCENE.CITY_PLAZA][$ K.SCN+K.BLD] = color_make_rgb([192,192,255])
			
		#endregion
		
		#region Street 1
			
			S[$ SCENE.CITY_ST1] = {}
			S[$ SCENE.CITY_ST1][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.CITY_ST1][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.CITY_ST1][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.CITY_ST1][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.CITY_ST1][$ K.BG0+K.SPR] = sprCityS1
			S[$ SCENE.CITY_ST1][$ K.BG0+K.PMT] = 1
			S[$ SCENE.CITY_ST1][$ K.ENV] = T
			S[$ SCENE.CITY_ST1][$ K.SCN+K.BLD] = color_make_rgb([192,192,255])
			
		#endregion
		
		#region Street 2
			
			S[$ SCENE.CITY_ST2] = {}
			S[$ SCENE.CITY_ST2][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.CITY_ST2][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.CITY_ST2][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.CITY_ST2][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.CITY_ST2][$ K.BG0+K.SPR] = sprCityS2
			S[$ SCENE.CITY_ST2][$ K.BG0+K.PMT] = 1
			S[$ SCENE.CITY_ST2][$ K.ENV] = T
			S[$ SCENE.CITY_ST2][$ K.SCN+K.BLD] = color_make_rgb([192,192,255])
			
		#endregion
		
		#region Street 3
			
			S[$ SCENE.CITY_ST3] = {}
			S[$ SCENE.CITY_ST3][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.CITY_ST3][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.CITY_ST3][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.CITY_ST3][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.CITY_ST3][$ K.BG0+K.SPR] = sprCityS3
			S[$ SCENE.CITY_ST3][$ K.BG0+K.PMT] = 1
			S[$ SCENE.CITY_ST3][$ K.ENV] = T
			S[$ SCENE.CITY_ST3][$ K.SCN+K.BLD] = color_make_rgb([192,192,255])
			
		#endregion
		
		#region Street 4
			
			S[$ SCENE.CITY_ST4] = {}
			S[$ SCENE.CITY_ST4][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.CITY_ST4][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.CITY_ST4][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.CITY_ST4][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.CITY_ST4][$ K.BG0+K.SPR] = sprCityS4
			S[$ SCENE.CITY_ST4][$ K.BG0+K.PMT] = 1
			S[$ SCENE.CITY_ST4][$ K.ENV] = T
			S[$ SCENE.CITY_ST4][$ K.SCN+K.BLD] = color_make_rgb([192,192,255])
			
		#endregion
		
		#region Store
			
			S[$ SCENE.CITY_STORE] = {}
			S[$ SCENE.CITY_STORE][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.CITY_STORE][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.CITY_STORE][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.CITY_STORE][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.CITY_STORE][$ K.BG0+K.SPR] = sprCityStore
			S[$ SCENE.CITY_STORE][$ K.BG0+K.PMT] = 1
			S[$ SCENE.CITY_STORE][$ K.ENV] = T
			S[$ SCENE.CITY_STORE][$ K.SCN+K.BLD] = color_make_rgb([255,255,192])
			
		#endregion
		
	#endregion
	
	#region Club
		
		#region Entrance
			
			S[$ SCENE.CLUB_ENT] = {}
			S[$ SCENE.CLUB_ENT][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.CLUB_ENT][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.CLUB_ENT][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.CLUB_ENT][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.CLUB_ENT][$ K.BG0+K.SPR] = sprClubEnt
			S[$ SCENE.CLUB_ENT][$ K.BG0+K.PMT] = 1
			S[$ SCENE.CLUB_ENT][$ K.ENV] = T
			S[$ SCENE.CLUB_ENT][$ K.SCN+K.BLD] = color_make_rgb([96,64,160])
			
		#endregion
		
		#region Floor
			
			S[$ SCENE.CLUB_FLOOR] = {}
			S[$ SCENE.CLUB_FLOOR][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.CLUB_FLOOR][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.CLUB_FLOOR][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.CLUB_FLOOR][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.CLUB_FLOOR][$ K.BG0+K.SPR] = sprClubFloor
			S[$ SCENE.CLUB_FLOOR][$ K.BG0+K.PMT] = 1
			S[$ SCENE.CLUB_FLOOR][$ K.ENV] = T
			S[$ SCENE.CLUB_FLOOR][$ K.SCN+K.BLD] = color_make_rgb([96,64,160])
			
		#endregion
		
		#region Bar
			
			S[$ SCENE.CLUB_BAR] = {}
			S[$ SCENE.CLUB_BAR][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.CLUB_BAR][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.CLUB_BAR][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.CLUB_BAR][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.CLUB_BAR][$ K.BG0+K.SPR] = sprClubBar
			S[$ SCENE.CLUB_BAR][$ K.BG0+K.PMT] = 1
			S[$ SCENE.CLUB_BAR][$ K.ENV] = T
			S[$ SCENE.CLUB_BAR][$ K.SCN+K.BLD] = color_make_rgb([96,64,160])
			
		#endregion
		
		#region Booth
			
			S[$ SCENE.CLUB_BOOTH] = {}
			S[$ SCENE.CLUB_BOOTH][$ K.BD0+K.SPR] = sprClubBoothBD
			S[$ SCENE.CLUB_BOOTH][$ K.BD0+K.PMT] = .8
			S[$ SCENE.CLUB_BOOTH][$ K.BG0+K.SPR] = sprClubBoothBG
			S[$ SCENE.CLUB_BOOTH][$ K.BG0+K.PMT] = 1
			S[$ SCENE.CLUB_BOOTH][$ K.ACT+K.LFT] = ACTOR.SPITFIRE
			S[$ SCENE.CLUB_BOOTH][$ K.ENV] = T
			S[$ SCENE.CLUB_BOOTH][$ K.TRA+K.CNT] = 0
			S[$ SCENE.CLUB_BOOTH][$ K.SCN+K.BLD] = color_make_rgb([96,64,160])
			
		#endregion
		
	#endregion
	
	#region Brothel
		
		#region Entrance
			
			S[$ SCENE.BROTH_ENT] = {}
			S[$ SCENE.BROTH_ENT][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.BROTH_ENT][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.BROTH_ENT][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.BROTH_ENT][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.BROTH_ENT][$ K.BG0+K.SPR] = sprBrothEnt
			S[$ SCENE.BROTH_ENT][$ K.BG0+K.PMT] = 1
			S[$ SCENE.BROTH_ENT][$ K.ENV] = T
			S[$ SCENE.BROTH_ENT][$ K.SCN+K.BLD] = color_make_rgb([192,192,192])
			
		#endregion
		
		#region Lounge 1
			
			S[$ SCENE.BROTH_L1] = {}
			S[$ SCENE.BROTH_L1][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.BROTH_L1][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.BROTH_L1][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.BROTH_L1][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.BROTH_L1][$ K.BG0+K.SPR] = sprBrothL1
			S[$ SCENE.BROTH_L1][$ K.BG0+K.PMT] = 1
			S[$ SCENE.BROTH_L1][$ K.ENV] = T
			S[$ SCENE.BROTH_L1][$ K.SCN+K.BLD] = color_make_rgb([192,192,192])
			
		#endregion
		
		#region Lounge 2
			
			S[$ SCENE.BROTH_L2] = {}
			S[$ SCENE.BROTH_L2][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.BROTH_L2][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.BROTH_L2][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.BROTH_L2][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.BROTH_L2][$ K.BG0+K.SPR] = sprBrothL2
			S[$ SCENE.BROTH_L2][$ K.BG0+K.PMT] = 1
			S[$ SCENE.BROTH_L2][$ K.ENV] = T
			S[$ SCENE.BROTH_L2][$ K.SCN+K.BLD] = color_make_rgb([192,192,192])
			
		#endregion
		
		#region Red Room
			
			S[$ SCENE.BROTH_R] = {}
			S[$ SCENE.BROTH_R][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.BROTH_R][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.BROTH_R][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.BROTH_R][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.BROTH_R][$ K.BG0+K.SPR] = sprBrothR
			S[$ SCENE.BROTH_R][$ K.BG0+K.PMT] = 1
			S[$ SCENE.BROTH_R][$ K.ENV] = T
			S[$ SCENE.BROTH_R][$ K.SCN+K.BLD] = color_make_rgb([192,96,96])
			
		#endregion
		
		#region Green Room 1
			
			S[$ SCENE.BROTH_G1] = {}
			S[$ SCENE.BROTH_G1][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.BROTH_G1][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.BROTH_G1][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.BROTH_G1][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.BROTH_G1][$ K.BG0+K.SPR] = sprBrothG
			S[$ SCENE.BROTH_G1][$ K.BG0+K.PMT] = 1
			S[$ SCENE.BROTH_G1][$ K.ENV] = T
			S[$ SCENE.BROTH_G1][$ K.SCN+K.BLD] = color_make_rgb([96,192,96])
			
		#endregion
		
		#region Green Room 2
			
			S[$ SCENE.BROTH_G2] = {}
			S[$ SCENE.BROTH_G2][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.BROTH_G2][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.BROTH_G2][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.BROTH_G2][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.BROTH_G2][$ K.BG0+K.SPR] = sprBrothG2
			S[$ SCENE.BROTH_G2][$ K.BG0+K.PMT] = 1
			S[$ SCENE.BROTH_G2][$ K.ENV] = T
			S[$ SCENE.BROTH_G2][$ K.SCN+K.BLD] = color_make_rgb([96,192,96])
			
		#endregion
		
		#region Blue Room
			
			S[$ SCENE.BROTH_B] = {}
			S[$ SCENE.BROTH_B][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.BROTH_B][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.BROTH_B][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.BROTH_B][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.BROTH_B][$ K.BG0+K.SPR] = sprBrothB
			S[$ SCENE.BROTH_B][$ K.BG0+K.PMT] = 1
			S[$ SCENE.BROTH_B][$ K.ENV] = T
			S[$ SCENE.BROTH_B][$ K.SCN+K.BLD] = color_make_rgb([96,96,192])
			
		#endregion
		
	#endregion
	
	#region Spaceport
		
		#region Entrance
			
			S[$ SCENE.SPACEPORT_ENT] = {}
			S[$ SCENE.SPACEPORT_ENT][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_ENT][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_ENT][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_ENT][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_ENT][$ K.BG0+K.SPR] = sprPortEnt
			S[$ SCENE.SPACEPORT_ENT][$ K.BG0+K.PMT] = 1
			S[$ SCENE.SPACEPORT_ENT][$ K.ENV] = T
			S[$ SCENE.SPACEPORT_ENT][$ K.SCN+K.BLD] = color_make_rgb([192,192,255])
			
		#endregion
		
		#region Overlook
			
			S[$ SCENE.SPACEPORT_OVERLOOK] = {}
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.BD0+K.PMT] = 1
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.BG0+K.SPR] = sprPortOverlook
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.BG0+K.PMT] = 1
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.BG0+K.L2+K.SPR] = sprScrapersFar
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.BG0+K.L2+K.PMT] = 1/2
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.BG0+K.L2+K.WMT] = 1.1
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.BG0+K.L1+K.SPR] = sprScrapersClose
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.BG0+K.L1+K.PMT] = 2/3
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.BG0+K.L1+K.WMT] = 1.2
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.ENV] = T
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.TRA+K.CNT] = 2
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.TRA+K.XRG] = [-.2,1.2]
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.TRA+K.YRG] = [1/3,2/3]
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.TRA+K.ZRG] = [1/3,2/3]
			S[$ SCENE.SPACEPORT_OVERLOOK][$ K.SCN+K.BLD] = color_make_rgb([96,96,160])
			
		#endregion
		
		#region Terminals
			
			S[$ SCENE.SPACEPORT_TERM] = {}
			S[$ SCENE.SPACEPORT_TERM][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_TERM][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_TERM][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_TERM][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_TERM][$ K.BG0+K.SPR] = sprPortTerm
			S[$ SCENE.SPACEPORT_TERM][$ K.BG0+K.PMT] = 1
			S[$ SCENE.SPACEPORT_TERM][$ K.ENV] = T
			S[$ SCENE.SPACEPORT_TERM][$ K.SCN+K.BLD] = color_make_rgb([192,192,255])
			
		#endregion
		
		#region Hangar Praey
			
			S[$ SCENE.SPACEPORT_PRAEY] = {}
			S[$ SCENE.SPACEPORT_PRAEY][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_PRAEY][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_PRAEY][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_PRAEY][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_PRAEY][$ K.BG0+K.SPR] = sprPortPraey
			S[$ SCENE.SPACEPORT_PRAEY][$ K.BG0+K.PMT] = 1
			S[$ SCENE.SPACEPORT_PRAEY][$ K.ENV] = T
			S[$ SCENE.SPACEPORT_PRAEY][$ K.SCN+K.BLD] = color_make_rgb([192,192,255])
			
		#endregion
		
		#region Hangar Spitfire
			
			S[$ SCENE.SPACEPORT_SPITFIRE] = {}
			S[$ SCENE.SPACEPORT_SPITFIRE][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_SPITFIRE][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_SPITFIRE][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_SPITFIRE][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_SPITFIRE][$ K.BG0+K.SPR] = sprPortSpitfire
			S[$ SCENE.SPACEPORT_SPITFIRE][$ K.BG0+K.PMT] = 1
			S[$ SCENE.SPACEPORT_SPITFIRE][$ K.ENV] = T
			S[$ SCENE.SPACEPORT_SPITFIRE][$ K.SCN+K.BLD] = color_make_rgb([192,192,255])
			
		#endregion
		
		#region Hangar Other 1
			
			S[$ SCENE.SPACEPORT_HANG1] = {}
			S[$ SCENE.SPACEPORT_HANG1][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_HANG1][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_HANG1][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_HANG1][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_HANG1][$ K.BG0+K.SPR] = sprPortTBD1
			S[$ SCENE.SPACEPORT_HANG1][$ K.BG0+K.PMT] = 1
			S[$ SCENE.SPACEPORT_HANG1][$ K.ENV] = T
			S[$ SCENE.SPACEPORT_HANG1][$ K.SCN+K.BLD] = color_make_rgb([192,192,255])
			
		#endregion
		
		#region Hangar Other 2
			
			S[$ SCENE.SPACEPORT_HANG2] = {}
			S[$ SCENE.SPACEPORT_HANG2][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_HANG2][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_HANG2][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_HANG2][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.SPACEPORT_HANG2][$ K.BG0+K.SPR] = sprPortTBD2
			S[$ SCENE.SPACEPORT_HANG2][$ K.BG0+K.PMT] = 1
			S[$ SCENE.SPACEPORT_HANG2][$ K.ENV] = T
			S[$ SCENE.SPACEPORT_HANG2][$ K.SCN+K.BLD] = color_make_rgb([192,192,255])
			
		#endregion
		
	#endregion
	
	#region Slums
		
		#region Alley 1
			
			S[$ SCENE.SLUM_A1] = {}
			S[$ SCENE.SLUM_A1][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.SLUM_A1][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.SLUM_A1][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.SLUM_A1][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.SLUM_A1][$ K.BG0+K.SPR] = sprSlumA1
			S[$ SCENE.SLUM_A1][$ K.BG0+K.PMT] = 1
			S[$ SCENE.SLUM_A1][$ K.ENV] = T
			S[$ SCENE.SLUM_A1][$ K.SCN+K.BLD] = color_make_rgb([192,192,96])
			
		#endregion
		
		#region Alley 2
			
			S[$ SCENE.SLUM_A2] = {}
			S[$ SCENE.SLUM_A2][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.SLUM_A2][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.SLUM_A2][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.SLUM_A2][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.SLUM_A2][$ K.BG0+K.SPR] = sprSlumA2
			S[$ SCENE.SLUM_A2][$ K.BG0+K.PMT] = 1
			S[$ SCENE.SLUM_A2][$ K.ENV] = T
			S[$ SCENE.SLUM_A2][$ K.SCN+K.BLD] = color_make_rgb([192,192,96])
			
		#endregion
		
		#region Alley 3
			
			S[$ SCENE.SLUM_A3] = {}
			S[$ SCENE.SLUM_A3][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.SLUM_A3][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.SLUM_A3][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.SLUM_A3][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.SLUM_A3][$ K.BG0+K.SPR] = sprSlumA3
			S[$ SCENE.SLUM_A3][$ K.BG0+K.PMT] = 1
			S[$ SCENE.SLUM_A3][$ K.ENV] = T
			S[$ SCENE.SLUM_A3][$ K.SCN+K.BLD] = color_make_rgb([192,192,96])
			
		#endregion
		
		#region Bodega
			
			S[$ SCENE.SLUM_BOD] = {}
			S[$ SCENE.SLUM_BOD][$ K.SK0+K.SPR] = sprNA
			S[$ SCENE.SLUM_BOD][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.SLUM_BOD][$ K.BG0+K.L2+K.SPR] = sprNA
			S[$ SCENE.SLUM_BOD][$ K.BG0+K.L1+K.SPR] = sprNA
			S[$ SCENE.SLUM_BOD][$ K.BG0+K.SPR] = sprSlumBod
			S[$ SCENE.SLUM_BOD][$ K.BG0+K.PMT] = 1
			S[$ SCENE.SLUM_BOD][$ K.ENV] = T
			S[$ SCENE.SLUM_BOD][$ K.SCN+K.BLD] = color_make_rgb([192,192,96])
			
		#endregion
		
	#endregion
	
	#region Cockpits
		
		#region Praey
			
			S[$ SCENE.COCKPIT_PRAEY] = {}
			S[$ SCENE.COCKPIT_PRAEY][$ K.BD0+K.SPR] = sprNA
			S[$ SCENE.COCKPIT_PRAEY][$ K.BD0+K.PMT] = 1
			S[$ SCENE.COCKPIT_PRAEY][$ K.BG0+K.SPR] = sprCockpit
			S[$ SCENE.COCKPIT_PRAEY][$ K.BG0+K.PMT] = 1
			S[$ SCENE.COCKPIT_PRAEY][$ K.BG0+K.L2+K.SPR] = sprScrapersFar
			S[$ SCENE.COCKPIT_PRAEY][$ K.BG0+K.L2+K.PMT] = 1/2
			S[$ SCENE.COCKPIT_PRAEY][$ K.BG0+K.L2+K.WMT] = 1.1
			S[$ SCENE.COCKPIT_PRAEY][$ K.BG0+K.L1+K.SPR] = sprScrapersClose
			S[$ SCENE.COCKPIT_PRAEY][$ K.BG0+K.L1+K.PMT] = 2/3
			S[$ SCENE.COCKPIT_PRAEY][$ K.BG0+K.L1+K.WMT] = 1.2
			S[$ SCENE.COCKPIT_PRAEY][$ K.ENV] = T
			S[$ SCENE.COCKPIT_PRAEY][$ K.TRA+K.CNT] = 0
			S[$ SCENE.COCKPIT_PRAEY][$ K.SCN+K.BLD+K.TR] = c.wht
			S[$ SCENE.COCKPIT_PRAEY][$ K.SCN+K.BLD+K.FL] = c.dgry
			
		#endregion
		
	#endregion
	
	#region Fetch Scene Sprites
		
		// Init Scene Level Keys...
		var rks = variable_instance_get_sorted_numKeys(S,T)
		
		if(is_array(rks)) {
			
			#region Iterate Scene Level...
				
				for(var i = 0; i < array_length(rks); i++) {
					
					// Init Instance Level Keys...
					var ks = variable_instance_get_names(S[$ rks[i]])
					
					#region Iterate Instance Level...
						
						for(var i2 = 0; i2 < array_length(ks); i2++) {
							
							try {
								
								// Get Key...
								var k = ks[i2]
								
								// Is Sprite Key?
								if(string_ends_with(k,K.SPR)) {
									
									// Get Sprite Value
									var e = S[$ i][$ k]
									
									// Verify Sprite...
									if(sprite_exists(e)) {
										
										// Add Sprite to Fetch Array if missing...
										if(!array_contains(fetchArr,e)) 
											fetchArr[array_length(fetchArr)] = e;
										
									}
									
								}
								
							} catch(_ex) {}
							
						}
						
					#endregion
					
				}
				
			#endregion
			
		}
		
	#endregion
    
}

function db_act() {
	
    try { /* GMLive Call */ if (live_call()) return live_result; } catch(_ex) { /* GMLive not available? */ }
    
    #region Actor List Reset
        
        for(var i = 0; i < ds_list_size(actorLst); i++) {
            
            var e = actorLst[|i]
            if(e != P) instance_destroy(e);
            else ds_list_clear(P.party);
            
        }
        
        // Clear Actor List...
        ds_list_clear(actorLst)
        
    #endregion
    
	#region Sylas (You)/Player
		
		ds_list_add(actorLst,P)
		
	#endregion
	
	#region Narrator
		
		ds_list_add(actorLst,instance_create_layer(0,0,"MG",oChar))
		var _char = actorLst[|ds_list_size(actorLst)-1]
		_char.dia[$ K.NM] = "Narrator"
		_char.dia[$ K.SX]  = SEX.MALE
		_char.body = sprNA
		_char.bodyPol = 1
		_char.bodyBack = sprNA
		_char.bodyBackPol = 1
		_char.diaSpr = _char.bodyBack
		_char.diaSprPol = _char.bodyBackPol
		_char.head = sprNA
		_char.headPol = 1
		_char.uid = ACTOR.NARRATOR
		_char.font1 = fNeu
		_char.font2 = fNeuB
		
	#endregion
	
	#region Spitfire
		
		ds_list_add(actorLst,instance_create_layer(0,0,"MG",oChar))
		var _char = actorLst[|ds_list_size(actorLst)-1]
		_char.dia[$ K.NM] = "Spitfire"
		_char.dia[$ K.SX]  = SEX.FEMALE
		_char.body = sprSpitfireBod
		_char.bodyPol = 1
		_char.bodyBack = sprSpitfireBack
		_char.bodyBackPol = 1
		_char.diaSpr = _char.bodyBack
		_char.diaSprPol = _char.bodyBackPol
		_char.head = sprSpitfire1
		_char.headPol = 1
		_char.uid = ACTOR.SPITFIRE
		_char.font1 = fSpitfire
		_char.font2 = fSpitfireB
		
	#endregion
	
	#region Alexandria
		
		ds_list_add(actorLst,instance_create_layer(0,0,"MG",oChar))
		var _char = actorLst[|ds_list_size(actorLst)-1]
		_char.dia[$ K.NM] = "Alexandria"
		_char.dia[$ K.SX]  = SEX.FEMALE
		_char.body = sprNA
		_char.bodyPol = 1
		_char.head = sprNA
		_char.headPol = 1
		_char.uid = ACTOR.ALEXANDRIA
		_char.font1 = fAlexandria1
		_char.font2 = fAlexandria2
		_char.col[1] = make_color_rgb(192,0,192)
		_char.col[2] = make_color_rgb(192,0,192)
		_char.col[3] = make_color_rgb(128,0,128)
		_char.col[4] = make_color_rgb(128,0,128)
		
	#endregion
	
	#region FOX
		
		ds_list_add(actorLst,instance_create_layer(0,0,"MG",oChar))
		var _char = actorLst[|ds_list_size(actorLst)-1]
		_char.dia[$ K.NM] = "F.O.X."
		_char.dia[$ K.SX]  = SEX.FEMALE
		_char.body = sprNA
		_char.bodyPol = 1
		_char.head = sprNA
		_char.headPol = 1
		_char.uid = ACTOR.FOX
		_char.font1 = fTransmit
		_char.font2 = fHUD
		_char.col[1] = make_color_rgb(0,255,0)
		_char.col[2] = make_color_rgb(0,255,0)
		_char.col[3] = make_color_rgb(0,192,0)
		_char.col[4] = make_color_rgb(0,192,0)
		
	#endregion
	
	#region Older Sylas
		
		ds_list_add(actorLst,instance_create_layer(0,0,"MG",oChar))
		var _char = actorLst[|ds_list_size(actorLst)-1]
		_char.dia[$ K.NM] = ACTORn[ACTOR.OLDERSYLAS]
		_char.dia[$ K.SX]  = SEX.MALE
		_char.body = sprNA
		_char.bodyPol = 1
		_char.head = sprSylasOlder
		_char.headPol = 1
		_char.uid = ACTOR.OLDERSYLAS
		_char.font1 = fBrave
		_char.font2 = fTransmit
		_char.col[1] = make_color_rgb(96,96,192)
		_char.col[2] = make_color_rgb(96,96,192)
		_char.col[3] = make_color_rgb(32,32,160)
		_char.col[4] = make_color_rgb(32,32,192)
		
	#endregion
	
	#region Unknown
		
		ds_list_add(actorLst,instance_create_layer(0,0,"MG",oChar))
		var _char = actorLst[|ds_list_size(actorLst)-1]
		_char.dia[$ K.NM] = ACTORn[ACTOR.UNKNOWN]
		_char.dia[$ K.SX]  = SEX.MALE
		_char.body = sprNA
		_char.bodyPol = 1
		_char.head = sprNA
		_char.headPol = 1
		_char.uid = ACTOR.UNKNOWN
		_char.font1 = fNeu
		_char.font2 = fTransmit
		_char.col[1] = c.lgry
		_char.col[2] = c.lgry
		_char.col[3] = c.dgry
		_char.col[4] = c.dgry
		
	#endregion
	
	#region Viral
		
		ds_list_add(actorLst,instance_create_layer(0,0,"MG",oChar))
		var _char = actorLst[|ds_list_size(actorLst)-1]
		_char.dia[$ K.NM] = ACTORn[ACTOR.VIRAL]
		_char.dia[$ K.SX]  = SEX.FEMALE
		_char.body = sprNA
		_char.bodyPol = 1
		_char.head = sprNA
		_char.headPol = 1
		_char.uid = ACTOR.VIRAL
		_char.font1 = fFakeLove
		_char.font2 = fInfect
		_char.col[1] = make_color_rgb(255,192,255)
		_char.col[2] = make_color_rgb(192,128,192)
		_char.col[3] = make_color_rgb(255,192,255)
		_char.col[4] = make_color_rgb(192,128,192)
		
	#endregion
    
}

function db_context() {
	
    try { /* GMLive Call */ if (live_call()) return live_result; } catch(_ex) { /* GMLive not available? */ }
    
	if(file_exists(game_save_id+"nodes.json")) {
		
		var _str = ""
		var _f = file_text_open_read(game_save_id+"nodes.json")
		while(!file_text_eof(_f)) _str += file_text_readln(_f)
		CM = json_parse(_str)
		
	}
    
}