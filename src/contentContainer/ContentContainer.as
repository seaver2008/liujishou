package contentContainer
{
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import assets.StartBg;
	import assets.StartTitle;
		
	public class ContentContainer extends Sprite
	{
		private var startbg:StartBg;
		private var starttitle:StartTitle;
		
//		private var start:StartLoad;
		private var home:HomeCon;
				
		public function ContentContainer()
		{
			init();
//			this.addChild(new CamContainer());
		}
		
		private function init():void
		{
//			start = new StartLoad();
			
			startbg = new StartBg();
			starttitle = new StartTitle();
			home = new HomeCon();
			
			this.addChild(startbg);
			this.addChild(starttitle);
			starttitle.alpha=0;
			starttitle.y=-200;
			TweenMax.to(starttitle, 1, {y:0,autoAlpha:1});
			startbg.addEventListener(Event.ENTER_FRAME,onFrame);
		}
		protected function onFrame(event:Event):void
		{		
			if(startbg.currentFrame==30){
				home.alpha=0;				
				this.addChild(home);		
				TweenMax.to(home, 0.8, {autoAlpha:1});
				removeChild(startbg);
				removeChild(starttitle);
				startbg.removeEventListener(Event.ENTER_FRAME,onFrame);					
			}
		}		
	}
}
