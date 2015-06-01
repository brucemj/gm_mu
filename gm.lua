--package.path="D:\\game\\lua\\sc\\?.lua"
--package.path="./?.lua;"
require("public")
require("login")
require("config")
require("task1")
require("new0")

app_id0 = "com.tianmashikong.qmqj.apps"
app_id1 = "com.tianmashikong.qmqj.apps.pp.1"
app_id2 = "com.tianmashikong.qmqj.apps.pp.11"

-- 主进程
function main()
	init("0",0)
	mSleep(3000)
	app_id = app_id1
	pul_log("-------------- start : " .. app_id)
	if lgn_startgm(app_id) == 0 then  --如果启动成功
		dialog(app_id .. "启动成功",2) --启动成功
		lgn_steps(2)
		cnf_steps(5)
		nw0_steps(2)
	else
		dialog(app_id .. "启动失败",2) --启动失败
		return 0
	end
end
main()

