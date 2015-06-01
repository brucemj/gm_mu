

function nw0_xinhao() 
	mSleep(1000)
	--开始征途
	x1,y1 = findMultiColorInRegionFuzzy( 0x5c8f03, "-15|20|0x416200,-2|19|0xffffff,-4|40|0xf8faf4,10|44|0x5d9103,-17|71|0x4a6800,-1|79|0xd0dfb6,-2|90|0xa1bf6f,11|100|0x5e9204,-12|94|0xbac7a8", 90, 154, 772, 197, 914)
	--mi 的logo
	x2,y2 = findMultiColorInRegionFuzzy( 0xf3f5f7, "-31|0|0x8e939f,-29|19|0x989ba0,-3|25|0xa4a7aa,-15|42|0x91969a,-42|46|0x343c48,5|25|0xf9fafb,-18|17|0x8d9094,-19|27|0x414346,5|-6|0xf7f9fb", 90, 445, 531, 519, 615)
	if x1 > 0 and x2 > 0 then
		pul_click(x1,y1)
	end	
end


function nw0_steps(num)
	repeat
		mSleep(1000)
		num = num - 1
		nw0_xinhao()
	until num < 0 
end