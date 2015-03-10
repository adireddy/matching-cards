package rocks.arm.matchingcards.view;

import pixi.core.display.Container;

interface IView {

	var stage(default, null):Container;

	function reset():Void;
}