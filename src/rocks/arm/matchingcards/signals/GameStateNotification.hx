package rocks.arm.matchingcards.signals;

import msignal.Signal;

class GameStateNotification {

	public static var preloading:Signal0 = new Signal0();
	public static var gameReady:Signal0 = new Signal0();

	public static var showSymbolSelection:Signal0 = new Signal0();
	public static var symbolSelectionComplete:Signal0 = new Signal0();

	public static var showReelSelection:Signal0 = new Signal0();
	public static var reelSelectionComplete:Signal0 = new Signal0();

	public static var spinRequestStart:Signal0 = new Signal0();
	public static var spinRequestComplete:Signal0 = new Signal0();

	public static var spinStart:Signal0 = new Signal0();
	public static var spinComplete:Signal0 = new Signal0();
	public static var reelSpinComplete:Signal1<Int> = new Signal1(Int);

	public static var showResults:Signal0 = new Signal0();
	public static var showResultsComplete:Signal0 = new Signal0();

	public static var rebet:Signal0 = new Signal0();
	public static var newGame:Signal0 = new Signal0();

	// Should be moved to separate classes
	public static var enableTicket:Signal0 = new Signal0();
	public static var disableTicket:Signal0 = new Signal0();
	public static var symbolSelected:Signal0 = new Signal0();
	public static var clearSymbolSelected:Signal0 = new Signal0();
}