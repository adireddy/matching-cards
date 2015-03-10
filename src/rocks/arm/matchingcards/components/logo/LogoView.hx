package rocks.arm.matchingcards.components.logo;

import rocks.arm.matchingcards.core.utils.StageProperties;
import pixi.core.sprites.Sprite;
import pixi.core.display.Container;

class LogoView extends ComponentView implements IComponentView {

	var _logo:Sprite;

	public function new(stage:Container) {
		super(stage);
		_container.name = "logo";
	}

	public function setAssetPaths() {
		//_loader.addSpriteToLoad(LogoAssets.LOGO);
	}

	public function init() {

	}

	public function reset() {
		_container.removeChild(_logo);
		_logo = null;
	}
}