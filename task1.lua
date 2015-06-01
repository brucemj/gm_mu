

function ts1_main()
	
end


function ts1_steps(num)
	repeat
		mSleep(1000)
		num = num - 1
	until num < 0 or cnf_pics["cnf_gn"] == 1;
end