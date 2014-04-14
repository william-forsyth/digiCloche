package {		import flash.display.*;	import flash.events.*;
	//import Lights;			public class main extends MovieClip {
		
		var food;
		var drinks;
		
		public function main() {
			
			food = new foodButton();
			drinks = new drinksButton();
			
			this.addChild(this.food);
			this.addChild(this.drinks);
			
			this.setChildIndex(this.food, 100);
			this.setChildIndex(this.drinks, 100);
		}
				}}	