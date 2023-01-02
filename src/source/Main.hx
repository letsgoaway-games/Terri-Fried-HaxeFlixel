package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.util.FlxColor;
import Player;
import Platform;
import flixel.util.FlxSave;
import flash.display.Bitmap;

class Main extends FlxState
{
	// Flixel Related
	var storage:FlxSave = new FlxSave();
	// Variables
	final pi:Float = 3.1415926535897;
	final gravity:Int = 1;
	var platforms:Array<Platform> = [new Platform(0), new Platform(1), new Platform(2), new Platform(3)];
	var player:Player;
	var scoreInt:Int = 0;
	var highscoreInt:Int = 0;
	var score:String;
	var highscore:String;
	var titleScreen:Bool = true;
	var playCoinFX:Bool = false;
	final screenWidth:Int = 800;
	final screenHeight:Int = 450;

	var mouseDownX:Int = 0;
	var mouseDownY:Int = 0;
	var lavaY:Float = screenHeight - 32;
	var timer:Float = 0;
	var splashTimer:Float = 0;
	var firstTimer:Bool = true;
	var playedSplash:Bool = false;
	var playedSelect:Bool = false;
	final playerSprite:FlxSprite = new FlxSprite().loadGraphic("assets/egg.png");
	final lavaSprite:FlxSprite = new FlxSprite().loadGraphic("assets/lava.png");
	final platformSprites:FlxSprite = new FlxSprite().loadGraphic("assets/platform.png");
	final coinSprite:FlxSprite = new FlxSprite().loadGraphic("assets/coin.png");
	final scoreBoxSprite:FlxSprite = new FlxSprite().loadGraphic("assets/scorebox.png");
	final logo:FlxSprite = new FlxSprite().loadGraphic("assets/logo.png");
	final splashEggSprite:FlxSprite = new FlxSprite().loadGraphic("splash_egg.png");
	final fxLaunch:FlxSound = FlxG.sound.load("assets/launch.wav");
	final fxClick:FlxSound = FlxG.sound.load("assets/click.wav");
	final fxDeath:FlxSound = FlxG.sound.load("assets/death.wav");
	final fxCoin:FlxSound = FlxG.sound.load("assets/coin.wav");
	final fxSplash:FlxSound = FlxG.sound.load("assets/splash.wav");
	final fxSelect:FlxSound = FlxG.sound.load("assets/select.wav");
	var font:FlxText = new FlxText();

	override public function create()
	{
		// Define Player here
		player = new Player(platforms[0].getX() + platforms[0].getWidth() / 2 - 26 / 2, platforms[0].getY() - player.getHeight(), 26, 32);
		storage.bind("TerraFriedHaxeFlixel");
		resetScore();
		highscore = "BEST: " + highscoreInt;
		font.font = "resources/font.otf";
		font.size = 64;
	}

	function addScore(amount:Int):Void
	{
		scoreInt += amount;
		if (scoreInt < 10)
		{
			score = "00" + scoreInt;
		}
		else if (scoreInt < 100)
		{
			score = "0" + scoreInt;
		}
		else
		{
			score = scoreInt + "";
		}
		if (scoreInt > highscoreInt)
		{
			highscoreInt = scoreInt;
			highscore = "BEST: " + highscoreInt;
		}
	}

	function resetScore():Void
	{
		scoreInt = 0;
		score = "00" + scoreInt;
		storage.data.highscoreInt = highscoreInt;
		storage.flush(0);
	}

	function resetGame()
	{
		resetScore();
		for (i in 0...5)
		{
			platforms[i] = new Platform(i);
		}
		player.setVelocity(0, 0);
		player.setX(platforms[0].getX() + platforms[0].getWidth() / 2 - 26 / 2);
		player.setY(platforms[0].getY() - player.getHeight());
	}

	function checkPlayerCollision()
	{
		var onPlatform:Bool = false;
		for (i in 0...5)
		{
			if (platforms[i].getHasCoin()
				&& player.getX() + player.getWidth() - 3 > platforms[i].getCoinX()
				&& player.getX() + 3 < platforms[i].getCoinX() + 24
				&& player.getY() + player.getHeight() - 3 > platforms[i].getCoinY()
				&& player.getY() + 3 < platforms[i].getCoinY() + 24)
			{
				addScore(1);
				platforms[i].setHasCoin(false);
				playCoinFX = true;
			}
			if (player.getX() + 1 < platforms[i].getX() + platforms[i].getWidth()
				&& player.getX() + player.getWidth() > platforms[i].getX()
				&& player.getY() + player.getHeight() >= platforms[i].getY()
				&& player.getY() < platforms[i].getY() + platforms[i].getHeight())
			{
				if (player.getY() > platforms[i].getY() + platforms[i].getHeight() / 2)
				{
					player.setVelocity(player.getVelocity().x, 5);
				}
				else if (player.getY() + player.getHeight() < platforms[i].getY() + platforms[i].getHeight())
				{
					onPlatform = true;
					player.setY(platforms[i].getY() - player.getHeight());
					player.setY(player.getY() + 1);
				}
			}
		}
		player.setOnPlatform(onPlatform);
	}

