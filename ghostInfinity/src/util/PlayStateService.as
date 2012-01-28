package util
{
	import flash.utils.Dictionary;
	
	import org.flixel.FlxSprite;

	public class PlayStateService
	{
		private static var instance:PlayStateService;
		

		public static function getInstance():PlayStateService
		{
			if(instance == null)
				instance = new PlayStateService();
			
			return instance;
		}

		// Ghost
		private var _ghostPlayerDict:Dictionary;

		public function get ghostPlayerDict():Dictionary
		{
			return _ghostPlayerDict;
		}

		public function set ghostPlayerDict(value:Dictionary):void
		{
			_ghostPlayerDict = value;
		}
		
		
		// Weekday
		private var _currentWeekDay:String = "MO";
		
		public function get currentWeekDay():String
		{
			return _currentWeekDay;
		}

		public function set currentWeekDay(value:String):void
		{
			_currentWeekDay = value;
		}
		
		//CurrentPlayer
		private var _currentPlayer:FlxSprite;

		public function get currentPlayer():FlxSprite
		{
			return _currentPlayer;
		}

		public function set currentPlayer(value:FlxSprite):void
		{
			_currentPlayer = value;
		}

		
	}
}