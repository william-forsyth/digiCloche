package  {		import flash.display.*;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import pq.multitouch.*;
	import pq.multitouch.manipulators.*;
	import pq.multitouch.events.PQTouchEvent;		public class foodButton extends MovieClip {
		
		var fadeInTimer:Timer;
		var fadeOutTimer:Timer;
		var moveT:Timer;
		var initialx;
		var initialy;
		
		var id; 				public function foodButton(xPos, yPos) {			this.x = xPos;			this.y = yPos;
			this.initialx = xPos;
			this.initialy = yPos;
			
			this.alpha = 0;
			
			this.width = 383.3;
			this.height = 368.8;
			
			//Multitouch.init();			
			//this.addEventListener(MouseEvent.CLICK, change);
			this.addEventListener(PQTouchEvent.TOUCH_DOWN, change);
		}
		
		public function change(e:PQTouchEvent) {
			trace("food ID: " + this.id);
			
			moveMiddleT();
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
				this.parent.removeChild(this);
				this.fadeOutTimer.stop();
			}		}
		
		public function moveMiddleT(){
			moveT = new Timer(50);
			moveT.addEventListener(TimerEvent.TIMER, moveMiddle);
			moveT.start();
			
		}
		
		public function moveMiddle(e:TimerEvent) {
			
			if (this.x <= this.initialx - 200) {
				moveT.stop();
				
				this.dispatchEvent(new Event("move", true, true));
			}
			else {
				this.x -= 10
			
				
			}
		}
		
		public function setID(newID) {
			this.id = newID;
		}
		
		public function getID() {
			return this.id;
		}
			}	

}