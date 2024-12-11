/// @description Context Map (It's a struct but w/e)
try { /* GMLive Call */ if (live_call()) return live_result; } catch(_ex) { /* GMLive not available? */ }
#region Mapped Contextuals...
	
	#region Draw Each Debug XY Entry per scni & Edit/Control Logic
		
		if(D.game_state == GAME.PLAY and D.scene_state == GAME.PLAY) {
			
			if(is(CM)) {
				
				// Loop through all the entries in CM
				// (a struct of structs, each struct an entry with relevant data)
				for(var i = 0; i < variable_instance_names_count(CM); i++) {
					
					var ao = draw_get_alpha()
					
					// Skip deleted entries
					if(!is(CM[$ string(i)])) continue
					
					// Is it an actual entry yet? If K.SCN+K.IN ain'T set then it ain'T defined at all yet
					if(variable_instance_exists(CM[$ string(i)],K.SCN+K.IN)) {
						
						#region Are we in the scni?
							
							if(CM[$ string(i)][$ K.SCN+K.IN] == D.scni) {
								
								#region Ensure needed bools for checks
									
									if(!variable_instance_exists(CM[$ string(i)],K.FOD))
										CM[$ string(i)][$ K.FOD] = F
									if(!variable_instance_exists(CM[$ string(i)],K.HLT))
										CM[$ string(i)][$ K.HLT] = F
									if(!variable_instance_exists(CM[$ string(i)],K.DTR))
										CM[$ string(i)][$ K.DTR] = F
									if(!variable_instance_exists(CM[$ string(i)],K.DTD))
										CM[$ string(i)][$ K.DTD] = F
									
								#endregion
								
								#region Scene K.DTD (Skip)
									
									if(CM[$ string(i)][$ K.DTD]) continue
									
								#endregion
								
								#region Scene WH Sanity
									
									if(variable_instance_exists(CM[$ string(i)],K.WH2))
										CM[$ string(i)][$ K.WH2] = [D.bgImg.sprite_width,D.bgImg.sprite_height]
									
								#endregion
								
								#region What shape? Circle or Rectangle?
									
									if(variable_instance_exists(CM[$ string(i)],K.SHP)) {
										
										if(CM[$ string(i)][$ K.SHP] == "rect") {
											
											#region Draw Debug XY Rectangles
												
												if(variable_instance_exists(CM[$ string(i)],K.XY4)) {
													
													#region Init
														
														var _dw2 = (D.bgImg.sprite_width-WW)/2
														var _dh2 = (D.bgImg.sprite_height-WH)/2
														
														// Init (First coordinate)
														var _xy4 = [CM[$ string(i)][$ K.XY4][0]*CM[$ string(i)][$ K.WH2][0]+D.bgImg.dltx-_dw2,
															CM[$ string(i)][$ K.XY4][1]*CM[$ string(i)][$ K.WH2][1]+D.bgImg.dlty-_dh2]
														
													#endregion
													
													#region 2nd Coordinate?
														
														if(array_length(CM[$ string(i)][$ K.XY4]) == 4) {
															
															#region Do have 2nd Coordinate, Full Draw
																
																// Init 2nd Coordinate
																_xy4[2] = CM[$ string(i)][$ K.XY4][2]*CM[$ string(i)][$ K.WH2][0]+D.bgImg.dltx-_dw2
																_xy4[3] = CM[$ string(i)][$ K.XY4][3]*CM[$ string(i)][$ K.WH2][1]+D.bgImg.dlty-_dh2
																
																#region Draw Additional Vars
																	
																	#region Mouse Hover
																		
																		if(mouse_in_rectangle(_xy4) and !D.ctrlOverride and D.fd <= 0 and !TRAN.override
																			and variable_instance_exists(CM[$ string(i)],K.HVR)
																			and variable_instance_exists(CM[$ string(i)],K.FND)) {
																			
																			// Set Hover
																			D.isHvr = T
																			
																			if(CM[$ string(i)][$ K.HVR] and (!CM[$ string(i)][$ K.FND]
																					or (CM[$ string(i)][$ K.FND] and CM[$ string(i)][$ K.FOD]))) {
																				
																				if(variable_instance_exists(CM[$ string(i)],K.STR)) {
																					
																					if(CM[$ string(i)][$ K.STR] != noone
																						and is_string(CM[$ string(i)][$ K.STR])) {
																						
																						#region Draw Hover/Found Messages on Cursor
																							
																							draw_set_font(fNeu)
																							var _w = D.bgImg.sprite_width/6
																							var strw = string_width_ext(CM[$ string(i)][$ K.STR],STRH,_w)
																							var strh = string_height_ext(CM[$ string(i)][$ K.STR],STRH,_w)
																							
																							// Draw and Reset
																							var hvo = [draw_get_halign(),draw_get_valign()]
																							var ao = draw_get_alpha()
																							var hv = [fa_left,fa_top]
																							var xx = WMX+STRH
																							var yy = WMY+STRH
																							if(xx+strw > WW) {
																								hv[0] = fa_right
																								xx = WMX-STRH
																							}
																							if(yy+strh > WH) {
																								hv[1] = fa_bottom
																								yy = WMY-STRH
																							}
																							draw_set_hvalign(hv)
																							draw_text_ext_color(xx,yy,CM[$ string(i)][$ K.STR],
																								STRH,_w,c.wht,c.wht,c.wht,c.wht,D.hvrPct)
																							draw_set_hvalign(hvo)
																							
																						#endregion
																						
																					}
																					
																				}
																				
																				#region Highlight
																					
																					if(variable_instance_exists(CM[$ string(i)],K.HLT)) {
																						
																						if(CM[$ string(i)][$ K.HLT]) {
																							
																							var ao = draw_get_alpha()
																							if(MBL) draw_set_alpha(D.hvrPct/6)
																							else draw_set_alpha(D.hvrPct/5)
																							
																							draw_rectangle_color(_xy4[0],_xy4[1],_xy4[2],_xy4[3],c.wht,c.wht,c.wht,c.wht,F)
																							
																							draw_set_alpha(ao)
																							
																						}
																						
																					}
																					
																				#endregion Highlight
																				
																				#region Click Actions
																					
																					if(variable_instance_exists(CM[$ string(i)],K.CLK)) {
																						
																						#region Left Click
																							
																							if(CM[$ string(i)][$ K.CLK] == V.MB_LP and MBLP) {
																								
																								#region Anim
																									
																									if(variable_instance_exists(CM[$ string(i)],K.ANM)) {
																										
																										// TODO: Make Universal (Set for just animNews1 atm)
																										var _anim = instance_create_layer(0,0,"FG",oAnim)
																										_anim.sprite_index = animNews1
																										_anim.animStr = CM[$ string(i)][$ K.ANM]
																										_anim.scl = (WW*D.zmn)/sprite_get_width(_anim.sprite_index)
																										_anim.font = fFem
																										TRAN.to_anim = _anim
																										TRAN.zXYpct = [lerp(_xy4[0],_xy4[2],.5)/D.mwref,lerp(_xy4[1],_xy4[3],.5)/D.mhref]
																										// "Destroy"
																										if(CM[$ string(i)][$ K.DTR])
																											CM[$ string(i)][$ K.DTD] = T
																										break
																										
																									}
																									
																								#endregion
																								
																								#region Scene Change
																									
																									if(variable_instance_exists(CM[$ string(i)],K.SCN+K.TO)) {
																										
																										TRAN.to_scni = int64(CM[$ string(i)][$ K.SCN+K.TO])
																										TRAN.zXYpct = [lerp(_xy4[0],_xy4[2],.5)/D.mwref,lerp(_xy4[1],_xy4[3],.5)/D.mhref]
																										
																									}
																									
																								#endregion
																								
																								#region WIP Light Toggle (blendBG)
																									
																									if(variable_instance_exists(CM[$ string(i)],K.ENT)) {
																										
																										if(CM[$ string(i)][$ K.ENT] == "blendBG") {
																											
																											// Toggle/Set ENV
																											if(variable_instance_exists(S[$ string(D.scni)],K.ENV))
																												S[$ string(D.scni)][$ K.ENV] = !S[$ string(D.scni)][$ K.ENV];
																											else S[$ string(D.scni)][$ K.ENV] = T;
																											
																											if(variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD)) {
																												
																												// Single Blending Specified
																												if(S[$ string(D.scni)][$ K.ENV]) D.scnBlend2 = S[$ string(D.scni)][$ K.SCN+K.BLD]; // Brighter...
																												else D.scnBlend2 = color_darken(S[$ string(D.scni)][$ K.SCN+K.BLD],1/4); // Darker... ~25% Darker? WIP: Can make a variable here...
																												
																											} else if(variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD+K.TR)
																												and variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD+K.FL)) {
																												
																												// True & False Blending Specified
																												if(S[$ string(D.scni)][$ K.ENV]) D.scnBlend2 = S[$ string(D.scni)][$ K.SCN+K.BLD+K.TR]; // Brighter?
																												else D.scnBlend2 = S[$ string(D.scni)][$ K.SCN+K.BLD+K.FL]; // Darker?
																												
																											} else if(!variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD+K.TR)
																												and variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD+K.FL)) {
																												
																												// False Only Blending Specified
																												if(S[$ string(D.scni)][$ K.ENV]) D.scnBlend2 = c.wht; // Brighter...
																												else D.scnBlend2 = S[$ string(D.scni)][$ K.SCN+K.BLD+K.FL]; // Darker?
																												
																											} else if(variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD+K.TR)
																												and !variable_instance_exists(S[$ string(D.scni)],K.SCN+K.BLD+K.FL)) {
																												
																												// True Only Blending Specified
																												if(S[$ string(D.scni)][$ K.ENV]) D.scnBlend2 = S[$ string(D.scni)][$ K.SCN+K.BLD+K.TR]; // Brighter?
																												else D.scnBlend2 = c.dgry; // Darker...
																												
																											} else {
																												
																												// No Blending Specified
																												if(S[$ string(D.scni)][$ K.ENV]) D.scnBlend2 = c.wht; // Brighter...
																												else D.scnBlend2 = c.dgry; // Darker...
																												
																											}
																											
																										}
																										
																									}
																									
																									
																								#endregion
																								
																								// Delay to Prevent Click-Thru
																								D.fd = 4
																								
																							}
																							
																						#endregion
																						
																					}
																					
																				#endregion
																				
																				/* N/A
																				if(variable_instance_exists(CM[$ string(i)],K.ENT)) {
																					
																					if(CM[$ string(i)][$ K.ENT] != noone
																						and is_string(CM[$ string(i)][$ K.ENT])) {
																						
																						#region Entity Spawn
																							switch(CM[$ string(i)][$ K.ENT]) {
																								
																								case "SniperLogBook": {
																									
																									if(!variable_instance_exists(s.set.entity,"SniperLogBook")) {
																										
																										var _xy = [irandom_range(_xy4[0],_xy4[2])-D.bgImg.sprite_width,irandom_range(_xy4[1],_xy4[3])-D.bgImg.sprite_height]
																										s.set.entity[$ "SniperLogBook"] = init_entity(_xy,"Armory Logbook",ent.game,scenei,s)
																										var _ent = s.set.entity[$ "SniperLogBook"]
																										_ent.gameObj = eSniperGame
																										_ent.spr = sprLogBook
																										_ent.sprRot = random_range(-45,45)
																										_ent.state = ent.game
																										_ent.durability = 1
																										
																									}
																									break
																									
																								}
																								
																							}
																						#endregion
																						
																					}
																					
																				}
																				*/
																				
																			}
																			
																			/*/Found?
																			if(CM[$ string(i)][$ K.FND] and !CM[$ string(i)][$ K.FOD] and p.search.done)
																				CM[$ string(i)][$ K.FOD] = T
																			*/
																			
																		}
																		
																	#endregion
																	
																#endregion
																
																// Reset alpha
																draw_set_alpha(ao)
																
															#endregion
															
														} else {}
														
													#endregion
													
												}
												
											#endregion
											
										} else if(CM[$ string(i)][$ K.SHP] == "circ") {
											
											#region Draw Debug XY Circles
												
												#region Inits
													
													var _dw2 = (D.bgImg.sprite_width-WW)/2
													var _dh2 = (D.bgImg.sprite_height-WH)/2
													
													var _xy2 = [CM[$ string(i)][$ K.XY2][0]*CM[$ string(i)][$ K.WH2][0]+D.bgImg.dltx-_dw2,
														CM[$ string(i)][$ K.XY2][1]*CM[$ string(i)][$ K.WH2][1]+D.bgImg.dlty-_dh2]
													var _rad = real(CM[$ string(i)][$ K.RAD])
													
												#endregion
												
												#region Mouse Hover
													
													if(mouse_in_circle(_xy2,_rad) and !D.ctrlOverride and D.fd <= 0 and !TRAN.override
														and variable_instance_exists(CM[$ string(i)],K.HVR)
															and variable_instance_exists(CM[$ string(i)],K.FND)) {
														
														// Set Hover
														D.isHvr = T
														
														if(CM[$ string(i)][$ K.HVR] and (!CM[$ string(i)][$ K.FND]
															or (CM[$ string(i)][$ K.FND] and CM[$ string(i)][$ K.FOD]))) {
															
															if(variable_instance_exists(CM[$ string(i)],K.STR)) {
																
																if(CM[$ string(i)][$ K.STR] != noone
																	and is_string(CM[$ string(i)][$ K.STR])) {
																	
																	#region Draw Hover/Found Messages on Cursor
																		
																		draw_set_font(fNeu)
																		var _w = D.bgImg.sprite_width/6
																		var strw = string_width_ext(CM[$ string(i)][$ K.STR],STRH,_w)
																		var strh = string_height_ext(CM[$ string(i)][$ K.STR],STRH,_w)
																		
																		// Draw and Reset
																		var hvo = [draw_get_halign(),draw_get_valign()]
																		var ao = draw_get_alpha()
																		var hv = [fa_left,fa_top]
																		var xx = WMX+STRH
																		var yy = WMY+STRH
																		if(xx+strw > WW) {
																			hv[0] = fa_right
																			xx = WMX-STRH
																		}
																		if(yy+strh > WH) {
																			hv[1] = fa_bottom
																			yy = WMY-STRH
																		}
																		draw_set_hvalign(hv)
																		draw_text_ext_color(xx,yy,CM[$ string(i)][$ K.STR],
																			STRH,_w,c.wht,c.wht,c.wht,c.wht,D.hvrPct)
																		draw_set_hvalign(hvo)
																		
																	#endregion
																	
																}
																
															}
															
															#region Highlight
																
																if(variable_instance_exists(CM[$ string(i)],K.HLT)) {
																	
																	if(CM[$ string(i)][$ K.HLT]) {
																		
																		var ao = draw_get_alpha()
																		if(MBL) draw_set_alpha(D.hvrPct/6)
																		else draw_set_alpha(D.hvrPct/5)
																		
																		draw_circle_color(_xy2[0],_xy2[1],_rad,c.wht,c.wht,F)
																		
																		draw_set_alpha(ao)
																		
																	}
																	
																}
																
															#endregion
															
															#region Click Actions
																
																if(variable_instance_exists(CM[$ string(i)],K.CLK)) {
																	
																	#region Left Click
																		
																		if(CM[$ string(i)][$ K.CLK] == V.MB_LP and MBLP) {
																			
																			#region Anim
																				
																				if(variable_instance_exists(CM[$ string(i)],K.ANM)) {
																					
																					// TODO: Make Universal (Set for just animNews1 atm)
																					var _anim = instance_create_layer(0,0,"FG",oAnim)
																					_anim.sprite_index = animNews1
																					_anim.animStr = CM[$ string(i)][$ K.ANM]
																					_anim.scl = (WW*D.zmn)/sprite_get_width(_anim.sprite_index)
																					_anim.font = fFem
																					TRAN.to_anim = _anim
																					TRAN.zXYpct = [_xy2[0]/D.mwref,_xy2[1]/D.mhref]
																					// "Destroy"
																					if(CM[$ string(i)][$ K.DTR])
																						CM[$ string(i)][$ K.DTD] = T
																					break
																					
																				}
																				
																			#endregion
																			
																			#region To Scene
																				
																				if(variable_instance_exists(CM[$ string(i)],K.SCN+K.TO)) {
																					
																					TRAN.to_scni = int64(CM[$ string(i)][$ K.SCN+K.TO])
																					TRAN.zXYpct = [_xy2[0]/D.mwref,_xy2[1]/D.mhref]
																					
																				}
																				
																			#endregion
																			
																			// Delay to Prevent Click-Thru
																			D.fd = 4
																			
																		}
																		
																	#endregion
																	
																}
																
															#endregion
															
														}
														
														/*
														// Found?
														if(CM[$ string(i)][$ K.FND] and !CM[$ string(i)][$ K.FOD])
															CM[$ string(i)][$ K.FOD] = T
														*/
														
													}
													
												#endregion
												
												#region Character/Entity Bodies
													
													if(CM[$ string(i)][$ K.ENT] == ACTOR.SYLAS) {
														
														// Init
														var _w = (D.bgImg.sprite_width)
														var _h = (D.bgImg.sprite_height)
														var _img = D.mgImg
														
														if(!P.suited and P.suitInst == N) {
															
															#region Create/Show Suit Instance
																
																_img.sprite_index = P.suitSpr
																_img.sclBase = 8
																_img.scl = (WW/_img.sclBase)/sprite_get_width(P.suitSpr)
																_img.xxpct = CM[$ string(i)][$ K.XY2][0]
																_img.yypct = CM[$ string(i)][$ K.XY2][1]
																_img.interact = T
																if(variable_instance_exists(CM[$ string(i)],K.STR))
																	_img.str = CM[$ string(i)][$ K.STR];
																P.suitInst = _img
																_img.inScn = D.scni
																
															#endregion
															
														} else if(P.suitInst != N and alarm[0] >= 0)
															P.suitInst.alarm[0] = 2;
														
													} else if(CM[$ string(i)][$ K.ENT] == V.STATIC
														and variable_instance_exists(CM[$ string(i)],K.SPR)) {
														
														#region Static - FG - Sprite
															
															var _spr = asset_get_index(CM[$ string(i)][$ K.SPR])
															if(_spr != F) {
																
																var _scl = (WW/4)/sprite_get_width(_spr)
																draw_sprite_ext(_spr,0,CM[$ string(i)][$ K.XY2][0],CM[$ string(i)][$ K.XY2][1],_scl,_scl,0,c.wht,1)
																
															}
															
														#endregion
														
													}
													
												#endregion
												
												// Reset Alpha
												draw_set_alpha(ao)
												
											#endregion
											
										}
										
									}
									
								#endregion
								
							}
							
						#endregion
						
					}
					
				}
				
			}
			
		}
		
	#endregion
	
#endregion