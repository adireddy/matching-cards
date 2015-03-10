package rocks.arm.matchingcards.components.menu;

import pixi.core.textures.Texture;
import rocks.arm.matchingcards.core.utils.AssetLoader;
import pixi.core.display.Container;
import rocks.arm.matchingcards.core.utils.StageProperties;
import pixi.core.sprites.Sprite;

class MenuView extends ComponentView implements IComponentView {

	@inject
	public var loader:AssetLoader;

	var _cards6:Sprite;
	var _cards12:Sprite;
	var _cards24:Sprite;
	var _cards36:Sprite;
	var _cards48:Sprite;

	public function new(stage:Container) {
		super(stage);
		_container.name = "menu";
	}

	public function setAssetPaths() {
		loader.addImage("cards6", "cards6.png");
		loader.addImage("cards12", "cards12.png");
		loader.addImage("cards24", "cards24.png");
		loader.addImage("cards36", "cards36.png");
		loader.addImage("cards48", "cards48.png");
	}

	public function init() {
		_cards6 = _addMenuItem("cards6");
		_cards12 = _addMenuItem("cards12");
		_cards12.position.y = _cards6.y + _cards6.height + 10;
		_cards24 = _addMenuItem("cards24");
		_cards24.position.y = _cards12.y + _cards12.height + 10;
		_cards36 = _addMenuItem("cards36");
		_cards36.position.y = _cards24.y + _cards24.height + 10;
		_cards48 = _addMenuItem("cards48");
		_cards48.position.y = _cards36.y + _cards36.height + 10;
		align();
	}

	function _addMenuItem(type:String):Sprite {
		var menuItem:Sprite = new Sprite(Texture.fromImage(loader.getPath(type)));
		_container.addChild(menuItem);
		return menuItem;
	}

	public function reset() {
		_container.removeChildren();
	}

	public function align() {
		_container.position.set((StageProperties.screenWidth - _container.width) / 2, (StageProperties.screenHeight - _container.height) / 2);
	}
}