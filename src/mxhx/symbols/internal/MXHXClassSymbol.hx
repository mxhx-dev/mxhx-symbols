package mxhx.symbols.internal;

import mxhx.symbols.IMXHXTypeSymbol;
import mxhx.symbols.IMXHXEventSymbol;
import mxhx.symbols.IMXHXFieldSymbol;
import mxhx.symbols.IMXHXInterfaceSymbol;
import mxhx.symbols.IMXHXClassSymbol;

class MXHXClassSymbol extends MXHXTypeSymbol implements IMXHXClassSymbol {
	public var superClass:IMXHXClassSymbol;
	public var interfaces:Array<IMXHXInterfaceSymbol>;
	public var fields:Array<IMXHXFieldSymbol>;
	public var events:Array<IMXHXEventSymbol>;
	public var defaultProperty:String;

	public function new(name:String, ?pack:Array<String>, ?params:Array<IMXHXTypeSymbol>, ?superClass:IMXHXClassSymbol,
			?interfaces:Array<IMXHXInterfaceSymbol>, ?fields:Array<IMXHXFieldSymbol>, ?events:Array<IMXHXEventSymbol>, ?defaultProperty:String) {
		super(name, pack, params);
		this.superClass = superClass;
		this.interfaces = interfaces != null ? interfaces : [];
		this.fields = fields != null ? fields : [];
		this.events = events != null ? events : [];
		this.defaultProperty = defaultProperty;
	}
}
