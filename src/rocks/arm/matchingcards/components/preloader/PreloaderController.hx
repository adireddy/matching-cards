package rocks.arm.matchingcards.components.preloader;

import rocks.arm.matchingcards.signals.GameStateNotification;
import rocks.arm.matchingcards.signals.ApplicationViewNotification;
import rocks.arm.matchingcards.signals.GameSetupNotification;

class PreloaderController extends ComponentController implements IComponentController {

	var _view:PreloaderView;
	var _assetsTotal:Int = 0;

	public function new(model:IComponentModel, view:PreloaderView) {
		super(model, view);
		_view = view;
		_view.setupComplete.addOnce(_onSetupComplete);
	}

	override function _addNotificationListeners() {
		super._addNotificationListeners();
		GameSetupNotification.preloaderStartSetup.addOnce(_onPreloaderStartSetup);
		ApplicationViewNotification.update.add(_onUpdate);
		ApplicationViewNotification.resize.add(_onResize);
	}

	function _onPreloaderStartSetup() {
		_view.setup();
	}

	override function _onGameReady() {
		super._onGameReady();
		_reset();
	}

	function _onSetupComplete() {
		GameSetupNotification.preloaderSetupComplete.dispatch();
	}

	function _onResize() {
		_view.align();
	}

	override function _reset() {
		super._reset();
		_view = null;

		GameSetupNotification.preloaderStartSetup.remove(_onPreloaderStartSetup);
		ApplicationViewNotification.update.remove(_onUpdate);
		ApplicationViewNotification.resize.remove(_onResize);
	}

	function _onUpdate(elapsedTime:Float) {
		_view.update();
	}
}