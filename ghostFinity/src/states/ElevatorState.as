package states {
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	import util.PlayStateService;

	public class ElevatorState extends FlxState
	{
		[Embed(source='../assets/fonts/bavaria.ttf', embedAsCFF="false", fontName="bavaria", mimeType="application/x-font-truetype")]
		private static var bavaria:Class;
		
		[Embed(source="../assets/sounds/elevator.mp3")] protected var ElevSnd:Class;
		
		private var bob:FlxSprite;
		private var elevator:FlxSprite;
		private var _endTime:uint = 800;
		private var animationCount:uint = 0;
		private static const ANIMATION_IDLE:String = "idle";
		private static const ANIMATION_CLOCK:String = "clock";
		private static const ANIMATION_BAG:String = "bag";
		
		private var infoText:FlxText;
		private var playStateServiceInst:PlayStateService;
		
		public function ElevatorState(endTime:uint = 800)
		{
			playStateServiceInst = PlayStateService.getInstance(); 
			
			_endTime = endTime;
			super();
		}
		
		override public function create():void
		{
			FlxG.play(ElevSnd, 1.0);
			super.create();
			createBackGround();
			createBob();
			createElevatorSim();
			createInfoText();
		}
		
		override public function update():void
		{
			super.update();
			animationCount++;
			
			if(animationCount%600 == 0){
				trace("clock", animationCount);
				bob.play(ANIMATION_CLOCK);
			}else if(animationCount%300 == 0){
				trace("bag", animationCount);
				bob.play(ANIMATION_BAG);
			}else if(animationCount%150 == 0){
				bob.play(ANIMATION_IDLE);
			}
			
			if (FlxG.keys.SPACE || animationCount >= _endTime) {
				FlxG.switchState(new PlayState());
			}
			
			if(elevator.y >= 90){
				elevator.y = -10;
			}else{
				elevator.y += 1;
			}
		}
		
		private function createInfoText():void
		{
			var textFormat:TextFormat = new TextFormat();
			textFormat.font = "bavaria";
			textFormat.align = TextFormatAlign.CENTER;
			textFormat.color = 0xffffff;
			textFormat.size = 5;
			
			infoText = new FlxText(0, 0, 100, playStateServiceInst.currentWeekDay ? playStateServiceInst.currentWeekDay : " ");
			infoText.setFormat("bavaria", 8, 0xffffff);
			infoText.antialiasing = false;
			add(infoText);
		}
		
		private function createBackGround():void
		{
			var bg:FlxSprite = new FlxSprite(0,0, PlayStateService.ImgElevatorBg);
			bg.active = false;
			add(bg);
		}
		
		private function createBob():void
		{
			bob = new FlxSprite(9*8-6,8*8-4);
			bob.loadGraphic(PlayStateService.ImgElevatorSpriteMap, true, false, 17, 17);
			bob.addAnimation(ANIMATION_IDLE,[0,1,0,0,0,1,2,0,0],3,true);
			bob.addAnimation(ANIMATION_CLOCK,[3,4,5,6,7,7,7,7,7,8,9],5,false);
			bob.addAnimation(ANIMATION_BAG,[10,11,12,13,14,15,16,0],5,false);
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