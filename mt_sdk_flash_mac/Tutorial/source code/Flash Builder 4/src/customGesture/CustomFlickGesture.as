package customGesture
{
	import flash.geom.Point;
	
	import pq.multitouch.*;
	import pq.multitouch.events.*;
	import pq.multitouch.gestures.EventGesture;

	public class CustomFlickGesture extends EventGesture
	{		
		private static const FlickActionThresholdInFrame:Number = 60; 
		
		private var evt:CustomFlickEvent = null;

        private var downFrame:Number;
        private var downPosition:Point;
        
        private var upFrame:Number;
        private var upPosition:Point;
        
		public function CustomFlickGesture()
		{
			super(CustomFlickEvent.FLICK);			
			downFrame = INVALIDFRAME;
			upFrame = INVALIDFRAME;
		}
		
		override public function touchDownHandler(e:PQTouchEvent):void
		{
			switch (this.manager.touchIDs.length)
            {
            	case 1:
            		downFrame = e.frameID;
            		downPosition = new Point(e.x,e.y);
            		break;
            	case 2:
            		downFrame = INVALIDFRAME;
            		break;
            }
		}
		
		override public function touchUpHandler(e:PQTouchEvent):void
		{
			switch (this.manager.touchIDs.length)
            {                
                case 1:
                    upFrame = e.frameID;
                    upPosition = new Point(e.x,e.y); 
                    if( Point.distance(downPosition,upPosition)>TouchOptions.clickDistThreshold &&
                        upFrame - downFrame < FlickActionThresholdInFrame )
                        {                        	                        	
                        	this.obj.dispatchEvent(
                        		new CustomFlickEvent( cal8Direction(upPosition.y-downPosition.y,upPosition.x-downPosition.x) ) );
                        } 
                    break;
            }
		}
		
		public static function cal8Direction(y:Number,x:Number):String{
		  	var degree:Number = Math.atan2(y, x)*(180/Math.PI);
		  	var direction:String = "up";
		  	if( degree > -22.5 && degree <= 22.5 ){
		  		direction = "right"
		  	}else if( degree > 22.5 && degree <= 67.5 ){
		  		direction = "downright"
		  	}else if( degree > 67.5 && degree <= 112.5 ){
		  		direction = "down"
		  	}else if( degree > 112.5 && degree <= 157.5 ){
		  		direction = "downleft"
		  	}
		  	else if( degree > -67.5 && degree <= -22.5 ){
		  		direction = "upright"
		  	}else if( degree >-112.5 && degree <= -67.5 ){
		  		direction = "up"
		  	}else if( degree >-157.5 && degree <= -112.5 ){
		  		direction = "upleft"
		  	} 
//		  	else if( degree > 157.5 && degree <= 180 ||
//		  			  degree < -157.5 && degree >= -180 ||	 ){
			else{
		  		direction = "left"
		  	} 		  	
			return direction;
		  }
		
	}
}