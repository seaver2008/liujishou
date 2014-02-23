package button
{
	import flash.display.Sprite;
	
	import assets.OkButton;
	
	public class OKButton extends Button
	{
		private var ok:OkButton;
		public function OKButton()
		{
			ok=new OkButton();
			super(ok);
			this.addChild(ok);
		}
	}
}