package {		import flash.display.*;	import flash.events.*;
	import flash.utils.Timer;

	//import Lights;			public class main extends MovieClip {
		
		var food1;
		var drinks1;
		var food2;
		var drinks2;
		var food3;
		var drinks3;
		var food4;
		var drinks4;
		
		var one;
		var two;
		var three;
		var four;
		
		var blueB;
		var redB;
		var orangeB;
		var yellowB;
		var greenB;
		
		var state;
		var stateTimer:Timer;
		
		public function main() {
			
			food1 		= new foodButton(649, 844);
			drinks1 	= new drinksButton(249, 844);
			food2		= new foodButton(649, 204);
			drinks2 	= new drinksButton(249, 204);
			food3 		= new foodButton(1688, 204);
			drinks3 	= new drinksButton(1288, 204);
			food4 		= new foodButton(1688, 844);
			drinks4 	= new drinksButton(1288, 844);
			
			blueB 		= new blue();
			redB 		= new red();
			orangeB 	= new orange();
			yellowB 	= new yellow();
			greenB 		= new green();
			
			this.addChild(this.blueB);
			this.state = 0;
			
			createCircle1();
			createCircle2();
			createCircle3();
			createCircle4();
			
			stateTimer = new Timer(4000);
			stateTimer.addEventListener(TimerEvent.TIMER, changeState);
			stateTimer.start();
			
			stage.addEventListener("move", moveDrink);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, sitDown);
	
		}
		
		public function sitDown(e:KeyboardEvent) {
			/*this.addChild(this.food1);
			this.setChildIndex(food1, 2);
			this.addChild(this.drinks1);
			this.setChildIndex(drinks1, 2);
			this.addChild(this.food2);
			this.setChildIndex(food2, 2);
			this.addChild(this.drinks2);
			this.setChildIndex(drinks2, 2);
			this.addChild(this.food3);
			this.setChildIndex(food3, 2);
			this.addChild(this.drinks3);
			this.setChildIndex(drinks3, 2);
			this.addChild(this.food4);
			this.setChildIndex(food4, 2);
			this.addChild(this.drinks4);
			this.setChildIndex(drinks4, 2);*/
			
			switch(e.keyCode) {
				case 38:
					this.addChild(this.food1);
					this.setChildIndex(food1, 2);
					this.addChild(this.drinks1);
					this.setChildIndex(drinks1, 2);
				
					this.drinks1.fadeInT();
					this.food1.fadeInT();
				
					this.food1.setID(1);
					this.drinks1.setID(1);
				
					break;
				case 37:
					this.addChild(this.food2);
					this.setChildIndex(food2, 2);
					this.addChild(this.drinks2);
					this.setChildIndex(drinks2, 2);
				
					this.food2.rotation = 180;
					this.drinks2.rotation = 180;
				
					this.drinks2.fadeInT();
					this.food2.fadeInT();
				
					this.food2.setID(2);
					this.drinks2.setID(2);
					
					break;
				case 39:
					this.addChild(this.food3);
					this.setChildIndex(food3, 2);
					this.addChild(this.drinks3);
					this.setChildIndex(drinks3, 2);
				
					this.food3.rotation = 180;
					this.drinks3.rotation = 180;
				
					this.drinks3.fadeInT();
					this.food3.fadeInT();
				
					this.food3.setID(3);
					this.drinks3.setID(3);
				
					break;
				case 40:
					this.addChild(this.food4);
					this.setChildIndex(food4, 2);
					this.addChild(this.drinks4);
					this.setChildIndex(drinks4, 2);
				
					this.drinks4.fadeInT();
					this.food4.fadeInT();
				
					this.food4.setID(4);
					this.drinks4.setID(4);
				
					break;
					
			}
			
			/*this.food2.rotation = 180;
			this.drinks2.rotation = 180;
			this.food3.rotation = 180;
			this.drinks3.rotation = 180;
			
			this.food1.setID(1);
			this.drinks1.setID(1);
			this.food2.setID(2);
			this.drinks2.setID(2);
			this.food3.setID(3);
			this.drinks3.setID(3);
			this.food4.setID(4);
			this.drinks4.setID(4);*/
		}
		
		public function changeState(e:TimerEvent) {
			switch(state) {
				case 0:
					this.blueB.fadeOutT();
					this.addChild(redB);
					this.setChildIndex(redB, 0);
					this.redB.fadeInT();
					state++;
					break;
				case 1:
					this.redB.fadeOutT();
					this.addChild(orangeB);
					this.setChildIndex(orangeB, 0);
					this.orangeB.fadeInT();
					state++;
					break;
				case 2:
					this.orangeB.fadeOutT();
					this.addChild(yellowB);
					this.setChildIndex(yellowB, 0);
					this.yellowB.fadeInT();
					state++;
					break;
				case 3:
					this.yellowB.fadeOutT();
					this.addChild(greenB);
					this.setChildIndex(greenB, 0);
					this.greenB.fadeInT();
					state++;
					break;
				case 4:
					this.greenB.fadeOutT();
					this.addChild(blueB);
					this.blueB.alpha = 0;
					this.setChildIndex(blueB, 0);
					this.blueB.fadeInT();
					state = 0;
					break;
			}
			
		}
		
		public function createCircle1(){
			for (var i = 0; i < 4; i++) {
				one = new circle1(1);

				this.addChild(this.one);
			}
		}
		
		public function createCircle2(){
			for (var i = 0; i < 3; i++) {
				two = new circle2(1);

				this.addChild(this.two);
			}
		}
		
		public function createCircle3(){
			for (var i = 0; i < 2; i++) {
				three = new circle3(1);

				this.addChild(this.three);
			}
		}
		
		public function createCircle4(){
			for (var i = 0; i < 2; i++) {
				four = new circle4(1);

				this.addChild(this.four);
			}
		}
		
		public function getChildren(target:DisplayObjectContainer):Array {
			var children:Array = [];

			for (var i:uint = 0; i < target.numChildren; i++)
				children.push(target.getChildAt(i));

			return children;
		}
		
		public function moveDrink(event:Event) {
			this.drinks1.fadeOutT();
			
		}
		
			}}	