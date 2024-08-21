package mxhx.symbols;

import mxhx.symbols.internal.MXHXInterfaceSymbol;
import mxhx.symbols.IMXHXInterfaceSymbol;
import mxhx.symbols.IMXHXClassSymbol;
import mxhx.symbols.IMXHXAbstractSymbol;
import mxhx.symbols.IMXHXTypeSymbol;
import mxhx.symbols.MXHXSymbolTools;
import mxhx.symbols.internal.MXHXAbstractSymbol;
import mxhx.symbols.internal.MXHXClassSymbol;
import utest.Assert;
import utest.Test;

class MXHXSymbolToolsCanAssignToTest extends Test {
	private var anyType:IMXHXAbstractSymbol;
	private var boolType:IMXHXAbstractSymbol;
	private var dynamicType:IMXHXAbstractSymbol;
	private var eregType:IMXHXClassSymbol;
	private var floatType:IMXHXAbstractSymbol;
	private var intType:IMXHXAbstractSymbol;
	private var stringType:IMXHXClassSymbol;
	private var uintType:IMXHXAbstractSymbol;

	private var customClassType:IMXHXClassSymbol;
	private var customSubclassType:IMXHXClassSymbol;
	private var customInterfaceType:IMXHXInterfaceSymbol;
	private var customExtendingInterfaceType:IMXHXInterfaceSymbol;
	private var customImplementingClassType:IMXHXClassSymbol;
	private var customImplementingSubclassType:IMXHXClassSymbol;
	private var customImplementingClassType2:IMXHXClassSymbol;

	public function setup():Void {
		anyType = new MXHXAbstractSymbol("Any");
		boolType = new MXHXAbstractSymbol("Bool");
		dynamicType = new MXHXAbstractSymbol("Dynamic");
		eregType = new MXHXClassSymbol("EReg");
		floatType = new MXHXAbstractSymbol("Float");
		intType = new MXHXAbstractSymbol("Int");
		stringType = new MXHXClassSymbol("String");
		uintType = new MXHXAbstractSymbol("UInt");

		anyType.from = [dynamicType];
		intType.to = [floatType];
		uintType.from = [intType];
		uintType.to = [intType];
		uintType.meta = [{name: ":transitive"}];

		customClassType = new MXHXClassSymbol("MyClass", ["com", "example"]);
		customSubclassType = new MXHXClassSymbol("MySubclass", ["com", "example"], null, customClassType);

		customInterfaceType = new MXHXInterfaceSymbol("MyInterface", ["com", "example"]);
		customExtendingInterfaceType = new MXHXInterfaceSymbol("MyExtendingInterface", ["com", "example"], null, [customInterfaceType]);

		customImplementingClassType = new MXHXClassSymbol("MyImplementingClass", ["com", "example"], null, null, [customInterfaceType]);
		customImplementingSubclassType = new MXHXClassSymbol("MyImplementingSubclass", ["com", "example"], null, customImplementingClassType);
		customImplementingClassType2 = new MXHXClassSymbol("MyImplementingClass", ["com", "example"], null, null, [customExtendingInterfaceType]);
	}

