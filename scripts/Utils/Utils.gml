function chance(pct) {
	
	var r = random_range(0,100)
	if(pct > r or pct == 100) return T
	else if(pct < r) return F
	else return chance(pct)
	
}

function flip() {
	
	if(chance(50)) return 1
	else return -1
	
}

function flipr() {
	
	if(chance(50)) return random_range(.01,1)
	else return -random_range(.01,1)
	
}

function actor_find(_uid) {
	
	for(var i = 0; i < ds_list_size(D.actorLst); i++) {
		
		if(_uid == D.actorLst[|i].uid)
			return D.actorLst[|i];
		
	}
	
	return N
	
}

function variable_instance_is_empty(inst) {
	
	return variable_instance_names_count(inst) <= 0
	
}

// WIP
function variable_instance_next_numKey(inst,stopAtEmpty) {
	
	// Init
	var rtn = N
	
	for(var i = 0; i < variable_instance_names_count(inst); i++) {
		
		if(stopAtEmpty) {
			
			// Return deleted/broken entry
			if(!variable_instance_exists(inst,string(i)) or !is(inst[$ i]) or variable_instance_is_empty(inst[$ i]))
				rtn = i;
			
		} else {
			
			// Skip deleted/broken entries
			if(!variable_instance_exists(inst,string(i)) or !is(inst[$ i]) or variable_instance_is_empty(inst[$ i])) continue;
			
		}
			
	}
	
}

function bbox_sanity(inst) {
	
	try {
		
		with(inst) {
			
			if(!is_nan(bbox_left) and !is_nan(bbox_top) and !is_nan(bbox_right) and !is_nan(bbox_bottom)) return T;
			
		}
		
	} catch(_ex) {}
	
	return F
	
}

function variable_instance_get_sorted_numKeys(struct,ascending) {
	
	// Init Keys Array
	var ks = variable_instance_get_names(struct)
	var rtn = []
	
	// Convert Numbers from Strings
	for(var i = 0; i < array_length(ks); i++) {
		
		// Convert and Add to return array
		if(is_string_real(ks[i]))
			rtn[array_length(rtn)] = real(ks[i]);
		
	}
	
	// Returns
	if(rtn == []) return N; // Nothing to return...
	else {
		
		// Sort & Return
		array_sort(rtn,ascending)
		return rtn
		
	}
	
}

function variable_instance_get_sorted_strKeys(struct,ascending) {
	
	// Init Keys Array
	var ks = variable_instance_get_names(struct)
	var rtn = []
	
	// Convert Numbers from Strings
	for(var i = 0; i < array_length(ks); i++) {
		
		// If not a number, add to return array...
		if(!is_string_real(ks[i])) rtn[array_length(rtn)] = ks[i];
		
	}
	
	// Returns
	if(rtn == []) return N; // Nothing to return...
	else {
		
		// Sort & Return
		array_sort(rtn,ascending)
		return rtn
		
	}
	 
}

function color_get_rgb(col) {
	
	return [color_get_red(col),color_get_green(col),color_get_blue(col)]
	
}

function color_make_rgb(colArr) {
	
	return make_color_rgb(colArr[0],colArr[1],colArr[2])
	
}

function color_brightness(col,mlt) {
	
	var _c = color_get_rgb(col)
	return make_color_rgb(_c[0]*mlt,_c[1]*mlt,_c[2]*mlt)
	
}

function scene_set_blend(col) {
	
	D.scnBlend1 = col
	D.scnBlend2 = col
	D.scnBlend3 = col
	
}

function mouse_in_window() {
	
	// Init Vars for Calc...
	var dmx = display_mouse_get_x()
	var dmy = display_mouse_get_y()
	var wx = window_get_x()
	var wy = window_get_y()
	
	// Return T/F if we are in window...
	return (dmx >= wx and dmx <= wx+WW and dmy >= wy and dmy <= wy+WH)
	
}

