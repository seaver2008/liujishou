package contentContainer
{
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Content extends Sprite
	{
		private var later:Sprite;
		private var effect:int;
		public var transfor:Array;
		
		public function Content()
		{
			super();
			init();			
		}
		
		private function init():void
		{
			
		}
		
		public function goTo(later:Sprite,effect:int = 0):void
		{
			this.later = later;
			this.effect = effect;
			
			this.mouseChildren = this.mouseEnabled = false;
			
			if(effect == 1)
			{
				TweenMax.to(this, 0.3, {x:-640, y:0,onComplete:onAllFinish});
				this.later.x = 640;
				TweenMax.to(later, 0.3, {x:0, y:0});
				this.parent.addChild(later);
				/*var t1:TimelineMax = new TimelineMax({onComplete:onAllFinish});
				t1.append(TweenMax.to(this,0.3,{z:200}));
				t1.append(TweenMax.to(this,0.3,{rotationX:this.rotationX+180}));
				t1.append(TweenMax.to(this,0.3,{z:0}));*/
			}
			else if (effect == -1)
			{
				TweenMax.to(this, 0.3, {x:640, y:0,onComplete:onAllFinish});
				this.later.x = -640;
				TweenMax.to(later, 0.3, {x:0, y:0});
				this.parent.addChild(later);
				/*var t2:TimelineMax = new TimelineMax({onComplete:onAllFinish});
				t2.append(TweenMax.to(this,0.3,{z:200}));
				t2.append(TweenMax.to(this,0.3,{rotationX:this.rotationX-180}));
				t2.append(TweenMax.to(this,0.3,{z:0}));*/
			}
			else if (effect == 0){
				onAllFinish();
			}
			
		}
		
		
		private function onAllFinish():void{
			trace(this.later);
//			this.later.x = 0;
			this.mouseChildren = this.mouseEnabled = true;
//			this.parent.addChild(later);
			this.parent.removeChild(this);
		}
	}
}