﻿package  {		import flash.display.MovieClip;	import flash.display.Shape;	import fl.controls.*;	import flash.text.*;	import flash.events.*;	import pq.multitouch.*;	import pq.multitouch.manipulators.MultiDragScaleRotate;		public class specialsPage extends MovieClip {				var img_head;		var page_title;		var fooditem;		var backbutton;				public function specialsPage() {			this.width = 428;//480;			this.height = 252;//270;						img_head = new specials();			img_head.y = -160;//-120;						img_head.width = 70;			img_head.height = 70;			this.addChild(img_head);						page_title = new specials_label();			page_title.y = img_head.y + 40;			this.addChild(page_title);						//stage width, stage height, width of rectangle, height of rectangle, ellipse width, ellipse height			var roundRect:Shape = new Shape();			roundRect.graphics.beginFill(0xFFFFFF, 0.5);			roundRect.graphics.drawRoundRect(0, 0, 600, 280, 15, 15);			roundRect.x = -300;			roundRect.y = -100;			this.addChild(roundRect);						backbutton = new back();			backbutton.x = -270;			backbutton.y = -170;			this.addChild(backbutton);					}		function getBackButton():Object{			return this.backbutton;		}			}	}