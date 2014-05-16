package {
	import flash.display.*;
	import flash.net.URLRequest;
	
	import pq.multitouch.*;
	import pq.multitouch.manipulators.MultiDragScaleRotate;
	
	public class AcstionScriptProject extends Sprite
	{
		public function AcstionScriptProject()
		{			
			stage.align = StageAlign.TOP_LEFT;			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			MultiTouch.init(stage);
			
			stage.addChild(TouchViewer.getInstance());
			
			var loader:Loader = new Loader();
			loader.load(new URLRequest("logo.png"));
			this.addChild(loader);
			
			MultiTouch.enableGesture(loader, new MultiDragScaleRotate());
		}
	}
}
