package unit
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author AliasCage
	 */
	public class car_shadow extends MovieClip
	{
		[Embed(source = "../images/car_shadow.png")]
		private var Shadow:Class;
		
		public function car_shadow(Car:car)
		{
			super();
			trace("Shadow init!")
			
			this.x = Car.x + 7;
			this.y = Car.y + 4;
			
			var shadow:Bitmap = new Shadow();
			shadow.width = Car.width;
			shadow.height = Car.height;
			shadow.x = -shadow.width / 2;
			shadow.y = -(shadow.height * 0.7);
			shadow.alpha = 0.5;
			this.addChild(shadow);
		}
		
		public function move(Car:car):void
		{
			this.x = Car.x + 7;
			this.y = Car.y + 4;
			this.rotation = Car.rotation;
		}
	
	}

}