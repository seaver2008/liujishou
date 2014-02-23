package button
{
	import flash.display.Sprite;
	
	import assets.Camera;
	
	public class TakePicButton extends Button
	{
		private var take:Camera;
		public function TakePicButton()
		{
			take = new Camera();
			super(take);
			this.addChild(take);
		}
	}
}