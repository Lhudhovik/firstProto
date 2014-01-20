package
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2World;
	import Box2D.Dynamics.Joints.b2Joint;
	import Box2D.Dynamics.Joints.b2PrismaticJointDef;
	import Box2D.Dynamics.Joints.b2PulleyJoint;
	import Box2D.Dynamics.Joints.b2PulleyJointDef;
	
	/**
	 * ...
	 * @author Ludo
	 */
	public class PulleyMechanismGroup extends MechanismGroup
	{
		private var _pulleys:Object;
		
		public function PulleyMechanismGroup(MaxSize:uint = 0)
		{
			super(MaxSize);
		
		}
		public function get pulleys():Object {
			return _pulleys;
		}
		public function createMechanism(name:String, plateform1:FlxBox2DSprite, plateform2:FlxBox2DSprite, anchor1:FlxBox2DSprite, anchor2:FlxBox2DSprite, ratio:Number, maxLength1:Number, maxLength2:Number):void
		{
			if (_pulleys == null)
			{
				_pulleys = new Object();
			}
			if (_pulleys[name])
			{
				return;
			}
			
			var pulleyJointDef:b2PulleyJointDef = new b2PulleyJointDef();
			pulleyJointDef.Initialize(plateform1.body, plateform2.body, anchor1.body.GetWorldCenter(), anchor2.body.GetWorldCenter(), plateform1.body.GetWorldCenter(), plateform2.body.GetWorldCenter(), ratio);
			pulleyJointDef.maxLengthA = maxLength1 / WorldElements._RATIO;
			pulleyJointDef.maxLengthB = maxLength2 / WorldElements._RATIO;
			_pulleys[name] = WorldElements.world.CreateJoint(pulleyJointDef);
			
			
		}
		
		public function removeMechanism(name:String):void
		{
			if (_pulleys[name])
			{
				_pulleys[name] = null;
			}
		
		}
	
	}

}