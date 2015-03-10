package rocks.arm.matchingcards.signals;

import msignal.Signal;

class ApplicationViewNotification {

	public static var update:Signal1<Float> = new Signal1(Float);
	public static var resize:Signal0 = new Signal0();

}