package;

import flixel.system.FlxAssets.FlxSoundAsset;
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
import flixel.util.FlxSpriteUtil;

class Main extends FlxState
{
	// Flixel Related
	var storage:FlxSave = new FlxSave();
	var highscoreDrawText:FlxText = new FlxText();
	var clickAnywhere:FlxText = new FlxText();
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
	var lavaY:Float;
	var timer:Float = 0;
	var splashTimer:Float = 0;
	var firstTimer:Bool = true;
	var playedSplash:Bool = false;
	var playedSelect:Bool = false;
	var playerSprite:FlxSprite = new FlxSprite();
	var lavaSprite:FlxSprite = new FlxSprite();
	var platformSprites:FlxSprite = new FlxSprite();
	var coinSprite:FlxSprite = new FlxSprite();
	var scoreBoxSprite:FlxSprite = new FlxSprite();
	var logo:FlxSprite = new FlxSprite();
	var splashEggSprite:FlxSprite = new FlxSprite();
	final fxLaunch:FlxSoundAsset = "assets/launch.wav";
	final fxClick:FlxSoundAsset = "assets/click.wav";
	final fxDeath:FlxSoundAsset = "assets/death.wav";
	final fxCoin:FlxSoundAsset = "assets/coin.wav";
	final fxSplash:FlxSoundAsset = "assets/splash.wav";
	final fxSelect:FlxSoundAsset = "assets/select.wav";
	var font:FlxText = new FlxText();
	var polymarsText:FlxText = new FlxText();
	var firstTime:Bool;

	override public function create()
	{
		// Define Player here
		player = new Player(platforms[0].getX() + platforms[0].getWidth() / 2 - 26 / 2, platforms[0].getY() - 32, 26, 32);
		playerSprite.loadGraphic("assets/egg.png");
		lavaSprite.loadGraphic("assets/lava.png");
		platformSprites.loadGraphic("assets/platform.png");
		coinSprite.loadGraphic("assets/coin.png");
		scoreBoxSprite.loadGraphic("assets/scorebox.png");
		logo.loadGraphic("assets/logo.png");
		splashEggSprite.loadGraphic("assets/splash_egg.png");
		lavaY = screenHeight - 32;
		storage.bind("TerraFriedHaxeFlixel");
		resetScore();
		highscore = "BEST: " + highscoreInt;
		font.font = "resources/font.otf";
		font.size = 64;
		add(highscoreDrawText);
		add(clickAnywhere);
		add(playerSprite);
		add(lavaSprite);
		add(scoreBoxSprite);
		add(logo);
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
		for (i in 0...4)
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
		playerSprite.alpha = 0;
		lavaSprite.alpha = 0;
		scoreBoxSprite.alpha = 0;
		coinSprite.alpha = 1;
		if (titleScreen)
		{
			if (splashTimer > 120)
			{
				if (!playedSelect)
				{
					FlxG.sound.play(fxSelect);
					playedSelect = true;
				}
				bgColor = FlxColor.fromString("#EEE4E1");
				logo.x = screenWidth / 2 - 200;
				logo.y = screenHeight / 2 - 45 - 30;
				logo.alpha = 1;
				highscoreDrawText.font = font.font;
				highscoreDrawText.size = 32;
				highscoreDrawText.text = highscore;
				highscoreDrawText.x = screenWidth / 2 - 37;
				highscoreDrawText.y = screenHeight / 2 + 10;
				highscoreDrawText.color = FlxColor.BLACK;
				highscoreDrawText.alpha = 1;
				clickAnywhere.font = font.font;
				clickAnywhere.size = 32;
				clickAnywhere.text = "CLICK ANYWHERE TO BEGIN";
				clickAnywhere.color = FlxColor.fromString("#B2967D");
				clickAnywhere.alpha = 0.4;
				clickAnywhere.x = screenWidth / 2 - 134;
				clickAnywhere.y = screenHeight / 2 + 50;
				clickAnywhere.alpha = 1;
				if (FlxG.mouse.pressed)
				{
					FlxG.sound.play(fxSelect);
					titleScreen = false;
					mouseDownX = FlxG.mouse.x;
					mouseDownY = FlxG.mouse.y;
				}
				polymarsText.alpha = 0;
				splashEggSprite.alpha = 0;
			}
			else
			{
				if (!playedSplash)
				{
					FlxG.sound.play(fxSplash);
					playedSplash = true;
				}
				bgColor = FlxColor.fromString("#EEE4E1");
				polymarsText.font = font.font;
				polymarsText.text = "POLYMARS";
				polymarsText.color = FlxColor.fromString("#D5815A");
				polymarsText.size = 32;
				polymarsText.x = screenWidth / 2 - 54;
				polymarsText.y = screenHeight / 2 + 3;
				add(polymarsText);
				splashEggSprite.x = screenWidth / 2 - 16;
				splashEggSprite.y = screenHeight / 2 - 16 - 23;
				add(splashEggSprite);
				splashTimer += 1;
				highscoreDrawText.alpha = 0;
				clickAnywhere.alpha = 0;
				logo.alpha = 0;
			}
		}
		else
		{
			if (playCoinFX)
			{
				FlxG.sound.play(fxCoin);
				playCoinFX = false;
			}
			if (FlxG.mouse.pressed && player.isOnGround())
			{
				FlxG.sound.play(fxClick);
				mouseDownX = FlxG.mouse.x;
				mouseDownY = FlxG.mouse.y;
			}
			if (FlxG.mouse.released && player.isOnGround())
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
					var velocityX:Float = FlxG.mouse.x - mouseDownX;

					var velocityY:Float = FlxG.mouse.y - mouseDownY;

					player.setVelocity(velocityX * 0.08, velocityY * 0.08);
				}
			}
			checkPlayerCollision();
			player.updatePosition();
			if (player.getY() > screenHeight)
			{
				FlxG.sound.play(fxDeath);
				resetGame();
			}
			for (i in 0...4)
			{
				platforms[i].updatePosition();
			}

