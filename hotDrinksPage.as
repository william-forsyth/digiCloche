﻿package {	import flash.display.MovieClip;	import flash.display.Shape;	import fl.controls.*;	import flash.text.*;	import flash.events.*;	import pq.multitouch.*;	import pq.multitouch.manipulators.MultiDragScaleRotate;		public class hotDrinksPage extends MovieClip{		var img_head;		var page_title;		var fooditem;				//food items		var capp;		var latte;		var flatwhite;		var espresso;		var longblack;		var babycinno;		var mocha;		var hotchoc;		var tea;		var greentea;		var circles:Array;		var myFont:Font = new helvs_light();		var myTextFormat:TextFormat = new TextFormat();		var startX:int;		var startY:int;				//alignments		var align_right = 220;		var align_left = -220;		var diff = 130;		var align_top = -20;				var backbutton;		public function hotDrinksPage()		{			this.width = 428;//480;			this.height = 252;//270;			myTextFormat.font = myFont.fontName;			myTextFormat.size = 8;			myTextFormat.color = 0x620c0d;			img_head = new hotdrinks();			img_head.y = -160;//-120;			img_head.width = 70;			img_head.height = 70;			this.addChild(img_head);			page_title = new hot_label();			page_title.y = img_head.y + 40;			this.addChild(page_title);			//stage width, stage height, width of rectangle, height of rectangle, ellipse width, ellipse height			var roundRect:Shape = new Shape();			roundRect.graphics.beginFill(0xFFFFFF, 0.5);			roundRect.graphics.drawRoundRect(0, 0, 600, 280, 15, 15);			roundRect.x = -300;			roundRect.y = -100;			this.addChild(roundRect);			//add all hot drinks items to stage			capp = new hot1();			capp.x = align_left;			capp.y = align_top;			this.addChild(capp);			latte = new hot2();			latte.x = align_left / 2;			latte.y = align_top;			this.addChild(latte);			flatwhite = new hot3();			flatwhite.x = 0;			flatwhite.y = align_top;			this.addChild(flatwhite);			espresso = new hot4();			espresso.x = align_right / 2;			espresso.y = align_top;			this.addChild(espresso);			longblack = new hot5();			longblack.x = align_right;			longblack.y = align_top;			this.addChild(longblack);			babycinno = new hot6();			babycinno.x = align_left;			babycinno.y = align_top + diff;			this.addChild(babycinno);			mocha = new hot7();			mocha.x = align_left / 2;			mocha.y = align_top + diff;			this.addChild(mocha);			hotchoc = new hot8();			hotchoc.x = 0;			hotchoc.y = align_top + diff;			this.addChild(hotchoc);			tea = new hot9();			tea.x = align_right / 2;			tea.y = align_top + diff;			this.addChild(tea);			greentea = new hot10();			greentea.x = align_right;			greentea.y = align_top;			this.addChild(greentea) + diff;			circles = [capp,latte,flatwhite,espresso,longblack,babycinno,mocha,hotchoc,tea,greentea];			for each (var i in circles)			{				i.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);				i.addEventListener(MouseEvent.MOUSE_UP, stopDragging);				i.startX = i.x;				i.startY = i.y;				MultiTouch.enableGesture(i,new MultiDragScaleRotate());			}			backbutton = new back();			backbutton.x = -270;			backbutton.y = -170;			this.addChild(backbutton);		}		function startDragging(event:MouseEvent):void		{//, obj:Object) {			//obj.startDrag();			// no longer need to keep track of startX & startY here because that's already been done up above			event.target.startDrag(true);			event.target.parent.addChild(event.target);		}		function stopDragging(event:MouseEvent):void		{//, obj:Object) {			//obj.stopDrag();			event.target.stopDrag();			// check to see if the event target is touching target_mc using hitTestObject;			if (event.target.hitTestObject(img_head))			{				event.target.buttonMode = false;				event.target.x = -400;				event.target.y = -400;				// move all circles OTHER than the current target back to their original positions				for each (var circleMC:MovieClip in circles)				{					if (event.target != circleMC)					{						circleMC.x = circleMC.startX;						circleMC.y = circleMC.startY;					}				}			}			else			{				// only need to move the event target back if it was dropped outside of target_mc				event.target.x = event.target.startX;				event.target.y = event.target.startY;				event.target.buttonMode = true;			}		}		function showInfo(e:MouseEvent, txtfile:String):void{			fooditem = new foodItem(txtfile,"hot");			this.addChild(fooditem);		}		function getBackButton():Object{			return this.backbutton;		}	}}