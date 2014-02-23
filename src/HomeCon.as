package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	import assets.HomeBg;
	import assets.Logo;
	
	import button.HomeButton1;
	import button.HomeHisButton;
	
	import contentContainer.Content;
	
	public class HomeCon extends Content
	{
		private var bg:HomeBg=new HomeBg();
		private var homeB:HomeButton1=new HomeButton1();
//		private var layer:Layer = new Layer();
		private var logo:Logo = new Logo();		
		private var PicArray:Array = new Array();
		private var Pic:Array = new Array();
		private var hisB:HomeHisButton = new HomeHisButton();
		public function HomeCon()
		{
			super();					
			init();			
		}
		
		protected function init():void{
			this.addChildAt(bg,0);	
			loadPic();				
			this.addChildAt(homeB,2);
			homeB.addEventListener(MouseEvent.CLICK,onhome1);
			this.addChildAt(logo,3);	
			this.addChildAt(hisB,4);
			hisB.addEventListener(MouseEvent.CLICK,onhome2);								
		}
				
		private function loadPic():void
		{
			for(var i:uint=0;i<=2;i++){
				PicArray[i]="pic"+(i+1)+".jpg";
				var loader:Loader = new Loader();
				loader.load(new URLRequest(PicArray[i]));
				Pic.push(loader);
				Pic[i].y=0;
			}
			this.addChildAt(Pic[Math.floor(Math.random()*PicArray.length)],1);
		}
		
		protected function onhome1(event:MouseEvent):void
		{
			this.goTo(new SelectCon,1);			
		}
		
		protected function onhome2(event:MouseEvent):void
		{
			this.goTo(new History,-1);
		}
	}
}