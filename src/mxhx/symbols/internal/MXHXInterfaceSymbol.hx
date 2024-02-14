package mxhx.symbols.internal;

import mxhx.symbols.IMXHXTypeSymbol;
import mxhx.symbols.IMXHXEventSymbol;
import mxhx.symbols.IMXHXFieldSymbol;
import mxhx.symbols.IMXHXInterfaceSymbol;

class MXHXInterfaceSymbol extends MXHXTypeSymbol implements IMXHXInterfaceSymbol {
	public var interfaces:Array<IMXHXInterfaceSymbol>;
	public var fields:Array<IMXHXFieldSymbol>;

	public function new(name:String, ?pack:Array<String>, ?params:Array<IMXHXTypeSymbol>, ?interfaces:Array<IMXHXInterfaceSymbol>,
			?fields:Array<IMXHXFieldSymbol>) {
		super(name, pack, params);
		this.interfaces = interfaces != null ? interfaces : [];
		this.fields = fields != null ? fields : [];
	}
}
