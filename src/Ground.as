package  
{
	import org.flixel.FlxSprite;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Ludo
	 */
	public class Ground extends FlxBox2DSprite
	{
		[Embed(source="../bin/assets/ground.png")]
		private var _ground:Class;
		
		
		public function Ground(Name : String, X:Number=0, Y:Number=0, Parent : *  = null) 
		{
			super(Name,X, Y,Parent,_ground);
		}
		override protected function init():void {
			_body = WorldElements.createBox2DBody(this, b2Body.b2_staticBody, 1, 0, 0);
			WorldElements.world.SetContactListener(new Flxb2contactListener());
		}
		
		override public function update():void {
			
			super.update();
		}
		
	}

}