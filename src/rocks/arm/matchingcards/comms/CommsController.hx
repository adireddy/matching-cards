package rocks.arm.matchingcards.comms;

import rocks.arm.matchingcards.model.Model;
import rocks.arm.matchingcards.model.IModel;

class CommsController implements ICommsController {

	var _model:Model;
	var _responses:Map<String, String>;

	public function new(model:IModel) {
		_model = cast(model, Model);
		_responses = new Map();
	}



	public function reset() {
		_model = null;
		_responses = null;
	}
}