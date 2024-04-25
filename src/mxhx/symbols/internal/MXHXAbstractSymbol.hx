package mxhx.symbols.internal;

import mxhx.symbols.IMXHXTypeSymbol;
import mxhx.symbols.IMXHXAbstractSymbol;

class MXHXAbstractSymbol extends MXHXTypeSymbol implements IMXHXAbstractSymbol {
	public var to:Array<IMXHXTypeSymbol>;
	public var from:Array<IMXHXTypeSymbol>;
	public var type:IMXHXTypeSymbol;

	public function new(name:String, ?pack:Array<String>, ?params:Array<IMXHXTypeSymbol>, ?type:IMXHXTypeSymbol, ?from:Array<IMXHXTypeSymbol>,
			?to:Array<IMXHXTypeSymbol>) {
		super(name, pack, params);
		this.type = type;
		this.from = from != null ? from : [];
		this.to = to != null ? to : [];
	}
}
