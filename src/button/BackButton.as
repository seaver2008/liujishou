package button
{
	import flash.display.Sprite;
	
	import assets.Back;
	
	public class BackButton extends Button
	{
		private var backButton:Back
		public function BackButton()
		{
			backButton = new Back();
			super(backButton);
			this.addChild(backButton);
		}
	}
}