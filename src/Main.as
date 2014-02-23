package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import contentContainer.ContentContainer;
	
	public class Main extends Sprite
	{
		internal var cc:ContentContainer = new ContentContainer();
		public function Main()
		{
			super();
			
			// 支持 autoOrient
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			this.addChild(cc);
		}
	}
}