package
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Expo;
	
	import flash.events.MouseEvent;
	
	import Static.StaticClass;
	
	import assets.Process1;
	import assets.Process2;
	import assets.SelectSex;
	
	import button.BackButton;
	import button.FemaleButton;
	import button.LoadPicButton;
	import button.MaleButton;
	import button.TakePicButton;
	
	import cam.CamContainer;
	
	import contentContainer.Content;
	
	
	public class SelectCon extends Content
	{
		private var selectSex:assets.SelectSex;
		private var female:FemaleButton;
		private var male:MaleButton;
		private var takePic:TakePicButton;
		private var loadPic:LoadPicButton;
		private var back1:BackButton;
		private var back2:BackButton;
		private var process1:Process1;
		private var process2:Process2;
		
		public function SelectCon()
		{
			super();					
			selectSex = new assets.SelectSex();
			female = new FemaleButton();
			male = new MaleButton();
			takePic = new TakePicButton();
			loadPic = new LoadPicButton();
			back1=new BackButton();
			back2=new BackButton();
			process1=new Process1();
			process2=new Process2();
			
			female.y=male.y=-550;
			takePic.y=loadPic.y=-550;
			process1.y=process2.y=920;
			
			this.addChild(selectSex);
			this.addChild(female);			
			this.addChild(male);
			this.addChild(process1);
			this.addChild(takePic);
			this.addChild(loadPic);
			this.addChild(process2);
			this.addChild(back1);
			TweenMax.to(male, 1, {x:0, y:0, ease:Expo.easeInOut});
			TweenMax.to(female, 1.5, {x:0, y:0, ease:Expo.easeInOut});
			TweenMax.to(process1, 0.5, {x:0, y:0, ease:Expo.easeInOut});
			
			female.addEventListener(MouseEvent.CLICK,onC1);
			male.addEventListener(MouseEvent.CLICK,onC2);
			back1.addEventListener(MouseEvent.CLICK,onBack1);			
		}
		
		protected function onBack1(event:MouseEvent):void
		{
			this.goTo(new HomeCon,-1);
			
		}
		
		protected function onBack2(event:MouseEvent):void
		{
			TweenMax.to(takePic, 1, {x:0, y:-550, ease:Expo.easeInOut});
			TweenMax.to(loadPic, 1.5, {x:0, y:-550, ease:Expo.easeInOut});
			TweenMax.to(male, 1, {x:0, y:0, ease:Expo.easeInOut});
			TweenMax.to(female, 1.5, {x:0, y:0, ease:Expo.easeInOut});
			TweenMax.to(process1, 0.5, {x:0, y:0, ease:Expo.easeInOut});
			TweenMax.to(process2, 0.5, {x:640, y:0, ease:Expo.easeInOut});
			this.addChild(back1);
		}
		
		protected function onC1(event:MouseEvent):void
		{
			//female
			StaticClass.sex = 1;
			gotoFunSele()			
		}
		
		protected function onC2(event:MouseEvent):void
		{
			//male
			StaticClass.sex = 0;
			gotoFunSele()
		}

		
		private function gotoFunSele():void
		{
			TweenMax.to(male, 1, {x:-320, y:0, ease:Expo.easeInOut});
			TweenMax.to(female, 1.5, {x:640, y:0, ease:Expo.easeInOut});
			TweenMax.to(process1, 0.5, {x:640, y:0, ease:Expo.easeInOut});			
//			this.goTo(new SelectFunCon,1);
			
			this.addChild(back2);
			this.removeChild(back1);
			
			TweenMax.to(takePic, 1, {x:0, y:0, ease:Expo.easeInOut});
			TweenMax.to(loadPic, 1.5, {x:0, y:0, ease:Expo.easeInOut});
			TweenMax.to(process2, 0.5, {x:0, y:0, ease:Expo.easeInOut});
			
			takePic.addEventListener(MouseEvent.CLICK,onC3);
			loadPic.addEventListener(MouseEvent.CLICK,onC4);						
			back2.addEventListener(MouseEvent.CLICK,onBack2);
		}
		
		protected function onC3(event:MouseEvent):void
		{
			TweenMax.to(takePic, 1, {x:-320, y:0, ease:Expo.easeInOut});
			TweenMax.to(loadPic, 1.5, {x:960, y:0, ease:Expo.easeInOut});
			this.goTo(new CamContainer,1);
		}
		
		protected function onC4(event:MouseEvent):void
		{
			TweenMax.to(takePic, 1, {x:-320, y:0, ease:Expo.easeInOut});
			TweenMax.to(loadPic, 1.5, {x:960, y:0, ease:Expo.easeInOut});
			this.goTo(new CameraRo,1);
		}		
		
	}
}