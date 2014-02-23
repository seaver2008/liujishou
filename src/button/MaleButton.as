package button
{
	import flash.display.Sprite;
	
	import assets.Male;
	
	import button.Button;
	
	public class MaleButton extends Button
	{
		private var maleButton:Male;
		public function MaleButton()
		{
			maleButton = new Male;
			super(maleButton);
			this.addChild(maleButton);
			
		}	
	}
}