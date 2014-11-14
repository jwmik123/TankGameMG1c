package  
{
	import flash.events.DataEvent;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author joel mik
	 */
	public class Tank extends MovieClip
	{
		private var tankBody:TankBodyArt;
		private var tankTurret:TankTurretArt;
		private var WPressed:Boolean = false;
		
		public function Tank() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
			tankBody = new TankBodyArt();
			this.addChild(tankBody);
			tankTurret = new TankTurretArt();
			this.addChild(tankTurret);
			
			
		}
		
		private function init(e:DataEvent):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUP);
			this.addEventListener(Event.ENTER_FRAME, loop);
			
		}
		
		private function loop(e:Event):void 
		{
			if (WPressed)
			{
				this.y -= 5;
			}
		}
		
		private function onKeyUP(e:Event):void 
		{
			if (e.keyCode == Keyboard.W)
			{
				//speler heeft W losgelaten
				WPressed = false;
				
			}
		}
		
		private function onKeyDown(e:Event):void 
		{
			if (e.keyCode == Keyboard.W)
			{
				// speler drukt op W
				WPressed = true;
				
				
				
			}
		}
		
	}

}