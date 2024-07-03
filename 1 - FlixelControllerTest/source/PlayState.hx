import flixel.FlxG;
import flixel.FlxState;
import flixel.input.gamepad.FlxGamepad;

class PlayState extends FlxState
{
    public function onDeviceConnected(gp:FlxGamepad){
        FlxG.log.add("A gamepad has been connected!");
    }

    override public function create():Void 
    {
        super.create();
        FlxG.debugger.visible=true;
        FlxG.gamepads.deviceConnected.add(onDeviceConnected);
    }

    override public function update(elapsed:Float):Void 
    {
        super.update(elapsed);

        // Important: can be null if there's no active gamepad yet!
        var gamepad:FlxGamepad = FlxG.gamepads.lastActive;
        if (gamepad != null)
        {
            updateGamepadInput(gamepad);
        }
    }

    function updateGamepadInput(gamepad:FlxGamepad):Void
    {
        //trace currently pressed buttons
        if (gamepad.pressed.A)
        {
            FlxG.log.add("The A button has been pressed.");
        }
		
        if (gamepad.analog.justMoved.LEFT_STICK_X)
        {
            FlxG.log.add("The x axis of the left analog stick of the controller has been moved.");
        }
    }
}