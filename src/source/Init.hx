package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Init extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, Main, 1, 60, true));
	}
}