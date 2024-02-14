package mxhx.symbols.internal;

import haxe.macro.Expr.MetadataEntry;
import mxhx.symbols.IMXHXArgumentSymbol;
import mxhx.symbols.IMXHXTypeSymbol;

class MXHXArgumentSymbol implements IMXHXArgumentSymbol {
	public var name:String;
	public var doc:Null<String>;
	public var file:String;
	public var offsets:{start:Int, end:Int};
	public var type:IMXHXTypeSymbol;
	public var optional:Bool;
	public var meta:Array<MetadataEntry>;

	public function new(name:String, type:IMXHXTypeSymbol, optional:Bool) {
		this.name = name;
		this.type = type;
		this.optional = optional;
	}
}
