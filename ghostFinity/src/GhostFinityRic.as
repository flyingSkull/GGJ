package 
{
	import org.flixel.FlxGame;
	
	import states.PlayStateRic;

	[SWF(width="800", height="600", backgroundColor="#ff9900")]
	

	public class GhostFinityRic extends FlxGame
	{
		public function GhostFinityRic()
		{
			super(800, 300, PlayStateRic, 1, 60, 20);
		}
	}
}