package mxhx.symbols.internal;

import mxhx.symbols.IMXHXTypeSymbol;

class MXHXTypeSymbol implements IMXHXTypeSymbol {
	public var name:String;
	public var doc:Null<String>;
	public var file:String;
	public var offsets:{start:Int, end:Int};
	public var pack:Array<String>;
	public var qname:String;
	public var module:String;
	public var params:Array<IMXHXTypeSymbol>;
	public var meta:Array<{name:String, ?params:Array<String>}> = [];
	public var isPrivate:Bool = false;

	public function new(name:String, ?pack:Array<String>, ?params:Array<IMXHXTypeSymbol>) {
		this.name = name;
		this.pack = pack != null ? pack : [];
		this.params = params != null ? params : [];
	}
}
