﻿/* THIS IS THE PASTA PAGE, NOT SOUP. I REPEAT. NOT SOUP.*/package  {		import flash.display.MovieClip;	import flash.display.Shape;	import flash.display.MovieClip;	import flash.display.Shape;	import fl.controls.*;	import flash.text.*;	import flash.events.*;	import pq.multitouch.*;	import pq.multitouch.manipulators.MultiDragScaleRotate;		public class soupPage extends MovieClip {		var img_head;		var page_title;		var roundRect;				//alignments		var align_right = 220;		var align_left = -220;		var diff = 130;		var align_top = -20;				///themfood		var neapolitan;		var bolognese;		var alfredo;		var arrabiata;		var veggie;				var fooditem;		var circles:Array;		var myFont:Font = new helvs_light();		var myTextFormat:TextFormat = new TextFormat();				var startX:int;		var startY:int;				var backbutton;		public function soupPage() {			this.width = 428;//480;			this.height = 252;//270;						img_head = new soup();			img_head.y = -160;//-120;						img_head.width = 70;			img_head.height = 70;			this.addChild(img_head);						page_title = new soup_label();			page_title.y = img_head.y + 40;			this.addChild(page_title);						//stage width, stage height, width of rectangle, height of rectangle, ellipse width, ellipse height			roundRect = new Shape();			roundRect.graphics.beginFill(0xFFFFFF, 0.5);			roundRect.graphics.drawRoundRect(0, 0, 600, 280, 15, 15);			roundRect.x = -300;			roundRect.y = -100;			this.addChild(roundRect);						neapolitan = new pasta1();			neapolitan.x = align_left;			neapolitan.y = align_top;			neapolitan.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "neapolitan.txt")});			//this.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent):void{ stopDragging(e, dessertPizza)}, true);			this.addChild(neapolitan);									bolognese = new pasta2();			bolognese.x = align_left/2;			bolognese.y = align_top;			this.addChild(bolognese);			bolognese.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "bolognese.txt")});									alfredo = new pasta3();			alfredo.x = 0;			alfredo.y = align_top;			this.addChild(alfredo);			alfredo.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "alfredo.txt")});									 			arrabiata = new pasta4();			arrabiata.x = align_right/2;			arrabiata.y = align_top;			this.addChild(arrabiata);			arrabiata.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "arrabbiata.txt")});						veggie = new dessert5();			veggie.x = align_right;			veggie.y = align_top;			veggie.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "veggie.txt")});			this.addChild(veggie);									/*this.dat_label = new CheckBox();			dat_label.label = "Dessert Pizza";			dat_label.width = 500;			dat_label.x = align_left - 40;			dat_label.y = dessertPizza.y + 40;			dat_label.setStyle("embedFonts", true);			dat_label.setStyle("textFormat", myTextFormat);			this.addChild(dat_label);						this.dis_label = new CheckBox();			dis_label.label = "Raspberry W/C Cheesecake";			dis_label.width = 500;			dis_label.x = align_left + 40;			dis_label.y = dessertPizza.y + 40;			dis_label.setStyle("embedFonts", true);			dis_label.setStyle("textFormat", myTextFormat);			this.addChild(dis_label);*/						circles = [neapolitan, bolognese, alfredo, arrabiata, veggie];						for each(var i in circles){				//i.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);				i.addEventListener(MouseEvent.MOUSE_UP, stopDragging);				i.startX = i.x;				i.startY = i.y;				MultiTouch.enableGesture(i,new MultiDragScaleRotate());			}						backbutton = new back();			backbutton.x = -270;			backbutton.y = -170;			this.addChild(backbutton);		}		function startDragging(event:MouseEvent):void{//, obj:Object) {			//obj.startDrag();			  // no longer need to keep track of startX & startY here because that's already been done up above  			  event.target.startDrag(true);  			  event.target.parent.addChild(event.target);		}				 		function stopDragging(event:MouseEvent):void{//, obj:Object) {			//obj.stopDrag();						event.target.stopDrag();			// check to see if the event target is touching target_mc using hitTestObject			if(event.target.hitTestObject(img_head)){				event.target.buttonMode = false;				event.target.x = -400;				event.target.y = -400;				// move all circles OTHER than the current target back to their original positions				for each(var circleMC:MovieClip in circles){					if(event.target != circleMC)					{						circleMC.x = circleMC.startX;						circleMC.y = circleMC.startY;					}				}			}else{				// only need to move the event target back if it was dropped outside of target_mc				event.target.x = event.target.startX;				event.target.y = event.target.startY;				event.target.buttonMode = true;			}		}		function showInfo(e:MouseEvent, txtfile:String):void{			fooditem = new foodItem(txtfile,"pasta");			this.addChild(fooditem);		}		function getBackButton():Object{			return this.backbutton;		}	}	}