package rocks.arm.matchingcards.model;


class Model implements IModel {

	public var balance(default, set):String;
	public var currentCoinSize(default, set):String;

	public function new() {

	}

	public function init() {


	}

	function set_balance(val:String):String {
		if (Std.parseFloat(val) < 0) val = "0";
		return balance = val;
	}

	function set_currentCoinSize(val:String):String {
		if (Std.parseFloat(val) < 0) val = "0";
		return currentCoinSize = val;
	}


	public function reset() {
		init();
	}
}