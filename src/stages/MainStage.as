package stages
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import unit.car;
	
	/**
	 * ...
	 * @author AliasCage
	 */
	public class MainStage extends MovieClip
	{
		[Embed(source = "../images/grass.jpg")]
		private var GrassArt:Class;
		
		[Embed(source = "../images/Road.png")]
		private var RoadArt:Class;
		
		private var grass:Bitmap;
		private var road:Bitmap;
		
		public function MainStage()
		{
			super();
			trace("Stage init!");
			grass = new GrassArt();
			road = new RoadArt();
			road.x = 80;
			road.y = 80;
			road.height *= 1.1;
			road.width *= 1.1;
			this.addChild(grass);
			this.addChild(road);
			this.scaleX = 2;
			this.scaleY = 2;
		}
		
		public function move(Car:car):void
		{
			this.x -= Car.xMov;
			this.y += Car.yMov;
		}
	
	}

}