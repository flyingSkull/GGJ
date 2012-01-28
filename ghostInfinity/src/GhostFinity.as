package {
	import org.flixel.FlxGame;
	
	import states.PlayState;

 	//Allows you to refer to flixel objects in your code
	[SWF(width="640", height="480", backgroundColor="#CCCCCC")] //Set the size and color of the Flash file

	public class GhostFinity extends FlxGame
	{
		public function GhostFinity()
		{
			super(640, 480, PlayState, 4, 60, 30, true); //Create a new FlxGame object and load "PlayState"
			forceDebugger = true;
		}
	}
}