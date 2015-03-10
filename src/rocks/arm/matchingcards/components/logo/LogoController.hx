package rocks.arm.matchingcards.components.logo;

class LogoController extends ComponentController implements IComponentController {

	var _view:LogoView;

	public function new(model:IComponentModel, view:LogoView) {
		super(model, view);
		_view = view;
	}

	override function _onSetupComponentAssetPaths():Void {
		_view.setAssetPaths();
	}
}