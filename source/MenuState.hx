package;

import PlayState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.sound.FlxSound;

class MenuState extends FlxState
{
	var player:FlxSprite;
	var dragon:FlxSprite;
	var pressed:Bool;
	var bg:FlxSprite;
	var catchme:FlxSound;
	var dir:String = "up";

	override public function create()
	{
		super.create();
		pressed = false;
		catchme = FlxG.sound.load(AssetPaths.dragon5__ogg);

		bg = new FlxSprite(0, 0, AssetPaths.background__png);
		add(bg);
		player = new FlxSprite(60, 320);
		player.loadGraphic(AssetPaths.Player__png, true, 900, 412);
		player.animation.add("notShooting", [0], 3, false);
		player.animation.add("shootingUp", [1], 3, false);
		add(player);
		dragon = new FlxSprite(350, 0, AssetPaths.Dragon__png);
		add(dragon);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		catchme.play();
		if (FlxG.keys.pressed.SPACE)
		{
			player.animation.play("shootingUp");
			pressed = true;
		}
		else
		{
			player.animation.play("notShooting");
			if (pressed)
			{
				FlxG.switchState(new PlayState());
			}
		}

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
