package states {
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	import util.PlayStateService;

	public class WeekendState extends FlxState
	{
		[Embed(source="../assets/sounds/we.mp3")] protected var WESnd:Class;
		
		private var bob:FlxSprite;
		private var elevator:FlxSprite;
		private var animationCount:uint = 0;
		private static const ANIMATION_IDLE:String = "idle";

		public function WeekendState()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.play(WESnd, 1.0, true);
			super.create();
			createBackGround();
			createBob();
			createElevatorSim();
		}
		
		override public function update():void
		{
			super.update();
			animationCount++;
			
			bob.play(ANIMATION_IDLE);
			
			if (FlxG.keys.SPACE || animationCount >= 400) {
				FlxG.switchState(new PlayState(true));
			}
			
			if(elevator.y >= 90){
				elevator.y = -10;
			}else{
				elevator.y += 1;
			}
		}
		
		private function createBackGround():void
		{
			var bg:FlxSprite = new FlxSprite(0,0, PlayStateService.ImgElevatorBg);
			bg.active = false;
			add(bg);
			trace("WWWWW")
		}
		
		private function createBob():void
		{
			bob = new FlxSprite(9*8-6,8*8-4);
			bob.loadGraphic(PlayStateService.ImgWeekendSpriteMap, true, false, 17, 17);
			bob.addAnimation(ANIMATION_IDLE,[0,1,2,3,4,5,6,7,8,9],5,true);
			bob.play(ANIMATION_IDLE);
			
			add(bob);
		}
		
		private function createElevatorSim():void{
			elevator = new FlxSprite(0,-10);
			elevator.makeGraphic(300, 10, 0xFF000000);
			add(elevator);
		}
	}
}