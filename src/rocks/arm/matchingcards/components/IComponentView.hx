package rocks.arm.matchingcards.components;

import pixi.core.display.Container;
import rocks.arm.matchingcards.view.IView;

interface IComponentView extends IView {

	var stage:Container;

	function init():Void;
	function show():Void;
	function hide():Void;
	function reset():Void;
	function setAssetPaths():Void;
}