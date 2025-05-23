/// @description Game
/// @description Game

#region Game
	
	if(D.game_state == GAME.PLAY) {
		
		if(D.scene_state == GAME.INIT) {
			
			#region Init
				
				// Clears all dialogue control variables to default
				diaNar_reset()
				
				// Clear Actors
				D.actorLeft = N
				D.actorRight = N
				
				area_check()
				
			#endregion
			
			#region Init Scene
				
				#region Sky 0
					
					// Sprite
					if(variable_instance_exists(S[$ string(D.scni)],K.SK0+K.SPR))
						D.skyImg.sprite_index = S[$ string(D.scni)][$ K.SK0+K.SPR];
						
					// Pan Multiplier
					if(variable_instance_exists(S[$ string(D.scni)],K.SK0+K.PMT))
						D.skyImg.panMult = S[$ string(D.scni)][$ K.SK0+K.PMT];
						
					// Scale
					D.skyImg.scl = ((WW*D.zmn)/sprite_get_width(D.skyImg.sprite_index))*D.skyImg.sclMult
					if(variable_instance_exists(S[$ string(D.scni)],K.SK0+K.WMT))
						D.skyImg.sclMultW = S[$ string(D.scni)][$ K.SK0+K.WMT];
					if(variable_instance_exists(S[$ string(D.scni)],K.SK0+K.HMT))
						D.skyImg.sclMultH = S[$ string(D.scni)][$ K.SK0+K.HMT];
					with(D.skyImg) {
						
						if(!is_undefined(sclMultW)) sclW = ((WW*D.zmn)/sprite_get_width(sprite_index))*sclMultW;
						else sclW = U;
						if(!is_undefined(sclMultH)) sclH = ((WW*D.zmn)/sprite_get_width(sprite_index))*sclMultH;
						else sclH = U;
						
					}
					
					
				#endregion
				
				#region BD 0
					
					// Sprite
					if(variable_instance_exists(S[$ string(D.scni)],K.BD0+K.SPR))
						D.bdImg.sprite_index = S[$ string(D.scni)][$ K.BD0+K.SPR];
						
					// Pan Multiplier
					if(variable_instance_exists(S[$ string(D.scni)],K.BD0+K.PMT))
						D.bdImg.panMult = S[$ string(D.scni)][$ K.BD0+K.PMT];
						
					// Scale
					D.bdImg.scl = ((WW*D.zmn)/sprite_get_width(D.bdImg.sprite_index))*D.bdImg.sclMult
					if(variable_instance_exists(S[$ string(D.scni)],K.BD0+K.WMT))
						D.bdImg.sclMultW = S[$ string(D.scni)][$ K.BD0+K.WMT];
					if(variable_instance_exists(S[$ string(D.scni)],K.BD0+K.HMT))
						D.bdImg.sclMultH = S[$ string(D.scni)][$ K.BD0+K.HMT];
					with(D.bdImg) {
						
						if(!is_undefined(sclMultW)) sclW = ((WW*D.zmn)/sprite_get_width(sprite_index))*sclMultW;
						else sclW = U;
						if(!is_undefined(sclMultH)) sclH = ((WW*D.zmn)/sprite_get_width(sprite_index))*sclMultH;
						else sclH = U;
						
					}
					
					
				#endregion
				
				#region BG 0 Layer 2
					
					// Sprite
					if(variable_instance_exists(S[$ string(D.scni)],K.BG0+K.L2+K.SPR))
						D.bgL2Img.sprite_index = S[$ string(D.scni)][$ K.BG0+K.L2+K.SPR];
						
					// Pan Multiplier
					if(variable_instance_exists(S[$ string(D.scni)],K.BG0+K.L2+K.PMT))
						D.bgL2Img.panMult = S[$ string(D.scni)][$ K.BG0+K.L2+K.PMT];
						
					// Scale
					D.bgL2Img.scl = ((WW*D.zmn)/sprite_get_width(D.bgL2Img.sprite_index))*D.bgL2Img.sclMult
					if(variable_instance_exists(S[$ string(D.scni)],K.BG0+K.L2+K.WMT))
						D.bgL2Img.sclMultW = S[$ string(D.scni)][$ K.BG0+K.L2+K.WMT];
					if(variable_instance_exists(S[$ string(D.scni)],K.BG0+K.L2+K.HMT))
						D.bgL2Img.sclMultH = S[$ string(D.scni)][$ K.BG0+K.L2+K.HMT];
					with(D.bgL2Img) {
						
						if(!is_undefined(sclMultW)) sclW = ((WW*D.zmn)/sprite_get_width(sprite_index))*sclMultW;
						else sclW = U;
						if(!is_undefined(sclMultH)) sclH = ((WW*D.zmn)/sprite_get_width(sprite_index))*sclMultH;
						else sclH = U;
						
					}
					
					
				#endregion
				
				#region BG 0 Layer 1
					
					// Sprite
					if(variable_instance_exists(S[$ string(D.scni)],K.BG0+K.L1+K.SPR))
						D.bgL1Img.sprite_index = S[$ string(D.scni)][$ K.BG0+K.L1+K.SPR];
						
					// Pan Multiplier
					if(variable_instance_exists(S[$ string(D.scni)],K.BG0+K.L1+K.PMT))
						D.bgL1Img.panMult = S[$ string(D.scni)][$ K.BG0+K.L1+K.PMT];
						
					// Scale
					D.bgL1Img.scl = ((WW*D.zmn)/sprite_get_width(D.bgL1Img.sprite_index))*D.bgL1Img.sclMult
					if(variable_instance_exists(S[$ string(D.scni)],K.BG0+K.L1+K.WMT))
						D.bgL1Img.sclMultW = S[$ string(D.scni)][$ K.BG0+K.L1+K.WMT];
					if(variable_instance_exists(S[$ string(D.scni)],K.BG0+K.L1+K.HMT))
						D.bgL1Img.sclMultH = S[$ string(D.scni)][$ K.BG0+K.L1+K.HMT];
					with(D.bgL1Img) {
						
						if(!is_undefined(sclMultW)) sclW = ((WW*D.zmn)/sprite_get_width(sprite_index))*sclMultW;
						else sclW = U;
						if(!is_undefined(sclMultH)) sclH = ((WW*D.zmn)/sprite_get_width(sprite_index))*sclMultH;
						else sclH = U;
						
					}
					
				#endregion
				
				#region BG 0
					
					// Sprite
					if(variable_instance_exists(S[$ string(D.scni)],K.BG0+K.SPR))
						D.bgImg.sprite_index = S[$ string(D.scni)][$ K.BG0+K.SPR];
						
					// Pan Multiplier
					if(variable_instance_exists(S[$ string(D.scni)],K.BG0+K.PMT))
						D.bgImg.panMult = S[$ string(D.scni)][$ K.BG0+K.PMT];
						
					// Scale
					D.bgImg.scl = ((WW*D.zmn)/sprite_get_width(D.bgImg.sprite_index))*D.bgImg.sclMult
					if(variable_instance_exists(S[$ string(D.scni)],K.BG0+K.WMT))
						D.bgImg.sclMultW = S[$ string(D.scni)][$ K.BG0+K.WMT];
					if(variable_instance_exists(S[$ string(D.scni)],K.BG0+K.HMT))
						D.bgImg.sclMultH = S[$ string(D.scni)][$ K.BG0+K.HMT];
					with(D.bgImg) {
						
						if(!is_undefined(sclMultW)) sclW = ((WW*D.zmn)/sprite_get_width(sprite_index))*sclMultW;
						else sclW = U;
						if(!is_undefined(sclMultH)) sclH = ((WW*D.zmn)/sprite_get_width(sprite_index))*sclMultH;
						else sclH = U;
						
					}
					
				#endregion
				
			#endregion
			
			#region Scene Characters
				
				if(!array_equals(D.scnActArr,[]) and is_scn(N)) {
					
					// Left
					if(is(D.scnActArr[D.scni][0])) {
						
						var _act = D.scnActArr[D.scni][0]
						if(!instance_of(_act,oChar)) _act = actor_find(_act);
						if(instance_of(_act,oChar) and !in_party(_act)) {
							
							_act.scni = D.scni
							D.actorLeft = _act
							
						}
						
					}
					
					// Right
					if(is(D.scnActArr[D.scni][1])) {
						
						var _act = D.scnActArr[D.scni][1]
						if(!instance_of(_act,oChar)) _act = actor_find(_act);
						if(instance_of(_act,oChar) and !in_party(_act)) {
							
							_act.scni = D.scni
							D.actorRight = _act
							
						}
						
					}
					
				}
				
			#endregion
			
			#region Environmental
				
				if(variable_instance_exists(S[$ string(D.scni)],K.ENV)) {
					
					#region Blending...
						
						if(variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD)) {
							
							#region Single Blend
								
								if(variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD+K.MT)) {
									
									// Single Blend... w/ Multiplier
									if(S[$ string(D.scni)][$ K.ENV]) scene_set_blend(S[$ string(D.scni)][$ K.SCN+K.BLD]); // Brighter...
									else scene_set_blend(color_brightness(S[$ string(D.scni)][$ K.SCN+K.BLD],S[$ string(D.scni)][$ K.SCN+K.BLD+K.MT])); // Darker...
									
								} else {
									
									// Single Blend... No Multiplier, Default 1/4
									if(S[$ string(D.scni)][$ K.ENV]) scene_set_blend(S[$ string(D.scni)][$ K.SCN+K.BLD]); // Brighter...
									else scene_set_blend(color_brightness(S[$ string(D.scni)][$ K.SCN+K.BLD],1/4)); // Darker...
									
								}
								
							#endregion
							
						} else if(variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD+K.TR)
							and variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD+K.FL)) {
							
							#region True & False Blend...
								
								if(S[$ string(D.scni)][$ K.ENV]) scene_set_blend(S[$ string(D.scni)][$ K.SCN+K.BLD+K.TR]); // Brighter...
								else scene_set_blend(S[$ string(D.scni)][$ K.SCN+K.BLD+K.FL]); // Darker...
								
							#endregion
							
						} else if(!variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD+K.TR)
							and variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD+K.FL)) {
							
							#region False Only Blend...
								
								if(S[$ string(D.scni)][$ K.ENV]) scene_set_blend(c.wht); // Brighter...
								else scene_set_blend(S[$ string(D.scni)][$ K.SCN+K.BLD+K.FL]); // Darker?
								
							#endregion
							
						} else if(variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD+K.TR)
							and !variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD+K.FL)) {
							
							#region True Only Blend...
								
								if(S[$ string(D.scni)][$ K.ENV]) scene_set_blend(S[$ string(D.scni)][$ K.SCN+K.BLD+K.TR]); // Brighter?
								else scene_set_blend(c.dgry); // Darker...
								
							#endregion
							
						} else {
							
							#region No Blend
								
								if(variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD+K.MT)) {
									
									// No Blend... w/ Multiplier
									if(S[$ string(D.scni)][$ K.ENV]) scene_set_blend(c.wht); // Brighter...
									else scene_set_blend(color_brightness(c.wht,S[$ string(D.scni)][$ K.SCN+K.BLD+K.MT])); // Darker...
									
								} else {
									
									// No Blend... No Multiplier, Default 1/4
									if(S[$ string(D.scni)][$ K.ENV]) scene_set_blend(c.wht); // Brighter...
									else scene_set_blend(color_brightness(c.wht,1/4)); // Darker...
									
								}
								
							#endregion
							
						}
						
					#endregion
					
				} else scene_set_blend(c.wht); // Default if no environment set... No Blend...
				
			#endregion
			
			#region Travellers
				
				if(variable_instance_exists(S[$ string(D.scni)],K.TRA+K.CNT )) {
					
					var cnt = S[$ string(D.scni)][$ K.TRA+K.CNT]
					for(var i = 0; i < cnt; i++) {
						// TODO TRAVELLERS SPAWNS
					}
					
				}
				if(variable_instance_exists(S[$ string(D.scni)],K.TRA+K.XRG)){}
				if(variable_instance_exists(S[$ string(D.scni)],K.TRA+K.YRG)){}
				if(variable_instance_exists(S[$ string(D.scni)],K.TRA+K.ZRG)){}
				
			#endregion
			
			// Set Play
			D.scene_state = GAME.PLAY
			
		}
		
		#region Fade-In BGM
			
			// D.bgm = Scene Music
			// bgm   = Default Music
			if(audio_is_playing(D.bgm)) {
				
				#region Stop Previous Scene Music and start new One
					
					if(variable_instance_exists(S[$string(D.scni)],K.PLY) and is(S[$ D.scni][$ K.PLY])) {
						
						if(audio_exists(S[$ D.scni][$ K.PLY]) and S[$ D.scni][$ K.PLY] != D.bgm and audio_sound_get_gain(D.bgmID) <= 0) {
							
							audio_stop_sound(D.bgm)
							D.bgm = S[$ D.scni][$ K.PLY]
							D.bgmID = audio_play_sound_on(bgmEmt,D.bgm,F,0,0)
							if(audio_is_playing(bgm) and audio_sound_get_gain(bgmID) > 0) audio_sound_gain(bgmID,0,4000);
							audio_sound_gain(D.bgmID,2/3,4000)
							S[$ D.scni][$ K.PLY] = N
							
						} else if(audio_sound_get_gain(D.bgmID) >= 2/3) audio_sound_gain(D.bgmID,0,4000);
						
					}
					
				#endregion
				
			} else if(audio_is_playing(bgm)) {
				
				#region Start/Stop Default Retrowave and Play Scene Music
					
					if(variable_instance_exists(S[$string(D.scni)],K.PLY) and is(S[$ D.scni][$ K.PLY])) {
						
						if(audio_exists(S[$ D.scni][$ K.PLY]) and S[$ D.scni][$ K.PLY] != D.bgm) {
							
							D.bgm = S[$ D.scni][$ K.PLY]
							D.bgmID = audio_play_sound_on(bgmEmt,D.bgm,F,0,0)
							if(audio_is_playing(bgm) and audio_sound_get_gain(bgmID) > 0) audio_sound_gain(bgmID,0,4000);
							audio_sound_gain(D.bgmID,2/3,4000)
							
						}
						S[$ D.scni][$ K.PLY] = N
						
					} else if(audio_is_playing(bgm) and audio_sound_get_gain(bgmID) <= 0) audio_sound_gain(bgmID,1/3,4000);
					
				#endregion
				
			} else bgmID = audio_play_sound_on(bgmEmt,bgm,T,0,0);
			
		#endregion
		
	}
	
