package rocks.arm.matchingcards.core.utils;

import rocks.arm.matchingcards.core.utils.GameProperties;
import gamesys.common.CurrencyFormatter;
import gamesys.common.Common;

class CurrencyFormat {

	public static function format(amount:Float, ?trailinZeros:Bool = false, ?splitThousands:Bool = false, ?subUnits:Bool = true):String {
		var format:CurrencyConfiguration = {};
		format.addTrailingZeros = trailinZeros;
		format.useSubUnits = subUnits;
		format.splitThousands = splitThousands;

		return Common.currencyFormatter.format(amount, GameProperties.currency, GameProperties.playMode, format);
	}
}