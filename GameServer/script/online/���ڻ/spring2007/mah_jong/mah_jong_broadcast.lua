--2007´º½Ú»î¶¯-Âé½«ÊÕ¼¯»î¶¯-»î¶¯¹ã²¥
--´úÂë¿ª·¢ÈË£ºÕÔ¹ó´º
--´úÂë¿ª·¢Ê±¼ä£º2007-01-26
--ĞŞ¸Ä¼ÇÂ¼:

--ÕÔ¹ó´º¹«¹²ÎÄ¼ş
Include("\\script\\online\\zgc_public_fun.lua")
--=============================¹«¹²±äÁ¿¶¨ÒåÇø==============================
--===============================Ö÷Âß¼­Çø==================================
function main()
	if spring_2007_date_chk() == 0 then
		return
	end
	local mah_seq_time = {{11,time_distance},{15,time_distance},{22,time_distance}}
	local mah_suc_seq = spring_2007_mahj_suc_seq_rtn()
	if mah_suc_seq == 0then
		local mah_jong_suc_seq = {		--Âé½«ºÍ·¢·¨ĞòÁĞ
			{11,4,16},	{12,10,7},	{18,16,15},
			{4,17,14},	{10,6,1},	{2,7,3},
			{4,19,9},	{3,1,5},	{8,11,2},
			{1,12,13},	{13,9,7},	{2,12,15},
			{16,10,6},	{17,14,19},	{18,11,3},
			{9,5,1},	{4,2,1},
		}
		mah_suc_seq = 1
		local sec_seq_now = Zgc_pub_today_sec_num_rtn()		--»ñµÃÏÖÔÚÊÇ½ñÌìµÄµÚ¶àÉÙÃë
		for i = 1, 3 do
			sec_seq_now[i].time_distance = sec_seq_now - (sec_seq_now[i][1]*3600 )
		end
		for i = 2,3 do
			if sec_seq_now[i].time_distance < sec_seq_now[i-1].time_distance then
				mah_suc_seq = i
			end
		end
		local date_seq = (zgc_pub_day_turn(1) - 13552 + 1)
		mah_suc_seq = mah_jong_suc_seq[date_seq][mah_suc_seq]
	end
	local mah_suc_name = {	"Great Four Joys",		"Four Concealed Tiles",		"Cöu Liªn B¶o §¨ng", "Thirteen Orphans",	"Linked Seven Pairs",
							"Pure Seven Pairs",		"Seven Stars Unmatched",		"Unbeatable Pillar",	"Great Three Origins",	"Thanh Yªu Cöu",
							"Single-Color Four Identical Sequences", 	"Single-Color Four Pure Triplets", 	"Self Single-Color",	"Pure Single-Color",
							"All Big",			"All Middle",			"All Small",		"Thanh Long",		"Three Concealed Tiles",}
	Msg2SubWorld("Ho¹t ®éng thu thËp bµi M¹c Ch­îc:"..mah_suc_name[mah_suc_seq].."!")
	Msg2SubWorld("Mäi ng­êi tham gia gia ho¹t ®éng thu thËp, ®Õn 3 thµnh thŞ chİnh gÆp Phóc ThÇn ®Ó nhËn phÇn th­ëng.")
	Msg2SubWorld("Xin ®Õn chç Phóc ThÇn nhËn  H­íng dÉn ho¹t ®éng (miÔn phİ)")
end
