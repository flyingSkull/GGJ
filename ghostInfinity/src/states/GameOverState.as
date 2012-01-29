package states {
	import util.PlayStateService;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;

	public class GameOverState extends FlxState {
		private var animationCount:uint = 0;
		public function GameOverState()
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			createBackGround();
		}

		override public function update():void
		{
			animationCount++;
			super.update();
			if (FlxG.keys.SPACE || animationCount >= 400) {
				FlxG.switchState(new CreditsState());
			}
		}
		
				
		private function createBackGround():void
		{
			var bg:FlxSprite = new FlxSprite(0,0, PlayStateService.ImgEndScreen);
			bg.active = false;
			add(bg);
		}
	}
}