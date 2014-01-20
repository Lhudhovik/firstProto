package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	/**
	 * ...
	 * @author Ludo
	 */
	public class Main extends FlxGame
	{
		
		public function Main():void 
		{
			FlxG.debug = true;
			FlxG.visualDebug = true;
			super(1366, 768, MenuState,1);
		}
		
		
	}
	
}