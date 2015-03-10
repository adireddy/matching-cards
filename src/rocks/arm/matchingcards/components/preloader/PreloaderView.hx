package rocks.arm.matchingcards.components.preloader;

import rocks.arm.matchingcards.core.utils.AssetLoader;
import pixi.text.Text;
import pixi.core.graphics.Graphics;
import pixi.core.display.Container;
import rocks.arm.matchingcards.core.utils.StageProperties;
import pixi.core.sprites.Sprite;
import msignal.Signal;

class PreloaderView extends ComponentView implements IComponentView {

	var _loadCount:Int;
	var _bg:Sprite;
	var _logo:Sprite;
	var _flower:Sprite;

	var _loadingBar:Graphics;
	var _loadingBarBG:Graphics;
	var _loadingText:Text;
	var _titleText:Text;

	public var setupComplete:Signal0;

	@inject
	public var loader:AssetLoader;

	public function new(stage:Container) {
		super(stage);
		_container.name = "preloader";
		_loadCount = 0;
		setupComplete = new Signal0();
	}

	public function setup() {
		_createLoadingBar();
		_createLoadingAndTitleText();
		setupComplete.dispatch();
	}

	function _createLoadingBar() {
		_loadingBarBG = new Graphics();
		_loadingBarBG.beginFill(0xFFFFFF);
		_loadingBarBG.drawRect(0, 0, 204, 34);
		_loadingBarBG.endFill();

		_loadingBar = new Graphics();
		_loadingBar.beginFill(0x088A29);
		_loadingBar.drawRect(0, 0, 200, 30);
		_loadingBar.endFill();

		_container.addChild(_loadingBarBG);
		_container.addChild(_loadingBar);

		_loadingBar.x = _loadingBar.y = 2;
		_container.x = (StageProperties.screenWidth - _loadingBar.width) / 2;
		_container.y = (StageProperties.screenHeight - _loadingBar.height) / 2;
	}

	function _createLoadingAndTitleText() {
		_loadingText = new Text("LOADING", { font:"24px Aclonica", fill:"#FFFFFF" });
		_loadingText.anchor.set(0.5, 0.5);
		stage.addChild(_loadingText);
		_loadingText.x = StageProperties.screenWidth / 2 + 2;
		_loadingText.y = StageProperties.screenHeight / 2 - 30;
		_loadingBar.scale.x = 0.02;

		_titleText = new Text("", { font:"60px Sigmar One", fill:"#FFFFFF" });//Matching Cards
		_titleText.anchor.set(0.5, 0.5);
		stage.addChild(_titleText);
		_titleText.x = StageProperties.screenWidth / 2;
		_titleText.y = StageProperties.screenY + 50;
	}

	public function update() {
		_loadingBar.scale.x = loader.progress / 100;
	}

	public function reset() {
		_container.removeChildren();
		stage.removeChild(_container);
		stage.removeChild(_loadingText);
		stage.removeChild(_titleText);
	}

	public function init() {}
	public function setAssetPaths() {}
	public function align() {}
}