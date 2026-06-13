function OnUse(nItemIndex)
	SendScript2Client("Open([[LargeMsg]], 1, [[mysterious mailbox]]);");
	--Talk(1,"","<color=green>任教主：<color>\n   	你好！在下江别鹤，久仰您大名，得知教主杀死恶魔东方不败，重新夺回日月神教，在下实在高兴，感谢教主为我们整个武林铲除了这个大魔头，我相信日月神教在武功盖世、雄才大略的教主带领下，一定会永远威震江湖。\n 	在下得知通天幻境里有一个万剑冢，里面有很多奇珍异宝，且知道任教主曾进入过通天幻境，因此恳请教主和我一起闯万剑冢，我想如果我们大家齐心协力，一定能开启万剑冢里的封印，到时候一切宝物教主都可以拿走，我会听从教主的安排。如能得到教主的相助，将会是我江别鹤一生的荣幸。\n   期待能早日见到教主！\n                                                                    <color=green> 江别鹤<color>")
	--SetItemUseLapse(nItemIndex,18*60*3);
end