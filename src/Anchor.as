package  
{
	import Box2D.Dynamics.b2Body;
	/**
	 * ...
	 * @author Ludo
	 */
	public class Anchor extends FlxBox2DSprite 
	{
		
		public function Anchor(Name:String, X:Number=0, Y:Number=0, Parent : * = null,Image:Class=null) 
		{
			super(Name, X, Y,Parent, Image);
			
		}
		override protected function init():void {
			this.width = 100;
			this.height = 100;
			_body = WorldElements.createBox2DBody(this, b2Body.b2_staticBody);
			_body.SetActive(false);
		}
		override public function update():void {
			
			
			super.update();
		}
		
	}

}