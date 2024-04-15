package mxhx.symbols.internal;

import mxhx.symbols.IMXHXArgumentSymbol;
import mxhx.symbols.IMXHXEnumSymbol;
import mxhx.symbols.IMXHXEnumFieldSymbol;

class MXHXEnumFieldSymbol implements IMXHXEnumFieldSymbol {
	public var name:String;
	public var doc:Null<String>;
	public var file:String;
	public var offsets:{start:Int, end:Int};
	public var parent:IMXHXEnumSymbol;
	public var args:Array<IMXHXArgumentSymbol>;
	public var meta:Array<{name:String, ?params:Array<String>}>;
	public var inlineExpr:Null<String>;

	public function new(name:String, ?parent:IMXHXEnumSymbol, ?args:Array<IMXHXArgumentSymbol>) {
		this.name = name;
		this.parent = parent;
		this.args = args != null ? args : [];
	}
}
