package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PauseSubState extends FlxSubState
{
	var pauseText:FlxText = new FlxText(0, 100, FlxG.width, "PAUSED", 64);
	// Difference between all of the buttons is 64
	var backText:FlxText = new FlxText(0, 228, FlxG.width, "Continue", 32);
	var exitText:FlxText = new FlxText(0, 292, FlxG.width, "Exit to menu", 32);

    var bg:FlxSprite = new FlxSprite(0, 0, AssetPaths.background__png);

	public function new()
	{
		super(0xFF000000);
	}

	override function create()
	{
		super.create();

		pauseText.setFormat(AssetPaths.Nightmare_Hero_Normal__ttf, 64, FlxColor.WHITE, FlxTextAlign.CENTER);
		backText.setFormat(AssetPaths.Nightmare_Hero_Normal__ttf, 32, FlxColor.WHITE, FlxTextAlign.CENTER);
		exitText.setFormat(AssetPaths.Nightmare_Hero_Normal__ttf, 32, FlxColor.WHITE, FlxTextAlign.CENTER);
        	add(bg);
		add(pauseText);
		add(backText);
		add(exitText);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(backText) && FlxG.mouse.justPressed)
		{
			close();
            FlxG.sound.music.play();
		}
		else if (FlxG.mouse.overlaps(exitText) && FlxG.mouse.justPressed)
		{
			FlxG.switchState(new MenuState());
		}

        if (FlxG.mouse.overlaps(backText))
        {
            backText.color = FlxColor.WHITE;
        }
        else
        {
            backText.color = FlxColor.BLACK;
        }

		if (FlxG.mouse.overlaps(exitText))
        {
            exitText.color = FlxColor.WHITE;
        }
        else
        {
            exitText.color = FlxColor.BLACK;
        }
	}
}
