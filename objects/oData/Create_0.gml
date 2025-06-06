#region Global Variables
	
	#region Init
		
		game_state = GAME.INIT
		diaParL = ds_list_create()
		diai = 0
		animPlay = N
		focus = N
		focusL = N
		focusR = N
		focusM = N
		fd = 4 // Frame Delay
		bgm = N
		bgmID = N
		
	#endregion
	
	#region Random Actor Asset Arrays
		
		// Actor List
		actorL = ds_list_create()
		
		cfArr = [sprCF1,sprCF2,
			sprCF3,sprCF4,sprCF5,
			sprCF6,sprCF7,sprCF8,
			sprCF9,sprCF10,sprCF11,
			sprCF12,sprCF13,sprCF14]
		cfiArr = []
		cfLoaded = F
		
		slumCFArr = [sprSlumCF1,sprSlumCF2,
			sprSlumCF3,sprSlumCF4,sprSlumCF5,
			sprSlumCF6,sprSlumCF7,sprSlumCF8,
			sprSlumCF9,sprSlumCF10]
		slumCFiArr = []
		slumCFLoaded = F
		
		brothCFArr = [sprBrothCF1,sprBrothCF2,
			sprBrothCF3,sprBrothCF4,sprBrothCF5,
			sprBrothCF6,sprBrothCF7,sprBrothCF8,
			sprBrothCF9,sprBrothCF10,sprBrothCF11,
			sprBrothCF12]
		brothCFiArr = []
		brothCFLoaded = F
		
		fArr = [sprF1,sprF2,
			sprF3,sprF4,sprF5,
			sprF6,sprF7,sprF8,
			sprF9,sprF10,sprF11,
			sprF12,sprF13,sprF14,
			sprF15,sprF16,sprF17,
			sprF18,sprF19,sprF20,
			sprF21,sprF22,sprF23,
			sprF24,sprF25,sprF26]
		fiArr = []
		fLoaded = F
		
		cmArr = [sprCM1,sprCM2,
			sprCM3,sprCM4,sprCM5,
			sprCM6,sprCM7,sprCM8,
			sprCM9,sprCM10,sprCM11,
			sprCM12,sprCM13,sprCM14,
			sprCM15,sprCM16,sprCM17,
			sprCM18,sprCM19,sprCM20,
			sprCM21]
		cmiArr = []
		cmLoaded = F
		
		slumCMArr = [sprSlumCM1,sprSlumCM2,
			sprSlumCM3,sprSlumCM4,sprSlumCM5,
			sprSlumCM6,sprSlumCM7]
		slumCMiArr = []
		slumCMLoaded = F
		
		mArr = [sprM1,sprM2,
			sprM3,sprM4,sprM5,
			sprM6,sprM7,sprM8,
			sprM9,sprM10,sprM11,
			sprM12,sprM13,sprM14,
			sprM15]
		miArr = []
		mLoaded = F
		
	#endregion
	
	// Init Draw Olds; HVO,FO,AO,CO
	draw_reset()
	
	#region Image Objects (Layers)
		
		// Sky
		skyImg = instance_create_layer(0,0,"BG",oImage)
		skyImg.persistent = T
		skyImg.depth = lerp(layer_get_depth("BG"),layer_get_depth("BGFade")+1,1/6)
		// Backdrop
		bdImg = instance_create_layer(0,0,"BG",oImage)
		bdImg.persistent = T
		bdImg.depth = lerp(layer_get_depth("BG"),layer_get_depth("BGFade")+1,2/6)
		// Background Layer 2
		bgL2Img = instance_create_layer(0,0,"BG",oImage)
		bgL2Img.persistent = T
		bgL2Img.depth = lerp(layer_get_depth("BG"),layer_get_depth("BGFade")+1,3/6)
		
		// Background Layer 1
		bgL1Img = instance_create_layer(0,0,"BG",oImage)
		bgL1Img.persistent = T
		bgL1Img.depth = lerp(layer_get_depth("BG"),layer_get_depth("BGFade")+1,4/6)
		
		// Background
		bgImg = instance_create_layer(0,0,"BG",oImage)
		bgImg.persistent = T
		bgImg.depth = lerp(layer_get_depth("BG"),layer_get_depth("BGFade")+1,5/6)
		
		// Middleground
		mgImg = instance_create_layer(0,0,"MG",oImage)
		mgImg.persistent = T
		
	#endregion
	
	#region Actor Objects (Layer)
		
		// Char L
		actorLeft = N
		// Char R
		actorRight = N
		
	#endregion
	
	#region Foreground
		
		fgImg = instance_create_layer(0,0,"FG",oImage)
		fgImg.persistent = T
		
	#endregion
	
	#region Global Factors
		
		wref = max(1,bgImg.sprite_width)
		href = max(1,bgImg.sprite_height)
		bgmxpct = MX/wref
		bgmypct = MY/href
		mwref = 1
		mhref = 1
		bgdltx = 1
		bgdlty = 1
		if(bbox_sanity(bgImg)) {
			
			mwref = max(1,bgImg.bbox_right)
			mhref = max(1,bgImg.bbox_bottom)
			bgdltx = bgImg.bbox_left
			bgdlty = bgImg.bbox_top
			
		}
		
	#endregion
	
