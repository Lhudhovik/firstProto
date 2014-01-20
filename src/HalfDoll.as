package
{
	import Box2D.Collision.Shapes.b2MassData;
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
	public class HalfDoll extends FlxBox2DSprite
	{
		[Embed(source="../bin/assets/p2_Bas.png")]
		private var _lowerMedium:Class;
		[Embed(source="../bin/assets/p3_Bas.png")]
		private var _lowerBig:Class;
		[Embed(source="../bin/assets/p2_Haut.png")]
		private var _upperMedium:Class;
		[Embed(source="../bin/assets/p3_Haut.png")]
		private var _upperBig:Class;
		
		private var _size:String;
		private var _part:String;
		
		
		
		
		public function HalfDoll(Name:String, X:Number = 0, Y:Number = 0, Parent : * = null, Size:String = WorldElements._MEDIUMSIZE, Part:String = WorldElements._LOWERPART)
		{
			
			_size = Size;
			_part = Part;
			super(Name, X, Y, Parent);
		}
		
		override protected function init():void
		{
			
			switch (_size)
			{
				
				case WorldElements._MEDIUMSIZE: 
					
					if (_part == WorldElements._LOWERPART)
					{
						this.loadGraphic(_lowerMedium, false, false, 380, 284);
						SpriteUtils.ExactResize(this, this.width / 7, this.height / 7);
					}
					else if (_part == WorldElements._UPPERPART)
					{
						this.loadGraphic(_upperMedium, false, false, 380, 424);
						SpriteUtils.ExactResize(this, this.width / 7, this.height / 7);
					}
					
					_body = WorldElements.createBox2DBody(this, b2Body.b2_dynamicBody, 2,2, 0);
					
					break;
				
				case WorldElements._BIGSIZE: 
					
					if (_part == WorldElements._LOWERPART)
					{
						this.loadGraphic(_lowerBig, false, false, 497, 373);
						SpriteUtils.ExactResize(this, this.width / 7, this.height / 7);
					}
					else if (_part == WorldElements._UPPERPART)
					{
						this.loadGraphic(_upperBig, false, false, 497, 531);
						SpriteUtils.ExactResize(this, this.width / 7, this.height / 7);
					}
					
					_body = WorldElements.createBox2DBody(this, b2Body.b2_dynamicBody, 2, 3, 0);
					
					break;
			
			}
			//_body.SetFixedRotation(true);
			WorldElements.addToPool(this, _name);
		}
		public function get size():String {
			return _size;
		}
		public function get part():String {
			return _part;
		}
		override public function update():void
		{
			
			//force = new b2Vec2();
			//if (FlxG.keys.LEFT)
			//{
				//force.Add(new b2Vec2(-40, 0));
			//}
			//if (FlxG.keys.RIGHT)
			//{
				//force.Add(new b2Vec2(40, 0));
			//}
			//
			//if (FlxG.keys.UP)
			//{
				//
				//if (_keyUp == "activated")
				//{
					//_body.ApplyForce(new b2Vec2(0, -500), _body.GetWorldCenter());
						//_keyUp = "desactivated";
						//_inAir == true;
					//
				//}
			//}
			//
			//if (force.x || force.y)
			//{
				//this._body.ApplyForce(force, this._body.GetWorldCenter());
			//}
			
			super.update();
		}
	
	}

}