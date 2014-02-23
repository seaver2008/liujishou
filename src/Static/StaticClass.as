package Static
{
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import assets.Minus;
	import assets.PissOff;
	import assets.Zero;
	
	public class StaticClass extends Sprite
	{
		
		public static var Picture:BitmapData; 
		public static var Cutpicture:BitmapData;
		public static var sex:int;
		public static var LoadPicture:Loader;
		public static var picture:MovieClip;
		
		public function StaticClass()
		{
			super();
//			Picture = new BitmapData(640,920);
		}
		public static function comments():String
		{
			var women1:Array = new Array;//10
			women1 = ["座右铭“做一个明媚的女子，不倾城不倾国”，倒是想倾来着，可就这德性，想倾屯子都难啊。","长得跟女版新佑卫门似的,知道的说你是流行STYLE，不知道根本分不清你正反面。","你是那种男人见到心会慌张的女孩，风吹着你秀美的头发，还来不及拭去的一颗西瓜子还停留在嘴边，别样的可爱。","我梦中的你是个美女，总有一天你会骑着喷火的恐龙出现。但在我眼前，我只看见了她的坐骑。","只能说你张成这样怎么能对得起我这双狂野的如疯狗般发现美的眼睛？","看看这张脸，只能说您活的有创意活的有勇气。","下次美图秀秀的时候，切记一定要直接柔光把五官打掉。","即使是万里长城也阻挡不了您进击的脚步，张成这样，您还是直接告诉我您是奇行种吧，下次记得给一张后脖颈的照片。","传说这世上美女如云，帅男如星，我在你照片没看到帅男，只看到了这么一句话：万里无云。","PS的跟刚从开水里脱完毛得了白化病的白斩鸡似的，看着就假。"];
			var women2:Array = new Array;//6
			women2 = ["照片整的跟灵异视频截图似的，俩黑漆漆的大眼珠子像刚从金字塔里挖出来的木乃伊，给人感觉随时有两只大苍蝇能从里面飞出来。一副幽怨的表情好像谁都欠你两元钱，半夜尽量少出门吧。","一看就是剁手党，每天关注闪购、团购网。9块钱包邮的拖鞋，10块钱3双的袜子，全都进了你的购物车。一个月收100多次快递，都是当当尾品汇不到3折的廉价货，总消费不到1000块。","你这种人，平时踱步到街角的图书馆，坐在最显眼的位置，来一杯蓝山，拿本《加缪文集》下面压着一本故事会。没人时发微博，有人时装读书，期待一段刻骨铭心的邂逅。","大家对你的评价是静若瘫痪，动若癫痫，自我感觉还特良好，微博上爱留一句“如何才能遇见你，在我最美丽的时刻。”遇你大爷，看你就心烦。","你这种人，看着有文化，实则写的字儿连画的都不如，说着一口洋文，但是听着属于中国人不懂，美国人不明白，法国人以为见老乡那种境界。快告诉我你四级证书是哪个街口办的？","你属于女神和女屌都不沾边的夹心层，玻尿酸注射过度的下巴和一对倒三角眼让你今生都无缘转正，纠结的眉头仿佛诉说着你的苦逼生活，给人一种杜十娘怒沉百宝箱前最后留念的感觉。"];
			var men1:Array = new Array;//8
			men1 = ["穿的土不土洋不洋，整的跟神探加吉特似的。","即使是万里长城也阻挡不了您进击的脚步，长成这样，您还是直接告诉我您是奇行种吧，下次记得给一张后脖颈的照片。","传说这世上美女如云，帅男如星，你发照片的时候，一定忘了我身处北京，就你这样也就PM2.5导致我看不见星星。","看看这张脸，只能说您活的有创意，活的有勇气。","你还记得不大学报到那天，有个家长拍着你肩膀一脸同情的跟你说：大哥你要孩子够晚的啊。","哥们，不要让我有一种找人逼你早恋的欲望，因为你现在已经彻底没了希望。","看着也像个研究生，苍白瘦弱的脸总是一副纵欲过度的样子。","成年后的大头儿子，ISO认证扁铲型脑袋，正方体头型可完美塞入各类收纳箱。"];
			var men2:Array = new Array;//5
			men2 = ["看你这长相和我对中国大学的了解，与其相信你对于异性有着不为人知的吸引力，我更倾向认为你想象力异常丰富，并且自己动手丰衣足食。切记注意身体，多抹护手霜。","你这种人，看着有文化，实则写的字儿连画的都不如，说着一口洋文，但是听着属于中国人不懂，美国人不明白，法国人以为见老乡那种境界。快告诉我你四级证书是哪个街口办的？","哥告诉你，你这是中二病晚期没救了，手里拿着水果刀就以为自己是浪客剑心，做晚饭洗菜刀还想COS一把海贼王，早上拿着刮胡刀以为自己是黄金圣斗士，殊不知已经变成了剩斗士，心灰意冷左右脸一刀一口子。亲记得死哥哥定律哦~","一看就是没有迅雷VIP，憋了一晚上，死活没看上苍老师新片儿。熬得一脸包，知道的说你是为了人类的本性而奋斗，不知道到的以为你是去给晋江当了地砖，脸被万千玛丽苏砸的是三步一坑五步一坎儿。左边整容医院，慢走不送。","我知道你将来一定是是技术白领，每天过的是哆啦A梦的72小时，现在学校里是大神级任务，作业给人抱大腿，考试给人送助攻，人称世纪好舍友。但是哥们你还年轻，不搞基的话趁早找个女朋友，改善下气质吧。"];
			var score:Array = new Array;//6  10
			score = ["就你这样哥真不知道该给你几分，滚粗！！","为了评分界的良心，负分！滚粗！！","剁手，负分！滚粗！","负分!该去哪去哪!","负分，滚粗！","负分，滚粗！","负分，滚粗！","负分该去哪去哪!","你的分数打折后是0分，哥正在考虑是不是减个价。","0分！哥没有什么想说的了，拿好你的分数，慢走不送!"];
			var scoreIndex:int;
			
			scoreIndex = Math.floor(Math.random()*10);
			
			
			if(scoreIndex == 0)
			{
				picture = new PissOff;
			}
			else if(scoreIndex == 8 || scoreIndex == 9)
			{
				picture = new Zero;
			}
			else
			{
				picture = new Minus;
			}
			picture.x = 420;
			picture.y = 160;
			
			if (sex == 0)
			{
				return men1[Math.floor(Math.random()*8)]+men2[Math.floor(Math.random()*5)]+score[scoreIndex];
			}
			else if(sex == 1)
			{
				return women1[Math.floor(Math.random()*10)]+women2[Math.floor(Math.random()*6)]+score[scoreIndex];
			}
			return "";
		}
	}
}