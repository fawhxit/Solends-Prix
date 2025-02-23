/// @description Global Logic Updates Updates
try { /* GMLive Call */ if (live_call()) return live_result; } catch(_ex) { /* GMLive not available? */ }
#region Control Override
	
	if(!ds_list_empty(diaParLst) or animPlay != N or focus != N) ctrlOverride = T;
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
		
		// Reset
		hvrDeli = 0
		hvrPct = 0
		
	}
	isHvro = isHvr
	isHvr = N
	
#endregion

#region Timers
	
	fr++
	frs = !frs
	if(fr >= GSPD) {
		
		fr = 0
		sc++
		scs = !scs
		if(sc >= 60) {
			
			sc = 0
			mn++
			mns = !mns
			if(mn >= 60) {
				
				mn = 0
				hr++
				hrs = !hrs
				
			}
			
		}
		
	}
	
#endregion