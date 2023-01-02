package;

import Random;

final screenWidth:Int = 800;
final screenHeight:Int = 450;

class Platform
{
	private var x:Float;
	private var y:Float;
	private final width:Int = 100;
	private final height:Int = 32;
	private var hasCoin:Bool;
	private var coinX:Float;
	private var coinY:Float;

	public function new(index:Int)
	{
		x = Random.int(0, 660) + 20;
		y = 0 - height - (index * 100);
		var coinInt = Random.int(0, 4);
		if (coinInt == 0 || index == 0)
		{
			hasCoin = false;
		}
		else
		{
			hasCoin = true;
		}
		coinX = x + width / 2 - 24 / 2;
		coinY = y - 24 - 5;
	}

	public function getX():Float
	{
		return x;
	}

	public function getY():Float
	{
		return y;
	}

	public function getWidth():Int
	{
		return width;
	}

	public function getHeight():Int
	{
		return height;
	}

	public function getHasCoin():Bool
	{
		return hasCoin;
	}

	public function setHasCoin(value:Bool):Void
	{
		hasCoin = value;
	}

	public function getCoinX():Float
	{
		return x;
	}

	public function getCoinY():Float
	{
		return y;
	}

	public function updatePosition()
	{
		y += 1;
		coinX = x + width / 2 - 24 / 2;
		coinY = y - 24 - 5;
		if (y > screenHeight)
		{
			x = Random.int(0, 660) + 20;
			y = 0 - height;
			var coinInt:Int = Random.int(0, 4);
			if (coinInt == 0)
			{
				hasCoin = false;
			}
			else
			{
				hasCoin = true;
			}
		}
	}
}
