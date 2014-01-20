package
{
	import Box2D.Collision.b2WorldManifold;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2ContactListener;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.Contacts.b2Contact;
	
	/**
	 * ...
	 * @author Ludo
	 */
	public class Flxb2contactListener extends b2ContactListener
	{
		
		override public function BeginContact(contact:b2Contact):void
		{
			// getting the fixtures that collided
			var fixtureA:b2Fixture = contact.GetFixtureA();
			var fixtureB:b2Fixture = contact.GetFixtureB();
			if ( fixtureA.GetBody().GetUserData().parent) {
				var parentA:* = fixtureA.GetBody().GetUserData().parent;
			}
			
			var bodyA:b2Body = fixtureB.GetBody();
			var contactPoint:b2Vec2 = contact.GetManifold().m_localPoint;
			
			contactPoint = bodyA.GetWorldPoint(contactPoint);
			// if the fixture is a sensor, mark the parent body to be removed
			
			if (parentA && parentA.size == WorldElements._LITTLESIZE)
				{
					trace(bodyA.GetWorldCenter().y + (bodyA.GetUserData().height - 1) / (2 * WorldElements._RATIO))
			trace( bodyA.GetWorldCenter().y)
			trace("CONTACT" + contactPoint.y);
				}
			if (parentA is Doll && contactPoint.y >= bodyA.GetWorldCenter().y + (bodyA.GetUserData().height - 1) / (2 * WorldElements._RATIO))
			{
				
				if (bodyA.GetUserData() is HalfDoll && bodyA.GetUserData().part == WorldElements._LOWERPART)
				{
					parentA.jumpAllowed = true;
				}
				if (parentA.size == WorldElements._LITTLESIZE)
				{
					parentA.jumpAllowed = true;
				}
			}
		}
	
	}
}