package rocks.arm.matchingcards.components;

import rocks.arm.matchingcards.model.IModel;

interface IComponentModel extends IModel {

	var mainModel:IModel;

	function init():Void;
	function reset():Void;
}