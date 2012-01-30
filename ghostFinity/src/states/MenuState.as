package states {
	import util.PlayStateService;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	public class MenuState extends FlxState
	{
		public function MenuState()
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
			super.update();
			if (FlxG.keys.SPACE) {
				FlxG.switchState(new ElevatorState());
			}
		}
		
				
		private function createBackGround():void
		{
			var bg:FlxSprite = new FlxSprite(0,0, PlayStateService.ImgStartScreen);
			bg.active = false;
			add(bg);
		}
	}
}