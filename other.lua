init("0",0)
mSleep(3000)

keys_seat = {
    ["q"] = {0,0}, -- 1
	["w"] = {0,0},
	["e"] = {0,0},
	["r"] = {0,0},
	["t"] = {0,0},
	["y"] = {0,0},
	["u"] = {0,0},
	["i"] = {0,0},
	["o"] = {0,0},
	["p"] = {0,0}, 	-- 10
	
	["a"] = {0,0}, 	-- 11
	["s"] = {0,0},
	["d"] = {0,0},
	["f"] = {0,0},
	["g"] = {0,0},
	["h"] = {0,0},
	["j"] = {0,0},
	["k"] = {0,0},
	["l"] = {0,0}, 	-- 19 
	
	["z"] = {0,0},	 -- 20
	["x"] = {0,0},
	["c"] = {0,0},
	["v"] = {0,0},
	["b"] = {0,0},
	["n"] = {0,0},
	["m"] = {0,0},	 -- 26
	}

function set_key_xy()
	for i = 1,10 do -- 第一排 q-p
		y = 763
		x = 32
		x1 = 52
		keys_seat[i] = {x + x1 * (i-1), y}
	end
	for i = 1,9 do -- 第二排 a-l
		y = 872
		x = 63
		x1 = 52
		keys_seat[i+10] = {x + x1 * (i-1), y}
	end
	for i = 1,7 do -- 第三排 z-m
		y = 978
		x = 126
		x1 = 52
		keys_seat[i+19] = {x + x1 * (i-1), y}
	end
	
	dialog(keys_seat["d"][1] .. keys_seat["d"][2],3)
	pul_click(keys_seat["d"][1],keys_seat["d"][2])
end


function snp_ff()
	current_time = os.date("%Y-%m-%d", os.time());
	snapshot(current_time..".png", 0, 0, 639, 1135,1);
end

function dlg_ret()
    choice = dialogRet("请选择您的性别：", "男", "女", "人妖", 0);
    if choice == 0 then      --男
        dialog("你好，帅哥。",0);
        mSleep(1000);
    elseif choice == 1 then  --女
        dialog("你好，美女",0);
        mSleep(1000);
    else                     --人妖
        dialog("人妖不允许使用该脚本。",0);
        mSleep(1000);
        lua_exit();          --退出脚本
    end
end

function pul_click(x,y)
	touchDown(1, x,  y); 
	mSleep(80);
	touchUp(1, x,  y);
	mSleep(40);
end

function wrt_txt()
	user_txt = "asddf"
	pul_click(144,  400)
	mSleep(1000)
	--ul_backKey(16)
	inputText(user_txt)
	mSleep(500)
	--pul_enterKey(1)
end

function dlg_int()
    text_a, text_b = dialogInput("请选择您的姓名和年龄", "在这里输入姓名#在这里输入年龄", "确认");
	mSleep(1000);
	dialog(text_a .. text_b ,2)
end

function shw_ui()
	    w,h = getScreenSize();
    MyJsonString = [[
    {
      "style": "default",
      "width": ]]..w..[[,
      "height": ]]..h..[[,
      "config": "save_111.dat",
      "timer": 10,
      "views": [
        {
          "type": "Label",
          "text": "设置",
          "size": 25,
          "align": "center",
          "color": "0,0,255"
        },
        {
          "type": "RadioGroup",
          "list": "选项1,选项2,选项3,选项4,选项5,选项6,选项7",
          "select": "1"
        },
        {
          "type": "Edit",
          "prompt": "测试三下",
          "text": "默认值",
          "size": 15,
          "align": "left",
          "color": "255,0,0"
        },
        {
          "type": "CheckBoxGroup",
          "list": "选项1,选项2,选项3,选项4,选项5,选项6,选项7",
          "select": "3@5"
        }
      ]
    }
    ]]
    ret, input1, input2, input3 = showUI(MyJsonString);
end

--------------------------------------- 函数定义结束 ------------------------------

--snp_ff()
--dlg_ret()
--wrt_txt()
--dlg_int()
--shw_ui()
set_key_xy()

