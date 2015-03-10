package rocks.arm.matchingcards.controller;

import rocks.arm.matchingcards.signals.GameStateNotification;
import minject.Injector;

import rocks.arm.matchingcards.signals.GameSetupNotification;
import rocks.arm.matchingcards.core.utils.AssetLoader;

import rocks.arm.matchingcards.components.logo.LogoController;
import rocks.arm.matchingcards.components.logo.LogoView;

import rocks.arm.matchingcards.components.menu.MenuController;
import rocks.arm.matchingcards.components.menu.MenuView;

import rocks.arm.matchingcards.components.preloader.PreloaderView;
import rocks.arm.matchingcards.components.preloader.PreloaderController;

import rocks.arm.matchingcards.core.utils.StageProperties;

import rocks.arm.matchingcards.model.IModel;
import rocks.arm.matchingcards.view.IView;
import rocks.arm.matchingcards.components.IComponentView;

class Controller implements IController {

	var _model:IModel;
	var _view:IView;
	var _injector:Injector;
	var _componentViews:Map<String, IComponentView>;

	@inject
	public var loader:AssetLoader;

	public function new(model:IModel, view:IView, injector:Injector) {
		_model = model;
		_view = view;
		_injector = injector;
		_init();
	}

	function _init() {
		_injector.mapValue(AssetLoader, new AssetLoader());
		_injector.injectInto(this);

		_componentViews = new Map();
		_model.init();

		_addNotificationListeners();
		_setupLoader();
		_setupComponents();
	}

	function _setupLoader() {
		loader.baseUrl = "assets/";
		loader.pixelRatio = StageProperties.pixelRatio;
		loader.loaded.addOnce(_onLoaded);
	}

	function _addNotificationListeners() {
		GameSetupNotification.preloaderSetupComplete.addOnce(_onPreloaderSetupComplete);
	}

	function _onPreloaderSetupComplete() {
		GameSetupNotification.setupComponentAssetPaths.dispatch();
		loader.start();
	}

	function _onLoaded() {
		GameSetupNotification.componentAssetsLoaded.dispatch();
		GameStateNotification.gameReady.dispatch();
	}

	public function reset() {
		if (_view != null) _view.reset();
		if (_model != null) _model.reset();
		_model = null;
		_view = null;
	}

	function _setupComponents() {
		_setupBackground();
		_setupLogo();
		_setupPreloader();

		GameSetupNotification.preloaderStartSetup.dispatch();
	}

	function _setupPreloader() {
		var view:PreloaderView = new PreloaderView(_view.stage);
		var controller:PreloaderController = new PreloaderController(null, view);
		_injector.injectInto(view);
		_componentViews.set("PreloaderView", view);
	}

	function _setupBackground() {
		var view:MenuView = new MenuView(_view.stage);
		var controller:MenuController = new MenuController(null, view);
		_injector.injectInto(view);
		_componentViews.set("BackgroundView", view);
	}

	function _setupLogo() {
		var view:LogoView = new LogoView(_view.stage);
		var controller:LogoController = new LogoController(null, view);
		_injector.injectInto(view);
		_componentViews.set("LogoView", view);
	}
}