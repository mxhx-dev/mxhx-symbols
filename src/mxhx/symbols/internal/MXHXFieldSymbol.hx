package mxhx.symbols.internal;

import mxhx.symbols.IMXHXTypeSymbol;
import mxhx.symbols.IMXHXFieldSymbol;

class MXHXFieldSymbol implements IMXHXFieldSymbol {
	public var parent:IMXHXTypeSymbol;
	public var name:String;
	public var doc:Null<String>;
	public var file:String;
	public var offsets:{start:Int, end:Int};
	public var type:IMXHXTypeSymbol;
	public var isMethod:Bool;
	public var isPublic:Bool;
	public var isStatic:Bool;
	public var isReadable:Bool;
	public var isWritable:Bool;
	public var meta:Array<{name:String, ?params:Array<String>}>;

	public function new(name:String, ?parent:IMXHXTypeSymbol, ?type:IMXHXTypeSymbol, isMethod:Bool = false, isPublic:Bool = true, isStatic:Bool = false) {
		this.name = name;
		this.parent = parent;
		this.type = type;
		this.isMethod = isMethod;
		this.isPublic = isPublic;
		this.isStatic = isStatic;
	}
}