function struct_trim_and_backfill(inst) {
	
	if(is_struct(inst)) {
		
		// Init Loop; Length of Struct
		var len = variable_instance_names_count(inst)
		var last = F // To set to true if nothing to fill with
		for(var ix = 0; ix < len; ix++) {
			
			// Sanitize Empty Structs
			if(is_struct(inst[$ ix]) and variable_instance_names_count(inst[$ ix]) <= 0)
				inst[$ ix] = N;
			
			// This Spot is Empty? Fill it with next if able...
			if(inst[$ ix] == N and ix < len-1 and !last) {
				
				for(var iy = ix+1; iy < len; iy++) {
					
					// Sanitize Empty Structs
					if(is_struct(inst[$ iy]) and variable_instance_names_count(inst[$ iy]) <= 0)
						inst[$ iy] = N;
					
					// Is Sanitized; Is Done or Continue | Is Struct; Backfill it and Break...
					if(inst[$ iy] == N) {
						
						// Is Last; Done and Break | Not Last; Try Next
						if(iy == len-1) {
							
							// We will now go back to ix loop and delete all the sanitized entries...
							last = T
							break
							
						} else continue; // More to check; Keep going...
						
					} else if(is_struct(inst[$ iy])) {
						
						// Do Backfill...
						inst[$ ix] = variable_clone(inst[$ iy])
						inst[$ iy] = N // Then Sanitize Old Index
						break
						
					} else inst[$ iy] = N; // Sanitize by default
					
				}
				
			}
			
			// No more to backfill... Remove sanitized entries...
			if(last) variable_struct_remove(inst,string(ix));
			
		}
		
	}
	
}

function struct_find(inst,k) {
	
	try {
		
		if(variable_instance_exists(inst,k)) return inst[$ k];
		
	} catch(_ex) {}
	
	return U
	
}

function is_hover(inst) {
	
	// Return True if No Hover set or Hover is instance
	return ((!D.isHvr or D.isHvr == inst) and (!D.isHvro or D.isHvro == inst))
	
}

function is_debug(val) {
	
	try {
		
		if(DBG) {
			
			if(DBG.active) {
				
				return val;
				
			}
			
		}
		
	} catch(_ex) {}
	
	return F
	
}

function trig_iter(struct) {
	
	if(is_struct(struct)) {
		
		#region Ensure Variables...
			
			if(!variable_instance_exists(struct,"seed")) struct[$  "seed"] = random_range(pi/10,pi)*10000;
			if(!variable_instance_exists(struct,"seed2")) struct[$  "seed2"] = random_range(pi/10,pi)*10000;
			if(!variable_instance_exists(struct,"i")) struct[$  "i"] = random(GSPD*8);
			if(!variable_instance_exists(struct,"i2")) struct[$  "i2"] = random(GSPD*8);
			if(!variable_instance_exists(struct,"d")) struct[$  "d"] = GSPD*16;
			if(!variable_instance_exists(struct,"d2")) struct[$  "d2"] = GSPD*16;
			if(!variable_instance_exists(struct,"xi")) struct[$  "xi"] = 0;
			if(!variable_instance_exists(struct,"pct")) struct[$  "pct"] = 0;
			if(!variable_instance_exists(struct,"pct2")) struct[$  "pct2"] = 0;
			if(!variable_instance_exists(struct,"deg")) struct[$  "deg"] = 0;
			if(!variable_instance_exists(struct,"deg2")) struct[$  "deg2"] = 0;
			if(!variable_instance_exists(struct,"sn")) struct[$  "sn"] = -sin(degtorad(0));
			if(!variable_instance_exists(struct,"snMlt")) struct[$  "snMlt"] = 0;
			if(!variable_instance_exists(struct,"snM")) struct[$  "snM"] = struct[$ "sn"]*(struct[$ "snMlt"]+1);
			if(!variable_instance_exists(struct,"sn2")) struct[$  "sn2"] = struct[$ "sn"]/2;
			if(!variable_instance_exists(struct,"csn")) struct[$  "csn"] = cos(degtorad(0));
			if(!variable_instance_exists(struct,"csnMlt")) struct[$  "csnMlt"] = 0;
			if(!variable_instance_exists(struct,"csnM")) struct[$  "csnM"] = struct[$ "csn"]*(struct[$ "csnMlt"]+1);
			if(!variable_instance_exists(struct,"csn2")) struct[$  "csn2"] = struct[$ "csn"]/2;
			
		#endregion
		
		#region Iterate + Updates
			
			with(struct) {
				
				// Iterate i -> d -> i = 0
				if(i >= d) i = 0;
				else i+=1;
				if(i2 < 0) i2 = d2+i2;
				else i2-=1;
				
				
				// Calc Updates
				xi++;
				pct = i/d
				pct2 = i2/d2
				deg = 360*pct
				deg2 = 360*pct2
				sn = -sin(degtorad(deg))
				sn2 = -sin(degtorad(deg2))
				csn = cos(degtorad(deg))
				csn2 = cos(degtorad(deg2))
				
				
			}
			
		#endregion
		
	}
	
}

