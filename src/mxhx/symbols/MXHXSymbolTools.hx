/*
	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
 */

package mxhx.symbols;

/**
	Utility functions for working with MXHX symbols.
**/
class MXHXSymbolTools {
	public static function resolveFieldByName(classSymbol:IMXHXClassSymbol, fieldName:String):IMXHXFieldSymbol {
		var current = classSymbol;
		while (current != null) {
			var resolved = Lambda.find(current.fields, field -> field.name == fieldName);
			if (resolved != null) {
				return resolved;
			}
			current = current.superClass;
		}
		return null;
	}

	public static function resolveEventByName(classSymbol:IMXHXClassSymbol, eventName:String):IMXHXEventSymbol {
		var current = classSymbol;
		while (current != null) {
			var resolved = Lambda.find(current.events, event -> event.name == eventName);
			if (resolved != null) {
				return resolved;
			}
			current = current.superClass;
		}
		return null;
	}

	public static function getUnifiedType(t1:IMXHXTypeSymbol, t2:IMXHXTypeSymbol):IMXHXTypeSymbol {
		if (t1 == null) {
			return t2;
		} else if (t2 == null) {
			return t1;
		}
		var current1 = t1;
		while (current1 != null) {
			var current2 = t2;
			while (current2 != null) {
				if (current2.qname == current1.qname) {
					return current1;
				}
				if ((current2 is IMXHXClassSymbol)) {
					var class2:IMXHXClassSymbol = cast current2;
					current2 = class2.superClass;
				} else {
					current2 = null;
				}
			}
			if ((current1 is IMXHXClassSymbol)) {
				var class1:IMXHXClassSymbol = cast current1;
				current1 = class1.superClass;
			} else {
				current1 = null;
			}
		}
		return null;
	}

	public static function canAssignTo(fromType:IMXHXTypeSymbol, toType:IMXHXTypeSymbol):Bool {
		if (fromType == null || toType == null) {
			return false;
		}
		if (fromType == toType) {
			return true;
		}
		if ((toType.name == "Any" || toType.name == "Dynamic") && toType.pack.length == 0) {
			return true;
		}
		if (toType.name == "Null") {
			if (fromType.name == "Null") {
				if (canAssignTo(fromType.params[0], toType.params[0])) {
					return true;
				}
			} else if (canAssignTo(fromType, toType.params[0])) {
				return true;
			}
		}
		if (MXHXSymbolTools.typeSymbolExtendsOrImplements(fromType, toType)) {
			return true;
		}
		if (fromType.name == toType.name) {
			if (toType.params.length > 0 && fromType.params.length == 0) {
				return true;
			}
			var paramsMatch = true;
			for (i in 0...toType.params.length) {
				var toParam = toType.params[i];
				var fromParam = fromType.params[i];
				if (toParam != null && fromParam != null) {
					paramsMatch = false;
					break;
				}
			}
			return paramsMatch;
		}
		return false;
	}

	public static function classSymbolExtends(classSymbol:IMXHXClassSymbol, possibleSuperClass:IMXHXClassSymbol):Bool {
		var currentClassSymbol = classSymbol.superClass;
		while (currentClassSymbol != null) {
			if (currentClassSymbol == possibleSuperClass) {
				return true;
			}
			currentClassSymbol = currentClassSymbol.superClass;
		}
		return false;
	}

	public static function typeSymbolImplements(typeSymbol:IMXHXTypeSymbol, possibleSuperInterface:IMXHXInterfaceSymbol):Bool {
		if ((typeSymbol is IMXHXClassSymbol)) {
			var classSymbol:IMXHXClassSymbol = cast typeSymbol;
			var currentClassSymbol = classSymbol;
			while (currentClassSymbol != null) {
				if (currentClassSymbol.interfaces.indexOf(possibleSuperInterface) != -1) {
					return true;
				}
				currentClassSymbol = currentClassSymbol.superClass;
			}
		}
		if ((typeSymbol is IMXHXInterfaceSymbol)) {
			var interfaceSymbol:IMXHXInterfaceSymbol = cast typeSymbol;
			var interfacesToSearch = [interfaceSymbol];
			while (interfacesToSearch.length > 0) {
				var currentInterfaceSymbol = interfacesToSearch.shift();
				if (currentInterfaceSymbol.interfaces.indexOf(possibleSuperInterface) != -1) {
					return true;
				}
				interfacesToSearch = interfacesToSearch.concat(currentInterfaceSymbol.interfaces);
			}
		}
		return false;
	}

	public static function typeSymbolExtendsOrImplements(typeSymbol:IMXHXTypeSymbol, possibleSuperClassOrInterface:IMXHXTypeSymbol):Bool {
		if ((typeSymbol is IMXHXClassSymbol) && (possibleSuperClassOrInterface is IMXHXClassSymbol)) {
			return classSymbolExtends(cast typeSymbol, cast possibleSuperClassOrInterface);
		}
		if ((possibleSuperClassOrInterface is IMXHXInterfaceSymbol)) {
			return typeSymbolImplements(typeSymbol, cast possibleSuperClassOrInterface);
		}
		return false;
	}
}
