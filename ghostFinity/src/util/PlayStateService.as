package util {
	import org.flixel.FlxSprite;

	import flash.geom.Point;

	/*.
	* @author stephan&ric
	*/
	
	public class PlayStateService
	{
		// ASSETS: images
		[Embed(source="../assets/map2.png")] public static var ImgMap:Class;
		[Embed(source="../assets/testMap.png")] public static var ImgTiles:Class;
		[Embed(source="../assets/pcSprite.png")] public static var ImgColliderComputer:Class;
		[Embed(source="../assets/pflanzeGross.png")] public static var ImgColliderFlowersBig:Class;
		[Embed(source="../assets/pflanzeKlein.png")] public static var ImgColliderFlowersSmall:Class;
		[Embed(source="../assets/stuhlLinks.png")] public static var ImgColliderChairLeft:Class;
		[Embed(source="../assets/stuhlRechts.png")] public static var ImgColliderChairRight:Class;
		[Embed(source="../assets/tasse.png")] public static var ImgColliderCup:Class;
		[Embed(source="../assets/levelBG.png")] public static var ImgBG:Class;
		[Embed(source="../assets/levelConfi.png")] public static var ImgFG:Class;
		[Embed(source="../assets/playerSprite.png")] public static var ImgPlayer:Class;
		[Embed(source="../assets/ghostSprite.png")] public static var GhostPlayer:Class;
		[Embed(source="../assets/startScreen.png")] public static var ImgStartScreen:Class;
		[Embed(source="../assets/elevatorBG.png")] public static var ImgElevatorBg:Class;
		[Embed(source="../assets/elevatorIdleSpritemap.png")] public static var ImgElevatorSpriteMap:Class;
		[Embed(source="../assets/weekendSpritemap.png")] public static var ImgWeekendSpriteMap:Class;
		[Embed(source="../assets/endScreen.png")] public static var ImgEndScreen:Class;
		[Embed(source="../assets/credits.png")] public static var ImgCreditsScreen:Class;
		
		// ASSET WHEIGHTS
		public static const WEIGHT_MONITOR:uint = 200;
		public static const WEIGHT_COMPUTER:uint = 400;
		
		public static const ASSET_ID_COMPUTER:uint = 50;
		public static const ASSET_ID_FLOWERS_BIG:uint = 51;
		public static const ASSET_ID_FLOWERS_SMALL:uint = 52;
		public static const ASSET_ID_CHAIR_LEFT:uint = 53;
		public static const ASSET_ID_CHAIR_RIGHT:uint = 54;
		public static const ASSET_ID_CUP:uint = 55;
		
		public static const WEEK_DAYS:Array = ["MON", "TUE", "WED", "THU", "FRI", "SAT"];
		
		private static var instance:PlayStateService;
		

		public static function getInstance():PlayStateService
		{
			if(instance == null)
				instance = new PlayStateService();
			
			return instance;
		}

		public static var LELVEL_MAP_0:Array = [	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 6, 0, 0, 0, 0, 0, 0, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,11, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,12, 0, 0, 0, 0, 1,
			1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 4, 0, 0, 0, 3, 4, 0, 0, 0, 0, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3,14,14,14,14,14,14,14,14,14, 4, 0, 0, 0, 3, 4, 0, 0, 3, 4, 0, 0, 0, 0,10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,13, 0, 0, 0, 0, 1,
			2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ];
		
		
		
		public static function getColliderPositionArray(colliderType:uint, tileMapArray:Array = null):Array 
		{
			var returnValue:Array = [];
			var tileArray:Array = tileMapArray == null ? PlayStateService.LELVEL_MAP_0 : tileMapArray;
			var colliderID:uint = 0;
			var i:uint = 0;
			
			while(tileArray.indexOf(colliderType, i) != -1)
			{
				colliderID = tileArray.indexOf(colliderType, i);
				returnValue.push(new Point(colliderID%100,uint(colliderID/100)));
				tileArray[colliderID] = 0;
				i = colliderID+1;
			}
			return returnValue;
		}
		
		// 
		private var _ghostPlayerDict:Array = [];

		public function get ghostPlayerDict():Array
		{
			return _ghostPlayerDict;
		}

		public function set ghostPlayerDict(value:Array):void
		{
			_ghostPlayerDict = value;
		}

		
		// Ghost-Points
		private var _ghostPlayerArray:Array = [];

		public function get ghostPlayerArray():Array
		{
			return _ghostPlayerArray;
		}

		public function set ghostPlayerArray(value:Array):void
		{
			_ghostPlayerArray = value;
		}
		
		// Weekday
		private var _currentWeekDay:String = "MON";
		
		public function get currentWeekDay():String
		{
			return _currentWeekDay;
		}

		public function set currentWeekDay(value:String):void
		{
			_currentWeekDay = value;
		}
		
		// CurrentPlayer
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