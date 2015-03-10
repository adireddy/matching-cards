package rocks.arm.matchingcards.components;

import rocks.arm.matchingcards.core.utils.StageProperties;

import pixi.core.display.DisplayObject;
import pixi.core.display.Container;

class ComponentView {

	public var stage:Container;

	var _parentContainer:Container;
	var _container:Container;

	public var name(default, set):String;

	public function new(stage:Container) {
		this.stage = stage;
		_parentContainer= new Container();
		_container = new Container();
		_parentContainer.addChild(_container);
		stage.addChild(_parentContainer);

		_alignContainer();
	}

	function _alignContainer() {
		_container.x = StageProperties.screenX;
	}

	public function show() {
		_parentContainer.addChild(_container);
	}

	public function hide() {
		_parentContainer.removeChild(_container);
	}

	function set_name(name:String):String {
		_container.name = name;
		return this.name = name;
	}

	@:keep public function listAllItems(container:Container) {
		for (item in container.children) trace(item.name);
	}

	@:keep public function getChildByName(name:String):DisplayObject {
		return _container.getChildByName(name);
	}
}