package mxhx.symbols.internal;

import mxhx.symbols.IMXHXEnumFieldSymbol;
import mxhx.symbols.IMXHXTypeSymbol;
import mxhx.symbols.IMXHXEnumSymbol;

class MXHXEnumSymbol extends MXHXTypeSymbol implements IMXHXEnumSymbol {
	public var fields:Array<IMXHXEnumFieldSymbol>;

	public function new(name:String, ?pack:Array<String>, ?params:Array<IMXHXTypeSymbol>, ?fields:Array<IMXHXEnumFieldSymbol>) {
		super(name, pack, params);
		this.fields = fields != null ? fields : [];
	}
}
