package cam
{	
	import flash.desktop.NativeApplication;
	import flash.display.Loader;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MediaEvent;
	import flash.media.CameraUI;
	import flash.media.MediaPromise;
	import flash.media.MediaType;
	import Static.StaticClass;
	
	import contentContainer.Content;
	
	public class CamContainer extends Content
	{
	
		private var deviceCameraApp:CameraUI = new CameraUI();
		private var imageLoader:Loader; 		
		public function CamContainer()
		{
			super();			

			init();
			
		}
		
		private function init():void
		{			
				if( CameraUI.isSupported )
				{
					trace( "Initializing camera..." );
					
					deviceCameraApp.addEventListener( MediaEvent.COMPLETE, imageCaptured );
					deviceCameraApp.addEventListener( Event.CANCEL, captureCanceled );
					deviceCameraApp.addEventListener( ErrorEvent.ERROR, cameraError );
					deviceCameraApp.launch( MediaType.IMAGE );
				}
				else
				{
					trace( "Camera interface is not supported.");
				}
	
		}		
		
		protected function cameraError(error:ErrorEvent ):void
		{
			trace( "Error:" + error.text );
			NativeApplication.nativeApplication.exit();
		}
		
		protected function captureCanceled(event:Event):void
		{
			trace( "Media capture canceled." );
			NativeApplication.nativeApplication.exit();
			this.goTo(new SelectCon,-1);	
		}
		
		protected function imageCaptured(event:MediaEvent):void
		{			
			trace( "Media captured..." );
			
			var imagePromise:MediaPromise = event.data;
			
			if( imagePromise.isAsync )
			{
				trace( "Asynchronous media promise." );
				imageLoader = new Loader();
				imageLoader.contentLoaderInfo.addEventListener( Event.COMPLETE, asyncImageLoaded );
				imageLoader.addEventListener( IOErrorEvent.IO_ERROR, cameraError );
				
				imageLoader.loadFilePromise( imagePromise );
			}
			else
			{
				trace( "Synchronous media promise." );
				imageLoader.loadFilePromise( imagePromise );
				showMedia( imageLoader );
			}
			
//			showPanel();
		}
		
		private function showMedia( loader:Loader ):void
		{	
//			StaticClass.Picture.draw(loader);
			StaticClass.LoadPicture=loader;
			
			this.goTo(new CutCon,1);			
		}
		
		protected function asyncImageLoaded(event:Event):void
		{
			trace( "Media loaded in memory." );
			showMedia( imageLoader ); 
		}
		
//		private function showPanel():void
//		{
//			this.addChild(panel);
//		}			
	}
}