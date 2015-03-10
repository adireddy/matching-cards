package rocks.arm.matchingcards.components;

import rocks.arm.matchingcards.signals.GameSetupNotification;
import rocks.arm.matchingcards.signals.GameStateNotification;

class ComponentController {

	var _componentModel:IComponentModel;
	var _componentView:IComponentView;

	public function new(model:IComponentModel, view:IComponentView) {
		_componentModel = model;
		_componentView = view;

		_addNotificationListeners();
	}

	function _addNotificationListeners() {
		GameSetupNotification.setupComponentAssetPaths.add(_onSetupComponentAssetPaths);
		GameStateNotification.gameReady.add(_onGameReady);
	}

	function _onGameReady() {
		_setup();
	}

	function _setup() {
		if (_componentModel != null) _componentModel.init();
		if (_componentView != null) _componentView.init();
		_addViewListeners();
	}

	function _onSetupComponentAssetPaths() {
		if (_componentView != null) _componentView.setAssetPaths();
	}

	function _reset() {
		if (_componentView != null) _componentView.reset();
		if (_componentModel != null) _componentModel.reset();
	}

	function _addViewListeners() {}
}