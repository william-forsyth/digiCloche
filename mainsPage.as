﻿/* THIS IS THE PIZZA PAGE, NOT MAINS. I REPEAT. NOT MAINS.*/package  {		import flash.display.MovieClip;	import flash.display.Shape;	import fl.controls.*;	import flash.text.*;	import flash.events.*;	import pq.multitouch.*;	import pq.multitouch.manipulators.MultiDragScaleRotate;		public class mainsPage extends MovieClip {		var img_head;		var page_title;		var roundRect;		//stage width, stage height, width of rectangle, height of rectangle, ellipse width, ellipse height				//alignments		var align_right = 220;		var align_left = -220;		var diff = 130;		var align_top = -20;				///themfood		var margherita;		var salami;		var veggie;		var supreme;		var meatlovers;				///them label		var margherita_label;		var salami_label;		var veggie_label;		var supreme_label;		var meatlovers_label;				var fooditem;		var circles:Array;		var myFont:Font = new helvs_light();		var myTextFormat:TextFormat = new TextFormat();				var startX:int;		var startY:int;				var backbutton;		public function mainsPage() {			this.width = 428;//480;			this.height = 252;//270;						img_head = new mains();			img_head.y = -160;//-120;						img_head.width = 70;			img_head.height = 70;			this.addChild(img_head);						page_title = new mains_label();			page_title.y = img_head.y + 40;			this.addChild(page_title);						//stage width, stage height, width of rectangle, height of rectangle, ellipse width, ellipse height			roundRect = new Shape();			roundRect.graphics.beginFill(0xFFFFFF, 0.5);			roundRect.graphics.drawRoundRect(0, 0, 600, 280, 15, 15);			roundRect.x = -300;			roundRect.y = -100;			this.addChild(roundRect);									myTextFormat.font = myFont.fontName;			myTextFormat.size = 8;			myTextFormat.color = 0x620c0d;			myTextFormat.align = TextFormatAlign.CENTER;						margherita = new pizza1();			margherita.x = align_left;			margherita.y = align_top;			margherita.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "margherita.txt")});			//this.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent):void{ stopDragging(e, dessertPizza)}, true);			this.addChild(margherita);									salami = new pizza2();			salami.x = align_left/2;			salami.y = align_top;			this.addChild(salami);			salami.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "salami.txt")});									veggie = new pizza3();			veggie.x = 0;			veggie.y = align_top;			this.addChild(veggie);			veggie.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "veggie.txt")});									 			supreme = new pizza4();			supreme.x = align_right/2;			supreme.y = align_top;			this.addChild(supreme);			supreme.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "supreme.txt")});						meatlovers = new pizza5();			meatlovers.x = align_right;			meatlovers.y = align_top;			meatlovers.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "meatlovers.txt")});			this.addChild(meatlovers);												margherita_label = new CheckBox();			margherita_label.label = "Margherita Pizza";			margherita_label.width = 300;			margherita_label.x = align_left - 40;			margherita_label.y = margherita.y + 40;			margherita_label.setStyle("embedFonts", true);			margherita_label.setStyle("textFormat", myTextFormat);			this.addChild(margherita_label);						salami_label = new CheckBox();			salami_label.label = "Wholegrain Salami Pizza";			salami_label.width = 300;			salami_label.x = align_left/2 - 40;			salami_label.y = salami.y + 40;			salami_label.setStyle("embedFonts", true);			salami_label.setStyle("textFormat", myTextFormat);			this.addChild(salami_label);						veggie_label = new CheckBox();			veggie_label.label = "Vegetarian Pizza";			veggie_label.width = 300;			veggie_label.x = -40;			veggie_label.y = veggie.y + 40;			veggie_label.setStyle("embedFonts", true);			veggie_label.setStyle("textFormat", myTextFormat);			this.addChild(veggie_label);												supreme_label = new CheckBox();			supreme_label.label = "Pizza Supreme";			supreme_label.width = 300;			supreme_label.x = align_right/2 - 40;			supreme_label.y = supreme.y + 40;			supreme_label.setStyle("embedFonts", true);			supreme_label.setStyle("textFormat", myTextFormat);			this.addChild(supreme_label);						meatlovers_label = new CheckBox();			meatlovers_label.label = "BBQ Meatlovers Pizza";			meatlovers_label.width = 300;			meatlovers_label.x = align_right - 40;			meatlovers_label.y = meatlovers.y + 40;			meatlovers_label.setStyle("embedFonts", true);			meatlovers_label.setStyle("textFormat", myTextFormat);			this.addChild(meatlovers_label);						circles = [margherita, veggie, meatlovers,supreme, salami];						for each(var i in circles){				//i.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);				i.addEventListener(MouseEvent.MOUSE_UP, stopDragging);				i.startX = i.x;				i.startY = i.y;				MultiTouch.enableGesture(i,new MultiDragScaleRotate());			}						backbutton = new back();			backbutton.x = -270;			backbutton.y = -170;			this.addChild(backbutton);							}		function startDragging(event:MouseEvent):void{//, obj:Object) {			//obj.startDrag();			  // no longer need to keep track of startX & startY here because that's already been done up above  			  event.target.startDrag(true);  			  event.target.parent.addChild(event.target);		}				 		function stopDragging(event:MouseEvent):void{//, obj:Object) {			//obj.stopDrag();						event.target.stopDrag();			// check to see if the event target is touching target_mc using hitTestObject			if(event.target.hitTestObject(img_head)){				event.target.buttonMode = false;				event.target.x = -400;				event.target.y = -400;				// move all circles OTHER than the current target back to their original positions				for each(var circleMC:MovieClip in circles){					if(event.target != circleMC)					{						circleMC.x = circleMC.startX;						circleMC.y = circleMC.startY;					}				}			}else{				// only need to move the event target back if it was dropped outside of target_mc				event.target.x = event.target.startX;				event.target.y = event.target.startY;				event.target.buttonMode = true;			}		}		function showInfo(e:MouseEvent, txtfile:String):void{			fooditem = new foodItem(txtfile,"pizza");			this.addChild(fooditem);		}		function getBackButton():Object{			return this.backbutton;		}	}	}