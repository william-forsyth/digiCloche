package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class circleRed extends MovieClip {
		
		
		public function circleRed() {
			this.addEventListener(MouseEvent.CLICK, go());
		}
		
		public function go() {
			parent.main.hide();
		}
	}
	
}
