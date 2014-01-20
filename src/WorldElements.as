package  
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2World;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import org.flixel.FlxPoint;
	
	/**
	 * ...
	 * @author Ludo
	 */
	public class WorldElements 
	{
		
		private static var _world : b2World;
		private static var _pulleyMechanisms : PulleyMechanismGroup;
		private static var _pool: Object;
		
		
		public static const _GRAVITY : b2Vec2 = new b2Vec2(0, 9.8);
		public static const _RATIO : int = 30;
		public static const _PULLEYTYPE : String = "Pulley";
		public static const _ROPETYPE: String = "Rope";
		public static const _LOWERPART : String = "Lower";
		public static const _UPPERPART : String = "Upper";
		public static const _LITTLESIZE : String = "Little";
		public static const _MEDIUMSIZE : String = "Medium";
		public static const _BIGSIZE : String = "Big";
		
		public static function initialize():void {
			
			_world = new b2World(_GRAVITY, true);
			_pulleyMechanisms = new PulleyMechanismGroup(20);
			_pool = new Object();
		}
		public static function createBox2DBody ( sprite : FlxSprite, type : uint, density : Number = 0, friction :Number = 0, restitution : Number = 0) : b2Body {
			
			var shape : b2PolygonShape = new b2PolygonShape();
			shape.SetAsBox((sprite.width ) / (2 * WorldElements._RATIO), (sprite.height) / (2 * WorldElements._RATIO));
			
			var fixDef : b2FixtureDef = new b2FixtureDef();
			fixDef.density = density;
			fixDef.restitution = restitution
			fixDef.friction = friction;
			fixDef.shape = shape;
			
			
			var bodyDef : b2BodyDef = new b2BodyDef();
			bodyDef.position.Set((sprite.x + (sprite.width / 2)) / WorldElements._RATIO , (sprite.y + (sprite.height / 2)) / WorldElements._RATIO);
			bodyDef.type = type;
			
			
			var body : b2Body = WorldElements._world.CreateBody(bodyDef);
			
			body.CreateFixture(fixDef);
			body.SetUserData (sprite);
			return body;
		}
	
		public static function addToPool(object : * , name : String):void {
			if (!_pool[name]) {
				_pool[name] = object;
			}
			
		}
		public static function removeFromPool(name : String) : void {
			if (_pool[name]) {
				_pool[name] = null;
			}
		}
		public static function getFromPool(name:String) : * {
			return _pool[name];
		}
		public static function getPool():Object {
			return _pool;
		}
		public static function get world():b2World {
			return _world;
		}
		public static function get pulleyMechanisms():PulleyMechanismGroup {
			return _pulleyMechanisms;
		}
	
		
	}

}