﻿package  {		import flash.display.*;			public class drinksButton extends MovieClip {				public function drinksButton() {			this.x = 500;			this.y = 540;					}				drinks.addEventListener(MoustEvent.CLICK, showDrinksMenu);				public function showDrinksMenu(e:MouseEvent):void {						this.removeChild(this.food)					}	}	}