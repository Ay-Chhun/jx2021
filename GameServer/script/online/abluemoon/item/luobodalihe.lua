Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
function OnUse()
	Say("Using the Carrot Grand Gift Box gives you <color=yellow>ten red carrots<color>. Do you want to use it?",2,
			"I want to use it/give_hongluobo10",
			"Not now/end_say"
	)
end

function give_hongluobo10()
	if Zgc_pub_goods_add_chk(1,10) ~= 1 then		--空间/负重判断
		Talk(1,"","Please make sure your bag has enough carry weight and space!")
		return
	end
	if DelItem(2,1,1095,1) == 1 then
		AddItem(2,1,1090,10)
	else
		Say("Please confirm you have a Carrot Grand Gift Box on you!",0)
	end
end

function end_say()
end