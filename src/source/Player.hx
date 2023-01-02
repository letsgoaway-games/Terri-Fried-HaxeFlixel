package;

import lime.math.Vector2;

final pi:Float = 3.1415926535897;
final gravity:Int = 1;
final screenWidth:Int = 800;
final screenHeight:Int = 450;

class Player
{
	private var x:Float;
	private var y:Float;
	private var width:Int;
	private var height:Int;
	private var onPlatform:Bool;
	private var velocity:Vector2 = new Vector2();

	public function new(x:Float, y:Float, width:Int, height:Int)
	{
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
		onPlatform = false;
	}

	public function getX():Float
	{
		return x;
	}

	public function getY():Float
	{
		return y;
	}

	public function setX(x:Float):Void
	{
		this.x = x;
	}

	public function setY(y:Float):Void
	{
		this.y = y;
	}

	public function getWidth():Int
	{
		return width;
	}

	public function getHeight():Int
	{
		return height;
	}

	public function isOnGround():Bool
	{
		return onPlatform;
	}

	public function isOnPlatform():Bool
	{
		return onPlatform;
	}

	public function setOnPlatform(result:Bool):Void
	{
		onPlatform = result;
	}

	public function setVelocity(x:Float, y:Float):Void
	{
		velocity.x = x;
		velocity.y = y;
	}

	public function getVelocity():Vector2
	{
		return velocity;
	}

	public function updatePosition()
	{
		x += velocity.x;
		y += velocity.y;
		if (!isOnGround())
		{
			velocity.y += gravity;
		}
		else
		{
			velocity.x = 0;
			velocity.y = 0;
		}
		if (x < 0)
		{
			velocity.x *= -1;
		}
		if (x + width > 800)
		{
			velocity.x *= -1;
		}
	}
}
