--File name:recordbook_item.lua
--Describe:聚宝斋功劳册物品脚本
--Create Date:2006-4-10
--Author:yanjun
Include("\\script\\online\\laborday06\\laborday_head.lua");

function OnUse()
	local selTab = {
				"Chng 1: danh m鬰 v藅 thu th藀 lo筰 1/#seetype(1)",
				"Chng 2: danh m鬰 v藅 thu th藀 lo筰 2/#seetype(2)",
				"Chng 3: danh m鬰 v藅 thu th藀 lo筰 3/#seetype(3)",
				"Chng 4: danh m鬰 v藅 thu th藀 lo筰 4/#seetype(4)",
				"Chng 5: danh m鬰 v藅 thu th藀 lo筰 5/#seetype(5)",
				"Chng 6: danh m鬰 v藅 thu th藀 lo筰 6/#seetype(6)",
				"Chng 7: danh m鬰 v藅 thu th藀 lo筰 7/#seetype(7)",
				"Chng 8: ph莕 thng/#knowrule(3)",
				"Chng 9: thuy誸 minh ho箃 ng/#knowdetail(3)",
				"Close/nothing",
				}
	Say("B筺  n閜 "..g_TotalItemNum.."<color=yellow>"..GetTask(ITEMNUM).."<color> lo筰 v藅 thu th藀.",getn(selTab),selTab);
end;

function seetype(nType)
	seenext(nType,1);
end;

function seenext(nType,nPageNo)
	if nPageNo == 0 then	--目前没起作用，不过还是保留着吧
		queryinfor();
		return 1;
	end;
	local nTaskID = LABORDAY_ITEM_BEGIN+nType-1;
	local sYes = "<color=yellow>submitted<color>";
	local sNo = "<color=red>ch璦 n閜<color>";
	local sContent = "";
	local selTab = {};
	local nSelNum = 1;
	local nMaxPage = 5;	--默认最大翻页（小页）数
	local tNumTab = {
			"m閠",
			"hai",
			"ba",
			"ben",
			"Wu",
			"six",
			"seven"
			};
	if nType == LABORDAY_ITEM_END-LABORDAY_ITEM_BEGIN+1 then	--如果为最后一页（大页）
		nMaxPage = floor(((g_TotalItemNum-30*(nType-1))-1)/6)+1;
	end;						
	if nPageNo ~= nMaxPage then
		selTab[nSelNum] = "Next page/#seenext("..nType..","..(nPageNo+1)..")";
		nSelNum = nSelNum + 1;
	end;
	if nPageNo ~= 1 then
		selTab[nSelNum] = "Previous page/#seenext("..nType..","..(nPageNo-1)..")";
		nSelNum = nSelNum + 1;
	end;
	selTab[nSelNum] = "Quay l筰 m鬰 l鬰 trc./OnUse";
	nSelNum = nSelNum + 1;
	selTab[nSelNum] = "Close./nothing";
	nSelNum = nSelNum + 1;
	local ItemNumPerPage = 6;
	if (nType-1)*30+nPageNo*6 > g_TotalItemNum then	
		ItemNumPerPage = mod(g_TotalItemNum,6);
	end;
	for i=1,ItemNumPerPage do	--6 item per page
		local sTail = "";
		if i ~= ItemNumPerPage then
			sTail = "<enter>";
		end;
		local nItemNo = (nType-1)*30+((nPageNo-1)*6+i);
		if ItemTab[nItemNo][5] ~= nil then
			if GetBit(GetTask(nTaskID),(nPageNo-1)*6+i) == 1 then
				sContent = sContent.."no.:"..nItemNo.." <color=green>"..ItemTab[nItemNo][5].."<color>("..ItemTab[nItemNo][4].."):"..sYes..sTail;
			else
				sContent = sContent.."no.:"..nItemNo.." <color=green>"..ItemTab[nItemNo][5].."<color>("..ItemTab[nItemNo][4].."):"..sNo..sTail;
			end;
		end;
	end;
	Say("Danh m鬰 thu th藀, lo筰 <color=yellow>"..tNumTab[nType].."<color>, trang <color=yellow>"..nPageNo.."<color>:<enter>"..sContent,getn(selTab),selTab);
end;