function fx_iter(struct) {
	
	if(is_struct(struct)) {
		
		#region Ensure Variables...
			
			if(!variable_instance_exists(struct,"spr")) struct[$ "spr"] = sprBeam;
			if(!variable_instance_exists(struct,"xy4")) struct[$ "xy4"] = [-DW*4,-DH*4,DW*5,DH*5];
			if(!variable_instance_exists(struct,"xy")) struct[$ "xy"]   = [DW*5,DH*5];
			if(!variable_instance_exists(struct,"rot")) struct[$ "rot"] = 30;
			if(!variable_instance_exists(struct,"blendc")) struct[$ "blendc"] = c.nr;
			if(!variable_instance_exists(struct,"col5")) struct[$ "col5"] = [1,struct[$ "blendc"],struct[$ "blendc"],c.blk,c.blk];
			if(!variable_instance_exists(struct,"outline")) struct[$ "outline"] = F;
			if(!variable_instance_exists(struct,"li")) struct[$ "li"] = random(GSPD*3);
			if(!variable_instance_exists(struct,"liv")) struct[$ "liv"] = random_range(2/3,1+(1/3));
			if(!variable_instance_exists(struct,"lpol")) struct[$ "lpol"] = 1 // Polarity for direction of iteration (li (+/-)liv)
			if(!variable_instance_exists(struct,"ld")) struct[$ "ld"] = GSPD*3;
			if(!variable_instance_exists(struct,"ldel")) struct[$ "ldel"] = random_range(GSPD,GSPD*2);
			if(!variable_instance_exists(struct,"ldeli")) struct[$ "ldeli"] = 0;
			if(!variable_instance_exists(struct,"ldeg")) struct[$ "ldeg"] = 0;
			if(!variable_instance_exists(struct,"lpct")) struct[$ "lpct"] = 0;
			if(!variable_instance_exists(struct,"lsn")) struct[$ "lsn"] = -sin(0);
			if(!variable_instance_exists(struct,"lcsn")) struct[$ "lcsn"] = cos(0);
			if(!variable_instance_exists(struct,"lsnM")) struct[$ "lsnM"] = 1;
			if(!variable_instance_exists(struct,"lcsnM")) struct[$ "lcsnM"] = 1;
			
		#endregion
		
		#region Iterate + Updates
			
			with(struct) {
				
				#region Iterate
					
					if(lpct >= 1) {
						
						struct[$ "blendc"] = c.nr
						
					}
					if(li >= ld) li = 0;
					else if(li < 0) li = ld;
					else li+=liv*lpol;
					lpct = li/ld
					ldeg = 360*lpct
					lsn  = -sin(degtorad(rot+90))
					lcsn = cos(degtorad(rot+90))
					xy = [lerp(xy4[3],xy4[1],lpct),lerp(xy4[2],xy4[0],lpct)]
					
				#endregion
				
				#region Dark+Light FX
					// We Draw a layer of darkness on a surface, subtract from it with the light, and blend
					
					if(dark) {
						
						// Init Surface
						var surf = surface_create(WW,WH)
						surface_set_target(surf)
						
						// Draw Darkness
						shader_set(shTranGradientBlk)
							draw_rectangle_color(0,0,WW,WH,c.nr,c.lr,c.nr,c.lr,F)
						shader_reset()
						
						// Subtract from Darkness...
						gpu_set_blendmode(bm_subtract)
							draw_sprite_ext(sprCF2,0,xy[0],xy[1],1,1,rot,c.wht,.8)
						gpu_set_blendmode(bm_normal)
						
						// Draw Surface
						surface_reset_target()
						draw_surface(surf,0,0)
						surface_free(surf)
						
						// Add Color to below...
						gpu_set_blendmode(bm_add)
							draw_sprite_ext(sprCF2,0,xy[0],xy[1],1,1,rot,blendc,.8)
						gpu_set_blendmode(bm_normal)
						
					}
					
				#endregion
				
			}
			
		#endregion
		
	}
	
}

