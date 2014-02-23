package
{
	import com.greensock.TweenMax;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.geom.Rectangle;
	import flash.net.navigateToURL;
	import flash.utils.ByteArray;
	
	import assets.HistoryBg1;
	import assets.HistoryTop;
	
	import asstes.HistoryBg0;
	
	import button.BackHome;
	import button.Trash;
	
	import contentContainer.Content;
	
	public class History extends Content
	{
		private var Eage:int = 70;//横向侧边距
		private var Scale:Number = 0.35;//缩略图缩放比
		private var picContainer:Sprite;
		private var file:File;
		private var fileStream:FileStream;
		private var id:int;
		private var tempPic:Sprite;
		private var picX:Number;
		private var picY:Number;
		private var oldY:Number;
		private var cOldY:Number;
		private var bg:MovieClip;
		private var bgN:MovieClip;
		
		public function History()
		{
			super();
			init();
		}
		private function init():void
		{
			bg = new HistoryBg1;
			bgN = new HistoryBg0;
			this.addChild(bg);
			
			picContainer = new Sprite;
			this.addChild(picContainer);
			
			loadPicData();
			
			var mc:Sprite = new Sprite;
			mc.graphics.beginFill(0xe8e6da);
			mc.graphics.drawRect(0,0,640,picContainer.height+100);
			mc.graphics.endFill();
			mc.alpha = 0;
			picContainer.addChildAt(mc,0);
			
			var top:HistoryTop = new HistoryTop;
			this.addChild(top);
			
			var homeButton:BackHome = new BackHome();
			this.addChild(homeButton);
			
			var trash:Trash = new Trash;
			trash.x = 620-trash.width;
			trash.y = 10;
			this.addChild(trash);
			
			trash.addEventListener(MouseEvent.CLICK,onClear);
			homeButton.addEventListener(MouseEvent.CLICK,onHome);
			picContainer.addEventListener(MouseEvent.MOUSE_DOWN,onBegin);
		}
		
		protected function onClear(event:MouseEvent):void
		{
			clear();
		}
		
		protected function onHome(event:MouseEvent):void
		{
			this.goTo(new HomeCon,-1);
		}
		
		private function loadPicData():void
		{
			
			file = File.applicationStorageDirectory.resolvePath("index.txt");
			if (file.exists)
			{
				fileStream = new FileStream();
				fileStream.open(file, FileMode.READ);
				id = fileStream.readInt();
				fileStream.close();
			}
			
			
			else changeBackground();
			
			
			var picAmount:int = id;
			var picArray:Array = new Array();
			var bitmap:Bitmap;
			var bitmapdata:BitmapData;
			var pic:Sprite;
			var i:int;
			trace(picAmount)
			for (i=1;i<=picAmount;i++){
				file = File.applicationStorageDirectory.resolvePath(i+".txt");
				trace(i);
				fileStream = new FileStream();
				fileStream.open(file, FileMode.READ);
				fileStream.position = 0;
				
				picArray[i] = new ByteArray();
				fileStream.readBytes(picArray[i]);
				fileStream.close();
				
				bitmapdata  =  new BitmapData(640,920);
				bitmapdata.setPixels(new Rectangle(0,0,640,920),picArray[i]);
				bitmap = new Bitmap(bitmapdata);
				
				pic = new Sprite;
				pic.addChild(bitmap);
				//-------------------位置信息在这里---------------------
				pic.scaleX = Scale;//缩放比相等
				pic.scaleY = Scale;//缩放比相等
				
				if (i%2 == 0) pic.x = 640-pic.width-Eage;//左右间距相等
				else pic.x = Eage;                       //左右间距相等
				
				var roll:int = (i-1)/2;
				pic.y = roll*300+130;
				
				
				///////////////////////////////////////////////////
				picContainer.addChild(pic);
				pic.addEventListener(MouseEvent.CLICK,onClick);
			}
			
		}
		
		private function clear():void
		{
			file = File.applicationStorageDirectory.resolvePath("index.txt");
			if (file.exists)
			{
				fileStream = new FileStream();
				fileStream.open(file, FileMode.READ);
				id = fileStream.readInt();
				fileStream.close();
			}
			var i:int;
			for (i=0;i<=id-1;i++)
			{
				trace(i);
				picContainer.removeChildAt(1);
			}
			file = File.applicationStorageDirectory.resolvePath("index.txt");
			if (file.exists) file.deleteFile();
			changeBackground();
		}
		
		private function changeBackground():void
		{
			// TODO Auto Generated method stub
			//换背景在这里
			this.removeChild(bg);
			this.addChildAt(bgN,0);
		}
		
		protected function onClick(event:MouseEvent):void
		{
			picContainer.removeEventListener(MouseEvent.MOUSE_DOWN,onBegin);
			tempPic = event.currentTarget as Sprite;
			trace(event.currentTarget);
			picX = event.currentTarget.x;
			picY = event.currentTarget.y;
			
			
			picContainer.addChild(tempPic);
			this.mouseChildren = this.mouseEnabled = false;
			TweenMax.to(tempPic, 0.3, {x:0,y:-picContainer.y,scaleX:1,scaleY:1,onComplete:showPic});
			
			
			tempPic.addEventListener(MouseEvent.CLICK,onReturn);
			tempPic.removeEventListener(MouseEvent.CLICK,onClick);
			
		}
		
		protected function onReturn(event:Event):void
		{
			
			this.mouseChildren = this.mouseEnabled = false;
			picContainer.addChild(tempPic);
			tempPic.y = -picContainer.y;
			TweenMax.to(tempPic, 0.3, {x:picX,y:picY,scaleX:Scale,scaleY:Scale,onComplete:returnPic});
			tempPic.removeEventListener(MouseEvent.CLICK,onReturn);
			tempPic.addEventListener(MouseEvent.CLICK,onClick);
			picContainer.addEventListener(MouseEvent.MOUSE_DOWN,onBegin);
		}
		
		protected function onBegin(e:MouseEvent):void
		{
			cOldY = picContainer.y;
			
			oldY = this.mouseY;
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE,onMove);
			stage.addEventListener(MouseEvent.MOUSE_UP,onUp);	
			
		}
		protected function onUp(e:MouseEvent):void
		{
			
			stage.removeEventListener(MouseEvent.MOUSE_MOVE,onMove);
			stage.removeEventListener(MouseEvent.MOUSE_UP,onUp);	
			slideEffect();
		}
		
		private function slideEffect():void
		{
			if(picContainer.y < 0&&picContainer.y > 830-picContainer.height&&(cOldY-picContainer.y>100||cOldY-picContainer.y<-100)){
				if(cOldY>picContainer.y) TweenMax.to(picContainer, 0.3, {x:picContainer.x,y:picContainer.y-50});
				else TweenMax.to(picContainer, 0.3, {x:picContainer.x,y:picContainer.y+50});
			}
			else if(picContainer.y >= 0) TweenMax.to(picContainer, 0.3, {y:0});
			else if(picContainer.y <= 830-picContainer.height) TweenMax.to(picContainer, 0.3, {y:830-picContainer.height});
		}
		
		protected function onMove(e:MouseEvent):void
		{
			if (picContainer.height>830){
				
				if (picContainer.y >= 0) picContainer.y += 0.1*(this.mouseY - oldY);
				else if (picContainer.y <= 830-picContainer.height) picContainer.y += 0.1*(this.mouseY - oldY);
				else picContainer.y += this.mouseY - oldY;
				oldY = this.mouseY;
			}
			
		}
		private function openMouse():void
		{
			this.mouseChildren = this.mouseEnabled = true;
		}
		private function showPic():void
		{
			tempPic.y = 0;
			this.addChild(tempPic);
			this.mouseChildren = this.mouseEnabled = true;
		}
		private function returnPic():void
		{
			
			this.mouseChildren = this.mouseEnabled = true;
		}
	}
}