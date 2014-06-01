package  {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	
	public class yellow extends MovieClip {
		
		var fadeInTimer:Timer;
		var fadeOutTimer:Timer;
		
		
		public function yellow() {
			this.x = 0;
			this.y = 0;
			this.alpha = 0;
		}
		
		public function fadeInT(){
			fadeInTimer = new Timer(10);
			fadeInTimer.addEventListener(TimerEvent.TIMER, fadeIn);
			fadeInTimer.start();
		}

		public function fadeOutT(){
			fadeOutTimer = new Timer(10);
			fadeOutTimer.addEventListener(TimerEvent.TIMER, fadeOut);
			fadeOutTimer.start();
			
		}
		
		public function fadeIn(e:TimerEvent) {
			this.alpha += 0.1;
			
			if (this.alpha >= 1){
				this.fadeInTimer.stop();
			}
			
		}
		
		public function fadeOut(e:TimerEvent) {
			this.alpha -= 0.1;
			
			if (this.alpha <= 0){
				this.fadeOutTimer.stop();
				this.parent.removeChild(this);
			}
		}
	}
	
}
