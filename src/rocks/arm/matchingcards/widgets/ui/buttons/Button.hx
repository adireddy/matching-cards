package rocks.arm.matchingcards.widgets.ui.buttons;

import pixi.geom.Point;
import pixi.display.DisplayObjectContainer;
import pixi.text.Text;
import pixi.InteractionData;
import msignal.Signal.Signal1;
import pixi.display.MovieClip;
import pixi.textures.Texture;
import pixi.display.DisplayObjectContainer;

/**
@example

to create a new Button you need:
@param buttonId:String a unique string to identify your button
@param buttonStateTextures:Array<Texture> an Array of 4 textures each entry in the array is a state of the button:
			0 = up state
			1 = over state
			2 = down state
			3 = disable state
@param buttonLabel:String if you need dynamic text to be displayed in the button then you can specify it here
@param textStyle:TextStyle textStyle object see Pixi documentation for detail.
*/

class Button extends DisplayObjectContainer implements IButton {

	public var rollOver:Signal1<Dynamic> = new Signal1(Dynamic);
	public var rollOut:Signal1<Dynamic> = new Signal1(Dynamic);
	public var clicked:Signal1<Dynamic> = new Signal1(Dynamic);

	private var _upFrame:Int = 0;
	private var _overFrame:Int = 1;
	private var _downFrame:Int = 2;
	private var _disableFrame:Int = 3;

	private var _buttonFrames:MovieClip;
	private var _buttonLabel:String;
	private var _textStyle:TextStyle;
	private var _textField:Text;
	private var _id:String;
	private var _enabled:Bool = true;

	public function new(buttonId:String, buttonStateTextures:Array<Texture>, ?buttonLabel:String, ?textStyle:TextStyle, ?labelPositionShift:Point) {
		super();

		_id = buttonId;

		_buttonFrames = new MovieClip(buttonStateTextures);
		addChild(_buttonFrames);
		_setup();

		if (cast buttonLabel) {
			_buttonLabel = buttonLabel;

			if (cast textStyle) {
				_textStyle = textStyle;
			}
			else {
				_textStyle = { font: "12px Arial", fill: "#000000", align: "center" }
			}
			_textField = new Text(_buttonLabel, _textStyle);
			_textField.name = "label";
			_textField.anchor.set(0.5, 0.5);

			var labelXShift:Float = 0;
			var labelYShift:Float = 0;

			if (cast labelPositionShift) {
				labelXShift = labelPositionShift.x;
				labelYShift = labelPositionShift.y;
			}
			_textField.x = Math.floor(_buttonFrames.width * .5 + labelXShift);
			_textField.y = Math.floor(_buttonFrames.height * .5 + labelYShift);
			addChild(_textField);
		}

		_showState(_upFrame);
	}

	private function _setup():Void {
		interactive = true;
		buttonMode = true;

		tap = _touchEndHandler;
		//touchend = _touchEndHandler;
		touchstart = _touchStartHandler;
		touchendoutside = _touchOutSideHandler;
		mouseover = _mouseOverHandler;
		mouseout = _mouseOutHandler;
		mousedown = _mouseDownHandler;
		mouseup = _mouseUpHandler;
	}

	private function _mouseOverHandler(event:InteractionData):Void {
		_showState(_overFrame);
		_dispatchHover();
	}

	private function _mouseDownHandler(event:InteractionData):Void {
		_showState(_downFrame);
	}

	private function _mouseUpHandler(event:InteractionData):Void {
		_showState(_upFrame);
	}

	private function _mouseOutHandler(event:InteractionData):Void {
		_showState(_upFrame);
		_dispatchOut();
	}

	private function _touchStartHandler(event:InteractionData):Void {
		_showState(_overFrame);
		_dispatchHover();
	}

	private function _touchEndHandler(event:InteractionData):Void {
		_showState(_overFrame);
		_dispatchClick();
	}

	private function _touchOutSideHandler(event:InteractionData):Void {
		_showState(_upFrame);
		_dispatchOut();
	}

	private function _dispatchOut():Void {
		rollOut.dispatch(this);
	}

	private function _dispatchHover():Void {
		rollOver.dispatch(this);
	}

	private function _dispatchClick():Void {
		clicked.dispatch(this);
	}

	private function _showState(state:Int):Void {
		_buttonFrames.gotoAndStop(state);
	}

	public function getButtonId():String {
		return _id;
	}

	public function setText(text:String):Void {
		_textField.setText(text);
	}

	public function enable():Void {
		_enabled = true;

		interactive = true;
		buttonMode = true;

		_showState(_upFrame);
	}

	public function disable():Void {
		_enabled = false;

		interactive = false;
		buttonMode = false;

		_showState(_disableFrame);
	}

	@:keep public function isEnabled():Bool {
		return interactive;
	}
}