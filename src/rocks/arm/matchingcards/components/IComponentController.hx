package rocks.arm.matchingcards.components;

interface IComponentController {

	private var _componentModel:IComponentModel;
	private var _componentView:IComponentView;

	private function _setup():Void;
	private function _reset():Void;
}