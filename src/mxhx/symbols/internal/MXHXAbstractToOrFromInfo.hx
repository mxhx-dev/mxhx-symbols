package mxhx.symbols.internal;

import mxhx.symbols.IMXHXTypeSymbol;
import mxhx.symbols.IMXHXFieldSymbol;

class MXHXAbstractToOrFromInfo implements IMXHXAbstractToOrFromInfo {
	public var field:IMXHXFieldSymbol;
	public var type:IMXHXTypeSymbol;

	public function new(field:IMXHXFieldSymbol, type:IMXHXTypeSymbol) {
		this.field = field;
		this.type = type;
	}
}
