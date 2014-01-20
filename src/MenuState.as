package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	
	/**
	 * ...
	 * @author Ludo
	 */
	public class MenuState extends FlxState 
	{
		
		override public function create():void {
			FlxG.switchState(new LevelProto());
		}
		override public function update():void {
			super.update();
		}
	}

}