			lavaY = screenHeight - 43 - Math.sin(timer) * 5;
			timer += 0.05;
			bgColor = FlxColor.fromString("#EEE4E1");
			if (FlxG.mouse.pressed && player.isOnGround())
			{
				var line = new FlxSprite();
				line.makeGraphic(FlxG.width, FlxG.height, 0, true);
				add(line);
				FlxSpriteUtil.fill(line, 0);
				FlxSpriteUtil.drawLine(line, mouseDownX
					+ (player.getX() - mouseDownX)
					+ (player.getWidth() / 2),
					mouseDownY
					+ (player.getY() - mouseDownY)
					+ (player.getHeight() / 2),
					FlxG.mouse.x
					+ (player.getX() - mouseDownX)
					+ (player.getWidth() / 2),
					FlxG.mouse.y
					+ (player.getY() - mouseDownY)
					+ (player.getHeight() / 2), {
						thickness: 3,
						color: 0xE7DAC9
					});
			}
			// DrawRectangle(player.getX(), player.getY(), player.getWidth(), player.getHeight(), WHITE);
			for (i in 0...4)
			{
				// DrawTexture(platformSprite, platforms[i].getX(), platforms[i].getY(), ColorFromNormalized((Vector4) {
				// .698,
				// .588,
				// .49,
				// 1.0
				// }));
				if (platforms[i].getHasCoin())
				{
					coinSprite.alpha = 1;
					coinSprite.x = platforms[i].getCoinX();
					coinSprite.y = platforms[i].getCoinY();
					add(coinSprite);
				}
			}
			playerSprite.alpha = 1;
			playerSprite.x = player.getX();
			playerSprite.y = player.getY();
			lavaSprite.alpha = 1;
			lavaSprite.x = 0;
			lavaSprite.y = lavaY;
			scoreBoxSprite.alpha = 1;
			scoreBoxSprite.x = 17;
			scoreBoxSprite.y = 17;
			// DrawTextEx(font, score, Vector2 {28, 20}, 64, 0, BLACK);
			// DrawTextEx(font, highscore, Vector2 {17, 90}, 32, 0, BLACK);
		}
	}
}
