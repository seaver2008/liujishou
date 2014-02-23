package button
{
	import flash.display.Sprite;
	import button.Button;
	import assets.Female;
	
	public class FemaleButton extends Button
	{
		private var femaleButton:Female;
		public function FemaleButton()
		{
			femaleButton = new Female();
			super(femaleButton);
			this.addChild(femaleButton);
			
		}
		
	}
}