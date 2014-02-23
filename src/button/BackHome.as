package button
{
	import flash.display.Sprite;
	
	import assets.BackHomeButton;
	
	public class BackHome extends Button
	{
		private var backhomebutton:BackHomeButton;
		public function BackHome()
		{
			backhomebutton = new BackHomeButton();
			super(backhomebutton);
			this.addChild(backhomebutton);
		}
	}
}