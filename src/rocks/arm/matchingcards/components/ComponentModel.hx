package rocks.arm.matchingcards.components;

import rocks.arm.matchingcards.model.IModel;

class ComponentModel implements IComponentModel {

	public var mainModel(default, default):IModel;

	public function new(mm:IModel) {
		mainModel = mm;
	}

	public function init() {}
	public function reset() {}
}