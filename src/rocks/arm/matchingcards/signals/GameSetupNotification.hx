package rocks.arm.matchingcards.signals;

import msignal.Signal;

class GameSetupNotification {

	public static var preloaderStartSetup:Signal0 = new Signal0();
	public static var preloaderSetupComplete:Signal0 = new Signal0();

	public static var setupComponentAssetPaths:Signal0 = new Signal0();

	public static var componentAssetLoadStart:Signal1<Int> = new Signal1(Int);
	public static var componentAssetLoaded:Signal1<String> = new Signal1(String);
	public static var componentAssetsLoaded:Signal0 = new Signal0();

	public static var assetLoadComplete:Signal1<String> = new Signal1<String>();
}