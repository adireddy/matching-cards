package rocks.arm.matchingcards.core.utils;

import String;
import msignal.Signal;
import pixi.loaders.Loader;

class AssetLoader extends Loader {

	public var fileProgress:Signal0;
	public var loaded:Signal0;

	public var pixelRatio(null, set):Float;

	var _pixelRatioPath:String;

	public function new() {
		super();
		_pixelRatioPath = "";
		pixelRatio = 1;
		fileProgress = new Signal0();
		loaded = new Signal0();
	}

	public function start() {
		load();
		on("complete", _onLoaded);
		on("progress", _onLoadProgress);
	}

	public function addImage(name:String, path:String) {
		if (File.exists(baseUrl + _pixelRatioPath + path)) add(name, _pixelRatioPath + path);
		else add(name, path);
	}

	public function getPath(name:String):String {
		return Reflect.field(resources, name).url;
	}

	public function addSpriteSheet(name:String, path:String) {

	}

	function _onLoadProgress() {
		fileProgress.dispatch();
	}

	function _onLoaded() {
		loaded.dispatch();
	}

	function set_pixelRatio(val:Float):Float {
		if (val > 1) _pixelRatioPath = "@" + val + "x/";
		return pixelRatio = val;
	}
}