package rocks.arm.matchingcards.core.utils;

class StageProperties {

	public static var actualPixelRatio:Float;
	public static var pixelRatio:Float = 1;
	public static var screenWidth:Float = 1024;
	public static var screenHeight:Float = 768;
	public static var bucketWidth:Float = 1024;
	public static var bucketHeight:Float = 768;
	public static var screenX:Float = 0;
	public static var screenY:Float = 0;
	public static var orientation:String;

	public static inline var LANDSCAPE:String = "LANDSCAPE";
	public static inline var PORTRAIT:String = "PORTRAIT";

	public static var bucketOverlapType:String;
	public inline static var BUCKET_OVERLAP_FULL:String = "BUCKET_OVERLAP_FULL";
	public inline static var BUCKET_OVERLAP_HORIZONTAL:String = "BUCKET_OVERLAP_HORIZONTAL";
	public inline static var BUCKET_OVERLAP_VERTICAL:String = "BUCKET_OVERLAP_VERTICAL";
}