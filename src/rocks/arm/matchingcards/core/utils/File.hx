package rocks.arm.matchingcards.core.utils;

class File {

	public static var _list:Array<String> = ["assets/.DS_Store","assets/back.png","assets/cards12.png","assets/cards24.png","assets/cards36.png","assets/cards48.png","assets/cards6.png","assets/icons.json","assets/icons.png","assets/logo.png","assets/@2x/back.png","assets/@2x/cards12.png","assets/@2x/cards24.png","assets/@2x/cards36.png","assets/@2x/cards48.png","assets/@2x/cards6.png","assets/@2x/icons.json","assets/@2x/icons.png","assets/@2x/icons.tps","assets/@2x/logo.png",""];

	public static function exists(val:String):Bool {
		 return (_list.indexOf(val) > -1);
	}
}