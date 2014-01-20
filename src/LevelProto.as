package  
{
	import flash.system.System;
	import flash.utils.*;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxState;
	
	/**
	 * ...
	 * @author Ludo
	 */
	public class LevelProto extends FlxState 
	{
		
		private var _littleDoll : Doll; 
		private var _mediumDoll : Doll;
		private var _bigDoll : Doll;
		private var _ground : Ground;
		private var _player : Player;
	
		
		
		override public function create():void {
			FlxG.bgColor = 0xffffffff;
			WorldElements.initialize();
			
			
			addDoll(new Doll("dollLittle", 0, 0)); 
			addDoll(new Doll("dollMedium", 200, 0, WorldElements._MEDIUMSIZE, false));
			addDoll(new Doll("dollBig", 400, 0, WorldElements._BIGSIZE, false));
			createGround();
			
			_player = new Player("Player 1", WorldElements.getFromPool("dollLittle"));
			
			add(WorldElements.pulleyMechanisms);
			WorldElements.pulleyMechanisms.addElement(new PulleyPlatform("p1", 500, 400));
			WorldElements.pulleyMechanisms.addElement(new PulleyPlatform("p2", 800, 400));
			WorldElements.pulleyMechanisms.addElement(new Anchor("anchor1", 500, 0));
			WorldElements.pulleyMechanisms.addElement(new Anchor("anchor2", 800, 0));
			
			WorldElements.pulleyMechanisms.createMechanism("pulleyTest", WorldElements.pulleyMechanisms.elements["p1"], 
			WorldElements.pulleyMechanisms.elements["p2"], WorldElements.pulleyMechanisms.elements["anchor1"], 
			WorldElements.pulleyMechanisms.elements["anchor2"], 1 , 600, 600);
			
			
			
			
			
			
		}
		override public function update():void {
			WorldElements.world.Step( FlxG.elapsed, 10, 10);
			WorldElements.world.ClearForces();
			for each( var element: * in WorldElements.getPool()) {
				if (element.update && !(element is FlxBox2DSprite)) {
					element.update();
				}
			}
			
			if (FlxG.keys.ESCAPE) {
				System.exit(0);
			}
			super.update();
		}
		private function addDoll(doll : Doll):void {
			
			if (doll.size == "Little") {
				add(doll._littleDoll);
			}
			else {
				add(doll._lowerPart);
				add(doll._upperPart);
			}
			
			
		}
		private function createGround() : void {
			_ground = new Ground("ground0",0, 600);
			add(_ground);
		}
		
		
	}

}