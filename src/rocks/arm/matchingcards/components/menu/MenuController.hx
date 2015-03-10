package rocks.arm.matchingcards.components.menu;

import rocks.arm.matchingcards.signals.ApplicationViewNotification;
import rocks.arm.matchingcards.signals.GameStateNotification;

class MenuController extends ComponentController {

	var _view:MenuView;

	public function new(model:IComponentModel, view:MenuView) {
		super(model, view);
		_view = view;
	}

	override function _addNotificationListeners() {
		super._addNotificationListeners();
		ApplicationViewNotification.resize.add(_onResize);
	}

	function _onResize() {
		_view.align();
	}
}