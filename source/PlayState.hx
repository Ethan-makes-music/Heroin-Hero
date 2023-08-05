package;

import Random;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.sound.FlxSound;

class PlayState extends FlxState
{
	var player:FlxSprite;
	var dragon:FlxSprite;
	var background:FlxSprite;
	var smack:FlxSprite;
	var heroinLeft:FlxSprite;

	// others
	var dir:String = "up";
	var dragonSndC:Int;

	// Sound effects
	var dragon1:FlxSound;
	var dragon2:FlxSound;
	var dragon3:FlxSound;
	var dragon4:FlxSound;
	var dragon5:FlxSound;

	override public function create()
	{
		super.create();

		// sound and music shit
		FlxG.sound.playMusic(AssetPaths.music__ogg, 1, true);

		dragon1 = FlxG.sound.load(AssetPaths.dragon1__ogg);
		dragon2 = FlxG.sound.load(AssetPaths.dragon2__ogg);
		dragon3 = FlxG.sound.load(AssetPaths.dragon3__ogg);
		dragon4 = FlxG.sound.load(AssetPaths.dragon4__ogg);
		dragon5 = FlxG.sound.load(AssetPaths.dragon5__ogg);

		// Background
		background = new FlxSprite(0, 0, AssetPaths.background__png);
		add(background);

		// Heroin Left
		heroinLeft = new FlxSprite(0, 0, AssetPaths.heroinLeft__png);
		add(heroinLeft);

		// SMACK
		smack = new FlxSprite(950, 570, AssetPaths.smack__png);
		add(smack);

		// Dragon
		dragon = new FlxSprite(200, 100, AssetPaths.Dragon__png);
		add(dragon);

		// Player adding
		player = new FlxSprite(60, 320);
		player.loadGraphic(AssetPaths.Player__png, true, 900, 412);
		player.animation.add("notShooting", [0], 3, false);
		player.animation.add("shootingUp", [1], 3, false);
		add(player);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.pressed.SPACE)
		{
			player.animation.play("shootingUp");
		}
		else if (!FlxG.keys.pressed.SPACE)
		{
			player.animation.play("notShooting");
		}

		if (FlxG.keys.justPressed.SPACE)
		{
			dragonSndC = Random.int(1, 5);
			switch dragonSndC
			{
				case 1:
					dragon1.play();
				case 2:
					dragon2.play();
				case 3:
					dragon3.play();
				case 4:
					dragon4.play();
				case 5:
					dragon5.play();
			}
		}

		// Dragon these nuts across your face cuh
		if (dragon.y >= 150)
		{
			dir = "up";
		}
		else if (dragon.y <= 50)
		{
			dir = "down";
		}

		if (dir == "up")
		{
			dragon.y -= 3;
		}
		else if (dir == "down")
		{
			dragon.y += 3;
		}
	}
}
