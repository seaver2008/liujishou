package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MediaEvent;
	import flash.media.CameraRoll;
	import flash.media.MediaPromise;
	import flash.media.MediaType;
	
	import Static.StaticClass;
	
	import contentContainer.Content;
	public class CameraRo extends Content
	{
		private var mediaSource:CameraRoll = new CameraRoll();
		public function CameraRo()
		{
			super();
			
			if( CameraRoll.supportsBrowseForImage )
			{
				log( "Browsing for image..." );
				mediaSource.addEventListener( MediaEvent.SELECT, imageSelected );
				mediaSource.addEventListener( Event.CANCEL, browseCanceled );
				
				mediaSource.browseForImage();
			}
			else
			{
				log( "Browsing in camera roll is not supported.");
			}
		}
		
		private var imageLoader:Loader; 
		private function imageSelected( event:MediaEvent ):void
		{
			log( "Image selected..." );
			
			var imagePromise:MediaPromise = event.data;
			
			imageLoader = new Loader();
			if( imagePromise.isAsync )
			{
				log( "Asynchronous media promise." );
				imageLoader.contentLoaderInfo.addEventListener( Event.COMPLETE, imageLoaded );
				imageLoader.contentLoaderInfo.addEventListener( IOErrorEvent.IO_ERROR, imageLoadFailed );
				imageLoader.loadFilePromise( imagePromise );
			}
			else
			{
				log( "Synchronous media promise." );
				imageLoader.loadFilePromise( imagePromise );
				this.addChild( imageLoader );
			}
		}
		
		private function browseCanceled( event:Event ):void
		{
			log( "Image browse canceled." );
			this.goTo(new SelectCon,-1);
		}
		
		private function imageLoaded( event:Event ):void
		{
			log( "Image loaded asynchronously." );
			this.addChild( imageLoader );
			StaticClass.LoadPicture = imageLoader;
			this.goTo(new CutCon,1);
		}
		
		private function imageLoadFailed( event:Event ):void
		{
			log( "Image load failed." );
		}
		
		private function log( text:String ):void
		{
			trace( text );
		}
		
	}
}