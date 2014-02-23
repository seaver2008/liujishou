package button
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Button extends MovieClip
	{
		private var mc:MovieClip;
		public function Button(mc:MovieClip)
		{
			super();
			init(mc);
		}
		
		private function init(mc:MovieClip):void
		{
			this.mc = mc;
			this.mc.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
		}
		
		protected function onMouseDown(event:MouseEvent):void
		{
			mc.gotoAndStop(2);
			mc.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
		}
		
		protected function onMouseUp(event:MouseEvent):void
		{
			mc.gotoAndStop(1);
			toDO();
		}
		
		private function toDO():void
		{
			// TODO Auto Generated method stub			
		}
	}
}