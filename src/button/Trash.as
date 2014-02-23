package button
{
	import flash.display.MovieClip;
	
	import assets.Trash;
	
	public class Trash extends Button
	{
		public function Trash()
		{
			var mc:assets.Trash = new assets.Trash();
			super(mc);
			this.addChild(mc);
		}
	}
}