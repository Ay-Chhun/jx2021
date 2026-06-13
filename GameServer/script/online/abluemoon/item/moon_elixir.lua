--脚本名称：月亮兔仙丹使用脚本
--脚本功能：使用月亮兔仙丹增加60个仙数量
--功能策划人：兔子
--功能开发人：村长
--功能测试人：洋葱
--代码开发时间：2008-12-11
--代码修改记录：
Elixir_chg_num = 60							--一个月亮仙丹兑换的数量
TaskID_elixer_num = 1263					--仙丹的数量
Elixer_num_max = 30000					--仙丹存放的最大数量

function OnUse(elixir_index)
	Say("<color=green>Tip<color>: Using the <color=yellow>Moonlight Immortal Pill<color> can increase your own <color=yellow>Immortal Pill<color> count by <color=yellow>"..Elixir_chg_num.."<color> pills. Are you sure you want to use it?",
	2,
	"I confirm I want to use it/elixir_use_dtm",
	"Let me think it over again/end_dialog"
	)
end
--确认使用数量输入
function elixir_use_dtm()
	local num_max = GetItemCount(2,0,1042)
	AskClientForNumber("elixir_chg_dtm",1,num_max,"Please enter the amount you want to exchange")
end
--确认对话
function elixir_chg_dtm(num_enter)
	--携带检测
	if GetItemCount(2,0,1042) <num_enter then
		Talk(1,"","<color=green>Tip<color>: Your <color=yellow>Moonlight Immortal Pill<color> count is insufficient. Please confirm and use it again!")
		return
	end
	--上限判断
	local elixir_num = GetTask(TaskID_elixer_num) + (num_enter *Elixir_chg_num)
	if elixir_num > Elixer_num_max then
		Talk(1,"","<color=green>Tip<color>: Your <color=yellow>Immortal Pill<color> count has reached the upper limit: <color=red>"..Elixer_num_max.."<color> pills. Please go to <color=yellow>Fengxiang<color> and find the <color=green>Chief Examiner Rabbit Steward<color> to exchange them first, then come back to use it!")
		return
	end
	--删除检测
	if DelItem(2,0,1042,num_enter) ~= 1 then
		Talk(1,"","<color=green>Tip<color>: Your <color=yellow>Moonlight Immortal Pill<color> count is insufficient. Please confirm and use it again!")
		return
	end
	SetTask(TaskID_elixer_num,elixir_num)
	Talk(1,"","<color=green>Tip<color>: After using it you gained <color=yellow>".. (num_enter *Elixir_chg_num).."<color> Immortal Pills. Your total Immortal Pill count is now <color=yellow>"..elixir_num.."<color> pills!")
end
--结束对话
function end_dialog()
end
