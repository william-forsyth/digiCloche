﻿package  {		import flash.display.MovieClip;	import flash.events.MouseEvent;	import fl.controls.*;
	import pq.multitouch.*;
		//simport flash.ui*;		//import flash.text.*;	//import fl.controls.Button;    //import fl.controls.Label;    //needed to automatically size the labels    //import flash.text.TextFieldAutoSize;//    import flash.events.MouseEvent;//    import flash.events.Event;		public class menu extends MovieClip {		var menuscreen;		var myLabel;		var welcome;		var language;		var lang_select;				public function menu(xPos, yPos, rotate) {			// constructor code			trace('new menu created');						this.x = xPos;			this.y = yPos;						this.width = 480;			this.height = 300;
			
			//this.addEventListener(MouseEvent.CLICK, change);
			MultiTouch.enableMouseSimulation(this);						/**ELEMENTS:**/						menuscreen = new bg_brown();			this.addChild(menuscreen);						welcome = new welcome_msg();			this.addChild(welcome);			welcome.y = -50;						language = new language_msg();			this.addChild(language);						lang_select = new ComboBox();			lang_select.addItem({label:"English"});			lang_select.addItem({label:"Japanese"});			lang_select.x = -60;			lang_select.y = 30;					this.addChild(lang_select);			if (lang_select.selectedIndex == 1){				trace("1");			}						//this.addEventListener(MouseEvent.MOUSE_MOVE, printX);								  			//welcome.x = ;						//myLabel = new Label();			// add background color to internal text field.			//myLabel.textField.background = true;			//myLabel.textField.backgroundColor = 0xDDDDDD;			//addChild(myLabel);									if (rotate == true){				this.rotation = -180;								//Everything else should be  rotated			};		}				/*function printX(e:MouseEvent):void{			//var points = evt.target;			trace("x:"+ mouseX);			trace("y" + mouseY);		}*/	}	}