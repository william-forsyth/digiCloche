package  {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	
	public class blue extends MovieClip {
		
		var fadeInTimer:Timer;
		var fadeOutTimer:Timer;
		
		
		public function blue() {
			this.x = 0;
			this.y = 0;
			this.alpha = 1;
			
			
		}
		
		public function fadeInT(){
			fadeInTimer = new Timer(10);
			fadeInTimer.addEventListener(TimerEvent.TIMER, fadeIn);
			fadeInTimer.start();
			
		}

		public function fadeOutT(){
			fadeOutTimer = new Timer(20);
			fadeOutTimer.addEventListener(TimerEvent.TIMER, fadeOut);
			fadeOutTimer.start();
			
			trace("fading out blue....");
			
		}
		
		public function fadeIn(e:TimerEvent) {
			this.alpha += 0.1;
			
			if (this.alpha >= 1){
				this.fadeInTimer.stop();
			}
			
		}
		
		public function fadeOut(e:TimerEvent) {
			this.alpha -= 0.1;
			trace("blue alpha: " + this.alpha);
			
			if (this.alpha <= 0){
				trace("removing blue...");
				this.parent.removeChild(this);
				this.fadeOutTimer.stop();
			}
		}
	}
	
}
