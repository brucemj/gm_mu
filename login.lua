
lgn_pics = {["lgn_picinputUser"] = 0, ["lgn_picinto"] = 0, ["lgn_picjuese"] = 0}
function readme()
	--print("login")
	dialog("hello, this is login readme.",3)
end

function lgn_startgm(app_id)
	flag = runApp(app_id)  --启动奇迹
	return flag
end

function lgn_picinputUser()
	user_txt = "mjflash011" 
	pass_txt = "ffff8888"
	-- 天马LOGO，区域找10个点
	x1,y1 = findMultiColorInRegionFuzzy( 0xd61518, "-23|18|0x231815,-30|27|0xd61518,-17|51|0x231815,14|46|0xde1518,17|56|0x231815,-13|67|0xd61518,-12|53|0x231815", 90, 441,  511, 524,  619)
	-- 蓝色登录按键，区域找10个点
	x2,y2 = findMultiColorInRegionFuzzy( 0x0073ff, "-1|22|0x56a2ff,0|30|0x0073ff,1|43|0x0073ff,2|52|0xffffff,1|60|0xffffff,1|84|0x0073ff,8|62|0x0073ff,16|69|0xffffff,-8|72|0xa5ceff", 90, 308,  756, 362,  977)
	if x1 > 0 and x2 > 0 then
		--dialog("lgn_picinputUser find.",3)
		pul_log("lgn_picinputUser find.")
		lgn_pics["lgn_picinputUser"] = 1
		mSleep(2000)
		
		--点击输入帐号
		pul_click(337,  536)
		mSleep(1000)
		pul_backKey(16)
		inputText(user_txt)
		mSleep(500)
		pul_enterKey(1)
		
		--点击输入密码
		pul_click(452,  567)
		mSleep(1000)
		pul_backKey(16)
		inputText(pass_txt)
		mSleep(500)
		pul_enterKey(1)		
	end
end

function lgn_picinto()
	-- 切换帐号 按键，区域找10个点
	x1,y1 = findMultiColorInRegionFuzzy( 0x3b5e00, "13|12|0xeb8c34,15|32|0xd78329,29|43|0x67a40a,22|77|0x6eaf0e,4|117|0x4b6e03,16|137|0xffa227,25|142|0xf6cb0d,2|152|0x3c6001,32|159|0x5e9305", 90, 116,  199, 156,  369)
	-- 进入游戏 按键，区域找10个点
	x2,y2 = findMultiColorInRegionFuzzy( 0x325401, "9|22|0x180e05,20|39|0x68a40a,11|63|0x141f03,4|89|0xd47038,2|126|0x110b05,7|133|0x2b190a,23|138|0xceb10a,19|70|0x6ead0d,20|110|0x4e7b09", 90, 117,  779, 154,  947)
	
	if x1 > 0 and x2 > 0 then
		lgn_pics["lgn_picinto"] = 1
		pul_log("lgn_picinto find.")
		mSleep(1000)
		pul_click(x2,y2)
	end
end

function lgn_picjuese()
	-- 返回 按键，区域找10个点
	x1,y1 = findMultiColorInRegionFuzzy( 0x966100, "5|10|0x8b5100,16|15|0x8d4600,23|18|0xb16501,28|8|0xdab630,30|-2|0xe6ca3e,30|-11|0xd9ab2c,17|5|0x180300,12|-4|0x180000", 90, 46,  130, 96,  179)
	-- 进入游戏 按键，区域找10个点
	x2,y2 = findMultiColorInRegionFuzzy( 0x396504, "-8|-21|0xd48440,12|-26|0x88710b,8|35|0x6caa0d,-13|53|0x405702,-5|77|0x385903,-2|96|0x794f24,9|104|0xfabc20", 90, 43,  470, 84,  666)
	if x1 > 0 and x2 > 0 then
		lgn_pics["lgn_picjuese"] = 1
		pul_log("lgn_picjuese find.")
		mSleep(1000)
		pul_click(x2,y2)
	end
end

function lgn_steps(num)
	repeat
		mSleep(1000)
		lgn_picinputUser()
		mSleep(1000)
		lgn_picinto()
		mSleep(1000)
		lgn_picjuese()
		num = num - 1
	until num < 0 or lgn_pics["lgn_picjuese"] == 1;
end
