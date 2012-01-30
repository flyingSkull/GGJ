package staff {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	
	import util.ConstService;

	/**
	 * @author stephan
	 */
	public class Player extends FlxSprite {
		
		protected var animationType:String;
		protected var animationDirection:int = 1;
		protected static const ANIMATION_IDLE:String = "idle";
		protected static const ANIMATION_IDLE_BACKWARDS:String = "idleBackwards";
		protected static const ANIMATION_RUN:String = "run";
		protected static const ANIMATION_RUN_BACKWARDS:String = "runBackwards";
		protected static const ANIMATION_JUMP:String = "jump";
		protected static const ANIMATION_JUMP_BACKWARDS:String = "jumpBackwards";
		
		public function Player(X : Number = 0, Y : Number = 0, SimpleGraphic : Class = null) {
			
			super(X, Y, SimpleGraphic);
			loadSpriteMap();
			initAnimations();
			initSpeed();
		}
		
		protected function loadSpriteMap():void{
			loadGraphic(ConstService.ImgPlayer, true, false, 17, 16);
		}
		
		protected function initAnimations():void{
			addAnimation(ANIMATION_IDLE, [0,1,2,3,4], 5, true);
			addAnimation(ANIMATION_IDLE_BACKWARDS, [29,30,31,32,33], 5, true);
			addAnimation(ANIMATION_RUN, [5,6,7,8,9,10,11,12,13,14,15,16], 15, true);
			addAnimation(ANIMATION_RUN_BACKWARDS, [17,18,19,20,21,22,23,24,25,26,27,28], 15, true);
			addAnimation(ANIMATION_JUMP, [6,7,8,8,8,8,8,8], 3, false);
			addAnimation(ANIMATION_JUMP_BACKWARDS, [17,18,19,19,19,19,19,19], 3, false);
		}
		
		protected function initSpeed():void{
			maxVelocity.x = 80;
			maxVelocity.y = 200;
			acceleration.y = 200;
			drag.x = maxVelocity.x*4;
		}
		
		override public function update():void{
			
			if(velocity.x < 0){
				animationDirection = -1;
				if(isTouching(FlxObject.FLOOR)){
					animationType = ANIMATION_RUN_BACKWARDS;
				}else{
					animationType = ANIMATION_JUMP_BACKWARDS;
				}
			}else if(velocity.x > 0){
				animationDirection = 1;
				if(isTouching(FlxObject.FLOOR)){
					animationType = ANIMATION_RUN;
				}else{
					animationType = ANIMATION_JUMP;
				}
			}else{
				if(animationDirection > 0){
					if(isTouching(FlxObject.FLOOR)){
						animationType = ANIMATION_IDLE;
					}else{
						animationType = ANIMATION_JUMP;
					}
				}else{
					if(isTouching(FlxObject.FLOOR)){
						animationType = ANIMATION_IDLE_BACKWARDS;
					}else{
						animationType = ANIMATION_JUMP_BACKWARDS;
					}
				}
			}
			play(animationType);
		}

	}
}
