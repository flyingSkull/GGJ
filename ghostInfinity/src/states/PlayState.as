package states 
{
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;

	/*.
	 * @author stephan
	 */
	 
	public class PlayState extends FlxState 
	{
		[Embed(source="../assets/map2.png")] private var ImgMap:Class;
		[Embed(source="../assets/tiles.png")] private var ImgTiles:Class;
		
		private var level:FlxTilemap;
		private var player:FlxSprite;
		
		override public function create():void
		{
			FlxG.bgColor = 0xffffffff;
			
			level = new FlxTilemap();
			level.loadMap(FlxTilemap.imageToCSV(ImgMap, false, 1), ImgTiles, 0, 0, FlxTilemap.ALT);
//			level.follow();
			add(level);
			
			createPlayer();
			
			var cam:FlxCamera = createCamera();
		}
		
		private function createPlayer():void
		{
			player = new FlxSprite(20,20)
			player.makeGraphic(4, 4, 0xFFFF0000);
			player.maxVelocity.x = 80;
			player.maxVelocity.y = 200;
			player.acceleration.y = 200;
			player.drag.x = player.maxVelocity.x*4;
			add(player);
		}
		
		private function createCamera():FlxCamera
		{
			var cam:FlxCamera = new FlxCamera(0, 0, FlxG.width/4, FlxG.height/4);
			cam.follow(player);
			cam.setBounds(0, 0, level.width, level.height, true);
			cam.color = 0xFFCCCC; 
			FlxG.addCamera(cam);
			return cam;
		}
		
		override public function update():void
		{
			FlxG.collide();
			
			player.acceleration.x = 0;
			
			if(FlxG.keys.LEFT)
				player.acceleration.x = -player.maxVelocity.x*4;
			if(FlxG.keys.RIGHT)
				player.acceleration.x = player.maxVelocity.x*4;
			if(FlxG.keys.justPressed("UP") && player.isTouching(FlxObject.FLOOR))
				player.velocity.y -= player.maxVelocity.y/1.5;
			
			super.update();
			
		}
	}
}
