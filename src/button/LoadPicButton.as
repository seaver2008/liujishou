package button
{
	import flash.display.Sprite;
	
	import assets.Gallery;
	
	public class LoadPicButton extends Button
	{
		private var load:Gallery;
		public function LoadPicButton()
		{
			load = new Gallery();
			super(load);
			this.addChild(load);
		}
	}
}