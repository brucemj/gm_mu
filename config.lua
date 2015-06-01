cnf_pics = {["cnf_gn"] = 0, ["cnf_gn_down_sys"] = 0, ["cnf_gn_down_gj"] = 0}
cnf_seat = {
		["cnf_gn"] = {0,0},
		["cnf_gn_down_sys"] = {0,0},
		["cnf_gn_down_gj"] = {0,0},
	}

function cnf_gn()
	-- 找 '功能' 图标
	x,y = findMultiColorInRegionFuzzy( 0x7c3d1b, "-9|-14|0x9e9187,12|-4|0xcca582,21|15|0xfbefe3,6|23|0xdcaf82,-5|18|0x6d2a11,-23|0|0x4a2a15,-24|16|0xe2a13e,13|-12|0xba9370,7|24|0xc79a71", 90, 559, 780, 617, 839)
	if x > 0 then
		cnf_pics["cnf_gn"] = 1
		pul_log("cnf_gn find.")
		mSleep(1000)
		
		-- 找 '功能' 下拉的 '系统设置' 图标, 判断'功能'是否被点击
		x1,y1 = findMultiColorInRegionFuzzy( 0x261513, "4|8|0x180809,22|10|0x53331e,11|16|0x6e4425,-15|12|0x4c2a14,-15|-6|0xd6973a,23|-9|0x55301c,29|6|0x623a20,19|19|0xf4e89c,13|11|0x5c3d24", 90, 372, 777, 433, 845)
		if x1 == -1 then
			pul_click(x,y)
		end
	end
end

function cnf_gn_down_sys()
	mSleep(1000)
	-- 找 '功能' 下拉的 '系统设置' 图标
	x,y = findMultiColorInRegionFuzzy( 0x261513, "4|8|0x180809,22|10|0x53331e,11|16|0x6e4425,-15|12|0x4c2a14,-15|-6|0xd6973a,23|-9|0x55301c,29|6|0x623a20,19|19|0xf4e89c,13|11|0x5c3d24", 90, 372, 777, 433, 845)
	if x > 0 then
		cnf_pics["cnf_gn_down_sys"] = 1
		pul_log("cnf_gn_down_sys find.")
		mSleep(1000)
		pul_click(x,y)
		mSleep(3000)
		cnf_gn_down_sys_music()
		cnf_gn_down_sys_game()
		cnf_gn_down_sys_pic()
		-- 关闭'设置' 框		inputText("/b")
		mSleep(1000)
		x,y = findMultiColorInRegionFuzzy( 0xcba691, "-9|-10|0x48120a,3|-10|0x603f34,13|-8|0xbfb0ab,11|8|0xfbf6f3,11|2|0x623f34,-3|10|0x58200b,-7|9|0xd2a07b,-10|2|0x7a2601,4|3|0xe9d3c3", 90, 505, 808, 543, 845)
		if x > 0 then			
			pul_click(x,y)
		end
	end
end

function cnf_gn_down_sys_music()
	-- 找 '设置'  图标, 如果存在点击音乐
	x,y = findMultiColorInRegionFuzzy( 0x470d00, "13|7|0x4c2b20,-1|21|0x9f5c1f,9|19|0xd8a247,5|29|0xce8c3c,7|39|0xd09a39,0|65|0x430f01,14|79|0x4b3224,2|95|0x58320f,10|113|0x9e7a31", 90, 502, 487, 546, 659)
	if x > 0 then
		pul_click(465,  497) --点击 音乐
		mSleep(1000)
		-- 关闭背景音乐
		x1,y1 = findMultiColorInRegionFuzzy( 0x110e0b, "1|13|0x110e0b,1|19|0x110e0b,-12|16|0x120e0b,11|21|0x110e0b,15|23|0x110e0b,13|24|0x110e0b,7|22|0x110e0b,6|16|0x120e0b,2|9|0x110e0b", 90, 347, 468, 387, 508)
		if x1 > 0 then
			pul_click(x1,  y1)
			mSleep(1000)
		end
		-- 关闭技能音乐
		x2,y2 = findMultiColorInRegionFuzzy( 0x110e0b, "3|0|0x110e0b,0|4|0x110e0b,25|15|0x110e0b,21|15|0x110e0b,22|10|0x110e0b,17|10|0x110e0b,11|12|0x110e0b,8|6|0x110e0b,-2|5|0x110e0b", 90, 243, 467, 286, 508)
		if x2 > 0 then
			pul_click(x2,  y2)
			mSleep(1000)
		end
	end
end

 

