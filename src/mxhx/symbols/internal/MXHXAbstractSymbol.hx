package mxhx.symbols.internal;

import mxhx.symbols.IMXHXTypeSymbol;
import mxhx.symbols.IMXHXAbstractSymbol;

class MXHXAbstractSymbol extends MXHXTypeSymbol implements IMXHXAbstractSymbol {
	public var from:Array<IMXHXTypeSymbol>;

	public function new(name:String, ?pack:Array<String>, ?params:Array<IMXHXTypeSymbol>, ?from:Array<IMXHXTypeSymbol>) {
		super(name, pack, params);
		this.from = from != null ? from : [];
	}
}
