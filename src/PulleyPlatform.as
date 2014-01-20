package  
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Ludo
	 */
	public class PulleyPlatform extends FlxBox2DSprite 
	{
		[Embed(source = "../bin/assets/platform.png")]
		private var _picture : Class;
		
		public function PulleyPlatform(Name:String, X:Number=0, Y:Number=0, Parent : * = null) 
		{
			super(Name, X, Y,Parent, _picture);
			
		}
		override protected function init():void {
			_body = WorldElements.createBox2DBody(this, b2Body.b2_dynamicBody, 1, 0, 0);
			this._body.SetFixedRotation(true);
			
		}
		
		override public function update():void {

			this._body.SetLinearVelocity(new b2Vec2(0, this._body.GetLinearVelocity().y));
			
			super.update();
		}
		
	}

}