function cnf_gn_down_sys_game()
	-- 找 '设置'  图标, 如果存在点击音乐
	x,y = findMultiColorInRegionFuzzy( 0x470d00, "13|7|0x4c2b20,-1|21|0x9f5c1f,9|19|0xd8a247,5|29|0xce8c3c,7|39|0xd09a39,0|65|0x430f01,14|79|0x4b3224,2|95|0x58320f,10|113|0x9e7a31", 90, 502, 487, 546, 659)
	if x > 0 then
		pul_click(468,  633) --点击 游戏
		mSleep(1000)
		-- 屏蔽其他玩家
		x,y = findMultiColorInRegionFuzzy( 0x110e0b, "7|11|0x120e0c,15|15|0x110e0b,19|16|0x110e0b,21|14|0x110e0b,17|12|0x110e0b,9|11|0x110e0b,-11|2|0x110e0b,-8|6|0x110e0b,1|11|0x110e0b", 90, 192, 333, 234, 375)
		if x > 0 then
			pul_click(x,  y)
			mSleep(1000)
		end
		-- 拒绝发起私聊
		x,y = findMultiColorInRegionFuzzy( 0x110e0b, "7|7|0x110e0b,13|8|0x110e0b,10|6|0x110e0b,8|8|0x110e0b,1|6|0x110e0b,-9|3|0x110e0b,-11|-3|0x110e0b,-15|-7|0x110e0b,-11|-2|0x110e0b", 90, 366, 595, 410, 637)
		if x > 0 then
			pul_click(x,  y)
			mSleep(1000)
		end
		-- 屏蔽他人特效
		x,y = findMultiColorInRegionFuzzy( 0x110e0b, "-15|-7|0x110e0b,-15|-11|0x110e0b,-15|-3|0x110e0b,8|9|0x110e0b,15|10|0x110e0b,17|8|0x110e0b,-1|6|0x110e0b,11|13|0x110e0b,-7|2|0x110e0b", 90, 192, 593, 235, 637)
		if x > 0 then
			pul_click(x,  y)
			mSleep(1000)
		end
	end
end

function cnf_gn_down_sys_pic()
	-- 找 '设置'  图标, 如果存在点击音乐
	x,y = findMultiColorInRegionFuzzy( 0x470d00, "13|7|0x4c2b20,-1|21|0x9f5c1f,9|19|0xd8a247,5|29|0xce8c3c,7|39|0xd09a39,0|65|0x430f01,14|79|0x4b3224,2|95|0x58320f,10|113|0x9e7a31", 90, 502, 487, 546, 659)
	if x > 0 then		 
		pul_click(466,  768) --点击 画质
		mSleep(1000)
		-- 流畅优先
		x,y = findMultiColorInRegionFuzzy( 0x2d2522, "-4|-4|0x211b19,2|-3|0x2b2320,2|3|0x2d2421,-4|3|0x28211e,0|-1|0x2d2522,0|7|0x221c19,-1|-1|0x2d2522,-4|1|0x2a2220,2|1|0x2d2522", 90, 252, 477, 277, 502)
		if x > 0 then
			pul_click(x,  y)
			mSleep(1000)
		end
	end
end

function cnf_gn_down_gj()
	mSleep(1000)
	-- -- 找 '功能' 下拉的 '挂机设置' 图标
	x,y = findMultiColorInRegionFuzzy( 0x767971, "-3|9|0x955417,9|14|0xeab74f,16|8|0xe5eadd,12|22|0x0f0809,-5|25|0x3f2802,-18|19|0x31150e,-23|-7|0x090202,-4|-7|0xc7cdc4,20|22|0x9f8034", 90, 372, 874, 435, 938)
	if x > 0 then
		cnf_pics["cnf_gn_down_gj"] = 1
		pul_log("cnf_gn_down_gj find.")
		pul_click(x,y)
		mSleep(2000)
		cnf_gn_down_gj_set1()
		cnf_gn_down_gj_set2()
		-- 关闭
		x,y = findMultiColorInRegionFuzzy( 0xb47f5d, "4|12|0x6d2304,10|-1|0x4d1e0d,23|3|0xbaa79e,22|22|0x5f322d,4|19|0xd5a684,15|10|0xe8cfbd,21|1|0xebddd3,29|-6|0x634035,19|25|0x603e33", 90, 574, 1072, 626, 1122)
		if x > 0 then
			pul_click(x,y)
		end
	end
end

