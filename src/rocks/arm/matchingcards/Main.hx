package rocks.arm.matchingcards;

import rocks.arm.matchingcards.signals.ApplicationViewNotification;
import rocks.arm.matchingcards.core.utils.AssetLoader;
import minject.Injector;
import pixi.plugins.app.Application;
import rocks.arm.matchingcards.controller.Controller;
import rocks.arm.matchingcards.comms.CommsController;
import rocks.arm.matchingcards.view.View;
import rocks.arm.matchingcards.model.Model;
import rocks.arm.matchingcards.core.utils.BrowserUtils;
import js.Browser;
import rocks.arm.matchingcards.core.utils.StageProperties;

class Main extends Application {

	public function new() {
		super();
		_setStageProperties();
		_init();
		_setupMVCS();
	}

	function _init() {
		Console.start();

		pixelRatio = StageProperties.pixelRatio;
		backgroundColor = 0x003366;
		onUpdate = _onUpdate;
		onResize = _onResize;
		super.start();
	}

	function _setStageProperties() {
		StageProperties.actualPixelRatio = Browser.window.devicePixelRatio;
		StageProperties.pixelRatio = BrowserUtils.getPixelRatio();
		_setScreenDimensions();
	}

	function _setScreenDimensions() {
		StageProperties.screenWidth = Browser.window.innerWidth;
		StageProperties.screenHeight = Browser.window.innerHeight;
		StageProperties.orientation = (StageProperties.screenWidth > StageProperties.screenHeight) ? StageProperties.LANDSCAPE : StageProperties.PORTRAIT;
	}

	function _setupMVCS() {
		var injector = new Injector();
		var model = new Model();
		var view = new View(_stage);
		var comms = new CommsController(model);
		var controller = new Controller(model, view, injector);
	}

	function _onUpdate(elapsedTime:Float) {
		ApplicationViewNotification.update.dispatch(elapsedTime);
	}

	function _onResize() {
		_setScreenDimensions();
		ApplicationViewNotification.resize.dispatch();
	}

	static function main() {
		var fonts:WebFontConfig = {};
		fonts.google = {};
		fonts.google.families = ["Sigmar One", "Aclonica"];
		fonts.active = init;
		untyped __js__("window").WebFontConfig = fonts;
	}

	static function init() {
		new Main();
	}
}

typedef WebFontConfig = {
	@:optional var google:Google;
	@:optional var active:Void -> Void;
}

typedef Google = {
	@:optional var families:Array<String>;
}