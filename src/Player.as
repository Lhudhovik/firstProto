package  
{
	import Box2D.Common.Math.b2Vec2;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Ludo
	 */
	public class Player 
	{
		
		private var _controledDoll : Doll;
		private var _name : String;
		
		public function Player(name : String, doll : Doll ) 
		{
			
			_controledDoll = doll;
			WorldElements.addToPool(this, _name);
		}
		public function update():void {
			if (FlxG.keys.UP) {
				if (_controledDoll.size == WorldElements._LITTLESIZE) {
					if ( _controledDoll.jumpAllowed) {
						_controledDoll.applyForce(new b2Vec2(0, -2000));
						_controledDoll.jumpAllowed = false;
					}
				}
				
			}
			if (FlxG.keys.RIGHT) {
				_controledDoll.applyForce(new b2Vec2(20, 0));
			}	
			
			if (FlxG.keys.LEFT) {
				_controledDoll.applyForce(new b2Vec2(-20, 0));
			}
			
		}
		
		public function get name():String {
			return _name;
		}
	}

}