function sfx_gunshot(vol) {
    
    if(is_array(vol)) audio_play_sound(sfxShot,0,F,random_range(vol[0],vol[1]),0,random_range(.9,1.1));
    else audio_play_sound(sfxShot,0,F,vol,0,random_range(.9,1.1));
    
}
function sfx_flyby(vol) {
    
    if(is_array(vol)) audio_play_sound(sfxFlyBy,0,F,random_range(vol[0],vol[1]),0,random_range(.9,1.1));
    else audio_play_sound(sfxFlyBy,0,F,vol,0,random_range(.9,1.1));
    
}
function pick_star_asset() {
    
    #region Pick Star Sprite
        
        var _p = irandom(3)
        switch(_p) {
            
            case 0: sprite_index = sprStar1; break;
            case 1: sprite_index = sprStar2; break;
            case 2: sprite_index = sprStar3; break;
            case 3: sprite_index = sprStar4; break;
            
        }
        scl = N
        isStar = _p+1
        flick = F
        draw = F
        depth = layer_get_depth(layer_get_id("FG"))
        deptho = depth
        
    #endregion
    
}
function pick_nova_asset() {
    
    #region Pick Nova Sprite
        
        var _p = irandom(6)
        switch(_p) {
            
            //case 0: sprite_index = sprNova1; break;
            //case 1: sprite_index = sprNova2; break;
            case 0: sprite_index = sprNova3; break;
            case 1: sprite_index = sprNova4; break;
            case 2: sprite_index = sprNova9; break;
            case 3: sprite_index = sprNova8; break;
            case 4: sprite_index = sprNova5; break;
            case 5: sprite_index = sprNova6; break;
            case 6: sprite_index = sprNova7; break;
            
        }
        scl = N
        isNova = _p+1
        flick = F
        draw = F
        sprHFlip = chance(50)
        depth = layer_get_depth(layer_get_id("MG"))
        deptho = depth
        /*
        if(is(par)) {
            
            for(var i = 0; i < ds_list_size(par.novL); i++) {
                
                if(par.novL[|i].sprite_index == sprite_index and par.novL[|i].self != self) {
                    
                    with(self) pick_nova_asset();
                    
                }
                
            }
            
        }
        */
        
    #endregion
    
}
function pick_galaxy_asset() {
    
    #region Pick Galaxy Sprite
        
        var _p = irandom(8)
        switch(_p) {
            
            case 0: sprite_index = sprGal1; break;
            case 1: sprite_index = sprGal2; break;
            case 2: sprite_index = sprGal3; break;
            case 3: sprite_index = sprGal4; break;
            case 4: sprite_index = sprGal5; break;
            case 5: sprite_index = sprGal6; break;
            case 6: sprite_index = sprGal7; break;
            case 7: sprite_index = sprGal8; break;
            case 8: sprite_index = sprGal9; break;
            
        }
        scl = N
        isGalaxy = _p+1
        flick = F
        draw = F
        sprHFlip = chance(50)
        depth = layer_get_depth(layer_get_id("BG"))
        deptho = depth
        /*
        if(is(par)) {
            
            for(var i = 0; i < ds_list_size(par.galL); i++) {
                
                if(par.galL[|i].sprite_index == sprite_index and par.galL[|i].self != self) {
                    
                    with(self) pick_galaxy_asset();
                    
                }
                
            }
            
        }
        */
        
    #endregion
    
}