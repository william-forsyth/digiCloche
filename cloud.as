package  {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	
	public class cloud extends MovieClip {
		
		var cloudTimer:Timer;
		var speed = 10;
		var xDir;
		var yDir;
		
		
		public function cloud(theSpeed) {
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
		/*	this.x += Math.random() * speed;
			this.y += Math.random() * speed;*/
			
/*			if (this.x > stage.width){
				this.x -= Math.random() * speed;
				this.y -= Math.random() * speed;
			}
			
			if (this.x < stage.width) {
				this.x += Math.random() * speed;
				this.y += Math.random() * speed;
			}
			
			if (this.y > stage.width){
				this.x -= Math.random() * speed;
				this.y -= Math.random() * speed;
			}
			
			if (this.y < stage.width) {
				this.x += Math.random() * speed;
				this.y += Math.random() * speed;
			}*/
			
			
			if(this.y > stage.height || this.y < 0) {
				yDir = yDir * -1;
			}
			else if ( this.x > stage.width || this.x < 0)
			{
				xDir = xDir * -1;
			}
			
			
//			this.x += speed * xDir;
//			this.y += speed * yDir;

			this.x += xDir;
			this.y += yDir;
		}
	}
	
}
