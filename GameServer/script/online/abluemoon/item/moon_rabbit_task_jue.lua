--½Å±¾Ãû³Æ£ºÊ¦ÃÅ¾÷Òª°üÊ¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£ºÍæ¼ÒÊ¹ÓÃ½Å±¾ºó£¬Ëæ»ú¸øÍæ¼ÒÔö¼ÓÈÎÒâÒ»¸öÃÅÅÉµÄÈÎÒâÁ½±¾¾÷Òª
--´úÂë±àÐ´ÈË£º´å³¤
--´úÂë±àÐ´Ê±¼ä£º2007-01-28
--ÐÞ¸Ä¼ÇÂ¼£ºÐ¡À¶´ò²¹¶¡
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êý
--=================================¹«¹²±äÁ¿¶¨ÒåÇø============================
jue_list = {
		{{"Shaolin Saber Technique Manual",2,6,1},
		{"Shaolin Staff Technique Manual",2,6,2},
		{"Demon-Slaying Saber Technique Manual",2,6,3},
		{"Demon-Sealing Staff Technique Manual",2,6,4},
		{"Golden Bell Shield Manual",2,6,5},
		{"Burning Wood Saber Technique Manual",2,6,6},
		{"Impermanence Staff Technique Manual",2,6,7},
		{"Self-Sacrifice Art Manual",2,6,8},
		{"Mahayana Tathagata Heart Method Manual",2,6,9},
		{"Bodhidharma Martial Scripture Manual",2,6,10},
		{"Seven Treasures Divine Reflection Heart Method Manual",2,6,11},
		{"Arhat Fist Manual",2,6,12},
		{"Kasyapa Leg Manual",2,6,13},
		{"Wisdom Eye Incantation Manual",2,6,14},
		{"Skanda Fist Manual",2,6,15},
		{"Manjushri Cloud-Emerging Leg Manual",2,6,16},
		{"Arhat Formation Manual",2,6,17},
		{"Great Sumeru Palm Manual",2,6,18},
		{"Shadowless Kick Manual",2,6,19},
		{"Shaolin Dragon Claw Hand Manual",2,6,20},
		{"Tiger-Subduing Qigong Manual",2,6,21},
		{"Shaolin Mind-Cultivation Method Manual",2,6,22},
		{"Five-Turn Finger Manual",2,6,23},
		{"Demon-Breaking Incantation Manual",2,6,24},
		{"Indestructible Vajra Manual",2,6,25},
		{"Indra Thunder Seal Break Manual",2,6,26},
		{"Kasaya Demon-Subduing Divine Power Manual",2,6,27},
		{"Formless Divine Art Manual",2,6,28},
		{"Lion's Roar Manual",2,6,29},
		{"Immovable Wisdom King Incantation Manual",2,6,30},
		{"Mighty Vajra Finger Manual",2,6,31}},
		{{"Hidden Weapon Crafting Art Manual",2,6,32},
		{"Mind's Eye Manual",2,6,33},
		{"Poison Thorn Bone Manual",2,6,34},
		{"Antidote Secret Art Manual",2,6,35},
		{"Soul-Hooking Trap Manual",2,6,36},
		{"Mechanism-Breaking Art Manual",2,6,37},
		{"Heart-Chasing Arrow Manual",2,6,38},
		{"Keen Insight Manual",2,6,39},
		{"Heart-Piercing Thrust Manual",2,6,40},
		{"Poison-Tempering Secret Art Manual",2,6,41},
		{"Soul-Snatching Banner Manual",2,6,42},
		{"Pear Blossom Rainstorm Needle Manual",2,6,43},
		{"Sand-Hidden Shadow Shot Manual",2,6,44},
		{"Life-Locking Needle Manual",2,6,45},
		{"Sky-Filling Flower Rain Manual",2,6,46}},
		{{"Guanyin Art Manual",2,6,47},
		{"Emei Buddha Intent Manual",2,6,48},
		{"Jade Maiden Sword Technique Manual",2,6,49},
		{"Crossing Origin Art Manual",2,6,50},
		{"Buddha Light Universal Radiance Manual",2,6,51},
		{"Lotus Heart Scripture Manual",2,6,52},
		{"Pure Sound Sanskrit Chant Manual",2,6,53},
		{"Flowing Water Art Manual",2,6,54},
		{"Universal Salvation Manual",2,6,55},
		{"Undying Heart Method Manual",2,6,56},
		{"Buddha Light Battle Qi Manual",2,6,57},
		{"Buddha Sound Battle Intent Manual",2,6,58},
		{"Great Mercy Great Compassion Incantation Manual",2,6,59},
		{"Free Melody Manual",2,6,60},
		{"Musical Mastery Manual",2,6,61},
		{"Lunar Eclipse Melody Manual",2,6,62},
		{"Water-Severing Heart Method Manual",2,6,63},
		{"Quiet Night Thoughts Manual",2,6,64},
		{"Lingering Echo Art Manual",2,6,65},
		{"Yangguan Three Variations Manual",2,6,66},
		{"Water-Returning Heart Method Manual",2,6,67},
		{"Burning Zither Boiling Crane Art Manual",2,6,68},
		{"Crow's Night Cry Manual",2,6,69},
		{"Heart-Bewitching Fragrance Melody Manual",2,6,70}},
		{{"Beggar Sect Palm Technique Manual",2,6,71},
		{"Through-Arm Fist Manual",2,6,72},
		{"Thousand-Catty Gate Manual",2,6,73},
		{"Overlord Fist Manual",2,6,74},
		{"Throat-Locking Grappling Hand Manual",2,6,75},
		{"Carefree Wandering Manual",2,6,76},
		{"Six Harmonies Fist Technique Manual",2,6,77},
		{"Drunken Butterfly Manual",2,6,78},
		{"Drunken Fist Manual",2,6,79},
		{"Beggar Sect Staff Technique Manual",2,6,80},
		{"Snake-Driving Staff Technique Manual",2,6,81},
		{"Begging Heaven and Earth Manual",2,6,82},
		{"Loach Art Manual",2,6,83},
		{"Skilled Hands Art Manual",2,6,84},
		{"Stealing Dragon Swapping Phoenix Manual",2,6,85},
		{"Overlord Sheds Armor Manual",2,6,86},
		{"Stealing Heaven Changing Day Manual",2,6,87},
		{"Dog-Beating Staff Technique Manual",2,6,88}},
		{{"Wudang Sword Technique Manual",2,6,89},
		{"Flowing Light Sword Technique Manual",2,6,90},
		{"Weiyang Sword Technique Manual",2,6,91},
		{"Soft Cloud Sword Technique Manual",2,6,92},
		{"Blazing Flame Sword Technique Manual",2,6,93},
		{"Rushing Thunder Sword Art Manual",2,6,94},
		{"Selfless Heart Method Manual",2,6,95},
		{"Supreme Clarity Sword Qi Manual",2,6,96},
		{"Dream-Entwining Sword Intent Manual",2,6,97},
		{"Falling Frost Sword Intent Manual",2,6,98},
		{"Scorching Sun Sword Qi Manual",2,6,99},
		{"Black Tortoise Sword Formation Manual",2,6,100},
		{"Sword-Controlling Art Manual",2,6,101},
		{"Orthodox Two Forms Sword Technique Manual",2,6,102},
		{"Taiyi Three Clarities Sword Manual",2,6,103},
		{"Divine Gate Thirteen Swords Manual",2,6,104},
		{"Earthly Tranquility Mysterious Yin Sword Manual",2,6,105},
		{"Heavenly Clarity Pure Yang Sword Manual",2,6,106},
		{"Eight Trigrams Sword Qi Manual",2,6,107},
		{"True Martial Seven-Cut Sword Manual",2,6,108},
		{"Wudang Brush Technique Manual",2,6,109},
		{"Taiyi Carefree Art Manual",2,6,110},
		{"Six Qi Jade-Transforming Art Manual",2,6,111},
		{"Cloud-Ladder Leap Manual",2,6,112},
		{"Seven Stars Art Manual",2,6,113},
		{"Lesser Yang Art Manual",2,6,114},
		{"Lesser Yin Art Manual",2,6,115},
		{"Big Dipper Seven Stars Formation Manual",2,6,116},
		{"Residual Shadow Art Manual",2,6,117},
		{"Heaven and Earth Art Manual",2,6,118},
		{"Upper Clarity Boundless Art Manual",2,6,119}},
		{{"Yang Family Spear Technique Manual",2,6,120},
		{"Yang Family Wind-Breaking Spear Manual",2,6,121},
		{"Yang Family Horse-Taming Art Manual",2,6,122},
		{"Yang Family Wolf-Charging Spear Manual",2,6,123},
		{"Yang Family Battle Stance Art Manual",2,6,124},
		{"Yang Family Cunning Battle Art Manual",2,6,125},
		{"Yang Family Sky Balance Spear Manual",2,6,126},
		{"Yang Family Hero Qi Manual",2,6,127},
		{"Yang Family Sea-Toppling Spear Manual",2,6,128},
		{"Yang Family Horse-Riding Art Manual",2,6,129},
		{"Azure Moon Flying Star Spear Manual",2,6,130},
		{"Yang Family Bow Technique Manual",2,6,131},
		{"Yang Family Continuous Shot Art Manual",2,6,132},
		{"Yang Family Formation Healing Art Manual",2,6,133},
		{"Yang Family Dragon-Returning Arrow Manual",2,6,134},
		{"Yang Family Cloud-Entwining Arrow Manual",2,6,135},
		{"Yang Family Wonder Gate Shield Manual",2,6,136},
		{"Yang Family Righteous Qi Arrow Manual",2,6,137},
		{"Yang Family Gold-Shattering Arrow Manual",2,6,138},
		{"Yang Family Illusion Spirit Art Manual",2,6,139},
		{"Yang Family Life-Extending Art Manual",2,6,140},
		{"Flowing Light Shadowless Arrow Manual",2,6,141}},
		{{"Five Poisons Saber Technique Manual",2,6,142},
		{"Soul-Summoning Incantation Manual",2,6,143},
		{"Corpse Control Technique Manual",2,6,144},
		{"Corpse Poison Technique Manual",2,6,145},
		{"Corpse Burst Great Art Manual",2,6,146},
		{"Corpse Gathering Evil Aura Manual",2,6,147},
		{"Corpse Curse Technique Manual",2,6,148},
		{"Myriad Poison Soul-Reaping Blade Manual",2,6,149},
		{"Sinister Soul-Devouring Aura Manual",2,6,150},
		{"Corpse-Urging Evil Aura Manual",2,6,151},
		{"Evil Spirit Great Art Manual",2,6,152},
		{"Evil Poison Skill Manual",2,6,153},
		{"Corpse-Rending Demon Skill Manual",2,6,154},
		{"Lower Gu Secret Method Manual",2,6,155},
		{"Mad Gu Manual",2,6,156},
		{"Gu-Rearing Secret Technique Manual",2,6,157},
		{"Mad Wind Claw Manual",2,6,158},
		{"Poison Gu Manual",2,6,159},
		{"Blood Cauldron Skill Manual",2,6,160},
		{"Blood Gu Manual",2,6,161},
		{"Fragrance Gu Manual",2,6,162},
		{"Corpse Gu Manual",2,6,163},
		{"Demon Gu Manual",2,6,164},
		{"Heart Gu Manual",2,6,165},
		{"Myriad Gu Devouring Heaven Manual",2,6,166},
		{"Illusion Gu Manual",2,6,167},
		{"Soul Gu Manual",2,6,168}},
}
jue_id = {	{607,"Shaolin Secret Pack"},
			{608,"Tangmen Secret Pack"},
			{609,"Emei Secret Pack"},
			{610,"Gaibang Secret Pack"},
			{611,"Wudang Secret Pack"},
			{612,"Yangmen Secret Pack"},
			{613,"Wudu Secret Pack"}}
