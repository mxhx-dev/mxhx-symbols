package mxhx.symbols.internal;

import mxhx.symbols.IMXHXClassSymbol;
import mxhx.symbols.IMXHXEventSymbol;

class MXHXEventSymbol implements IMXHXEventSymbol {
	public var name:String;
	public var doc:Null<String>;
	public var file:String;
	public var offsets:{start:Int, end:Int};
	public var type:IMXHXClassSymbol;
	public var meta:Array<{name:String, ?params:Array<String>}>;

	public function new(name:String, type:IMXHXClassSymbol) {
		this.name = name;
		this.type = type;
	}
}
