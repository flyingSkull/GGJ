package colliders {
	import states.PlayState;
	import org.flixel.FlxSprite;

	/**
	 * @author stephan
	 */
	public class Collider extends FlxSprite {
		public function Collider(X : Number = 0, Y : Number = 0, SimpleGraphic : Class = null, weight:int = 50, friction:Number = 30) {
			super(X*PlayState.TILE_WIDTH, Y*PlayState.TILE_WIDTH, SimpleGraphic);
			acceleration.y = weight;
			drag.x = friction;
//			mass = 5;
//			width = 8;
//			height = 8;
//			offset.x = 0;
//			offset.y = 0;
		}
	}
}
