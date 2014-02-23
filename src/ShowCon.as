package
{
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.geom.Rectangle;
	import flash.media.CameraRoll;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	
	import Static.StaticClass;
	
	import assets.Layer;
	import assets.RenrenButton;
	import assets.SaveButton;
	import assets.ShowBg;
	import assets.SinaButton;
	import assets.WeixinButton;
	
	import asstes.ShareButton;
	
	import button.BackHome;
	
	import contentContainer.Content;
	
	public class ShowCon extends Content
	{
		private var showbg:ShowBg;
		private var sharebutton:ShareButton;
		private var layer:Layer;
		private var backhome:BackHome;		
		private var sina:SinaButton;
		private var renren:RenrenButton;
		private var weixin:WeixinButton;
		private var save:SaveButton;
		private var loader:Loader;
		private var file:File;
		private var fStream:FileStream;
		private var copyed:BitmapData;
		private var tittle:String;
		private var tt:String;
		public function ShowCon()
		{
			super();
			showbg=new ShowBg();
			layer=new Layer();
			backhome=new BackHome();
			sharebutton=new ShareButton();
			sina=new SinaButton();
			renren=new RenrenButton();
			weixin=new WeixinButton();
			save=new SaveButton();
			
			sharebutton.x=sina.x=renren.x=weixin.x=save.x=560;
			sharebutton.y=sina.y=renren.y=weixin.y=save.y=80;
			layer.alpha=0;
						
			init();			
		}
		
		private function savePicData():void
		{
			copyed = new BitmapData(640,920);
			copyed.draw(this);
			var byteArray:ByteArray = copyed.getPixels(new Rectangle(0,0,640,920));
			byteArray.position = 0;
			
			
			
			var id:int = 0;
			file = File.applicationStorageDirectory.resolvePath("index.txt");
			if(file.exists)
			{
				fStream = new FileStream();
				fStream.open(file, FileMode.READ);
				id = fStream.readInt();
				fStream.close();
				
				id = id+1;
				
				fStream = new FileStream();
				fStream.open(file, FileMode.WRITE);
				fStream.writeInt(id);
				fStream.close();
			}
			else 
			{
				fStream = new FileStream();
				fStream.open(file, FileMode.WRITE);
				fStream.writeInt(1);
				fStream.close();
				id = 1;
			}
			
			
				
			fStream.close();
			file = File.applicationStorageDirectory.resolvePath(id+".txt");
			trace(id);
			fStream = new FileStream();
			fStream.open(file, FileMode.WRITE);
			fStream.writeBytes(byteArray);
			fStream.close();
			trace("Save Complete");
		}
		
		protected function init():void
		{
			var bitmap:Bitmap=new Bitmap(StaticClass.Cutpicture);
			this.addChild(bitmap);
			bitmap.x=50;bitmap.y=50;bitmap.width=360;bitmap.height=360;
			
			this.addChild(showbg);
			
			addText();
			//////////////////////////////////////////////////
			
			savePicData();                              //录入全屏
			
			//////////////////////////////////////////////////
			this.addChild(layer);layer.alpha=0;
			
			this.addChild(backhome);
			this.addChild(sharebutton);	
			
			sharebutton.addEventListener(MouseEvent.CLICK,onShare);
			backhome.addEventListener(MouseEvent.CLICK,onBackhome);
			
			
			this.addChildAt(sina,6);sina.alpha=0;
			this.addChildAt(renren,7);renren.alpha=0;
			this.addChildAt(weixin,8);weixin.alpha=0;
			this.addChildAt(save,9);save.alpha=0;
			
			sina.addEventListener(MouseEvent.CLICK,onSina);
			renren.addEventListener(MouseEvent.CLICK,onRenren);
			weixin.addEventListener(MouseEvent.CLICK,onWeixin);
			save.addEventListener(MouseEvent.CLICK,onSave);
			
		}
		
		private function addText():void
		{
			
			var text:TextField = new TextField();
			text.text = StaticClass.comments();
			tt = text.text;
			
			text.x = 75;
			text.y = 440;
			text.width = 500;
			text.height = 500;
			text.wordWrap= true;
			text.textColor = 0x5b5858;
			
			var textFormat:TextFormat = new TextFormat;
			if (text.text.length<=140) textFormat.size = 35;
			else textFormat.size = 30;
			text.setTextFormat(textFormat);
			this.addChild(text);
			this.addChild(StaticClass.picture);
		}
		
		protected function onBackhome(event:MouseEvent):void
		{
			this.goTo(new HomeCon,-1);
		}
		
		protected function onShare(event:MouseEvent):void
		{	
			
			sharebutton.removeEventListener(MouseEvent.CLICK,onShare);	
			sharebutton.gotoAndStop(2);
			
			this.addChildAt(layer,5);layer.alpha=0;
			
			TweenLite.to(layer, 0.5, {autoAlpha:1});
			TweenMax.to(sharebutton, 0.5, {rotation:225});
			TweenMax.to(showbg, 0.5, {blurFilter:{blurX:20}});
			TweenMax.to(sina, 0.5, {x:230, y:80, autoAlpha:1, ease:Back.easeOut});
			TweenMax.to(renren, 0.6, {x:275, y:245, autoAlpha:1,ease:Back.easeOut});
			TweenMax.to(weixin, 0.7, {x:395, y:365, autoAlpha:1,ease:Back.easeOut});
			TweenMax.to(save, 0.8, {x:560, y:410, autoAlpha:1,ease:Back.easeOut});
			
			sharebutton.addEventListener(MouseEvent.CLICK,onClose);
		}
		
		protected function onClose(event:MouseEvent):void
		{
			sharebutton.removeEventListener(MouseEvent.CLICK,onClose);
			sharebutton.gotoAndStop(1);
			
			TweenLite.to(layer, 1, {autoAlpha:0});
			TweenMax.to(sharebutton, 0.5, {rotation:-180});
			TweenMax.to(showbg, 0.5, {blurFilter:{blurX:0}});
			TweenMax.to(sina, 0.8, {x:560, y:80, autoAlpha:0, ease:Back.easeIn});
			TweenMax.to(renren, 0.7, {x:560, y:80, autoAlpha:0,ease:Back.easeIn});
			TweenMax.to(weixin, 0.6, {x:560, y:80, autoAlpha:0,ease:Back.easeIn});
			TweenMax.to(save, 0.5, {x:560, y:80, autoAlpha:0,ease:Back.easeIn});
			
			sharebutton.addEventListener(MouseEvent.CLICK,onShare);
		}
		
		protected function onSina(event:MouseEvent):void
		{
			TweenMax.to(sina, 0.5, {scaleX:2, scaleY:2, autoAlpha:0, onComplete:backBg});
			var request:URLRequest = new URLRequest("http://service.weibo.com/share/share.php?url=http%3A%2F%2Fopen.weibo.com%2Fsharebutton&appkey=&title="+tt+"&pic=&ralateUid=&language=zh_cn");
			navigateToURL(request);
		}
		
		protected function onRenren(event:MouseEvent):void
		{
			TweenMax.to(renren, 0.5, {scaleX:2, scaleY:2, autoAlpha:0, onComplete:backBg});
			var request:URLRequest = new URLRequest("http://www.connect.renren.com/share/sharer?url=&title="+tt);//没有链接分享会提示缺少参数
			navigateToURL(request);
		}
		
		protected function onWeixin(event:MouseEvent):void
		{
			TweenMax.to(weixin, 0.5, {scaleX:2, scaleY:2, autoAlpha:0, onComplete:backBg});
			
		}
		
		protected function onSave(event:MouseEvent):void
		{
			TweenMax.to(save, 0.5, {scaleX:2, scaleY:2, autoAlpha:0, onComplete:backBg});
			var mediaSource:CameraRoll = new CameraRoll();
			mediaSource.addBitmapData(copyed);
		}
		
		private function backBg():void{
			sharebutton.removeEventListener(MouseEvent.CLICK,onClose);
			sharebutton.gotoAndStop(1);
			
			TweenLite.to(layer, 1, {autoAlpha:0});
			TweenMax.to(sharebutton, 0.5, {rotation:-180});
			TweenMax.to(showbg, 0.5, {blurFilter:{blurX:0}});
			TweenMax.to(sina, 0.8, {scaleX:1, scaleY:1, x:560, y:80, autoAlpha:0});
			TweenMax.to(renren, 0.7, {scaleX:1, scaleY:1, x:560, y:80, autoAlpha:0});
			TweenMax.to(weixin, 0.6, {scaleX:1, scaleY:1, x:560, y:80, autoAlpha:0});
			TweenMax.to(save, 0.5, {scaleX:1, scaleY:1, x:560, y:80, autoAlpha:0});
			
			sharebutton.addEventListener(MouseEvent.CLICK,onShare);
		}
		
	}
}