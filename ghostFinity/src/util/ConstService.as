package util
{
	public class ConstService
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
		
		public function ConstService()
		{
		}
	}
}