#endregion

#region Application Surface Draw (Shaders)
	
	/* OLD
	var exSurf = surface_create(WW,WH)
	surface_set_target(exSurf)
	var arg = shader_get_uniform(shExtractBright, "threshold")
	shader_set_uniform_f(arg, 0.8)
	shader_set(shExtractBright)
	draw_surface_ext(surfBuf, 0, 0, 1, 1, 0, c_white, 1)
	surface_reset_target()
	
	var blrSurf = surface_create(WW,WH)
	surface_set_target(blrSurf)
	shader_set(shBlur)
	arg = shader_get_uniform(shBlur, "blurStrength")
	shader_set_uniform_f(arg, 4.0)
	draw_surface_ext(exSurf, 0, 0, 1, 1, 0, c_white, 1)
	surface_reset_target()
	
	shader_set(shCombine)
	arg = shader_get_uniform(shCombine, "originalTexture")
	shader_set_uniform_f(arg, surface_get_texture(surfBuf))
	arg = shader_get_uniform(shCombine, "bloomTexture")
	shader_set_uniform_f(arg, surface_get_texture(blrSurf))
	arg = shader_get_uniform(shCombine, "bloomIntensity")
	shader_set_uniform_f(arg, 4.0)
	draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, 1)
	shader_reset()
	surface_free(exSurf)
	surface_free(blrSurf)
	surface_free(surfBuf)
	surfBuf = surface_create(WW,WH)
	*/
	
#endregion