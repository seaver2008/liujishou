package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TransformGestureEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.ui.Multitouch;
	import flash.utils.ByteArray;
	
	import Static.StaticClass;
	
	import assets.CutLayer;
	
	import button.BackButton;
	import button.OKButton;
	
	import cam.CamContainer;
	
	import contentContainer.Content;
	
	public class CutCon extends Content
	{
		private var loader:Loader;
		private var okbutton:OKButton;
		private var cutlayer:CutLayer;
		private var backbutton:BackButton;
		public function CutCon()
		{
			super();
			init();
		}
		
		protected function init():void{
			loader = new Loader();
			loader=StaticClass.LoadPicture;
			this.addChild(loader);
			
			var rate:Number;
			rate = 640/loader.width;
			loader.width *= rate;
			loader.height *= rate;
			loader.y = 200;
			
			
			cutlayer=new CutLayer();
			this.addChild(cutlayer);
			okbutton = new OKButton();
			backbutton = new BackButton();
			backbutton.y=140;
			this.addChild(backbutton);
			this.addChild(okbutton);
			backbutton.addEventListener(MouseEvent.CLICK,onBack);
			okbutton.addEventListener(MouseEvent.CLICK,onClick);
			this.addEventListener(TransformGestureEvent.GESTURE_ZOOM,onZoom);
			this.addEventListener(TransformGestureEvent.GESTURE_ROTATE,onRotate);
			this.addEventListener(MouseEvent.MOUSE_DOWN,onBegin);
		}
		
		protected function onBack(event:MouseEvent):void
		{
			this.goTo(new CamContainer,-1)
		}
		
		
		
		protected function onClick(event:MouseEvent):void
		{
			var copyed:BitmapData = new BitmapData(640,920);
			copyed.draw(this);
			var byteArray:ByteArray = copyed.getPixels(new Rectangle(100,200,440,440));
			byteArray.position = 0;
			
			
			var bitmapdata:BitmapData  =  new BitmapData(440,440);			
			bitmapdata.setPixels(new Rectangle(0,0,440,440),byteArray);
			StaticClass.Cutpicture=bitmapdata;

			this.goTo(new ShowCon,1);
		}
		private var oldX:Number;
		private var oldY:Number;
		protected function onBegin(e:MouseEvent):void
		{
			
			oldX = this.mouseX;
			oldY = this.mouseY;
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE,onMove);
			stage.addEventListener(MouseEvent.MOUSE_UP,onUp);	
			
		}
		
		protected function onUp(e:MouseEvent):void
		{
			
			stage.removeEventListener(MouseEvent.MOUSE_MOVE,onMove);
			stage.removeEventListener(MouseEvent.MOUSE_UP,onUp);	
		}
		
		protected function onMove(e:MouseEvent):void
		{
			
			loader.x += this.mouseX - oldX;
			loader.y += this.mouseY - oldY;
			
			oldX = this.mouseX;
			oldY = this.mouseY;
		}
		
		/////////////////////////////////////////////////////////////////
		protected function onRotate(e:TransformGestureEvent):void
		{
			
			var p:Point = new Point(e.localX,e.localY);
			var parent_p:Point = this.globalToLocal(loader.localToGlobal(p));
			
			loader.rotation += e.rotation;
			
			var parent_p2:Point = this.globalToLocal(loader.localToGlobal(p));
			
			loader.x += (parent_p.x - parent_p2.x);
			loader.y += (parent_p.y - parent_p2.y);
		}
		
		
		/////////////////////////////////////////////////////////////
		protected function onZoom(e:TransformGestureEvent):void
		{
			var p:Point = new Point(e.localX,e.localY);
			var parent_p:Point = this.globalToLocal(loader.localToGlobal(p));
			
			loader.scaleX *= e.scaleX;
			loader.scaleY *= e.scaleY;
			
			var parent_p2:Point = this.globalToLocal(loader.localToGlobal(p));
			
			loader.x += (parent_p.x - parent_p2.x);
			loader.y += (parent_p.y - parent_p2.y);
			
		}
	}
}