#endregion

#region Gameplay Globals
	
	// Zoom
	zmn = 1.05
	z   = zmn
	zmx = 1.15
	zoomed = F
	zo = zmn
	
	// Hover
	isHvr = N
	isHvrO = N
	hvrDel = GSPD/2
	hvrDeli = 0
	hvrPct = 0
	btnHvr = F
	btnHvr2 = F
	
	// Overrides
	ctrlOverride = F
	
	// circs
	circ1 = 0
	circ1i = 0
	circ1iv = 0
	circ2 = 0
	circ2i = 0
	circ2iv = 0
	circ3 = 0
	circ3i = 0
	circ3iv = 0
	
	// Timers
	// Normal ( -> Runtime)
	fr = 0
	sc = 0
	mn = 0
	hr = 0
	// States; Randomized Start
	frs = chance(50)
	scs = chance(50)
	mns = chance(50)
	hrs = chance(50)
	
#endregion

#region Dialogue Globals
	
	#region DiaNar/Universal
		
		diaOverride = F
		diaZmn = 1
		diaZmx = 1.2
		diaDel = GSPD
		diaDeli = 0
		diaDelPct = 0
		diaDeli2 = 0
		diaDelPct2 = 0
		diaSpeaker = N
		diaNestL = ds_list_create()
		diaTranDel = GSPD*(2/3)
		diaTranDeli = 0
		diaTranPct = 0
		diaSoftClose = F
		diad = 0
		diaNestDir = T // T == Into Nest, F == Out of Nest
		diaContinue = F
		diaLnkA = N
		diaLnkB = N
		diaLnkC = N
		diaLnkD = N
		diaLnkE = N
		diaAnimTo = N
		diaTrigi = 0
		diaEnter = F
		diaDone = F
		diaDly = GSPD*2
		diaI = 0
		diaPct = 0
		diaInstArr = N // Array to hold instance vars (i.e. [actor id, image] to transition to) ([Inst]ance [Arr]ay)
		diaImn = 0
		diaImx = diaDly
		diaInstRpt = N
		diaLBDrawn = F
		
	#endregion
	
	#region Combat Specific
		
		diaOpp = N
		
		#region Asset Arrays
			
			#region Male
				
				comMGuard = [sprComMGuard1,sprComMGuard2]
				comMNeutral = [sprComMNeutral1,sprComMNeutral2]
				comMStumble = [sprComMStumble1,sprComMStumble2]
				comMRecoverN = [sprComMRecoverN1]
				comMRecoverS = [sprComMRecoverS1]
				comMRecoverW = [sprComMRecoverW1]
				comMLoaded = F
				
			#endregion
			
			#region Female
				
				comFGuard = [sprComFGuard1,sprComFGuard2]
				comFNeutral = [sprComFNeutral1,sprComFNeutral2]
				comFStumble = [sprComFStumble1,sprComFStumble2]
				comFRecoverN = [sprComFRecoverN1]
				comFRecoverS = [sprComFRecoverS1]
				comFRecoverW = [sprComFRecoverW1]
				comFLoaded = F
				
			#endregion
			
			#region Actions
				
				comActBlock = [sprComActBlock1]
				comActFist = [sprComActFist1]
				comActGrab = [sprComActGrab1]
				comActHandshake = [sprComActHandshake1]
				comActLoaded = F
				
			#endregion
			
		#endregion
		
	#endregion
	
#endregion

#region Scene Globals
	
	// Scene Basics
	scni         = -1
	scene_state  = GAME.INIT
	
	// Scene Blend/Light
	scnBlend1    = c.wht
	scnBlend2    = c.wht
	scnBlend3    = c.wht
	scnLight     = N
	scnBlendDel  = GSPD/4
	scnBlendDeli = 0
	scnBlendPct  = 0
	
	// Scene Actors
	scnActArr = []
	scnActSel = N
	
#endregion

#region Scene Struct
	
	#macro S global.scene_struct
	S = {}
	
	// Init Scene Struct
	db_scn()
	
#endregion

#region Narrative Struct WIP
	
	#region Init
		
		// Narrative Struct
		#macro NS global.narrative_struct
		NS = {}
		NS[$ K.I] = 0
		NS[$ K.CAR] = 0
		NS[$ K.CAR+K.DL] = GSPD*.2
		NS[$ K.CAR+K.DLI] = 0
		
		// Combat Struct
		#macro CS global.combat_struct
		CS = {}
		CS[$ K.I] = 0
		CS[$ K.CAR] = 0
		CS[$ K.CAR+K.DL] = GSPD*.2
		CS[$ K.CAR+K.DLI] = 0
		
	#endregion
	
	// Init Narrative Struct
	db_diaNar()
	
#endregion

#region Contextuals Map
	
	#macro CM global.contextuals_map
	CM = U
	db_context()
	cmHvr = F
	
#endregion

#region Init Char List
	
	db_act()
	
#endregion

#region Global Surfaces
	
	loadSurf = U
	
#endregion

#region Loads
	
	load_common()
	
#endregion