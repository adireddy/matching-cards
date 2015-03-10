import sys.io.FileOutput;
import sys.FileSystem;
import sys.io.File;

class Assets {

	var folders:Array<String> = [];
	var files:Array<String> = [];

	var _assetsFile:FileOutput;

	public function new() {
		_assetsFile = File.write("src/rocks/arm/matchingcards/core/utils/File.hx", false);
		_assetsFile.writeString("package rocks.arm.matchingcards.core.utils;\n\n");
		_assetsFile.writeString("class File {\n\n");

		_assetsFile.writeString("\tpublic static var _list:Array<String> = [");

		_listFiles("assets");

		_assetsFile.writeString("\"\"];");

		_assetsFile.writeString("\n\n\tpublic static function exists(val:String):Bool {\n");
		_assetsFile.writeString("\t\t return (_list.indexOf(val) > -1);\n");
		_assetsFile.writeString("\t}");

		_assetsFile.writeString("\n}");

		_assetsFile.close();
	}

	function _listFiles(name:String) {
		var files = FileSystem.readDirectory(name);
		for (f in files) {
			if (FileSystem.isDirectory(name + "/" + f)) folders.push(name + "/" + f);
			else _assetsFile.writeString("\"" + name + "/" + f + "\",");

			//_assetsFile.writeString("\tpublic static var " + _variablize(name + "/" + f) + " = \"" + name + "/" + f + "\";\n");
		}

		if(folders.length > 0) {
			_listFiles(folders.shift());
		}
	}

	function _variablize(name:String):String {
		name = name.split("/").join("_");
		name = name.split("-").join("_");
		name = name.split("x").join("_");
		name = name.split(".").join("_");
		return name;
	}

	static function main() {
		new Assets();
	}
}