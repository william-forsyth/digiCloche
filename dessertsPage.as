﻿package  {		import flash.display.MovieClip;	import flash.display.Shape;	import fl.controls.*;	import flash.text.*;	import flash.events.*;	import pq.multitouch.*;	import pq.multitouch.manipulators.MultiDragScaleRotate;		public class dessertsPage extends MovieClip {				var img_head;		var page_title;		var roundRect;		//stage width, stage height, width of rectangle, height of rectangle, ellipse width, ellipse height				//alignments		var align_right = 220;		var align_left = -220;		var diff = 120;		var align_top = -20;				///themfood		var dessertPizza;		var rwcheesecake;		var cbrulee;		var nycheesecake;		var brownie;		var mudcake;		var cinntart;				//themlabel		var dat_label;		var dis_label;		var cbrulee_lbl;		var nycheesecake_lbl;		var brownie_lbl;		var mudcake_lbl;		var cinntart_lbl;				//theminfo		var viewInfo1;		var viewInfo2;		var viewInfo3;		var viewInfo4;		var viewInfo5;		var viewInfo6;		var viewInfo7;				var viewInfoArray = [viewInfo1,viewInfo2,viewInfo3,viewInfo4,viewInfo5,viewInfo6,viewInfo7];		var txtArray = ["dessertpizza", "rwcheesecake", "cbrule","mudcake","cinntart","brownie","nyccheesecake"];						var fooditem;		var circles:Array;		var myFont:Font = new helvs_light();		var myTextFormat:TextFormat = new TextFormat();		var linkFormat:TextFormat = new TextFormat();		var startX:int;		var startY:int;		var backbutton;		public function dessertsPage() {						this.width = 428;//480;			this.height = 252;//270;						myTextFormat.font = myFont.fontName;			myTextFormat.size = 8;			myTextFormat.color = 0x620c0d;						linkFormat.font = myFont.fontName;			linkFormat.size = 10;			linkFormat.color = 0x620c0d;			linkFormat.underline = true;						img_head = new desserts();			img_head.y = -160;//-120;						img_head.width = 70;			img_head.height = 70;			this.addChild(img_head);						page_title = new desserts_label();			page_title.y = img_head.y + 40;			this.addChild(page_title);						roundRect = new Shape();			roundRect.graphics.beginFill(0xFFFFFF, 0.5);			roundRect.graphics.drawRoundRect(0, 0, 600, 280, 15, 15);			roundRect.x = -300;			roundRect.y = -100;			this.addChild(roundRect);						dessertPizza = new dessert1();			dessertPizza.x = align_left;			dessertPizza.y = align_top;						viewInfo1 =  new TextField();			viewInfo1.defaultTextFormat = linkFormat;			viewInfo1.embedFonts = true;			viewInfo1.width = 300;			//viewInfo1.buttonMode = true;			viewInfo1.x = dessertPizza.x - 20;//something with mods			viewInfo1.y = dessertPizza.y + 55;			viewInfo1.wordWrap = true;			viewInfo1.text = "View Info" ;			viewInfo1.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{showInfo(e, "dessertpizza.txt")});								this.addChild(viewInfo1);										//viewInfo1.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "dessertpizza.txt")});			//this.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent):void{ stopDragging(e, dessertPizza)}, true);			this.addChild(dessertPizza);									rwcheesecake = new dessert2();			rwcheesecake.x = align_left/2;			rwcheesecake.y = align_top;			this.addChild(rwcheesecake);			//rwcheesecake.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "rwcheesecake.txt")});									cbrulee = new dessert3();			cbrulee.x = 0;			cbrulee.y = align_top;			this.addChild(cbrulee);			//cbrulee.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "cbrule.txt")});									 			nycheesecake = new dessert4();			nycheesecake.x = align_right/2;			nycheesecake.y = align_top;			this.addChild(nycheesecake);			//nycheesecake.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "nyccheesecake.txt")});						brownie = new dessert5();			brownie.x = align_right;			brownie.y = align_top;			//brownie.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "brownie.txt")});			this.addChild(brownie);						mudcake = new dessert6();			mudcake.x = align_left;			mudcake.y = align_top+diff;			this.addChild(mudcake);			//mudcake.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "mudcake.txt")});						cinntart = new dessert7();			cinntart.x = align_left/2;			cinntart.y = align_top+diff;			this.addChild(cinntart);			//cinntart.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{ showInfo(e, "cinntart.txt")});						this.dat_label = new CheckBox();			dat_label.label = "Dessert Pizza";			dat_label.width = 300;			dat_label.x = align_left - 40;			dat_label.y = dessertPizza.y + 40;			dat_label.setStyle("embedFonts", true);			dat_label.setStyle("textFormat", myTextFormat);						this.addChild(dat_label);			dessertPizza.addEventListener(MouseEvent.MOUSE_DOWN, listentoit);			this.dis_label = new CheckBox();			dis_label.label = "Raspberry W/C Cheesecake";			dis_label.width = 300;			dis_label.x = align_left + 40;			dis_label.y = dessertPizza.y + 40;			dis_label.setStyle("embedFonts", true);			dis_label.setStyle("textFormat", myTextFormat);			this.addChild(dis_label);							/*labels*/						this.cbrulee_lbl = new CheckBox();			this.cbrulee_lbl.label = "Creme Brulee";			this.cbrulee_lbl.width = 300;			this.cbrulee_lbl.x = - 40;			this.cbrulee_lbl.y = cbrulee.y + 40;			this.cbrulee_lbl.setStyle("embedFonts", true);			this.cbrulee_lbl.setStyle("textFormat", myTextFormat);			this.addChild(this.cbrulee_lbl);						this.nycheesecake_lbl = new CheckBox();			this.nycheesecake_lbl.label = "NY Cheesecake";			this.nycheesecake_lbl.width = 300;			this.nycheesecake_lbl.x = align_right/2 - 40;			this.nycheesecake_lbl.y = nycheesecake.y + 40;			this.nycheesecake_lbl.setStyle("embedFonts", true);			this.nycheesecake_lbl.setStyle("textFormat", myTextFormat);			this.addChild(this.nycheesecake_lbl);						this.brownie_lbl = new CheckBox();			this.brownie_lbl.label = "American Brownie";			this.brownie_lbl.width = 300;			this.brownie_lbl.x = align_right - 40;			this.brownie_lbl.y = brownie.y + 40;			this.brownie_lbl.setStyle("embedFonts", true);			this.brownie_lbl.setStyle("textFormat", myTextFormat);			this.addChild(this.brownie_lbl);						this.mudcake_lbl = new CheckBox();			this.mudcake_lbl.label = "Dessert Pizza";			this.mudcake_lbl.width = 300;			this.mudcake_lbl.x = align_left - 40;			this.mudcake_lbl.y = mudcake.y + 40;			this.mudcake_lbl.setStyle("embedFonts", true);			this.mudcake_lbl.setStyle("textFormat", myTextFormat);			this.addChild(this.mudcake_lbl);						this.cinntart_lbl = new CheckBox();			this.cinntart_lbl.label = "Dessert Pizza";			this.cinntart_lbl.width = 300;			this.cinntart_lbl.x = align_left/2 - 40;			this.cinntart_lbl.y = cinntart.y + 40;			this.cinntart_lbl.setStyle("embedFonts", true);			this.cinntart_lbl.setStyle("textFormat", myTextFormat);			this.addChild(this.cinntart_lbl);			/*LABEL CREATION END*/									circles = [dessertPizza, rwcheesecake, cbrulee,mudcake,cinntart,brownie,nycheesecake];						for each(var i in circles){				//i.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);				i.addEventListener(MouseEvent.MOUSE_UP, stopDragging);				i.startX = i.x;				i.startY = i.y;				MultiTouch.enableGesture(i,new MultiDragScaleRotate());//true,true,true,false,bound:Rectangle=null,120,180));				//trace(i+ "" +circles.indexOf(i) );				//trace("stringify" + i.toString() );									/*viewInfoArray[circles.indexOf(i)] =  new TextField();					viewInfoArray[circles.indexOf(i)].defaultTextFormat = linkFormat;					viewInfoArray[circles.indexOf(i)].embedFonts = true;					viewInfoArray[circles.indexOf(i)].width = 300;					//viewInfo1.buttonMode = true;					viewInfoArray[circles.indexOf(i)].x = i.x - 20;//something with mods					viewInfoArray[circles.indexOf(i)].y = i.y + 55;					viewInfoArray[circles.indexOf(i)].wordWrap = true;					viewInfoArray[circles.indexOf(i)].text = "View Info" + circles.indexOf(i) ;					viewInfoArray[circles.indexOf(i)].addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void{showInfo(e, viewInfoArray[circles.indexOf(i)])});					trace(circles.indexOf(i));					this.addChild(viewInfoArray[circles.indexOf(i)]);*/			}						//for each(var k in viewInfoArray){							//			viewInfo1.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent):void{ hoverInfo(e, viewInfo1)});		//			viewInfo1.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent):void{ hoverOutInfo(e, viewInfo1)});						//}						backbutton = new back();			backbutton.x = -270;			backbutton.y = -170;			this.addChild(backbutton);					}		function startDragging(event:MouseEvent):void{//, obj:Object) {			//obj.startDrag();			  // no longer need to keep track of startX & startY here because that's already been done up above  			  event.target.startDrag(true);  			  event.target.parent.addChild(event.target);		}				 		function stopDragging(event:MouseEvent):void{//, obj:Object) {			//obj.stopDrag();						event.target.stopDrag();			// check to see if the event target is touching target_mc using hitTestObject			if(event.target.hitTestObject(img_head)){				event.target.buttonMode = false;				event.target.x = -400;				event.target.y = -400;				// move all circles OTHER than the current target back to their original positions				for each(var circleMC:MovieClip in circles){					if(event.target != circleMC)					{						circleMC.x = circleMC.startX;						circleMC.y = circleMC.startY;					}				}			}else{				// only need to move the event target back if it was dropped outside of target_mc				event.target.x = event.target.startX;				event.target.y = event.target.startY;				event.target.buttonMode = true;			}		}		function showInfo(e:MouseEvent, v:Object):void{			trace(v.text);			//fooditem = new foodItem(v + ".txt","desserts");			//fooditem.getClose().addEventListener(MouseEvent.MOUSE_DOWN, closeInfo);			//fooditem.addEventListener(MouseEvent.MOUSE_DOWN, closeInfo2);			//this.addChild(fooditem);		}		function getBackButton():Object{			return this.backbutton;		}		function closeInfo(e:MouseEvent):void{			this.removeChild(fooditem);		}		function closeInfo2(e:MouseEvent):void{			trace("if within the outside boundaries we will delete");		}		 		function listentoit(event:MouseEvent):void { 			this.dat_label.selected = true; 			trace(this.dat_label.label);		}	}}