package rocks.arm.matchingcards.core.utils;

import js.Browser;

class BrowserUtils {

	public static function getPixelRatio():Float {
		var pixelRatio:Int = (Browser.window.devicePixelRatio <= 2) ? Math.floor(Browser.window.devicePixelRatio) : 2;
		if (isiOS() && (Browser.window.screen.width == 320 && Browser.window.screen.height == 480)) pixelRatio = 1;
		if (pixelRatio < 1) pixelRatio = 1;
		if (isiOS() && pixelRatio > 1 && getiOSVersion()[0] < 8) pixelRatio = 1;
		Console.info("Pixel Ratio: " + pixelRatio);
		return pixelRatio;
	}

	public static function isAndroid():Bool {
		return ~/Android/i.match(Browser.navigator.userAgent);
	}

	public static function isiOS():Bool {
		return ~/(iPad|iPhone|iPod)/i.match(Browser.navigator.userAgent);
	}

	public static function getiOSVersion():Array<Int> {
		var v:EReg = ~/[0-9_]+?[0-9_]+?[0-9_]+/i;
		var matched:Array<Int> = [];
		if (v.match(Browser.navigator.userAgent)) {
			var match:Array<String> = v.matched(0).split("_");
			matched = [for (i in match) Std.parseInt(i)];
		}
		Console.info("iOS v: " + matched);
		return matched;
	}
}