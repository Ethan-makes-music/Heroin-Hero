package;

import flixel.util.FlxColor;
import flixel.text.FlxText;
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
	var startUpSound:FlxSound;
	var dir:String = "up";
	var menuText:FlxText;
	var startText:FlxText;

	override public function create()
	{
		super.create();
		pressed = false;

		menuText = new FlxText(0, 200, FlxG.width, "Heroin Hero", 48);
		startText = new FlxText(0 , 350, FlxG.width, "START", 72);
		menuText.setFormat(AssetPaths.Nightmare_Hero_Normal__ttf, 128, FlxColor.BLACK, FlxTextAlign.LEFT);
		startText.setFormat(AssetPaths.Nightmare_Hero_Normal__ttf, 72, FlxColor.BLACK, FlxTextAlign.LEFT);

		catchme = FlxG.sound.load(AssetPaths.dragon5__ogg);
		startUpSound = FlxG.sound.load(AssetPaths.startupSound__ogg);

		bg = new FlxSprite(0, 0, AssetPaths.background__png);
		add(bg);
		player = new FlxSprite(60, 320);
		player.loadGraphic(AssetPaths.Player__png, true, 900, 412);
		player.animation.add("notShooting", [0], 3, false);
		player.animation.add("shootingUp", [1], 3, false);
		//add(player);
		dragon = new FlxSprite(350, 0, AssetPaths.Dragon__png);
		//add(dragon);
		add(menuText);
		add(startText);

		startUpSound.play();
		catchme.play();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(startText) && FlxG.mouse.justPressed)
		{
			FlxG.switchState(new PlayState());
		}

		if (FlxG.mouse.overlaps(startText))
		{
			startText.color = FlxColor.WHITE;
		}
		else
		{
			startText.color = FlxColor.BLACK;
		}
	}
}
