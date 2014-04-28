package {		import flash.display.*;	import flash.events.*;
	//import Lights;			public class main extends MovieClip {
		
		var food;
		var drinks;
		var one;
		var two;
		var three;
		var four;
		
		var blue;
		
		var state;
		
		public function main() {
			
			food = new foodButton();
			drinks = new drinksButton();
			blue = new blueBack();
			
			this.addChild(this.blue);
			
			/*this.addChild(this.food);
			this.addChild(this.drinks);*/
			
			createCircle1();
			createCircle2();
			createCircle3();
			createCircle4();
			
	
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
			for (var i = 0; i < 1; i++) {
				four = new circle4(1);

				this.addChild(this.four);
			}
		}
				}}	