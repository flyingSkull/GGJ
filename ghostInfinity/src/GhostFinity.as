package {
	import states.MenuState;

	import org.flixel.FlxGame;
	
	//Allows you to refer to flixel objects in your code
	[SWF(width="600", height="320", backgroundColor="#CCCCCC")] //Set the size and color of the Flash file
	
	public class GhostFinity extends FlxGame
	{
		public function GhostFinity()
		{
			super(600, 320, MenuState, 4, 60, 30, true); //Create a new FlxGame object and load "PlayState"
			forceDebugger = true;
		}
	}
}