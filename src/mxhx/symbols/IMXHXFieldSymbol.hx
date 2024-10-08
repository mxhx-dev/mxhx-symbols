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
	An MXHX symbol representing a field declared on a type symbol.
**/
interface IMXHXFieldSymbol extends IMXHXSymbol {
	/**
		The field's owning type.
	**/
	public var parent:IMXHXTypeSymbol;

	/**
		The field's type.
	**/
	public var type:IMXHXTypeSymbol;

	/**
		Indicates whether the field is a method or not.
	**/
	public var isMethod:Bool;

	/**
		Indicates whether the field is public or private.
	**/
	public var isPublic:Bool;

	/**
		Indicates whether the field is static or not.
	**/
	public var isStatic:Bool;

	/**
		Indicates whether the field is readable or not (default or get).
	**/
	public var isReadable:Bool;

	/**
		Indicates whether the field is writable or not (default or set).
	**/
	public var isWritable:Bool;
}
