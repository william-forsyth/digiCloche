﻿﻿package {		import flash.display.*;	import flash.events.*;	import flash.utils.Timer;	import flash.ui.Keyboard;	import flash.display.Graphics;    import flash.display.Sprite;	import flash.geom.*;	import pq.multitouch.*;	import flash.text.*;		import com.phidgets.*;	import com.phidgets.events.*;		public class main extends MovieClip {				var one;		var two;		var three;		var four;				var blueB;		var redB;		var orangeB;		var yellowB;		var greenB;				var myState;		var stateTimer:Timer;				var newMenu1;		var newMenu2;		var newMenu3;		var newMenu4;				var menu1ready = true;		var menu2ready = true;		var menu3ready = true;		var menu4ready = true;				var milady;		//var rads :Number = degrees * (Math.PI / 180);		var screenwidth:int = 1920;		var screenheight:int = 1080;				var infoFormat:TextFormat = new TextFormat();		var infoMsg:TextField = new TextField();		var infoMsg2:TextField = new TextField();		var bubblething;		var bubblething2;		var myFont:Font = new helvs_light();				var rfid:PhidgetRFID = new PhidgetRFID();				var allergy1 = new TextField();		var allergy2 = new TextField();		var allergy3 = new TextField();		var allergy4 = new TextField();		var myTextFormat:TextFormat = new TextFormat();				var game;		var gameTimer:Timer;
		
		var redS:Sprite = new Sprite();
		var orangeS:Sprite = new Sprite();
		var yellowS:Sprite = new Sprite();
		var greenS:Sprite = new Sprite();
		var blueS:Sprite = new Sprite();
		var purpleS:Sprite = new Sprite();
		var whiteS:Sprite = new Sprite();				//640 400 + 30		public function main() {						newMenu1	= new menu(340, 860);						newMenu2	= new menu(340, 220);			newMenu3	= new menu(1580, 220);			newMenu4	= new menu(1580, 860);						blueB 		= new blue();			redB 		= new red();			orangeB 	= new orange();			yellowB 	= new yellow();			greenB 		= new green();						this.addChild(this.blueB);			this.myState = 0;						createCircle1();			createCircle2();			createCircle3();			createCircle4();						stateTimer = new Timer(4000);			stateTimer.addEventListener(TimerEvent.TIMER, changeState);			stateTimer.start();						this.addChild(TouchViewer.getInstance());						this.addEventListener(Event.ADDED_TO_STAGE, initKeyboardEvents);									milady = new lazySusan();			this.addChild(milady);			//milady.addEventListener(Event.ENTER_FRAME, move);			milady.x = 1000;			milady.y = 540;						infoFormat.font = myFont.fontName;			infoFormat.color = 0x2f1a10;			infoFormat.size = 18;			infoFormat.align = TextFormatAlign.CENTER;									bubblething = new bannerthing();			bubblething.x = 950;			bubblething.y = 100;			this.addChild(bubblething);						bubblething2 = new bannerthing();			bubblething2.x = 950;			bubblething2.y = 980;			bubblething2.rotation = -180;			this.addChild(bubblething2);						infoMsg.defaultTextFormat = infoFormat;			infoMsg.embedFonts = true;			infoMsg.text = "Drag items here";			infoMsg.width = 400;			infoMsg.wordWrap = true;			infoMsg.x = 750;			infoMsg.y = 85;						this.addChild(infoMsg);			infoMsg2.rotation = -180;			infoMsg2.defaultTextFormat = infoFormat;			infoMsg2.embedFonts = true;			infoMsg2.text = "Drag items here";			infoMsg2.width = 400;			infoMsg2.wordWrap = true;			infoMsg2.x = 1150;//750;			infoMsg2.y = 995;						this.addChild(infoMsg2);									rfid.addEventListener(PhidgetEvent.DETACH,	onDetach);			rfid.addEventListener(PhidgetEvent.ATTACH,	onAttach);			rfid.addEventListener(PhidgetErrorEvent.ERROR, onError);			rfid.addEventListener(PhidgetDataEvent.TAG, onTag);			rfid.addEventListener(PhidgetDataEvent.TAG_LOST, onTagLoss);			rfid.open("localhost", 5001, "1234");						myTextFormat.font = myFont.fontName;			myTextFormat.size = 40;			myTextFormat.color = 0xFFFFFF;						allergy1.defaultTextFormat = myTextFormat;			allergy1.embedFonts = true;			allergy1.text = '';			allergy1.width = 500;			allergy1.x = 100;			allergy1.y = 500;			this.addChild(allergy1);			this.setChildIndex(allergy1, 5);									allergy2.defaultTextFormat = myTextFormat;			allergy2.embedFonts = true;			allergy2.text = '';			allergy2.width = 500;			allergy2.x = 100			allergy2.y = 550;			this.addChild(allergy2);			this.setChildIndex(allergy2, 5);						allergy3.defaultTextFormat = myTextFormat;			allergy3.embedFonts = true;			allergy3.text = '';			allergy3.width = 500;			allergy3.x = 1500;			allergy3.y = 500;			this.addChild(allergy3);			this.setChildIndex(allergy3, 5);						allergy4.defaultTextFormat = myTextFormat;			allergy4.embedFonts = true;			allergy4.text = '';			allergy4.width = 500;			allergy4.x = 1500;			allergy4.y = 550;			this.addChild(allergy4);			this.setChildIndex(allergy4, 5);
			
			/*
			redS.graphics.beginFill(0xFF0000);
			redS.graphics.drawCircle(10, 10, 10);
			redS.graphics.endFill();
			addChild(redS);

			orangeS.graphics.beginFill(0xFF9900);
			orangeS.graphics.drawCircle(10, 30, 10);
			orangeS.graphics.endFill();
			addChild(orangeS);

			yellowS.graphics.beginFill(0xFFFF00);
			yellowS.graphics.drawCircle(10, 50, 10);
			yellowS.graphics.endFill();
			addChild(yellowS);

			greenS.graphics.beginFill(0x00FF00);
			greenS.graphics.drawCircle(10, 70, 10);
			greenS.graphics.endFill();
			addChild(greenS);

			blueS.graphics.beginFill(0x0000FF);
			blueS.graphics.drawCircle(10, 90, 10);
			blueS.graphics.endFill();
			addChild(blueS);

			purpleS.graphics.beginFill(0xFF00FF);
			purpleS.graphics.drawCircle(10, 110, 10);
			purpleS.graphics.endFill();
			addChild(purpleS);

			whiteS.graphics.lineStyle(1, 0x000000);
			whiteS.graphics.beginFill(0xFFFFFF);
			whiteS.graphics.drawCircle(10, 130, 10);
			whiteS.graphics.endFill();
			addChild(whiteS);

			redS.addEventListener(MouseEvent.CLICK, changeBack('red'));
			orangeS.addEventListener(MouseEvent.CLICK, changeBack('orange'));
			yellowS.addEventListener(MouseEvent.CLICK, changeBack('yellow'));
			greenS.addEventListener(MouseEvent.CLICK, changeBack('green'));
			blueS.addEventListener(MouseEvent.CLICK, changeBack('blue'));
			purpleS.addEventListener(MouseEvent.CLICK, changeBack('purple'));
			whiteS.addEventListener(MouseEvent.CLICK, changeBack('white'));*/		}				public function initKeyboardEvents(e:Event):void{			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, sitDown);			stage.fullScreenSourceRect = new Rectangle(0,0,1920,1080);			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE; 			trace("Stage:" + stage);			trace("This.stage:" + this.stage);			trace("Stage status:" + stage.displayState);			trace("Stage status:" + stage.fullScreenSourceRect);			MultiTouch.init(stage);											}				public function sitDown(e:KeyboardEvent) {			switch(e.keyCode) {				case 37:									if (menu1ready == true){						this.addChild(newMenu1);						trace('37');						menu1ready = false;					}										break;				case 38:									if (menu2ready == true){						newMenu2.rotation = -180;						this.addChild(newMenu2);						menu2ready = false;						trace('38');							}					break;				case 39:					if (menu3ready == true){						newMenu3.rotation = -180;						this.addChild(newMenu3);						menu3ready = false;						trace('39');					}					break;				case 40:									if (menu4ready == true){						this.addChild(newMenu4);						trace('40');						menu4ready = false;					}					break;				case 32:					game = new gameBG();					this.addChild(game);									gameTimer = new Timer(70000, 1);					gameTimer.addEventListener(TimerEvent.TIMER, closeGame);					gameTimer.start();													}						trace(e.keyCode);					}				public function changeState(e:TimerEvent) {			switch(this.myState) {				case 0:					this.blueB.fadeOutT();					this.addChild(redB);					this.setChildIndex(redB, 0);					this.redB.fadeInT();					this.myState++;					break;				case 1:					this.redB.fadeOutT();					this.addChild(orangeB);					this.setChildIndex(orangeB, 0);					this.orangeB.fadeInT();					this.myState++;					break;				case 2:					this.orangeB.fadeOutT();					this.addChild(yellowB);					this.setChildIndex(yellowB, 0);					this.yellowB.fadeInT();					this.myState++;					break;				case 3:					this.yellowB.fadeOutT();					this.addChild(greenB);					this.setChildIndex(greenB, 0);					this.greenB.fadeInT();					this.myState++;					break;				case 4:					this.greenB.fadeOutT();					this.addChild(blueB);					this.blueB.alpha = 0;					this.setChildIndex(blueB, 0);					this.blueB.fadeInT();					this.myState = 0;					break;			}					}				public function createCircle1(){			for (var i = 0; i < 4; i++) {				one = new circle1(1);				this.addChild(this.one);			}		}				public function createCircle2(){			for (var i = 0; i < 3; i++) {				two = new circle2(1);				this.addChild(this.two);			}		}				public function createCircle3(){			for (var i = 0; i < 2; i++) {				three = new circle3(1);				this.addChild(this.three);			}		}				public function createCircle4(){			for (var i = 0; i < 2; i++) {				four = new circle4(1);				this.addChild(this.four);			}		}				public function getChildren(target:DisplayObjectContainer):Array {			var children:Array = [];			for (var i:uint = 0; i < target.numChildren; i++)				children.push(target.getChildAt(i));			return children;		}				/*protected function move(e :Event) :void{			 var rad :Number = this.angle * (Math.PI / 180);			 this.x = this.origin.x + this.radius * Math.cos(rad);			 this.y = this.origin.y + this.radius * Math.sin(rad);					 if (this.reverse == false)			 {				  this.angle += this.speed; // clockwise			 }			 else			 {				  this.angle -= this.speed; // counter-clockwise			 }					 this.angle %= 360;		}*/		function getLazySuzan():Object{			return this.milady;		}				public function onAttachPre(b:Boolean, id:int) {			trace(rfid.serialNumber);		}				public function onTag(evt:PhidgetDataEvent):void{			var tag = evt.Data;									trace(evt);						var RFIDid = rfid.serialNumber;						trace(RFIDid);						if (RFIDid == '18320') {				if (tag == '01056df998') {					allergy1.text = 'ALLERGY DETECTED: Nut';				}				else if (tag == '080032f959') {					allergy1.text = 'ALLERGY DETECTED: Shrimp';				}				else if (tag == '0800332ee4'){					allergy1.text = 'Diet Preference: Vegetarian';										/*if (stage.contains(newMenu1.mymainspage)){						this.newMenu1.mymainspage.removeAllergy("vegetarian");					}*/										//this.dispatchEvent(new Event('vegetarian', true));									}				else {					allergy1.text = 'No known allergens'				}				trace("what to do..");			}			else if (RFIDid ==23062) {				if (tag == '01056df998') {					allergy2.text = 'NUT ALLERGY';				}				else if (tag == '080032f959') {					allergy2.text = 'SHRIMP ALLERGY';				}				else if (tag == '0800332ee4'){					allergy2.text = 'VEGETARIAN';				}				else {					allergy2.text = 'No known allergens'				}							trace("I'm hungry");			}			else if (RFIDid == 17790) {				if (tag == '01056df998') {					allergy3.text = 'NUT ALLERGY';				}				else if (tag == '080032f959') {					allergy3.text = 'SHRIMP ALLERGY';				}				else if (tag == '0800332ee4'){					allergy3.text = 'VEGETARIAN';				}				else {					allergy3.text = 'No known allergens'				}							trace('Adee plz feed me');			}					}				public function onAttach(evt:PhidgetEvent):void{			trace(evt);			rfid.Antenna = true;			rfid.LED = true;		}				public function onDetach(evt:PhidgetEvent):void{			trace(evt);		}			public function onTagLoss(evt:PhidgetDataEvent):void{			trace(evt);			//userAllergy.text = "";						var RFIDid = rfid.serialNumber;						if (RFIDid == 18320) {				allergy1.text = '';								//this.newMenu1.mymainspage.returnAlpha();			}			else if (RFIDid == 23062){				allergy2.text = '';			}			else if (RFIDid == 17790){				allergy3.text = '';			}					}				public function onError(evt:PhidgetErrorEvent):void{			trace(evt);		}				public function closeGame(e:TimerEvent) {			this.removeChild(this.game);								}
		
		public function changeBack(colour) {
			return function (e:MouseEvent) {
				switch(colour) {
					case 'red':
						stage.addChild(redB);
						stage.setChildIndex(redB, 0);
					case 'orange':
						stage.addChild(orangeB);
						stage.setChildIndex(orangeB, 0);
					case 'yellow':
						stage.addChild(yellowB)
						stage.setChildIndex(yellowB, 0);;
					case 'green':
						stage.addChild(greenB);
						stage.setChildIndex(greenB, 0);
					case 'blue':
						stage.addChild(blueB);
						stage.setChildIndex(blueB, 0);
					//case 'purple':
						//this.addChild(purpleB);
				}
			}
		}			}}