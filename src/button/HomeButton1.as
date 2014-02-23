package button
{
	import flash.display.Sprite;
	
	import assets.HomeButton;
	
	public class HomeButton1 extends Button
	{
		private var homeB:assets.HomeButton=new HomeButton();
		public function HomeButton1()
		{
			super(homeB);
			this.addChild(homeB);
		}
	}
}