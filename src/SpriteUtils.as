package  
{
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Ludo
	 */
	public class SpriteUtils 
	{
		public static function ScaleResize( sprite : FlxSprite, scale : Number):void {
			sprite.scale = new FlxPoint( scale, scale);
			sprite.width *= scale;
			sprite.height *= scale;
			sprite.centerOffsets();
		}
		public static function ExactResize( sprite : FlxSprite, newWidth : int, newHeight : int):void
		{
			
			sprite.scale = new FlxPoint( newWidth / sprite.width, newHeight / sprite.height);
			sprite.width = newWidth;
			sprite.height = newHeight;
			sprite.centerOffsets();
			
			
			
		}
		
		
	}

}