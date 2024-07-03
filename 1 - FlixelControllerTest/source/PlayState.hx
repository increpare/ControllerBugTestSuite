import flixel.FlxG;
import flixel.FlxState;
import flixel.input.gamepad.FlxGamepad;

class PlayState extends FlxState
{
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
        if (gamepad.pressed.A)
        {
            trace("The bottom face button of the controller is pressed.");
        }
		
        if (gamepad.analog.justMoved.LEFT_STICK_X)
        {
            trace("The x axis of the left analog stick of the controller has been moved.");
        }
    }
}