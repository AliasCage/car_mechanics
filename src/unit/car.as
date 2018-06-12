package unit
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author AliasCage
	 */
	public class car extends MovieClip
	{
		private const forvardSpeed:Number = 14;
		private const forvardAddSpeed:Number = 0.10;
		private const forvardStopSpeed:Number = 0.08;
		
		private const backSpeed:Number = 5;
		private const backAddSpeed:Number = 0.3;
		private const backStopSpeed:Number = 0.12;
		
		private const ruleAngle:Number = 0.2;
		
		[Embed(source = "../images/car.png")]
		private var DropArt:Class;
			
		public var xMov:Number = 0;
		public var yMov:Number = 0;
		
		private var isRun:Boolean = false;
		private var isStop:Boolean = false;
		
		private var rotateAngle:Number = 0;
		
		private var speed:Number = 0;
		
		public function car()
		{
			super();
			trace("Car init!")
			
			this.x = 400;
			this.y = 600;
			xMov = this.x;
			yMov = this.y;
			
			var vCar:Bitmap = new DropArt();
			vCar.width = vCar.width * 0.2;
			vCar.height = vCar.height * 0.2;
			vCar.x = -vCar.width / 2;
			vCar.y = -(vCar.height * 0.7);			
			this.addChild(vCar);
		
		}
		
		public function move():void
		{
			yMov = speed * Math.cos(rotateAngle * Math.PI / 180);
			xMov = speed * Math.sin(rotateAngle * Math.PI / 180);
			
			if (!isRun && speed > 0)
			{
				speed -= forvardStopSpeed;
				if (speed < 0.3)
					speed = 0;
			}
			if (!isStop && speed < 0)
			{
				speed += backStopSpeed;
				if (speed > 0.3)
					speed = 0;
			}
			
			this.rotation = rotateAngle;
		
		}
		
		public function left():void
		{
			if (speed > 0.3 || speed < -0.3)
				rotateAngle -= ruleAngle * speed;
		}
		
		public function right():void
		{
			if (speed > 0.3 || speed < -0.3)
				rotateAngle += ruleAngle * speed;
		}
		
		public function goOn():void
		{
			isRun = true;
			if (speed < forvardSpeed)
				speed += forvardAddSpeed;
		
		}
		
		public function goOff():void
		{
			isRun = false;
		
		}
		
		public function backOn():void
		{
			isStop = true;
			if (speed > -backSpeed)
				speed -= backAddSpeed;
		
		}
		
		public function backOff():void
		{
			isStop = false;
		}
	
	}

}