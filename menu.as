﻿/* 19/05/2014 by Aphrodite */package  {		import flash.display.MovieClip;	import flash.events.MouseEvent;	import fl.controls.*;	//import fl.transitions.*; 	import fl.transitions.easing.*;	import pq.multitouch.*;	import pq.multitouch.manipulators.MultiDragScaleRotate;	import flash.text.engine.*;     import flash.display.Sprite; 	import flash.text.*;	import flash.events.*;	import flash.net.*;	import fl.motion.easing.Back;		public class menu extends MovieClip {				var menuscreen;		var homescreen;		var foodscreen;		var drinksscreen;				//backbutton		var backbutton;				//food pages		var myentreepage;		var mymainspage;		var mysidespage;		var mydessertspage;		var myspecialspage;		var mysouppage;				//drinks pages		var mycoldpage;		var myhotpage;		var myalcopage;				public function menu(xPos, yPos) {			// constructor code						this.x = xPos;			this.y = yPos;						this.width = 640;			this.height = 400;						menuscreen = new bg_brown();			menuscreen.getPage().addEventListener(MouseEvent.CLICK, homeScreen);			this.addChild(menuscreen);			//menuscreen.x = 70;			//menuscreen.y = 62;			//this.addChild(TouchViewer.getInstance());				//MultiTouch.enableMouseSimulation(this);					}		function homeScreen(e:MouseEvent){						if (this.contains(menuscreen)){				trace(this.numChildren);								this.removeChild(menuscreen);			}else if (this.contains(foodscreen)){				trace("foodscreen");				trace(this.numChildren);				this.removeChild(foodscreen);			}else if(this.contains(drinksscreen)){				trace(this.numChildren);				trace("drinksscreen");				this.removeChild(drinksscreen);			}			homescreen = new bg_red();							homescreen.getFoodButton().addEventListener(MouseEvent.CLICK, foodScreen);			homescreen.getDrinksButton().addEventListener(MouseEvent.CLICK, drinksScreen);			this.addChild(homescreen);				}				function foodScreen(e:MouseEvent){			//this.removeChild(homescreen);												if (this.contains(homescreen)){				this.removeChild(homescreen);				trace(this.numChildren);											}else if (this.contains(myentreepage)){				this.removeChildAt(1);				trace(this.numChildren);											}else if(this.contains(mymainspage)){				this.removeChildAt(1);				trace(this.numChildren);											}else if(this.contains(mysidespage)){				this.removeChildAt(1);				trace(this.numChildren);															}else if(this.contains(mysouppage)){				this.removeChildAt(1);				trace(this.numChildren);											}else if(this.contains(myspecialspage)){				this.removeChildAt(1);				trace(this.numChildren);											}else if(this.contains(mydessertspage)){				this.removeChildAt(1);				trace(this.numChildren);							}			this.foodscreen = new bg_food();						foodscreen.getEntreeButton().addEventListener(MouseEvent.MOUSE_DOWN, showEntreesPage);			foodscreen.getSpecialsButton().addEventListener(MouseEvent.MOUSE_DOWN, showSpecialsPage);			foodscreen.getMainsButton().addEventListener(MouseEvent.MOUSE_DOWN, showMainsPage);						foodscreen.getSidesButton().addEventListener(MouseEvent.MOUSE_DOWN, showSidesPage);			foodscreen.getSoupButton().addEventListener(MouseEvent.MOUSE_DOWN, showSoupPage);			foodscreen.getDessertsButton().addEventListener(MouseEvent.MOUSE_DOWN, showDessertsPage);			foodscreen.getBackButton().addEventListener(MouseEvent.MOUSE_DOWN, homeScreen);			this.addChild(this.foodscreen);		}		function drinksScreen(e:MouseEvent){			//this.removeChild(homescreen);			if (this.contains(homescreen)){				trace("homescreen");				this.removeChild(homescreen);			}else if (this.contains(myhotpage)){				trace("hot page");				this.removeChild(myhotpage);			}else if(this.contains(mycoldpage)){				trace("cold page");				this.removeChild(mycoldpage);			}else if(this.contains(myalcopage)){				trace("alcohol page");				this.removeChild(myalcopage);			}			this.drinksscreen = new bg_drinks();			drinksscreen.getHotDrinksButton().addEventListener(MouseEvent.MOUSE_DOWN, showHotDrinksPage);			drinksscreen.getColdDrinksButton().addEventListener(MouseEvent.MOUSE_DOWN, showColdDrinksPage);			drinksscreen.getAlcoholButton().addEventListener(MouseEvent.MOUSE_DOWN, showAlcoholPage);			drinksscreen.getBackButton().addEventListener(MouseEvent.MOUSE_DOWN, homeScreen);			this.addChild(this.drinksscreen);		}				/*THESE ARE THE FOOD PAGES*/				function showEntreesPage(e:MouseEvent):void{			this.removeChild(foodscreen);						myentreepage = new entreesPage();			this.addChild(myentreepage);			myentreepage.getBackButton().addEventListener(MouseEvent.MOUSE_DOWN, foodScreen);					}		function showMainsPage(e:MouseEvent):void{			this.removeChild(foodscreen);						mymainspage = new mainsPage();			this.addChild(mymainspage);			mymainspage.getBackButton().addEventListener(MouseEvent.MOUSE_DOWN, foodScreen);		}		function showSpecialsPage(e:MouseEvent):void{			this.removeChild(foodscreen);						myspecialspage = new specialsPage();			this.addChild(myspecialspage);			myspecialspage.getBackButton().addEventListener(MouseEvent.MOUSE_DOWN, foodScreen);		}				function showSoupPage(e:MouseEvent):void{			this.removeChild(foodscreen);						mysouppage = new soupPage();			this.addChild(mysouppage);			mysouppage.getBackButton().addEventListener(MouseEvent.MOUSE_DOWN, foodScreen);		}				function showDessertsPage(e:MouseEvent):void{			this.removeChild(foodscreen);						mydessertspage = new dessertsPage();			this.addChild(mydessertspage);			mydessertspage.getBackButton().addEventListener(MouseEvent.MOUSE_DOWN, foodScreen);		}				function showSidesPage(e:MouseEvent):void{			this.removeChild(foodscreen);						mysidespage = new sidesPage();			this.addChild(mysidespage);			mysidespage.getBackButton().addEventListener(MouseEvent.MOUSE_DOWN, foodScreen);		}						/*These are the drinks pages*/				function showHotDrinksPage(e:MouseEvent):void{			this.removeChild(drinksscreen);						myhotpage = new hotDrinksPage();			this.addChild(myhotpage);			myhotpage.getBackButton().addEventListener(MouseEvent.CLICK, drinksScreen);		}		function showColdDrinksPage(e:MouseEvent):void{			this.removeChild(drinksscreen);						mycoldpage = new coldDrinksPage();			this.addChild(mycoldpage);			mycoldpage.getBackButton().addEventListener(MouseEvent.CLICK, drinksScreen);		}		function showAlcoholPage(e:MouseEvent):void{			this.removeChild(drinksscreen);						myalcopage = new alcoholPage();			this.addChild(myalcopage);			myalcopage.getBackButton().addEventListener(MouseEvent.CLICK, drinksScreen);		}			/*	function goBack(event:MouseEvent, screen:Object):void{			backbutton = new back();			this.addChild(backbutton);		}*/	}}