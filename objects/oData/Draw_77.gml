/// @description Global Logic Updates Updates


#region Control Override
	
	if(!ds_list_empty(diaParL) or animPlay != N or focus != N or !loading_done()) ctrlOverride = T;
	else ctrlOverride = F;
	
#endregion

#region Frame Delay
	
	if(fd > 0) fd = clamp(fd-1,0,GSPD);
	
#endregion

#region Hover Iteration
	
	if(isHvr) {
		
		// Iterate
		if(hvrDeli < hvrDel) hvrDeli = clamp(hvrDeli+1,0,hvrDel);
		hvrPct = hvrDeli/hvrDel
		
	} else {
		
		// De-Iterate
		if(hvrDeli > 0) max(0,hvrDeli--)
		hvrPct = hvrDeli/hvrDel
		
	}
	isHvrO = isHvr
	isHvr = N
	
	// Button Hover (For UI SFX)
	if(btnHvr and !btnHvr2) btnHvr = F;
	btnHvr2 = F
	
#endregion

#region Timers
	
	// Frame
	fr++
	frs = !frs
	if(fr >= GSPD) {
		
		// Second
		fr = 0
		sc++
		scs = !scs
		if(sc >= 60) {
			
			// Minute
			sc = 0
			mn++
			mns = !mns
			if(mn >= 60) {
				
				// Hour
				mn = 0
				hr++
				hrs = !hrs
				
			}
			
		}
		
	}
	
#endregion