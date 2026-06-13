--小解绑符物品脚本
Include("\\script\\item\\jiebangfu.lua")

t_award = 
{
	n_gold = 400,
	n_room_need = 2,
	n_weight_need = 50,
	t_item = {
		{2,1,30470,1,"Strength Refine Pill"},
		{2,2,7,40,"M秐h Thi猲 th筩h"},
		},
}

function OnUse(nItemIdx)
	return _OnUseReal(nItemIdx)
end