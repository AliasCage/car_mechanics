package
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import stages.MainStage;
	import unit.car;
	import unit.car_shadow;
	
	/**
	 * ...
	 * @author AliasCage
	 */
	public class Main extends Sprite
	{
		private var carMC:car;
		private var shadow:car_shadow;
		private var level:MainStage;
		
		private var keys:Array = [];
		
		public function Main()
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
			stage.addEventListener(Event.ENTER_FRAME, mainFunc);
		
		}
		
		private function mainFunc(e:Event):void
		{
			carMC.move();
			shadow.move(carMC);
			level.move(carMC);
			
			if (keys[39])
				carMC.right();
			
			if (keys[37])
				carMC.left();
			
			if (keys[38])
				carMC.goOn();
			else
				carMC.goOff();
			
			if (keys[40])
				carMC.backOn();
			else
				carMC.backOff();
		
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			keys[e.keyCode] = true;
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			keys[e.keyCode] = false;
		}
		
		private function init(e:Event = null):void
		{			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			carMC = new car();
			shadow = new car_shadow(carMC);
			level = new MainStage();
			
			stage.addChild(level);
			stage.addChild(shadow);
			stage.addChild(carMC);
			
			trace(stage.height);
			trace(stage.width);
		}
	
	}

}