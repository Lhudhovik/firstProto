package  
{
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Dynamics.b2FixtureDef;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Ludo
	 */
	public class MechanismGroup extends FlxGroup 
	{
		protected var _elements : Object;
		public function MechanismGroup(MaxSize:uint=0) 
		{
			super(MaxSize);
			init();
			
		}
		protected function init():void {
			_elements = new Object();
		}
		public function get elements():Object {
			return _elements;
		}
		
		public function addElement ( sprite : FlxBox2DSprite , type : uint = 2, density : Number = 0, friction :Number = 0, restitution : Number = 0) :void {
			
			if ( sprite.body == null) {
				sprite.body = WorldElements.createBox2DBody(sprite, type, density, friction, restitution); 
			}
			
			_elements[sprite.name] = sprite;
			add(_elements[sprite.name]);
			
			
		}
		public function removeElement (name : String):void {
			remove(_elements[name]);
			_elements[name] = null;
		}
		
	}

}