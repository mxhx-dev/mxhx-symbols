package mxhx.symbols.internal;

import mxhx.symbols.IMXHXTypeSymbol;
import mxhx.symbols.IMXHXAbstractSymbol;

class MXHXAbstractSymbol extends MXHXTypeSymbol implements IMXHXAbstractSymbol {
	public var to:Array<IMXHXAbstractToOrFromInfo>;
	public var from:Array<IMXHXAbstractToOrFromInfo>;
	public var type:IMXHXTypeSymbol;
	public var impl:IMXHXClassSymbol;

	public function new(name:String, ?pack:Array<String>, ?params:Array<IMXHXTypeSymbol>, ?type:IMXHXTypeSymbol, ?from:Array<IMXHXAbstractToOrFromInfo>,
			?to:Array<IMXHXAbstractToOrFromInfo>) {
		super(name, pack, params);
		this.type = type;
		this.from = from != null ? from : [];
		this.to = to != null ? to : [];
	}
}
