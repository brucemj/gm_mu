function readme()
	--print("login")
	dialog("hello, this is public readme.",3)
end

function pul_backKey(num)
	-- 找小键盘 'x'，并点击 num次 'x' 
	x,y = findMultiColorInRegionFuzzy( 0xffffff, "2|18|0xffffff,22|12|0xadb4be,-23|12|0xadb4be,1|10|0xadb4be,6|6|0xadb4be,-4|17|0xaeb5bf,-3|6|0xadb4be,6|15|0xadb4be", 90, 93, 972, 144, 1075)
	if x > 0 then
		for i=1,num do
			touchDown(1, x,  y); 
			mSleep(80);
			touchUp(1, x,  y);
			mSleep(40);
		end
	end
end

function pul_enterKey(num)
	-- 找小键盘 'enter'，并点击 num次 'enter'
	x,y = 36,  999
	-- 由于 Enter 的颜色可能会变化，用绝对坐标
	if x > 0 then
		for i=1,num do
			touchDown(1, x,  y); 
			mSleep(80);
			touchUp(1, x,  y);
			mSleep(40);
		end
	end
end

function pul_log(logtxt)
	logfile = "dlog"
	initLog(logfile, 0); --把 0 换成 1 即生成形似 test_1397679553.log 的日志文件
    wLog(logfile,"[DATE] : " .. logtxt);
    mSleep(100);
    closeLog(logfile); --关闭日志
end

function pul_click(x,y)
	touchDown(1, x,  y); 
	mSleep(80);
	touchUp(1, x,  y);
	mSleep(40);
end