	override public function update(elapsed:Float)
	{
		if (titleScreen)
		{
			if (splashTimer > 120)
			{
				if (!playedSelect)
				{
					FlxG.sound.play(fxSelect);
					playedSelect = true;
				}
				bgColor = FlxColor.fromString("#EDE3E0");
				logo.x = screenWidth / 2 - 200;
				logo.y = screenHeight / 2 - 45 - 30;
				DrawTextEx(font, highscore, Vector2 {screenWidth / 2 - 37, screenHeight / 2 + 10}, 32, 0, BLACK);
				DrawTextEx(font, "CLICK ANYWHERE TO BEGIN", Vector2 {screenWidth / 2 - 134, screenHeight / 2 + 50}, 32, 0, ColorFromNormalized((Vector4) {
					.698,
					.588,
					.49,
					0.4
				})); // #b2967d
				EndDrawing();
				if (IsMouseButtonDown(MOUSE_LEFT_BUTTON))
				{
					FlxG.sound.play(fxSelect);
					titleScreen = false;
					mouseDownX = GetMouseX();
					mouseDownY = GetMouseY();
				}
			}
			else
			{
				if (!playedSplash)
				{
					FlxG.sound.play(fxSplash);
					playedSplash = true;
				}
				BeginDrawing();
				ClearBackground(ColorFromNormalized((Vector4) {
					0.933,
					0.894,
					0.882,
					1.0
				}));
				DrawTextEx(font, "POLYMARS", Vector2 {screenWidth / 2 - 54, screenHeight / 2 + 3}, 32, 0, ColorFromNormalized((Vector4) {
					.835,
					.502,
					.353,
					1.0
				}));
				DrawTexture(splashEggSprite, screenWidth / 2 - 16, screenHeight / 2 - 16 - 23, WHITE);
				EndDrawing();
				splashTimer += 1;
			}
		}
		else
		{
			if (playCoinFX)
			{
				FlxG.sound.play(fxCoin);
				playCoinFX = false;
			}
			if (IsMouseButtonPressed(MOUSE_LEFT_BUTTON) && player.isOnGround())
			{
				FlxG.sound.play(fxClick);
				mouseDownX = GetMouseX();
				mouseDownY = GetMouseY();
			}
			if (IsMouseButtonReleased(MOUSE_LEFT_BUTTON) && player.isOnGround())
			{
				if (firstTime)
				{
					firstTime = false;
				}
				else
				{
					FlxG.sound.play(fxLaunch);
					if (player.isOnPlatform())
					{
						player.setY(player.getY() - 1);
					}
					int
					velocityX = GetMouseX() - mouseDownX;

					int
					velocityY = GetMouseY() - mouseDownY;

					player.setVelocity((double) velocityX * .08, (double) velocityY * .08);
				}
			}
			checkPlayerCollision();
			player.updatePosition();
			if (player.getY() > screenHeight)
			{
				FlxG.sound.play(fxDeath);
				resetGame();
			}
			for (i in 0...5)
			{
				platforms[i].updatePosition();
			}

			lavaY = screenHeight - 43 - sin(timer) * 5;
			timer += 0.05;
			BeginDrawing();

			ClearBackground(ColorFromNormalized((Vector4) {
				0.933,
				0.894,
				0.882,
				1.0
			}));
			if (IsMouseButtonDown(MOUSE_LEFT_BUTTON) && player.isOnGround())
			{
				DrawLineEx((Vector2) {
					static_cast<float>
					(mouseDownX + (player.getX() - mouseDownX) + (player.getWidth() / 2)),
					static_cast<float>
					(mouseDownY + (player.getY() - mouseDownY) + (player.getHeight() / 2))
				}, (Vector2) {
					static_cast<float>
					(GetMouseX() + (player.getX() - mouseDownX) + (player.getWidth() / 2)),
					static_cast<float>
					(GetMouseY() + (player.getY() - mouseDownY) + (player.getHeight() / 2))
				}, 3.0 f, ColorFromNormalized((Vector4) {
					.906,
					.847,
					.788,
					1.0
				}));
			}
			// DrawRectangle(player.getX(), player.getY(), player.getWidth(), player.getHeight(), WHITE);
			for (int i = 0;
			i < 4;
			i++
		)
			{
				DrawTexture(platformSprite, platforms[i].getX(), platforms[i].getY(), ColorFromNormalized((Vector4) {
					.698,
					.588,
					.49,
					1.0
				}));
				if (platforms[i].getHasCoin())
				{
					DrawTexture(coinSprite, platforms[i].getCoinX(), platforms[i].getCoinY(), WHITE);
				}
			}
			DrawTexture(playerSprite, player.getX(), player.getY(), WHITE);
			DrawTexture(lavaSprite, 0, lavaY, WHITE);
			DrawTexture(scoreBoxSprite, 17, 17, WHITE);
			DrawTextEx(font, score, Vector2 {28, 20}, 64, 0, BLACK);
			DrawTextEx(font, highscore, Vector2 {17, 90}, 32, 0, BLACK);
		}
	}
}
