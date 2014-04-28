package  {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	
	public class orange extends MovieClip {
		
		var fadeInTimer:Timer;
		var fadeOutTimer:Timer;
		
		
		public function orange() {
			this.x = 0;
			this.y = 0;
			this.alpha = 0;
			
		}
		
		public function fadeInT(){
			fadeInTimer = new Timer(10);
			fadeInTimer.addEventListener(TimerEvent.TIMER, fadeIn);
			this.fadeInTimer.start();
			
			trace("fading in orange...");
		}

		public function fadeOutT(){
			fadeOutTimer = new Timer(10);
			fadeOutTimer.addEventListener(TimerEvent.TIMER, fadeOut);
			this.fadeOutTimer.start();
			
			trace("fading out orange...");
			
		}
		
		public function fadeIn(e:TimerEvent) {
			this.alpha += 0.1;
			
			if (this.alpha >= 1){
				this.fadeInTimer.stop();
			}
			
		}
		
		public function fadeOut(e:TimerEvent) {
			this.alpha -= 0.1;
			trace("orange alpha: " + this.alpha);
			
			if (this.alpha <= 0){
				trace("removing orange...");
				this.parent.removeChild(this);
				this.fadeOutTimer.stop();
			}
		}
	}
	
}
