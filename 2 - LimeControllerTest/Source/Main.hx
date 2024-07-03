package;

import openfl.display.Sprite;
import openfl.events.Event;

import lime.ui.Gamepad;
import lime.ui.GamepadAxis;
import lime.ui.GamepadButton;

class Main extends Sprite {
	
	public function new() {
		super();
		init();
	}

	private function init():Void {
        trace("init");
		Gamepad.onConnect.add (onGamepadConnect);
		addEventListener(Event.ENTER_FRAME, onEnter);
	}

	private function onButtonDown (g:Gamepad, b:GamepadButton):Void {
		trace(b + ' pressed' + ' on gamepad ' + g.id);
  	}

	private function onButtonUp (g:Gamepad, b:GamepadButton):Void {
  		trace(b + ' released' + ' on gamepad ' + g.id);
	}

	private function onAxisMove (g:Gamepad, a:GamepadAxis, v:Float):Void {
		if ((v > 0 && v < 0.1) || (v < 0 && v > -0.1)) v = 0; //additional analog jitter filter
		switch (Std.string(a)) {
			case "LEFT_X": 
			  trace(g.id + ' LEFT_X:' + v);
			case "LEFT_Y":
				trace(g.id + ' LEFT_Y:' + v);
			case "RIGHT_X":
				trace(g.id + ' RIGHT_X:' + v);
			case "RIGHT_Y":
				trace(g.id + 'RIGHT_Y:' + v);
			case "TRIGGER_LEFT": trace(g.id + ' TRIGGER_LEFT:' + v);
			case "TRIGGER_RIGHT": trace(g.id + ' TRIGGER_RIGHT:' + v);
			default: trace(Std.string(a) + ':' + v);
		}
	}

	private function onGamepadConnect (g:Gamepad):Void {
		trace('gamepad ' + g.id + ' ('+ g.name + ') connected');
		g.onButtonDown.add (onButtonDown.bind(g));
		g.onButtonUp.add (onButtonUp.bind(g)); 
		g.onAxisMove.add (onAxisMove.bind(g));
		g.onDisconnect.add (onGamepadDisconnect.bind(g));
	}

	private function onGamepadDisconnect (g:Gamepad):Void {
    		trace('gamepad ' + g.id + ' disconnected');
	}

	private function onEnter(e:Event):Void {
	}
	
}