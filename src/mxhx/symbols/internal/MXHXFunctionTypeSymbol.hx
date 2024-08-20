package mxhx.symbols.internal;

import mxhx.symbols.IMXHXTypeSymbol;

class MXHXFunctionTypeSymbol extends MXHXTypeSymbol implements IMXHXFunctionTypeSymbol {
	public var arguments:Array<IMXHXArgumentSymbol>;
	public var returnType:IMXHXTypeSymbol;

	public function new(name:String, ?arguments:Array<IMXHXArgumentSymbol>, ?returnType:IMXHXTypeSymbol) {
		super(name, null, null);
		this.arguments = arguments != null ? arguments : [];
		this.returnType = returnType;
	}
}
