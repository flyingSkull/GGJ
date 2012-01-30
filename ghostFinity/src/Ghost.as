package {
	import util.PlayStateService;

	import org.flixel.FlxObject;
	/**
	 * @author stephan
	 */
	public class Ghost extends Player {
		private var tempX:Number = 0;
		private var tempVel:Number = 1;
		public function Ghost(X : Number = 0, Y : Number = 0, SimpleGraphic : Class = null) {
			super(X, Y, SimpleGraphic);
		}
		
		override protected function loadSpriteMap():void{
			loadGraphic(PlayStateService.GhostPlayer, true, false, 20, 20);
		}
		
		override protected function initAnimations():void{
			addAnimation(ANIMATION_IDLE, [0,1,2,3,4], 5, true);
			addAnimation(ANIMATION_IDLE_BACKWARDS, [5,6,7,8,9], 5, true);
			addAnimation(ANIMATION_RUN, [0,1,2,3,4], 15, true);
			addAnimation(ANIMATION_RUN_BACKWARDS, [5,6,7,8,9], 15, true);
			addAnimation(ANIMATION_JUMP, [0,1,2,3,4], 3, false);
			addAnimation(ANIMATION_JUMP_BACKWARDS, [5,6,7,8,9], 3, false);
		}
		
		override public function update():void{
			tempVel = x - tempX;
			if(tempVel < 0){
				animationDirection = -1;
				if(isTouching(FlxObject.FLOOR)){
					animationType = ANIMATION_RUN_BACKWARDS;
				}else{
					animationType = ANIMATION_JUMP_BACKWARDS;
				}
			}else if(tempVel >= 0){
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
			tempX = x;
			play(animationType);
		}
	}
}
