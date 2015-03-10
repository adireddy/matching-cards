package rocks.arm.matchingcards.view;

import pixi.core.display.Container;

class View implements IView {

    public var stage(default, null):Container;

    public function new(stage:Container) {
        this.stage = stage;
    }

    public function reset() {
        stage = null;
    }
}