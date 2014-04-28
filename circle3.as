package  {
	
	import flash.display.BitmapData;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.MovieClip;
	
	
	public class circle3 extends MovieClip {
		
		var cloudTimer:Timer;
		var hideTimer:Timer;
		var fadeTimer:Timer;
		var speed = 1;
		var xDir;
		var yDir;
		
		
		public function circle3(theSpeed) {
			render();
			cloudTimer = new Timer(50);
			cloudTimer.addEventListener(TimerEvent.TIMER, moveCloud);
			cloudTimer.start();
			
		}
		
		public function render() {
			this.x = Math.random()*1920;
			this.y = Math.random()*1080;
			
			
			xDir = Math.random() * speed - speed/2;
			yDir = Math.random() * speed - speed/2;
		}
		
		public function moveCloud(e:TimerEvent) {
			if(this.y > stage.height || this.y < 0) {
				yDir = yDir * -1;
			}
			else if ( this.x > stage.width || this.x < 0)
			{
				xDir = xDir * -1;
			}
			

			this.x += xDir;
			this.y += yDir;
		}
		
	}
}

	

