gj1_world_maps = {
	[0] = { 305,  502}, -- 勇者大陆
	[30] = { 228,  361}, -- 仙踪林
	[60] = { 387,  358}, -- 冰风谷
	[100] = { 159,  781}, -- 地下城
	[170] = { 457,  478}, -- 失落之塔
	[200] = { 119,  606}, -- 亚特兰蒂斯
	[300] = { 301,  709}, -- 死亡沙漠
	[400] = { 467,  880}, -- 天空之城
	[500] = { 107,  466}, -- 幽暗森林
	[600] = { 248,  894}, -- 坎特鲁废墟
	[700] = { 118,  921}, -- 坎特鲁遗址
}

function gj1_think() 
	mSleep(1000)
	--冥想图标
	x1,y1 = findMultiColorInRegionFuzzy( 0x8b0304, "-2|3|0xbf2807,-5|4|0x811705,-37|-6|0xffab35,-37|12|0xf4a234,-11|20|0xdec99c,6|20|0xc4a77e,6|-10|0xcdb38a,18|-2|0xfcd146,-21|-8|0xceb88b", 90, 104, 357, 167, 416)
	--冥想的确定按键
	x2,y2 = findMultiColorInRegionFuzzy( 0x598c03, "6|-31|0x5d9204,-7|-29|0x385c00,12|29|0x5b8d03,-8|27|0x355a00,-8|11|0xfcfdfb,3|11|0xfefefd,4|-9|0xfefefd,-4|-9|0xfcfcfb,0|-9|0xfefffe", 90, 143, 659, 175, 748)
	if x1 > 0 and x2 > 0 then
		dialog("冥想图标",2)
	end	
end

function gj1_map_select()
	mSleep(1000)
	--地图的圆形边框上部
	x,y = findMultiColorInRegionFuzzy( 0x3a312a, "3|0|0x28231e,3|3|0x38302a,3|6|0x241f1a,3|19|0xfceda7,6|19|0xe7db93,4|25|0x4e412d,4|29|0x3f3629,4|33|0x0e0c0a,1|33|0x352d27", 90, 586, 998, 603, 1058)
	if x > 0 then
		pul_click(527, 1047) --点击地图
	end
	mSleep(3000)
	-- 判断地图对话框是否出现
	x,y = findMultiColorInRegionFuzzy( 0xab6517, "16|-2|0xd7a741,-5|24|0x9b570c,19|24|0xeeb244,10|-16|0x4e2f1c,8|68|0x430b00,9|78|0xc78a31,12|94|0xd59a39,8|109|0xc4872a,4|114|0x3c1000", 90, 576, 495, 625, 638)
	if x>0 then
		pul_click(530,   95) --点击世界地图
		mSleep(2000)
		pul_click(gj1_world_maps[60][1],   gj1_world_maps[60][2]) --点击 勇者大陆
	end
end

function gj1_steps(num)
	repeat
		mSleep(1000)
		num = num - 1
		nw0_xinhao()
	until num < 0 
end