package states {
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	import util.ConstService;

	public class CreditsState extends FlxState {
		private var animationCount : uint = 0;

		public function CreditsState()
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
				FlxG.switchState(new MenuState());
			}
		}
		
				
		private function createBackGround():void
		{
			var bg:FlxSprite = new FlxSprite(0,0, ConstService.ImgCreditsScreen);
			bg.active = false;
			add(bg);
		}
	}
}