--==================================½Å±¾Ö÷Âß¼­Çø=============================
function OnUse(goods_index)
	local goods_id = GetItemParticular(goods_index)
	local goods_diff = 0
	for i =1, getn(jue_id) do
		if goods_id == jue_id[i][1] then
			goods_diff = i
			break
		end
	end
	Say("Sö dông tói bÝ kiÕp sÏ may m¾n nhËn ®­îc c¸c lo¹i yÕu quyÕt m«n ph¸i. Sö dông?",2,
	"Agreed!/#goods_use_det("..goods_diff..")",
	"Ch­a cÇn/end_dialog"
	)
end

function end_dialog()
end

--***********************************ÎïÆ·Ê¹ÓÃÇø******************************
function goods_use_det(goods_diff)
	if Zgc_pub_goods_add_chk(5,50) ~= 1 then		--¿Õ¼ä/¸ºÖØÅÐ¶Ï
		Talk(1,"","Please make sure your bag has enough carry weight and space!")
		return
	end
	if GetItemCount(2,0,jue_id[goods_diff][1]) == 0 then
		Talk(1,"","Please confirm your inventory contains <color=red>"..jue_id[goods_diff][2].."<color>£¡")
		return
	end
	if DelItem(2,0,jue_id[goods_diff][1],1) ~= 1 then
		Talk(1,"","Please confirm your inventory contains <color=red>"..jue_id[goods_diff][2].."<color>£¡")
		return
	else
		for i = 1, 5 do
			local ran_num = random(1,getn(jue_list[goods_diff]))
			local add_flag = AddItem(jue_list[goods_diff][ran_num][2],jue_list[goods_diff][ran_num][3],jue_list[goods_diff][ran_num][4],1)
			if add_flag == 1 then
				Msg2Player("Äã»ñµÃÒ»±¾:\""..jue_list[goods_diff][ran_num][1].."\"")
			else
				WriteLog(GetName().."Obtained:"..jue_list[goods_diff][ran_num][1].."Increase failed, failure marker:"..add_flag)
			end
		end
	end	
end
