﻿package  {		import flash.display.MovieClip;	import flash.display.Shape;	import fl.controls.*;	import flash.text.*;	import flash.events.*;	import pq.multitouch.*;	import pq.multitouch.manipulators.MultiDragScaleRotate;		public class sidesPage extends MovieClip {				var img_head;		var page_title;		var roundRect;		//stage width, stage height, width of rectangle, height of rectangle, ellipse width, ellipse height				//alignments		var align_right = 220;		var align_left = -220;		var diff = 130;		var align_top = -20;				///themfood		var ceasarsalad;		var gardensalad;		var garlicbread;		var chips;				///themlabel		var ceasarsalad_label;		var gardensalad_label;		var garlicbread_label;		var chips_label;				var fooditem;		var circles:Array;		var myFont:Font = new helvs_light();		var myTextFormat:TextFormat = new TextFormat();				var startX:int;		var startY:int;		var backbutton;				public function sidesPage() {			this.width = 428;//480;			this.height = 252;//270;						img_head = new sides();			img_head.y = -160;//-120;			img_head.width = 70;			img_head.height = 70;			this.addChild(img_head);						page_title = new sides_label();			page_title.y = img_head.y + 40;			this.addChild(page_title);						myTextFormat.font = myFont.fontName;			myTextFormat.size = 8;			myTextFormat.color = 0x620c0d;						//stage width, stage height, width of rectangle, height of rectangle, ellipse width, ellipse height			roundRect = new Shape();			roundRect.graphics.beginFill(0xFFFFFF, 0.5);			roundRect.graphics.drawRoundRect(0, 0, 600, 280, 15, 15);			roundRect.x = -300;			roundRect.y = -100;			this.addChild(roundRect);					ceasarsalad = new side1();			ceasarsalad.x = align_left;			ceasarsalad.y = align_top;			ceasarsalad.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "ceasarsalad.txt")});			//this.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent):void{ stopDragging(e, dessertPizza)}, true);			this.addChild(ceasarsalad);									gardensalad = new side2();			gardensalad.x = align_left/2;			gardensalad.y = align_top;			this.addChild(gardensalad);			gardensalad.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "gardensalad.txt")});									garlicbread = new side3();			garlicbread.x = 0;			garlicbread.y = align_top;			this.addChild(garlicbread);			garlicbread.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "garlicbread.txt")});									 			chips = new side4();			chips.x = align_right/2;			chips.y = align_top;			this.addChild(chips);			chips.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "chips.txt")});					ceasarsalad_label = new CheckBox();			ceasarsalad_label.label = "Ceasar Salad";			ceasarsalad_label.width = 300;			ceasarsalad_label.x = align_left - 40;			ceasarsalad_label.y = ceasarsalad.y + 40;			ceasarsalad_label.setStyle("embedFonts", true);			ceasarsalad_label.setStyle("textFormat", myTextFormat);			this.addChild(ceasarsalad_label);						gardensalad_label = new CheckBox();			gardensalad_label.label = "Garden Salad";			gardensalad_label.width = 300;			gardensalad_label.x = align_left/2 - 40;			gardensalad_label.y = gardensalad.y + 40;			gardensalad_label.setStyle("embedFonts", true);			gardensalad_label.setStyle("textFormat", myTextFormat);			this.addChild(gardensalad_label);						garlicbread_label = new CheckBox();			garlicbread_label.label = "Garlic Bread";			garlicbread_label.width = 300;			garlicbread_label.x = - 40;			garlicbread_label.y = garlicbread.y + 40;			garlicbread_label.setStyle("embedFonts", true);			garlicbread_label.setStyle("textFormat", myTextFormat);			this.addChild(garlicbread_label);						chips_label = new CheckBox();			chips_label.label = "Garden Salad";			chips_label.width = 300;			chips_label.x = align_right/2 - 40;			chips_label.y = chips.y + 40;			chips_label.setStyle("embedFonts", true);			chips_label.setStyle("textFormat", myTextFormat);			this.addChild(chips_label);						circles = [ceasarsalad, gardensalad, garlicbread,chips];						for each(var i in circles){				//i.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);				i.addEventListener(MouseEvent.MOUSE_UP, stopDragging);				i.startX = i.x;				i.startY = i.y;				MultiTouch.enableGesture(i,new MultiDragScaleRotate());			}						backbutton = new back();			backbutton.x = -270;			backbutton.y = -170;			this.addChild(backbutton);								}		function startDragging(event:MouseEvent):void{//, obj:Object) {			//obj.startDrag();			  // no longer need to keep track of startX & startY here because that's already been done up above  			  event.target.startDrag(true);  			  event.target.parent.addChild(event.target);		}				 		function stopDragging(event:MouseEvent):void{//, obj:Object) {			//obj.stopDrag();						event.target.stopDrag();			// check to see if the event target is touching target_mc using hitTestObject			if(event.target.hitTestObject(img_head)){				event.target.buttonMode = false;				event.target.x = -400;				event.target.y = -400;				// move all circles OTHER than the current target back to their original positions				for each(var circleMC:MovieClip in circles){					if(event.target != circleMC)					{						circleMC.x = circleMC.startX;						circleMC.y = circleMC.startY;					}				}			}else{				// only need to move the event target back if it was dropped outside of target_mc				event.target.x = event.target.startX;				event.target.y = event.target.startY;				event.target.buttonMode = true;			}		}		function showInfo(e:MouseEvent, txtfile:String):void{			fooditem = new foodItem(txtfile,"sides");			this.addChild(fooditem);		}		function getBackButton():Object{			return this.backbutton;		}	}	}