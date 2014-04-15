package {		import flash.display.*;	import flash.events.*;
	//import Lights;			public class main extends MovieClip {
		
		var food;
		var drinks;
		var clouds;
		
		public function main() {
			
			food = new foodButton();
			drinks = new drinksButton();
			
			for (var i = 0; i < 5; i++) {
				clouds = new cloud(10);

				this.addChild(this.clouds);
			}
			
			this.addChild(this.food);
			this.addChild(this.drinks);
	
		}
				}}	