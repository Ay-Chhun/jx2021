-- Created by TuanNA5
-- Give player award for 3rd BHTA

EXT_MATTICH = -1
EXT_NHANSAM = 5
BHTA_DATE_START = 10051400
BHTA_DATE_END = 10051624

tPrize ={
	{"M∂nh MÀt Tﬁch Th t Lπc",{2,1,1088},1,1,EXT_MATTICH},
	{"Nh©n S©m Vπn N®m",{2,1,30071},1,1,EXT_NHANSAM}
}

function get_prize()
	local tSay = {
--		"NhÀn M∂nh MÀt Tﬁch Th t Lπc/#processIndex(1)",
		"NhÀn Nh©n S©m Vπn N®m/#processIndex(2)",
		"End dialogue/nothing",
	}	
	Say("ThÍi gian nhÀn th≠Îng vÀt ph»m Bang HÈi Tinh Anh 3 tı <color=red>14/05/2010 - 16/05/2010<color>, c∏c hπ nhÀn ph«n th≠Îng nµo?",getn(tSay),tSay)
end


function processIndex(nIndex)		
	local nExtVal = GetExtPoint(tPrize[nIndex][5])
	local nFreeItemRoom = GetFreeItemRoom()
	
	if (nExtVal >= 1) then
		if ((nFreeItemRoom >=  tPrize[nIndex][3]) and (GetCurItemWeight() + nExtVal*tPrize[nIndex][4] <= GetMaxItemWeight())) then
			PayExtPoint(tPrize[nIndex][5], nExtVal)
		else			
			Say("S¯c l˘c ho∆c hµnh trang cÒa c∏c hπ kh´ng ÆÒ.",0)
			Msg2Player("S¯c l˘c ho∆c hµnh trang cÒa bπn kh´ng ÆÒ.")
			return			
		end		
	else
		Say("Chÿ c„ ng≠Íi tham gia Bang HÈi Tinh Anh 3 mÌi Æ≠Óc nhÀn!",0)
		Msg2Player("Bπn kh´ng ÆÒ Æi“u ki÷n nhÀn th≠Îng.")
	end
end