function cnf_gn_down_gj_set1()
	-- 找 '挂机设置'  标题栏, 如果存在 则配置
	x,y = findMultiColorInRegionFuzzy( 0x421000, "-3|14|0xa1601d,16|15|0xdea73b,11|38|0xc69631,12|58|0xd49e3c,15|71|0x1e160e,14|87|0x402c1d,10|113|0xca9635,8|129|0x443120,4|172|0x3f1000", 90, 573, 480, 627, 656)
	if x > 0 then
		pul_click(428,  406) -- 自动加血百分比
		mSleep(1000)
		pul_click(324,  356) -- 自动加蓝百分比
		-- 全地图
		x,y = findMultiColorInRegionFuzzy( 0x2b2320, "-7|0|0x1b1615,4|2|0x2b2320,0|9|0x27201d,-1|4|0x2d2522,3|3|0x2c2421,0|0|0x2b2320,3|0|0x29211f,-5|5|0x241e1c,1|4|0x2d2522", 90, 157, 411, 181, 437)
		if x > 0 then
			pul_click(x,y)
		end
		-- 当前屏
		x,y = findMultiColorInRegionFuzzy( 0x2c2421, "-3|0|0x231c1a,2|-4|0x201a18,5|-1|0x29221f,1|6|0x2b2320,1|0|0x2c2421,3|-1|0x2b2421,0|-1|0x2a231f,0|-1|0x2a231f,-1|2|0x2b2421", 90, 157, 222, 181, 250)
		if x > 0 then
			--pul_click(x,y)
		end
	end
end

function cnf_gn_down_gj_set2()
	-- 找 '挂机设置'  标题栏, 如果存在 则配置
	x,y = findMultiColorInRegionFuzzy( 0x421000, "-3|14|0xa1601d,16|15|0xdea73b,11|38|0xc69631,12|58|0xd49e3c,15|71|0x1e160e,14|87|0x402c1d,10|113|0xca9635,8|129|0x443120,4|172|0x3f1000", 90, 573, 480, 627, 656)
	if x > 0 then
		-- 拾取设置
		x,y = findMultiColorInRegionFuzzy( 0x5e9203, "-13|13|0xa7a8a5,-1|36|0xd4d5d1,9|52|0x5b8f03,-13|72|0x4a5d25,-7|86|0xe9e9e8,1|88|0xa9aaa8,-15|98|0xcccdc9,-11|99|0x284700,-3|69|0x5a8d03", 90, 28, 721, 68, 841)
		if x > 0 then
			pul_click(x,y)
			mSleep(1000)
			--白色装备
			x,y = findMultiColorInRegionFuzzy( 0x12770e, "1|10|0x12840c,9|16|0x15c306,14|18|0x17e502,-7|13|0x080807,-2|18|0x080807,-7|-2|0x070706,9|-6|0x080807,-12|5|0x070706,3|19|0x070706", 90, 445, 362, 491, 406)
			if x > 0 then
				pul_click(x,y); mSleep(500);
			end
			--药品
			x,y = findMultiColorInRegionFuzzy( 0x12770e, "1|10|0x12840c,9|16|0x15c306,14|18|0x17e502,-7|13|0x080807,-2|18|0x080807,-7|-2|0x070706,9|-6|0x080807,-12|5|0x070706,3|19|0x070706", 90, 233, 361, 278, 405)
			if x > 0 then
				pul_click(x,y); mSleep(500);
			end
			--绿色装备
			x,y = findMultiColorInRegionFuzzy( 0x12770e, "1|10|0x12840c,9|16|0x15c306,14|18|0x17e502,-7|13|0x080807,-2|18|0x080807,-7|-2|0x070706,9|-6|0x080807,-12|5|0x070706,3|19|0x070706", 90, 445, 616, 491, 662)
			if x > 0 then
				pul_click(x,y); mSleep(500);
			end
			--关闭
			x,y = findMultiColorInRegionFuzzy( 0x682105, "-1|-6|0xd4a27e,8|-4|0x613f33,12|-4|0xf4e7df,13|8|0xf6ece6,1|9|0xbe8f70,6|2|0xe5c8b2,1|1|0x662206,7|-6|0x634034,9|1|0xd5bfb0", 90, 542, 806, 578, 840)
			if x > 0 then
				mSleep(1500);
				pul_click(x,y); mSleep(500);
			end
		end
	end
end

function cnf_steps(num)
	repeat
		mSleep(1000)
		cnf_gn()
		cnf_gn_down_sys()
		mSleep(2000)
		cnf_gn()
		cnf_gn_down_gj()
		num = num - 1
	until num < 0 or cnf_pics["cnf_gn"] == 1;
end
