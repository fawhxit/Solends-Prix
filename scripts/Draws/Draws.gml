// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#region Button Related...
	
	function draw_button_fxl(xy,bgc,fgc,str,actn,enabled){
		
		// If not enabled, Darken
		if(!enabled) {
			
			fgc[0] = fgc[0]*.8
			fgc[1] = c.dgry
			fgc[2] = c.dgry
			fgc[3] = c.gry
			fgc[4] = c.gry
			
		}
		
		// Set AO
		var ao = draw_get_alpha()
		
		#region Body
			
			// BG
			draw_set_alpha(bgc[0])
			draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
				bgc[1],bgc[2],bgc[3],bgc[4],F)
			
			// Outline
			draw_set_alpha(fgc[0])
			draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
				fgc[1],fgc[2],fgc[3],fgc[4],T)
			
		#endregion
		
		#region Interaction
		
			if(mouse_in_rectangle(xy) and enabled) {
			
				// Hilight
				if(MBL) draw_set_alpha(fgc[0]*.25)
				else draw_set_alpha(fgc[0]*.5)
				draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
					fgc[1],fgc[2],fgc[3],fgc[4],F)
				
				// Do button action
				if(MBLR) {
					
					// Reset Alpha and Do Action
					draw_set_alpha(ao)
					return button_action(actn)
					
				}
				
			}
		
		#endregion
		
		#region Text
			
			var midx = lerp(xy[0],xy[2],0.5)
			var midy = lerp(xy[1],xy[3],0.5)
			draw_set_font(fHUD)
			draw_set_hvalign([fa_center,fa_middle])
			draw_text_color(midx,midy,str,fgc[1],fgc[2],
				fgc[3],fgc[4],fgc[0])
			
		#endregion
		
		// Reset Alpha
		draw_set_alpha(ao)
		return N
		
	}
	
	function button_action(actn) {
		
		switch(actn) {
			
			#region Meta
				
				case ACTION.PLAY: {
					
					if(D.game_state == GAME.MENU) {
						
						set_scni(SCENE.RESORT_BED)
						audio_stop_all()
						sfx_gunshot(1)
						M.introInst = instance_create_layer(0,0,"GUI",oIntro)
						room_goto(rGame)
						
					}
					
					break
					
				}
				
				case ACTION.EXIT: {
					
					game_end()
					
				}
				
			#endregion
			
			#region Dialogue
				
				case ACTION.DIA_GOTO: return ACTION.DIA_GOTO;
				
				case ACTION.DIA_LEAVE: return ACTION.DIA_LEAVE;
				
			#endregion
			
			default: break;
			
		}
		
		// Default Return Nothing...
		return N
		
	}
	
#endregion

