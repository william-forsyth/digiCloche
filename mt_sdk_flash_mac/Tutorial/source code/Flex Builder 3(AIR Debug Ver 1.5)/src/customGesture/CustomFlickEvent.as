package customGesture
{
	import flash.events.Event;
	
	import pq.multitouch.events.BaseGestureEvent;

	public class CustomFlickEvent extends BaseGestureEvent
	{		
		public static const FLICK:String = "FLICK";
		
		private var _direction:String
		
		public function get direction():String
        {
            return _direction;
        }

        public function CustomFlickEvent(diretion:String="up")
		{
			super(FLICK, false, false, NaN, NaN);
			
			_direction = diretion
		}		
		
		override public function clone():Event{
			var e:CustomFlickEvent = new CustomFlickEvent(this.direction);
			return this.copyTo(e);											
		}		
	}
}