package  {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.text.*;
	import flash.display.Graphics;
    import flash.display.Sprite;
    import flash.events.Event;
	import flash.events.*;
	import flash.display.*;
	
	import pq.multitouch.*;
	import pq.multitouch.manipulators.MultiDragScaleRotate;
	
	
	public class gameBG extends MovieClip {
		
		var myFont:Font = new helvs_light();
		var myTextFormat:TextFormat = new TextFormat();
		
		var bannerFont:Font = new helvs_light();
		var bannerFormat:TextFormat = new TextFormat();
		
		var playerFont:Font = new helvs_light();
		var playerFormat:TextFormat = new TextFormat();
		
		var overFormat:TextFormat = new TextFormat();
		
		var timer:TextField;
		var timerText = 0;
		
		var banner:TextField;
		var gameOver:TextField;
		var winner:TextField;
		
		var topScore:TextField;
		var bottomScore:TextField;
		var scoreTop = 0;
		var scoreBottom = 0;
		
		var gameTimer:Timer;
		var bannerTimer:Timer;
		var circleTimer:Timer;
		var scoreTimer:Timer;
		
		var margherita;
		var salami;
		var veggie;
		var supreme;
		var meatlovers;
		
		var circles:Array;
		var foodItems:Array;
		var topArray:Array;
		var bottomArray:Array;
		
		var rectangle:Shape = new Shape; // initializing the variable named rectangle
		
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
			
			scoreTimer = new Timer(10);
			scoreTimer.addEventListener(TimerEvent.TIMER, scorer);
			scoreTimer.start();
			
			timer = new TextField();
			topScore = new TextField();
			bottomScore = new TextField();
			gameOver = new TextField();
			winner = new TextField();
			
			this.addChild(timer);
			this.addChild(topScore);
			this.addChild(bottomScore);
			
			myTextFormat.font = myFont.fontName;
			myTextFormat.size = 200;
			myTextFormat.color = 0xFFFFFF;
			
			timer.defaultTextFormat = myTextFormat;
			timer.embedFonts = true;
			timer.width = 400;
			timer.wordWrap = true;
			timer.x = 910;
			timer.y = 420;
			timer.text = timerText;
			
			playerFormat.font = playerFont.fontName;
			playerFormat.size = 80;
			playerFormat.color = 0xFFFFFF;
			
			overFormat.font = myFont.fontName;
			overFormat.size = 800;
			overFormat.color = 0xFFFFFF;
			
			topScore.defaultTextFormat = playerFormat;
			topScore.embedFonts = true;
			topScore.width = 500;
			topScore.wordWrap = true;
			topScore.x = 960;
			topScore.y = 100;
			topScore.text = scoreTop;
			topScore.rotation = 180;
			
			bottomScore.defaultTextFormat = playerFormat;
			bottomScore.embedFonts = true;
			bottomScore.width = 500;
			bottomScore.wordWrap = true;
			bottomScore.x = 960;
			bottomScore.y = 980;
			bottomScore.text = scoreBottom;
			
			gameOver.defaultTextFormat = playerFormat;
			gameOver.embedFonts = true;
			gameOver.width = 500;
			gameOver.wordWrap = true;
			gameOver.x = 720;
			gameOver.y = 480;
			gameOver.text = 'GAME OVER';
			
			winner.defaultTextFormat = playerFormat;
			winner.embedFonts = true;
			winner.width = 1000;
			winner.wordWrap = true;
			winner.x = 1260;
			winner.y = 540;
			winner.text = '';
			
			
			foodItems = [];
			topArray = [];
			bottomArray = [];
			
		}
		
		public function tick(e:TimerEvent) {
			timer.text = timerText.toString();
			timerText += 1;
			
			if (timerText > 60) {
				this.gameTimer.stop();
				this.circleTimer.stop();
				this.scoreTimer.stop();
				this.removeChild(timer);
				this.addChild(gameOver);
				
				/*if (getWinner() == 'top'){
					winner.text = 'TOP TEAM WINS';
					winner.y = 270;
					winner.rotation = 180;
					this.addChild(winner);
				}*/
				
				getWinner();
			}
			
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
			
			circles = [margherita, veggie, meatlovers, supreme, salami];
			
			for each(var i in circles){
				//i.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
				//i.addEventListener(MouseEvent.MOUSE_UP, stopDragging);
				/*i.startX = i.x;
				i.startY = i.y;*/
				MultiTouch.enableGesture(i,new MultiDragScaleRotate());
				
				//var posTimer = new Timer(10);
				//posTimer.addEventListener(TimerEvent.TIMER, offScreen(i));
				//posTimer.start();
				
				//trace(i.hitTestObject(rectangle));
				
				/*if(i.hitTestObject(rectangle)){
					trace('SCORE');
					
					scoreBottom += 1;
					bottomScore.text = scoreBottom;
					
				}*/
				
				if (i.y < 0) {
					scoreBottom++;
					bottomScore = scoreBottom;
				}
			}
			
			var random = Math.floor(Math.random() * (5));
			
			this.addChild(circles[random]);
			foodItems.push(circles[random]);
			
			//trace(foodItems);
			
			/*trace(random);
			
			trace('x = ' + circles[random].x);
			trace('y = ' + circles[random].y);*/
			
		}
		
		
		public function scorer(e:TimerEvent) {
			for each (var thing in foodItems) {
				if (thing.y < 0){
					trace('BOOM');
					
					foodItems.splice(foodItems.indexOf(thing), 1);
					
					scoreBottom++;
					bottomScore.text = scoreBottom.toString();
					
					this.removeChild(thing);
				}
				else if (thing.y > 1080) {
					foodItems.splice(foodItems.indexOf(thing), 1);
					
					scoreTop++;
					topScore.text = scoreTop.toString();
					
					this.removeChild(thing);
				}
				else if (thing.x < 0 || thing.x > 1920) {
					foodItems.splice(foodItems.indexOf(thing), 1);
					
					this.removeChild(thing);
				}
			}
			
			//for (var thing:Number = 0; thing < foodItems.length; thing++) {
			//	var anotherThing = foodItems[thing];
			//	
			//	if (anotherThing.x < 0) {
			//		trace('BOOM');
			//		
			//		//foodItems.splice(foodItems.indexOf(thing);
			//		
			//		foodItems.splice(thing);
			//		
			//		scoreBottom++;
			//		bottomScore.text = scoreBottom.toString();
			//	}
			//}
		}
		
		public function getWinner() {
			if (scoreTop > scoreBottom) {
				
				var winnerRec:Shape = new Shape; // initializing the variable named rectangle
				winnerRec.graphics.beginFill(0x00FF00); // choosing the colour for the fill, here it is red
				winnerRec.graphics.drawRect(0, 0, 1920,560); // (x spacing, y spacing, width, height)
				winnerRec.graphics.endFill(); // not always needed but I like to put it in to end the fill
				winnerRec.alpha = .5;
				addChild(winnerRec); // adds the rectangle to the stage
				
				var loser:Shape = new Shape; // initializing the variable named rectangle
				loser.graphics.beginFill(0xFF0000); // choosing the colour for the fill, here it is red
				loser.graphics.drawRect(0, 560, 1920,560); // (x spacing, y spacing, width, height)
				loser.graphics.endFill(); // not always needed but I like to put it in to end the fill
				loser.alpha = .5;
				addChild(loser); // adds the rectangle to the stage
				
				winner.text = 'TOP TEAM WINS';
				winner.y = 270;
				winner.rotation = 180;
				this.addChild(winner);
				
				
			}
			else if (scoreTop < scoreBottom) {
				var winnerRec:Shape = new Shape; // initializing the variable named rectangle
				winnerRec.graphics.beginFill(0x00FF00); // choosing the colour for the fill, here it is red
				winnerRec.graphics.drawRect(0, 560, 1920,560); // (x spacing, y spacing, width, height)
				winnerRec.graphics.endFill(); // not always needed but I like to put it in to end the fill
				winnerRec.alpha = .5;
				addChild(winnerRec); // adds the rectangle to the stage
				
				var loser:Shape = new Shape; // initializing the variable named rectangle
				loser.graphics.beginFill(0xFF0000); // choosing the colour for the fill, here it is red
				loser.graphics.drawRect(0, 0, 1920,560); // (x spacing, y spacing, width, height)
				loser.graphics.endFill(); // not always needed but I like to put it in to end the fill
				loser.alpha = .5;
				addChild(loser); // adds the rectangle to the stage
				
				winner.text = 'BOTTOM TEAM WINS';
				winner.x = 490;
				winner.y = 810;
				this.addChild(winner);
			}
			else if (scoreTop == scoreBottom) {
				var winnerRec:Shape = new Shape; // initializing the variable named rectangle
				winnerRec.graphics.beginFill(0x0000FF); // choosing the colour for the fill, here it is red
				winnerRec.graphics.drawRect(0, 0, 1920,1080); // (x spacing, y spacing, width, height)
				winnerRec.graphics.endFill(); // not always needed but I like to put it in to end the fill
				winnerRec.alpha = .5;
				addChild(winnerRec); // adds the rectangle to the stage
				
				winner.text = 'DRAW';
				winner.x = 840;
				winner.y = 540;
				this.addChild(winner);
			}
		}
		
	}
	
}
