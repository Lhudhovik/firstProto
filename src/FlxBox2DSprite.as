package
{
	import Box2D.Dynamics.b2Body;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Ludo
	 */
	public class FlxBox2DSprite extends FlxSprite
	{
		protected var _body:b2Body;
		protected var _name:String;
		protected var _parent : * ;
		
		
		public function FlxBox2DSprite(Name:String, X:Number = 0, Y:Number = 0, Parent : * = null, Image:Class = null)
		{
			_name = Name;
			_parent = Parent;
			super(X, Y, Image);
			init();
		
		}
		
		protected function init():void
		{
		
		}
		
		public function get name():String {
			return _name;
		}
		public function get body():b2Body {
			return _body;
		}
		public function set body(newBody : b2Body):void {
			_body = newBody;
		}
		public function get parent():*{
			return _parent;
		}
		
		
		

		override public function update():void
		{
			if (_body != null)
			{
				this.x = (_body.GetPosition().x * WorldElements._RATIO) - this.width / 2;
				this.y = (_body.GetPosition().y * WorldElements._RATIO) - this.height / 2;
				this.angle = _body.GetAngle() * (180 / Math.PI);
			}
			
			super.update();
		}
	}

}