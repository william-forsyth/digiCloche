﻿package  {		import flash.display.MovieClip;	import flash.display.Shape;		public class sidesPage extends MovieClip {				var img_head;		var page_title;				public function sidesPage() {			this.width = 428;//480;			this.height = 252;//270;						img_head = new sides();			img_head.y = -160;//-120;						img_head.width = 70;			img_head.height = 70;						this.addChild(img_head);						page_title = new sides_label();			page_title.y = img_head.y + 40;			this.addChild(page_title);			//stage width, stage height, width of rectangle, height of rectangle, ellipse width, ellipse height			var roundRect:Shape = new Shape();			roundRect.graphics.beginFill(0xFFFFFF, 0.5);			roundRect.graphics.drawRoundRect(0, 0, 600, 280, 15, 15);			roundRect.x = -300;			roundRect.y = -100;			this.addChild(roundRect);		}	}	}