﻿package  {		import flash.display.MovieClip;	import flash.events.*;			public class bg_food extends MovieClip {				var myentree;		var mysides;		var mymains;		var mysoup;		var myspecials;		var mydesserts;				var myentree_label;		var mysides_label;		var mymains_label;		var mysoup_label;		var myspecials_label;		var mydesserts_label;				var backbutton;				public function bg_food() {			// constructor code			this.width = 428;//480;			this.height = 252;//270;						createContents();		}				function createContents(){						myentree = new entree();			myentree.x = -200;			myentree.y = -90;						mysides = new sides();			mysides.x = 200;			mysides.y = -90;						mymains = new mains();			mymains.y = -120;						mysoup = new pasta_logo();			mysoup.x = -200;			mysoup.y = 90;						myspecials = new specials();			myspecials.y = 110;						mydesserts = new desserts();			mydesserts.x = 200;			mydesserts.y = 90;												//myentree.addEventListener(MouseEvent.MOUSE_DOWN, showEntreePage);						this.addChild(myentree);			this.addChild(mysides);			this.addChild(mymains);			this.addChild(mysoup);			this.addChild(myspecials);			this.addChild(mydesserts);									/*labels*/						mymains_label = new mains_label();			mymains_label.x = mymains.x;			mymains_label.y = mymains.y + 75;						mysides_label = new sides_label();			mysides_label.x = mysides.x;			mysides_label.y = mysides.y + 75;						myentree_label = new entrees_label();			myentree_label.x = myentree.x;			myentree_label.y = myentree.y + 75;						mysoup_label = new soup_label();			mysoup_label.x = mysoup.x;			mysoup_label.y = mysoup.y + 75;						myspecials_label = new specials_label();			myspecials_label.x = myspecials.x;			myspecials_label.y = myspecials.y + 75;						mydesserts_label = new desserts_label();			mydesserts_label.x = mydesserts.x;			mydesserts_label.y = mydesserts.y + 75;						this.addChild(myentree_label);			this.addChild(mysides_label);			this.addChild(mymains_label);			this.addChild(mysoup_label);			this.addChild(myspecials_label);			this.addChild(mydesserts_label);						backbutton = new back();			backbutton.x = -270;			backbutton.y = -170;			this.addChild(backbutton);		}				function getEntreeButton():Object{			return this.myentree;		}		function getMainsButton():Object{			return this.mymains;		}		function getSpecialsButton():Object{			return this.myspecials;		}		function getSoupButton():Object{			return this.mysoup;		}		function getSidesButton():Object{			return this.mysides;		}		function getDessertsButton():Object{			return this.mydesserts;		}		function getBackButton():Object{			return this.backbutton;		}	}	}