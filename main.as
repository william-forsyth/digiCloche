﻿package {		import flash.display.*;	import flash.events.*;	import flash.utils.Timer;	import flash.ui.Keyboard;		//import pq.multitouch.*;		public class main extends MovieClip {				var one;		var two;		var three;		var four;				var blueB;		var redB;		var orangeB;		var yellowB;		var greenB;				var myState;		var stateTimer:Timer;				var newMenu1;		var newMenu2;		var newMenu3;		var newMenu4;				var menu1ready = true;		var menu2ready = true;		var menu3ready = true;		var menu4ready = true;				var milady;		public function main() {			newMenu1	= new menu(285, 200, true);						newMenu2	= new menu(1635, 880, false);			newMenu3	= new menu(1635, 200, true);			newMenu4	= new menu(285, 880, false);									blueB 		= new blue();			redB 		= new red();			orangeB 	= new orange();			yellowB 	= new yellow();			greenB 		= new green();						this.addChild(this.blueB);			this.myState = 0;						createCircle1();			createCircle2();			createCircle3();			createCircle4();						stateTimer = new Timer(4000);			stateTimer.addEventListener(TimerEvent.TIMER, changeState);			stateTimer.start();						//this.addChild(TouchViewer.getInstance());						this.addEventListener(Event.ADDED_TO_STAGE, initKeyboardEvents);									milady = new lazySusan();			this.addChild(milady);			milady.x = 990;			milady.y = 540;		}				public function initKeyboardEvents(e:Event):void{			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, sitDown);			trace("Stage:" + this.stage);			//MultiTouch.init(stage);					}				public function sitDown(e:KeyboardEvent) {			switch(e.keyCode) {				case 38:									if (menu1ready == true){						this.addChild(newMenu1);						trace('38');						menu1ready = false;					}										break;				case 37:									if (menu2ready == true){						this.addChild(newMenu2);						menu2ready = false;						trace('37');										}					break;				case 39:					if (menu3ready == true){						this.addChild(newMenu3);						menu3ready = false;						trace('39');					}					break;				case 40:									if (menu4ready == true){						this.addChild(newMenu4);						trace('40');						menu4ready = false;					}					break;								}					}				public function changeState(e:TimerEvent) {			switch(this.myState) {				case 0:					this.blueB.fadeOutT();					this.addChild(redB);					this.setChildIndex(redB, 0);					this.redB.fadeInT();					this.myState++;					break;				case 1:					this.redB.fadeOutT();					this.addChild(orangeB);					this.setChildIndex(orangeB, 0);					this.orangeB.fadeInT();					this.myState++;					break;				case 2:					this.orangeB.fadeOutT();					this.addChild(yellowB);					this.setChildIndex(yellowB, 0);					this.yellowB.fadeInT();					this.myState++;					break;				case 3:					this.yellowB.fadeOutT();					this.addChild(greenB);					this.setChildIndex(greenB, 0);					this.greenB.fadeInT();					this.myState++;					break;				case 4:					this.greenB.fadeOutT();					this.addChild(blueB);					this.blueB.alpha = 0;					this.setChildIndex(blueB, 0);					this.blueB.fadeInT();					this.myState = 0;					break;			}					}				public function createCircle1(){			for (var i = 0; i < 4; i++) {				one = new circle1(1);				this.addChild(this.one);			}		}				public function createCircle2(){			for (var i = 0; i < 3; i++) {				two = new circle2(1);				this.addChild(this.two);			}		}				public function createCircle3(){			for (var i = 0; i < 2; i++) {				three = new circle3(1);				this.addChild(this.three);			}		}				public function createCircle4(){			for (var i = 0; i < 2; i++) {				four = new circle4(1);				this.addChild(this.four);			}		}				public function getChildren(target:DisplayObjectContainer):Array {			var children:Array = [];			for (var i:uint = 0; i < target.numChildren; i++)				children.push(target.getChildAt(i));			return children;		}			}}	