#region Base Draw Functions...
	
	#region HVAlign
		
		function draw_set_hvalign(hva) {
			
			draw_set_halign(hva[0])
			draw_set_valign(hva[1])
			
		}
		
		function draw_get_hvalign() {
			
			return [draw_get_halign(),draw_get_valign()]
			
		}
		
	#endregion
	
	#region Draw Globals
		
		function draw_reset() {
			
			try {
				
				with(D) {
					
					// This is also the first defaults... Ideally outside of specific draw lines these should return to these values...
					// Can use this to reset to defaults if needed?
					HVO = [fa_left,fa_top]
					FO = fNeu
					AO = 1
					CO = c.wht
					
				}
				
			} catch(_ex) {
				
				// Must be in Data Create Event...
				// D wouldn't be set yet...
				HVO = [fa_left,fa_top]
				FO = fNeu
				AO = 1
				CO = c.wht
				
			}
			
		}
		
		function draw_olds_pull() {
			
			with(D) {
				
				// Set Olds
				HVO = draw_get_hvalign()
				FO = draw_get_font()
				AO = draw_get_alpha()
				CO = draw_get_color()
				
			}
			
		}
		
		function draw_olds_push() {
			
			with(D) {
				
				// Apply Olds
				draw_set_hvalign(HVO)
				draw_set_font(FO)
				draw_set_alpha(AO)
				draw_set_color(CO)
				
			}
			
		}
		
		/// @desc draw rectangle primitive rotated color
		/// @func draw_rectangle_ext_color(xy4[0],xy4[1],xy4[2],xy4[3],rot,col5[1],col5[2],col5[3],col5[4],outline)
		/// @param xy4
		/// @param rot
		/// @param col5[4]
		/// @param outline
		/// @returns n/a
		function draw_rectangle_ext_color(xy4,rot,col5,outline) {
			
			// Init Alpha
			var ao = draw_get_alpha()
			draw_set_alpha(col5[0])
			
			// Orign x/y
			var ox,oy
			ox = lerp(xy4[0],xy4[2],0.5)
			oy = lerp(xy4[1],xy4[3],0.5)
			
			// Get x/y rotations
			var sxx,sxy,syx,syy
			sxx =  cos(degtorad(rot))
			sxy = -sin(degtorad(rot))
			syx =  sin(degtorad(rot))
			syy =  cos(degtorad(rot))
			
			// Apply x rotations
			var sx1,sx2,sx3,sx4
			sx1 = sxx*(xy4[0]-ox)
			sx2 = sxx*(xy4[2]-ox)
			sx3 = sxy*(xy4[0]-ox)
			sx4 = sxy*(xy4[2]-ox)
			
			// Apply y rotations
			var sy1,sy2,sy3,sy4
			sy1 = syx*(xy4[1]-oy)
			sy2 = syx*(xy4[3]-oy)
			sy3 = syy*(xy4[1]-oy)
			sy4 = syy*(xy4[3]-oy)
			
			// Get rectangle x coordinates
			var xx1,xx2,xx3,xx4
			xx1=ox+sx1+sy1
			xx2=ox+sx2+sy1
			xx3=ox+sx2+sy2
			xx4=ox+sx1+sy2
			
			// Get rectangle y coordinates
			var yy1,yy2,yy3,yy4
			yy1=oy+sx3+sy3
			yy2=oy+sx4+sy3
			yy3=oy+sx4+sy4
			yy4=oy+sx3+sy4
			
			// Draw...
			if(outline) {
				
				// Outline
				draw_line_color(xx1,yy1,xx4,yy4,col5[1],col5[4])
				draw_line_color(xx2,yy2,xx1,yy1,col5[2],col5[1])
				draw_line_color(xx3,yy3,xx2,yy2,col5[3],col5[2])
				draw_line_color(xx4,yy4,xx3,yy3,col5[4],col5[3])
				
			} else {
				
				// Filled
				draw_triangle_color(xx1,yy1,xx2,yy2,xx3,yy3,col5[1],col5[2],col5[3],false)
				draw_triangle_color(xx1,yy1,xx3,yy3,xx4,yy4,col5[1],col5[3],col5[4],false)
				
			}
			
			// Reset Alpha
			draw_set_alpha(col5[0])
			
		}
		
	#endregion
	
	#region Text
		
		// Line before: var _str,_strw,_strh,_bgc,_fgc
		// Since this is setting where it is called from...
		function text_prep(str) {
			
			try { /* GMLive Call */ if (live_call()) return live_result; } catch(_ex) { /* GMLive not available? */ }
			
			// the usual init; non-ext
			str_  = str
			stri_ = 0
			strw_ = string_width(str)
			strh_ = string_height(str)
			bgc_  = [1/3,c.dgry,c.dgry,c.blk,c.blk] // Background Default
			fgc_  = [1,c.ng,c.ng,c.lg,c.lg] // Foreground/Text Default
			
		}
		
		// Line before: var _str,_strw,_strh,_bgc,_fgc
		// Since this is setting where it is called from...
		function text_prep_cc(str) {
			
			try { /* GMLive Call */ if (live_call()) return live_result; } catch(_ex) { /* GMLive not available? */ }
			
			// the usual init; non-ext
			str_  = str
			strw_ = string_width_ext(str,STRH,WW*(7/8))
			strh_ = string_height_ext(str,STRH,WW*(7/8))
			bgc_  = [.9,c.blk,c.blk,c.blk,c.blk] // Background Default
			fgc_  = [1,c.wht,c.wht,c.lgry,c.lgry] // Foreground/Text Default
			
		}
		
	#endregion
	
#endregion