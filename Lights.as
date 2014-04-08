package
    {
/* Import required classes */
 
    import flash.display.MovieClip;
    import flash.filters.BitmapFilter;
    import flash.filters.BlurFilter;
    import flash.events.Event;
	
	public class Lights extends MovieClip {
			private var lightsNumber:int; //The number of Lights on Stage
			private var xSpeed:int; //The horizontal speed the Lights have
			private var ySpeed:int; //Vertical Speed
			private var lightsDir:String; //Direction the Lights are going, this can be Up, Down, Left or Right
			private var areaW:int; //The width of the area where the effect will take place
			private var areaH:int; //Height
			private var lights:Array = new Array(); //This array will store all the Lights MovieClips so we can use them outside the For where we are going to create them.
		
			/* Main function */
 
			public function init(areaWidth:int, areaHeight:int, numberOfLights:int, lightSize:int, lightColor:uint, minimumScale:Number, hSpeed:int, vSpeed:int, dir:String, quality:int):void
			{
		 
				areaW = areaWidth;
				areaH = areaHeight;
				lightsNumber = numberOfLights;
				lightsDir = dir;
				
				for (var i:int = 0; i < numberOfLights; i++) {
						/* Create the specified number of lights */
					 
					   var light:MovieClip = new MovieClip();
					 
					   /* Set random speed to x and y based on the params */
					 
					   xSpeed = Math.floor((Math.random() * (hSpeed - -hSpeed + 1)) + -hSpeed);
						ySpeed = Math.round((Math.random() * vSpeed) + 0.5);
					 
					   light.xSpeed = xSpeed;
						light.ySpeed = ySpeed;
					 
					 
						/* Create lights */
					 
						light.graphics.beginFill(lightColor);
						light.graphics.drawCircle(0, 0, lightSize / 2);
						light.graphics.endFill();
										
				
						
				light.x = Math.floor(Math.random() * areaWidth);
				light.y = Math.floor(Math.random() * areaHeight);
						
				var b:int = Math.floor(Math.random() * 10) + 200; //Calculates a random Blur between 0-9 and adds 5 to the result.
 
				var blur:BitmapFilter = new BlurFilter(b,b,quality); //The BlurFilter object.
			 
				var filterArray:Array = new Array(blur); //To apply the filter we need an array of filters.
			 
				light.filters = filterArray; //Sets the filters array to the Light
						
				light.scaleX = Math.round(((Math.random() * (1-minimumScale)) + minimumScale) * 100) / 100;
				light.scaleY = light.scaleX;
						
				addChild(light);
				 
				/* Store lights in an array to use it later */
				 
				lights.push(light);
				 
				/* Check for lights direction */
				
				checkDirection();
			}
				
			}
				
		private function checkDirection():void
		{
			for (var i:int = 0; i < lights.length; i++){
				switch ( lightsDir )
			{
			
			case "up" :
			 
			   lights[i].addEventListener(Event.ENTER_FRAME, moveUp);
			 
			   break;
				case "down" :
			 
			   lights[i].addEventListener(Event.ENTER_FRAME, moveDown);
			 
			   break;
				case "right" :
			 
			   lights[i].addEventListener(Event.ENTER_FRAME, moveRight);
			 
			   break;
				case "left" :
			 
			   lights[i].addEventListener(Event.ENTER_FRAME, moveLeft);
			 
			   break;
				default :
				trace("Invalid Direction!");
				}
				}
			}
			
			private function moveUp(e:Event):void
		  {
		  e.target.x += e.target.xSpeed;
		  e.target.y-=e.target.ySpeed;
		   /* Reset light position, Y first, then X  */
		 
		   if (e.target.y + (e.target.height / 2) < 0)
			{
			e.target.y = areaH + (e.target.height / 2);
			e.target.x=Math.floor(Math.random()*areaW);
			}
		   if ((e.target.x + e.target.width / 2) < 0 || (e.target.x - e.target.width / 2) > areaW)
			{
			e.target.y = areaH + (e.target.height / 2);
			e.target.x=Math.floor(Math.random()*areaW);
			}
			}
		   /* Move Down function */
		 
		   private function moveDown(e:Event):void
			{
			e.target.x+=e.target.xSpeed;
			e.target.y+=e.target.ySpeed;
		   /* Reset light position, Y first, then X */
		 
		   if (e.target.y - (e.target.height / 2) > areaH)
			{
			e.target.y = 0 - (e.target.height / 2);
			e.target.x=Math.floor(Math.random()*areaW);
			}
		   if ((e.target.x + e.target.width / 2) < 0 || (e.target.x - e.target.width / 2) > areaW)
			{
			e.target.y = areaH + (e.target.height / 2);
			e.target.x=Math.floor(Math.random()*areaW);
			}
			}
		 
		  /* Move Right function */
		   private function moveRight(e:Event):void
			{
			e.target.x+=e.target.ySpeed;
			e.target.y+=e.target.xSpeed;
		 
		   /* Reset light position, Y first, then X */
		   if (e.target.y - (e.target.height / 2) > areaH || e.target.y + (e.target.height / 2) < 0)
			{
			e.target.x = 0 - (e.target.height / 2);
			e.target.y = Math.floor(Math.random()*areaH);
			}
		 
		   if ((e.target.x - e.target.width / 2) > areaW)
			{
			e.target.x = 0 - (e.target.height / 2);
			e.target.y = Math.floor(Math.random()*areaW);
			}
			}
		   /* Move Left function */
		 
		   private function moveLeft(e:Event):void
			{
			e.target.x-=e.target.ySpeed;
			e.target.y-=e.target.xSpeed;
		   /* Reset light position, Y first, then X */
		 
		   if (e.target.y - (e.target.height / 2) > areaH || e.target.y + (e.target.height / 2) < 0)
			{
			e.target.x = areaW + (e.target.width / 2);
			e.target.y=Math.floor(Math.random()*areaH);
			}
		 
		   if ((e.target.x + e.target.width / 2) < 0)
			{
			e.target.x = areaW + (e.target.width / 2);
			e.target.y=Math.floor(Math.random()*areaW);
			}
			}
			}
			}
		
		