function fx_pre(struct) {
	// This is used mostly for additional layers of darkness currently...
	
	if(is_struct(struct)) {
		
		#region Ensure Variables...
			
			if(!variable_instance_exists(struct,"spr")) struct[$ "spr"] = sprBeam;
			if(!variable_instance_exists(struct,"xy4")) struct[$ "xy4"] = [-DW*4,-DH*4,DW*5,DH*5];
			if(!variable_instance_exists(struct,"xy")) struct[$ "xy"]   = [DW*5,DH*5];
			if(!variable_instance_exists(struct,"rot")) struct[$ "rot"] = 30;
			if(!variable_instance_exists(struct,"blendc")) struct[$ "blendc"] = c.nr;
			if(!variable_instance_exists(struct,"col5")) struct[$ "col5"] = [1,struct[$ "blendc"],struct[$ "blendc"],c.blk,c.blk];
			if(!variable_instance_exists(struct,"outline")) struct[$ "outline"] = F;
			if(!variable_instance_exists(struct,"li")) struct[$ "li"] = random(GSPD*3);
			if(!variable_instance_exists(struct,"liv")) struct[$ "liv"] = random_range(2/3,1+(1/3));
			if(!variable_instance_exists(struct,"lpol")) struct[$ "lpol"] = 1 // Polarity for direction of iteration (li (+/-)liv)
			if(!variable_instance_exists(struct,"ld")) struct[$ "ld"] = GSPD*3;
			if(!variable_instance_exists(struct,"ldel")) struct[$ "ldel"] = random_range(GSPD,GSPD*2);
			if(!variable_instance_exists(struct,"ldeli")) struct[$ "ldeli"] = 0;
			if(!variable_instance_exists(struct,"ldeg")) struct[$ "ldeg"] = 0;
			if(!variable_instance_exists(struct,"lpct")) struct[$ "lpct"] = 0;
			if(!variable_instance_exists(struct,"lsn")) struct[$ "lsn"] = -sin(0);
			if(!variable_instance_exists(struct,"lcsn")) struct[$ "lcsn"] = cos(0);
			if(!variable_instance_exists(struct,"lsnM")) struct[$ "lsnM"] = 1;
			if(!variable_instance_exists(struct,"lcsnM")) struct[$ "lcsnM"] = 1;
			
		#endregion
		
		#region Iterate + Updates
			
			with(struct) {
				
				// We iterate only in fx_iter
				
				#region Dark+Light FX
					// We Draw a layer of darkness on a surface, subtract from it with the light, and blend
					
					if(dark) {
						
						// Init Surface
						var surf = surface_create(WW,WH)
						surface_set_target(surf)
						
						// Draw Darkness
						shader_set(shTranGradientBlk)
							draw_rectangle_color(0,0,WW,WH,c.lr,c.nr,c.lr,c.nr,F)
						shader_reset()
						
						// Subtract from Darkness...
						gpu_set_blendmode(bm_subtract)
							draw_sprite_ext(sprCF2,0,xy[0]*.6,xy[1]*.6,1,1,rot,c.wht,2/3)
						gpu_set_blendmode(bm_normal)
						
						// Draw Surface
						surface_reset_target()
						draw_surface(surf,0,0)
						surface_free(surf)
						
						// Add Color to below...
						gpu_set_blendmode(bm_add)
							draw_sprite_ext(sprCF2,0,xy[0]*.6,xy[1]*.6,1,1,rot,blendc,.1)
						gpu_set_blendmode(bm_normal)
						
					}
					
				#endregion
				
			}
			
		#endregion
		
	}
	
}

function noise1D(seed, x) {
	
    var xi = floor(x); // Get the integer position
    var xf = x - xi;   // Get the fractional part for interpolation

    // Get noise values at integer positions
    var n0 = hash(xi + seed * 10000);
    var n1 = hash(xi + 1 + seed * 10000);

    // Interpolate between the two noise values
    return mix(n0, n1, smoothstep(xf));
    
}

// Hash function to generate pseudo-random gradients
function hash(n) {
	
    n = (n << 13) ^ n;
    return (1.0 - ((n * (n * n * 15731 + 789221) + 1376312589) & 0x7fffffff) / 1073741824.0);
    
}

// Smooth interpolation function
function smoothstep(t) {
	
    return t * t * (3.0 - 2.0 * t);
    
}

