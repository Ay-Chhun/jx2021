Include ("\\Script\\lib\\globalfunctions.lua")

--Ã·Ωª√ÿºÆ∂“ªª≥ËŒÔ È
N_PUTINITEMPARAM = 177156
N_MAX_SUMMIT_ITEM_COUNT = 5
N_NEED_MONEY = 100000
STR_PLEASE_SUMMIT_BOOK = "H∑y giao mÀt tﬁch"
STR_SUMMIT_DESC = "X∏c Æﬁnh dÔng 5 MÀt Tﬁch S≠ M´n cao c p cÔng 10 vµng ÆÊi k¸ n®ng bπn ÆÂng hµnh kh´ng?"
SZ_THIS_SCRIPT = "\\script\\pet\\pet_book_exchange.lua"
MAX_RATE = 10000

--t_item_list = {}
t_book_award=
{
    --{1,400,"’Ê∆¯ª§ÃÂ1º∂",{2,150,1,1},0,0},
    {1,500,"Ch©n kh› hÈ th” C p 2",{2,150,2,1},0,0},
    {1,333,"Ch©n kh› hÈ th” C p 3",{2,150,3,1},0,0},
    {1,167,"Ch©n kh› hÈ th” C p 4",{2,150,4,1},0,0},
    --{1,400,"“Ê Ÿ—”—Ù1º∂",{2,150,5,1},0,0},
    {1,500,"›ch Th‰ Di™n D≠¨ng C p 2",{2,150,6,1},0,0},
    {1,333,"›ch Th‰ Di™n D≠¨ng C p 3",{2,150,7,1},0,0},
    {1,167,"›ch Th‰ Di™n D≠¨ng C p 4",{2,150,8,1},0,0},
    --{1,400,"«ø…Ì∞‘ÃÂ1º∂",{2,150,9,1},0,0},
    {1,500,"Strong Body Mighty Form Lv 2",{2,150,10,1},0,0},
    {1,333,"Strong Body Mighty Form Lv 3",{2,150,11,1},0,0},
    {1,167,"Qiang Shen Ba Ti Level 4",{2,150,12,1},0,0},
    --{1,120,"“ı∑Á ¥π«1º∂",{2,150,13,1},0,0},
    {1,150 ,"Yin Wind Bone Eroding Lv 2",{2,150,14,1},0,0},
    {1,100 ,"Yin Wind Bone Eroding Lv 3",{2,150,15,1},0,0},
    {1,50 ,"Yin Feng Shi Gu Level 4",{2,150,16,1},0,0},
    --{1,20 ,"–˛Œ‰ŒﬁÀ´1º∂",{2,150,17,1},0,0},
    {1,25 ,"Huy“n VÚ V´ Song C p 2",{2,150,18,1},0,0},
    {1,17 ,"Huy“n VÚ V´ Song C p 3",{2,150,19,1},0,0},
    {1,8  ,"Huy“n VÚ V´ Song C p 4",{2,150,20,1},0,0},
    --{1,200,"ŒÂ––Œﬁœ‡1º∂",{2,150,21,1},0,0},
    {1,250,"Formless Featureless Lv 2",{2,150,22,1},0,0},
    {1,170,"Formless Featureless Lv 3",{2,150,23,1},0,0},
    {1,80 ,"Wu Xing Wu Xiang Level 4",{2,150,24,1},0,0},
    --{1,400,"Ω¡È∏ΩÃÂ1º∂",{2,150,25,1},0,0},
    {1,500,"Metal Spirit Attachment Lv 2",{2,150,26,1},0,0},
    {1,333,"Metal Spirit Attachment Lv 3",{2,150,27,1},0,0},
    {1,167,"Jin Ling Fu Ti Level 4",{2,150,28,1},0,0},
    --{1,320,"ƒæ¡È∏ΩÃÂ1º∂",{2,150,29,1},0,0},
    {1,400,"Wood Spirit Attachment Lv 2",{2,150,30,1},0,0},
    {1,270,"Wood Spirit Attachment Lv 3",{2,150,31,1},0,0},
    {1,130 ,"Mu Ling Fu Ti Level 4",{2,150,32,1},0,0},
    --{1,400,"ÀÆ¡È∏ΩÃÂ1º∂",{2,150,33,1},0,0},
    {1,500,"Water Spirit Attached Body Lv 2",{2,150,34,1},0,0},
    {1,333,"Water Spirit Attached Body Lv 3",{2,150,35,1},0,0},
    {1,167,"Shui Ling Fu Ti Level 4",{2,150,36,1},0,0},
    --{1,160,"ª¡È∏ΩÃÂ1º∂",{2,150,37,1},0,0},
    {1,200,"Fire Spirit Attached Body Lv 2",{2,150,38,1},0,0},
    {1,133 ,"Fire Spirit Attached Body Lv 3",{2,150,39,1},0,0},
    {1,67 ,"Huo Ling Fu Ti Level 4",{2,150,40,1},0,0},
    --{1,400,"Õ¡¡È∏ΩÃÂ1º∂",{2,150,41,1},0,0},
    {1,500,"Earth Spirit Attachment Lv 2",{2,150,42,1},0,0},
    {1,333,"Earth Spirit Attachment Lv 3",{2,150,43,1},0,0},
    {1,167,"Tu Ling Fu Ti Level 4",{2,150,44,1},0,0},
    --{1,320,"∆∆ø’’∂”∞1º∂",{2,150,45,1},0,0},
    {1,400,"Sky Shattering Shadow Slash Lv 2",{2,150,46,1},0,0},
    {1,270,"Sky Shattering Shadow Slash Lv 3",{2,150,47,1},0,0},
    {1,130 ,"Po Kong Zhan Ying Level 4",{2,150,48,1},0,0},
    --{1,320,"…À∫¶º”…Ó1º∂",{2,150,49,1},0,0},
    {1,400,"S∏t th≠¨ng gia n©ng c p 2",{2,150,50,1},0,0},
    {1,270,"S∏t th≠¨ng gia n©ng c p 3",{2,150,51,1},0,0},
    {1,130 ,"S∏t th≠¨ng gia n©ng c p 4",{2,150,52,1},0,0},
    --{1,20 ,"«·¡È—∏º≤1º∂",{2,150,53,1},0,0},
    {1,25 ,"Nimble Spirit Swiftness  Lv 2",{2,150,54,1},0,0},
    {1,17 ,"Nimble Spirit Swiftness  Lv 3",{2,150,55,1},0,0},
    {1,8  ,"Qing Ling Xun Ji Level 4",{2,150,56,1},0,0},
    --{1,120,"Œﬁ–Œ÷Æπ∆1º∂",{2,150,57,1},0,0},
    {1,150 ,"Formless Ancient Lv 2",{2,150,58,1},0,0},
    {1,100 ,"Formless Ancient Lv 3",{2,150,59,1},0,0},
    {1,50 ,"Wu Xing Zhi Gu Level 4",{2,150,60,1},0,0},
}


