package  {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.text.*;
	import flash.display.Graphics;
    import flash.display.Sprite;
    import flash.events.Event;
	import flash.events.*;
	
	import pq.multitouch.*;
	import pq.multitouch.manipulators.MultiDragScaleRotate;
	
	
	public class gameBG extends MovieClip {
		
		var myFont:Font = new helvs_light();
		var myTextFormat:TextFormat = new TextFormat();
		
		var bannerFont:Font = new helvs_light();
		var bannerFormat:TextFormat = new TextFormat();
		
		var timer:TextField;
		var timerText = 0;
		
		var banner:TextField;
		
		var gameTimer:Timer;
		var bannerTimer:Timer;
		var circleTimer:Timer;
		
		var margherita;
		var salami;
		var veggie;
		var supreme;
		var meatlovers;
		
		var circles:Array;
		
		
		public function gameBG() {
			this.x = 0;
			this.y = 0;
			
			/*bannerFormat.font = bannerFont.fontName;
			bannerFormat.size = 400;
			bannerFormat.color = 0xFFFFFF;
			
			banner.defaultTextFormat = bannerFormat;
			banner.embedFonts = true;
			banner.width = 400;
			banner.wordWrap = true;
			banner.x = 960;
			banner.y = 540;
			banner.text = 'FOOD FIGHT!';*/
			
			gameTimer = new Timer(1000);
			gameTimer.addEventListener(TimerEvent.TIMER, tick);
			gameTimer.start();
			
			/*bannerTimer = new Timer(5000);
			bannerTimer.addEventListener(TimerEvent.TIMER, bannerLeave);
			bannerTimer.start();*/
			
			circleTimer = new Timer(1000);
			circleTimer.addEventListener(TimerEvent.TIMER, addFood);
			circleTimer.start();
			
			timer = new TextField();
			this.addChild(timer);
			
			myTextFormat.font = myFont.fontName;
			myTextFormat.size = 40;
			myTextFormat.color = 0xFFFFFF;
			
			timer.defaultTextFormat = myTextFormat;
			timer.embedFonts = true;
			timer.width = 400;
			timer.wordWrap = true;
			timer.x = 960;
			timer.y = 540;
			timer.text = timerText;
			
			
			
			for each(var i in circles){
				//i.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
				//i.addEventListener(MouseEvent.MOUSE_UP, stopDragging);
				i.startX = i.x;
				i.startY = i.y;
				MultiTouch.enableGesture(i,new MultiDragScaleRotate());
			}
			
		}
		
		public function tick(e:TimerEvent) {
			timer.text = timerText.toString();
			timerText += 1;
			
			trace(timerText);
		}
		
		public function bannerLeave(e:TimerEvent) {
			this.removeChild(banner);
			
			this.removeEventListener(TimerEvent.TIMER, bannerLeave);
		}
		
		public function addFood(e:TimerEvent) {
			
			margherita = new pizza1();
			margherita.x = Math.floor(Math.random() * (1910 - 10 + 1)) + 10;
			margherita.y = Math.floor(Math.random() * (1070 - 10 + 1)) + 10;
			
			salami = new pizza2();
			salami.x = Math.floor(Math.random() * (1910 - 10 + 1)) + 10;
			salami.y = Math.floor(Math.random() * (1070 - 10 + 1)) + 10;
			
			veggie = new pizza3();
			veggie.x = Math.floor(Math.random() * (1910 - 10 + 1)) + 10;
			veggie.y = Math.floor(Math.random() * (1070 - 10 + 1)) + 10;
									 
			supreme = new pizza4();
			supreme.x = Math.floor(Math.random() * (1910 - 10 + 1)) + 10;
			supreme.y = Math.floor(Math.random() * (1070 - 10 + 1)) + 10;
			
			meatlovers = new pizza5();
			meatlovers.x = Math.floor(Math.random() * (1910 - 10 + 1)) + 10;
			meatlovers.y = Math.floor(Math.random() * (1070 - 10 + 1)) + 10;
			
			circles = [margherita, veggie, meatlovers,supreme, salami];
			
			for each(var i in circles){
				//i.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
				//i.addEventListener(MouseEvent.MOUSE_UP, stopDragging);
				i.startX = i.x;
				i.startY = i.y;
				MultiTouch.enableGesture(i,new MultiDragScaleRotate());
			}
			
			var random = Math.floor(Math.random() * (5));
			
			this.addChild(circles[random]);
			
			trace(random);
			
			trace('x = ' + circles[random].x);
			trace('y = ' + circles[random].y);
			
		}
		
	//	function stopDragging(event:MouseEvent):void{//, obj:Object) {
	//		//obj.stopDrag();
	//		
	//		event.target.stopDrag();
	//		
	//		// check to see if the event target is touching target_mc using hitTestObject
	//		
	//		if (event.target.hitTestObject(img_head)) {
	//			event.target.buttonMode = false;
	//			event.target.x = -400;
	//			event.target.y = -400;
	//			
	//			// move all circles OTHER than the current target back to their original positions
	//			for each(var circleMC:MovieClip in circles){
	//				if(event.target != circleMC)
	//				{
	//					circleMC.x = circleMC.startX;
	//					circleMC.y = circleMC.startY;
	//				}
	//			}
	//		}
	//	//	else{
	//	//		// only need to move the event target back if it was dropped outside of target_mc
	//	//		event.target.x = event.target.startX;
	//	//		event.target.y = event.target.startY;
	//	//		event.target.buttonMode = true;
	//	//	}
	//	//}
	//}
	
}