// Linear interpolation function
function mix(a, b, t) {
	
    return a + (b - a) * t;
    
}

function lerp_color(c1,c2,pct) {
	
	var _r = lerp(color_get_red(c1),color_get_red(c2),pct)
	var _g = lerp(color_get_green(c1),color_get_green(c2),pct)
	var _b = lerp(color_get_blue(c1),color_get_blue(c2),pct)
	return make_color_rgb(_r,_g,_b)
	
}

function delta_pct(ll,ul,val) {
	
	rtn = U
	if(val-ul > ll) rtn = ((val-ul)-ll)/(ul-ll);
	else rtn = (val-ll)/(ul-ll);
	return rtn
	
}

function array_clone(dst,src) {
	
	array_copy(dst,0,src,0,array_length(src))
	
}

function proc_fx_arr(inp,last) {
	
	// Init
	var rtn = F
	var time = N
	
	// Set Time? If it is an array...
	if(is_array(inp)) time = inp[0]*GSPD; // Get Second(s) in Frames for Time
	
	if(is_undefined(inp) or inp == N or inp == []) rtn = T; // No FX
	else if(is_array(inp) and array_length(inp) > 1) {
		
		#region inp == FX Array [Time, N/[FX+]]
			
			if(is_array(inp[1])) {
				
				#region Array Template: inp[0] = Time (Seconds); inp[1] = FX Array (ie [V.ZOOM_PAN, 1])
					// [time/sec, [V.FX, velocity...]]
					
					var _narr = inp[1]
					var _k = _narr[0]
					
					switch(_k) {
						
						#region Zoom Pan
							
							case V.ZOOM_PAN: {
								
								#region Init Parent-Nested Variables
									
									if(is_undefined(n_fxi)) {
										
										n_fxi = 0
										n_z = 1
										// Option 1; Velocity
										if(array_length(_narr) >= 2 and !is_undefined(_narr[1])) n_vel = _narr[1];
										else n_vel = 1; // Default; 1
										n_zmn = 1 // Zoom Min, Make changeable? Change to z_rng? [mn,mx]
										// Option 2; Zoom Max
										if(array_length(_narr) >= 3 and !is_undefined(_narr[2])) n_zmx = _narr[2];
										else n_zmx = 1+(1/5); // Default; 1.2
										// Option 3; Alignment Array i.e. [fa_center,fa_middle]
										if(array_length(_narr) >= 4 and !is_undefined(_narr[3])) n_aln = _narr[3];
										else n_aln = U;
										// Option 4; Color
										if(array_length(_narr) >= 5 and !is_undefined(_narr[4])) n_col = _narr[4];
										else n_col = U;
										
									} else n_fxi++;
									
								#endregion
								
								// Calc
								var pct = n_fxi/time
								
								// Apply
								n_z = lerp(n_zmn,n_zmx,pct)
								
								// Effect Done?
								if(pct >= 1 and last) n_fxdone = T;
								
								break
								
							}
							
						#endregion
						
						default: rtn = F; break;
						
					}
					
				#endregion
				
			} else if(inp[1] != N) {
				
				#region [Time, V.FX]
					
					var _k = inp[1]
					switch(_k) {
						
						default: rtn = F; break;
						
					}
					
				#endregion
				
			}
			
		#endregion
		
	} else if(inp != N and ((!is_array(inp) and is_real(inp)) or (is_array(inp) and array_length(inp) == 1))) {
		
		rtn = T
		#region inp == FX Value Only
			
			switch(inp) {
				
				default: rtn = F; break;
				
			}
			
		#endregion
		
	}
	
	return rtn
	
}

function set_scni(scni) {
	
	try {
		
		if(scni > SCENE.FIRST and scni < SCENE.LAST) {
			
			D.game_state  = GAME.PLAY
			D.scene_state = GAME.INIT
			D.scni = scni
			return T
			
		} else {
			
			show_debug_message("WARN: SCNI not changed. New scni was out of bounds.\n!(SCENE.FIRST < D.scni < SCENE.LAST)")
			show_debug_message(_ex)
			
		}
		
	} catch(_ex) {
		
		show_debug_message("[FAIL] Couldn't change SCNI for some reason, see exception details.")
		show_debug_message(_ex)
		
	}
	
	return F
	
}