	public function testAssignToAny():Void {
		Assert.isTrue(MXHXSymbolTools.canAssignTo(anyType, anyType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(boolType, anyType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(dynamicType, anyType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(eregType, anyType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(floatType, anyType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(intType, anyType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(stringType, anyType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(uintType, anyType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customClassType, anyType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customSubclassType, anyType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customInterfaceType, anyType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customExtendingInterfaceType, anyType));
	}

	public function testAssignToBool():Void {
		Assert.isTrue(MXHXSymbolTools.canAssignTo(anyType, boolType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(boolType, boolType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(dynamicType, boolType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(eregType, boolType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(floatType, boolType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(intType, boolType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(stringType, boolType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(uintType, boolType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customClassType, boolType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customSubclassType, boolType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customInterfaceType, boolType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customExtendingInterfaceType, boolType));
	}

	public function testAssignToDynamic():Void {
		Assert.isTrue(MXHXSymbolTools.canAssignTo(anyType, dynamicType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(boolType, dynamicType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(dynamicType, dynamicType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(eregType, dynamicType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(floatType, dynamicType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(intType, dynamicType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(stringType, dynamicType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(uintType, dynamicType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customClassType, dynamicType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customSubclassType, dynamicType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customInterfaceType, dynamicType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customExtendingInterfaceType, dynamicType));
	}

	public function testAssignToEReg():Void {
		Assert.isTrue(MXHXSymbolTools.canAssignTo(anyType, eregType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(boolType, eregType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(dynamicType, eregType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(eregType, eregType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(floatType, eregType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(intType, eregType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(stringType, eregType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(uintType, eregType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customClassType, eregType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customSubclassType, eregType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customInterfaceType, eregType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customExtendingInterfaceType, eregType));
	}

	public function testAssignToFloat():Void {
		Assert.isTrue(MXHXSymbolTools.canAssignTo(anyType, floatType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(boolType, floatType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(dynamicType, floatType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(eregType, floatType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(floatType, floatType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(intType, floatType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(stringType, floatType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(uintType, floatType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customClassType, floatType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customSubclassType, floatType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customInterfaceType, floatType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customExtendingInterfaceType, floatType));
	}

	public function testAssignToInt():Void {
		Assert.isTrue(MXHXSymbolTools.canAssignTo(anyType, intType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(boolType, intType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(dynamicType, intType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(eregType, intType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(floatType, intType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(intType, intType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(stringType, intType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(uintType, intType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customClassType, intType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customSubclassType, intType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customInterfaceType, intType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customExtendingInterfaceType, intType));
	}

	public function testAssignToString():Void {
		Assert.isTrue(MXHXSymbolTools.canAssignTo(anyType, stringType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(boolType, stringType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(dynamicType, stringType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(eregType, stringType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(floatType, stringType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(intType, stringType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(stringType, stringType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(uintType, stringType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customClassType, stringType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customSubclassType, stringType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customInterfaceType, stringType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customExtendingInterfaceType, stringType));
	}

	public function testAssignToUInt():Void {
		Assert.isTrue(MXHXSymbolTools.canAssignTo(anyType, uintType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(boolType, uintType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(dynamicType, uintType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(eregType, uintType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(floatType, uintType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(intType, uintType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(stringType, uintType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(uintType, uintType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customClassType, uintType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customSubclassType, uintType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customInterfaceType, uintType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customExtendingInterfaceType, uintType));
	}

	public function testAssignToCustomClass():Void {
		Assert.isTrue(MXHXSymbolTools.canAssignTo(anyType, customClassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(boolType, customClassType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(dynamicType, customClassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(eregType, customClassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(floatType, customClassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(intType, customClassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(stringType, customClassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(uintType, customClassType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customClassType, customClassType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customSubclassType, customClassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customInterfaceType, customClassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customExtendingInterfaceType, customClassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customImplementingClassType2, customClassType));
	}

	public function testAssignToCustomSubclass():Void {
		Assert.isTrue(MXHXSymbolTools.canAssignTo(anyType, customSubclassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(boolType, customSubclassType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(dynamicType, customSubclassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(eregType, customSubclassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(floatType, customSubclassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(intType, customSubclassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(stringType, customSubclassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(uintType, customSubclassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customClassType, customSubclassType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customSubclassType, customSubclassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customInterfaceType, customSubclassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customExtendingInterfaceType, customSubclassType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customImplementingClassType2, customSubclassType));
	}

	public function testAssignToCustomInterface():Void {
		Assert.isTrue(MXHXSymbolTools.canAssignTo(anyType, customInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(boolType, customInterfaceType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(dynamicType, customInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(eregType, customInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(floatType, customInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(intType, customInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(stringType, customInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(uintType, customInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customClassType, customInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customSubclassType, customInterfaceType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customInterfaceType, customInterfaceType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customExtendingInterfaceType, customInterfaceType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customImplementingClassType, customInterfaceType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customImplementingSubclassType, customInterfaceType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customImplementingClassType2, customInterfaceType));
	}

	public function testAssignToCustomExtendingInterface():Void {
		Assert.isTrue(MXHXSymbolTools.canAssignTo(anyType, customExtendingInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(boolType, customExtendingInterfaceType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(dynamicType, customExtendingInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(eregType, customExtendingInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(floatType, customExtendingInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(intType, customExtendingInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(stringType, customExtendingInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(uintType, customExtendingInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customClassType, customExtendingInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customSubclassType, customExtendingInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customInterfaceType, customExtendingInterfaceType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customExtendingInterfaceType, customExtendingInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customImplementingClassType, customExtendingInterfaceType));
		Assert.isFalse(MXHXSymbolTools.canAssignTo(customImplementingSubclassType, customExtendingInterfaceType));
		Assert.isTrue(MXHXSymbolTools.canAssignTo(customImplementingClassType2, customExtendingInterfaceType));
	}
}
