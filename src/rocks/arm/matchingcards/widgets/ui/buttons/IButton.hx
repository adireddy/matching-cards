package rocks.arm.matchingcards.widgets.ui.buttons;

import msignal.Signal;

interface IButton {

	var rollOver:Signal1<Dynamic> = new Signal1(Dynamic);
	var rollOut:Signal1<Dynamic> = new Signal1(Dynamic);
	var clicked:Signal1<Dynamic> = new Signal1(Dynamic);

	function setText(text:String):Void;
	function getButtonId():String;
	function enable():Void;
	function disable():Void;
	function isEnabled():Bool;
}