function PetBookExchangeMain()
	local szTitle = "Ta Æang sÎ h˜u mÈt vµi quy”n s∏ch k¸ n®ng bπn ÆÂng hµnh Æay, chÿ c«n ng≠¨i giao cho ta 5 <color=red>MÀt tﬁch s≠ m´n cao c p<color> cÔng 10 vµng ph› thÒ tÙc, ta sœ ÆÊi cho ng≠¨i mÈt quy”n. Th’ nµo, ÆÂng ˝ ch¯?"
	local tbSay = {}
	tinsert(tbSay, "Ta muËn ÆÊi /OnExchange")
	tinsert(tbSay, "Th´i, ta kh´ng ÆÊi/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function OnExchange()
	--PutinItemBox("title", MaxPutinCount, "prompt", "call_back_script", callback_num)
	PutinItemBox(STR_PLEASE_SUMMIT_BOOK, N_MAX_SUMMIT_ITEM_COUNT, STR_SUMMIT_DESC, SZ_THIS_SCRIPT, N_PUTINITEMPARAM)
end

function OnPutinCheck(PutinItemParam, nWorldIdx, nG, nD, nP)
	--local nLevel = GetItemLevel(nWorldIdx)
	local nOk = 0
	if nG == 0 and nD == 107 and (nP >= 166 and nP <= 179) then
		nOk = 1
	end
	
--	if nOK == 1 then
--		t_item_list[getn(t_item_list) + 1] = nWorldIdx
--	else
--		t_item_list = {}
--	end
--	print(format("Put(%d)=%d", nWorldIdx, nOk))
	return nOk
end

function OnPutinComplete(nPutinItemParam)
	local nMoney = GetCash() or 0
	if nMoney < N_NEED_MONEY then
		Talk(1,"",format("SË vµng hi÷n c„ cÒa ng≠¨i kh´ng ÆÒ %d vµng!",floor(N_NEED_MONEY/10000)))
		return
	end
	local tbItems = GetPutinItem()
	if getn(tbItems) ~= N_MAX_SUMMIT_ITEM_COUNT then
		Talk(1,"",format("C«n nÈp %d quy”n mÀt tﬁch s≠ m´n cao c p!", N_MAX_SUMMIT_ITEM_COUNT))
		return
	end
	Pay(N_NEED_MONEY)
	for i = 1,getn(tbItems) do
		DelItemByIndex(tbItems[i][1], -1)
	end
	gf_EventGiveRandAward(t_book_award, MAX_RATE, 1, "S∏ch k‹ n®ng bπn ÆÂng hµnh", "Bæc ß»u L∑o Nh©n trao ÆÊi")
--	local nRand = random(1,getn(t_book_award))
--	local nIndex = AddItem(unpack(t_book_award[nRand]))
--	WriteLog(format("[Account:%s Role:%s] exchange pet book(nRand=%d)(Index:%d) %s(%d, %d, %d, %d)"
--			, GetAccount(), GetName(), nRand, nIndex, GetItemName(nIndex), t_book_award[nRand][1], t_book_award[nRand][2], t_book_award[nRand][3], t_book_award[nRand][4]
--			, nBookId, nNeedMoney, nRet
--			))
end

function no()
end