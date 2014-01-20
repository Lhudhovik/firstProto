package
{
	import Box2D.Collision.Shapes.b2MassData;
	import Box2D.Dynamics.Joints.b2DistanceJoint;
	import Box2D.Dynamics.Joints.b2DistanceJointDef;
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
	public class Doll 
	{
		[Embed(source="../bin/assets/Poupee_1.png")]
		private var _little : Class;
		
		public var _upperPart : HalfDoll;
		public var _lowerPart : HalfDoll;
		public var _littleDoll : FlxBox2DSprite;
		
		private var distanceJointDef:b2DistanceJointDef;
		

		
		private var _size:String;
		private var _name : String;
		private var _keyUp : String = "activated";
		
		private var _jumpAllowed : Boolean = true;
		private var _inside : Boolean = false;
		private var _inAnimation : Boolean = false;
		private var _x : Number;
		private var _y : Number;
		
		
		public function Doll(Name : String, X:Number = 0, Y:Number = 0, Size:String = WorldElements._LITTLESIZE, Inside :Boolean = false)
		{
			
			_size = Size;
			_inside = Inside;
			_name = Name;
			_x = X;
			_y = Y;
			init();
		}
		
		private function init():void
		{
			
			switch (_size)
			{
				case WorldElements._LITTLESIZE: 
					
					_littleDoll = new FlxBox2DSprite("Little1",_x, _y,this, _little);
					SpriteUtils.ExactResize(_littleDoll, _littleDoll.width / 7, _littleDoll.height / 7);
					
					_littleDoll.body = WorldElements.createBox2DBody(_littleDoll, b2Body.b2_dynamicBody, 1, 0, 0);
					_littleDoll.body.SetFixedRotation(true);
					
					break;
				
				case WorldElements._MEDIUMSIZE: 
					_upperPart = new HalfDoll("upperMediumPart", _x, _y, this, WorldElements._MEDIUMSIZE, WorldElements._UPPERPART);
					_lowerPart = new HalfDoll("lowerMediumPart", _x, _y + _upperPart.height,this, WorldElements._MEDIUMSIZE, WorldElements._LOWERPART);
					createLink(_upperPart, _lowerPart);
					break;
				
				case WorldElements._BIGSIZE: 
					_upperPart = new HalfDoll("upperBigPart", _x, _y,this,WorldElements._BIGSIZE, WorldElements._UPPERPART);
					_lowerPart = new HalfDoll("lowerBigPart", _x, _y + _upperPart.height,this, WorldElements._BIGSIZE, WorldElements._LOWERPART);
					createLink(_upperPart, _lowerPart);
					
					break;
			}
			
			WorldElements.addToPool(this, _name);
			
		}
		public function get size ():String {
			return _size;
		}
		public function get name():String {
			return _name;
		}
		public function get inside():Boolean {
			return _inside;
		}
		public function set inside(isInside : Boolean):void {
			_inside = isInside;
		}
		public function set jumpAllowed( allowed : Boolean):void {
			_jumpAllowed = allowed;
		}
		public function get jumpAllowed():Boolean {
			return _jumpAllowed;
		}
		public function createLink(upperPart : HalfDoll, lowerPart : HalfDoll) : void {
			distanceJointDef = new b2DistanceJointDef();
			distanceJointDef.collideConnected = true;
			distanceJointDef.Initialize(upperPart.body, lowerPart.body, upperPart.body.GetWorldCenter(), lowerPart.body.GetWorldCenter());
			WorldElements.world.CreateJoint(distanceJointDef);
		}
		public function applyForce( vector : b2Vec2) :void {
			if (_lowerPart != null) {
				_lowerPart.body.ApplyForce(vector, _lowerPart.body.GetWorldCenter());
			}
			if (_littleDoll != null) {
				_littleDoll.body.ApplyForce(vector, _littleDoll.body.GetWorldCenter());
			}
			
			
		}
		public function update():void {
		
			if (_lowerPart != null && _upperPart !=null && _inAnimation == false) {
				_upperPart.body.SetPosition(new b2Vec2(_lowerPart.body.GetPosition().x, _lowerPart.body.GetPosition().y- ((_lowerPart.height + _upperPart.height)/2)/WorldElements._RATIO))
				
				}
			
			
			
		}
	
	}

}