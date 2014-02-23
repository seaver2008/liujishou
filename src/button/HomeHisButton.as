package button
{
	import flash.display.Sprite;
	
	import assets.HisButton;
	
	public class HomeHisButton extends Button
	{
		private var hisButton:HisButton=new HisButton();
		public function HomeHisButton()
		{
			super(hisButton);
			this.addChild(hisButton);
		}
	}
}