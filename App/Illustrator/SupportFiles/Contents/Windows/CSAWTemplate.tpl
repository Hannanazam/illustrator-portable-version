/*
 * ADOBE SYSTEMS INCORPORATED
 * Copyright 2011 Adobe Systems Incorporated. All Rights Reserved.
 *
 * NOTICE:  Adobe permits you to use, modify, and distribute this file in
 * accordance with the terms of the Adobe license agreement accompanying it.
 * If you have received this file from a source other than Adobe, then your
 * use, modification, or distribution of it requires the prior written
 * permission of Adobe.
 */

package com.adobe.{{LCAPPLICATION}}
{
	import com.adobe.csawlib.{{LCAPPLICATION}}.*;
	import com.adobe.csawlib.*;
	import flash.external.HostObject;
	import flash.filesystem.File;
{{#FOR_EACH_METHODS}}
	import flash.utils.flash_proxy;

	use namespace flash_proxy;
{{/FOR_EACH_METHODS}}

	/**
	* {{CLASSDESCRIPTION}}
	*
	*/
	public class {{CLASSNAME}} extends {{SUPERCLASS}} {
{{#ENUM_ONLY_METHODS}}
 		/**
		 * Enumeration cache
		 */
		private static var _enumCache : CSEnumSharedCache;

		{
			_enumCache = new  CSEnumSharedCache( {{CLASSNAME}}, "{{CLASSNAME}}" );
			CSGlobalCache.getInstance().putItem("com.adobe.{{LCAPPLICATION}}.{{CLASSNAME}}", _enumCache);
		}

		static public function get enumCache() : CSEnumSharedCache
		{
			return _enumCache; // Should have been instantiated in static initializer
		}

		/**
		 * Constructor
		 *
		 * @param enum                 Enumerations value
		 */
		public function {{CLASSNAME}}(ho:HostObject = null, enum : Number = NaN)
		{
			super(ho, enum );
		}
{{/ENUM_ONLY_METHODS}}
{{#ENUM_STATIC_PROPERTIES}}
		/**
		 * {{PROPERTY_DESCRIPTION}}
		 */
		static public function get {{PROPERTY_NAME}}() : {{CLASSNAME}}
		{
			return enumCache.getEnumObject( {{ENUM_VALUE}}, "{{PROPERTY_NAME}}" );
		}
{{#SHOW_LCASE_ENUMS}}
		/** Alias for {{PROPERTY_NAME}}.
		 * {{PROPERTY_DESCRIPTION}}
		 */
		static public function get {{LCASE_PROPERTY_NAME}}() : {{CLASSNAME}}
		{
			return enumCache.getEnumObject( {{ENUM_VALUE}}, "{{PROPERTY_NAME}}" );
		}
{{/SHOW_LCASE_ENUMS}}
{{/ENUM_STATIC_PROPERTIES}}
{{#STATIC_PROPERTIES}}
		/**
		 * {{PROPERTY_DESCRIPTION}}
		 */
		static public function get {{PROPERTY_NAME}} () : {{PROPERTY_TYPE}} {
			return CSHostObject.hostGetStatic("{{CLASSNAME}}", "{{PROPERTY_NAME}}", {{PROPERTY_TYPE}});
		}
{{/STATIC_PROPERTIES}}
{{#RO_PROPERTIES}}
		/**
		 * {{PROPERTY_DESCRIPTION}}
		 */
		public {{OPTIONAL_GET_OVERRIDE}} function get {{PROPERTY_NAME}} () : {{PROPERTY_TYPE}} {
			return hostGet( "{{PROPERTY_NAME}}", {{PROPERTY_TYPE}});
		}
{{/RO_PROPERTIES}}
{{#RW_PROPERTIES}}
		/**
		 * {{PROPERTY_DESCRIPTION}}
		 */
		public {{OPTIONAL_GET_OVERRIDE}} function get {{PROPERTY_NAME}} () : {{PROPERTY_TYPE}} {
			return hostGet( "{{PROPERTY_NAME}}", {{PROPERTY_TYPE}});
		}
		/**
		 * {{PROPERTY_DESCRIPTION}}
		 */
		public {{OPTIONAL_SET_OVERRIDE}} function set {{PROPERTY_NAME}} (value : {{PROPERTY_TYPE}}) : void {
			hostSet( "{{PROPERTY_NAME}}", value );
		}
{{/RW_PROPERTIES}}
{{#METHODS}}
		/**
		 * {{METHOD_DESCRIPTION}}
		 {{#PARAMS}}* @param  {{PARAM_NAME}} ({{PARAM_TYPEINFO}}) {{PARAM_DESCRIPTION}}
		 {{/PARAMS}}
		 */
		public {{OPTIONAL_OVERRIDE}} function {{AS_METHOD_NAME}} (
							{{#PARAMS}} {{PARAM_NAME}}:{{PARAM_TYPEINFO}}{{OPTIONAL_EQUALS}}{{AS_DEFAULT_VALUE}}{{OPTIONAL_COMMA}}
							{{/PARAMS}}) : {{METHOD_RETURN}} {
			var args : Array = [ {{#PARAMS}} {{PARAM_NAME}}{{OPTIONAL_COMMA}} {{/PARAMS}}];
{{#METHOD_HAS_HOST_DEFAULT_ARGS}}
			var hostDefaultArgs : Array = new Array();
			{{#PARAMS}}{{#PARAM_HAS_DEFAULT_VALUE}}hostDefaultArgs.push({{HOST_DEFAULT_VALUE}}); /*{{PARAM_NAME}}*/
			{{/PARAM_HAS_DEFAULT_VALUE}}{{/PARAMS}}
{{/METHOD_HAS_HOST_DEFAULT_ARGS}}
{{#METHOD_HAS_DEFAULT_ARGS}}
			var csawDefaultArgs : Array = new Array();
			{{#PARAMS}}{{#PARAM_HAS_DEFAULT_VALUE}}csawDefaultArgs.push({{AS_DEFAULT_VALUE}}); /*{{PARAM_NAME}}*/
			{{/PARAM_HAS_DEFAULT_VALUE}}{{/PARAMS}}
			args = replaceDefaultArgs(args, csawDefaultArgs{{#METHOD_HAS_HOST_DEFAULT_ARGS}}, hostDefaultArgs{{/METHOD_HAS_HOST_DEFAULT_ARGS}});
{{/METHOD_HAS_DEFAULT_ARGS}}
			{{RETURN_DECL}} hostCall( "{{METHOD_NAME}}", ( {{MOD_METHOD_RETURN}} ), args );
		}
{{/METHODS}}
{{#LEN_METHODS}}
		/**
		 * The number of objects in the collection.
		 *
		 */
		public function get length () : Number {
			return hostGet( "length", Number);
		}
{{/LEN_METHODS}}
{{#INDEX_METHODS}}{{#SUPPORTS_NAME}}
		/**
		 * Get the first element in the collection with the provided name.
		 *
		 * @param name
		 */
		public function getByName (nameParam : String) : {{METHOD_RETURN}} {
				var args : Array = [nameParam];

			return hostCall( "getByName",  ( {{MOD_METHOD_RETURN}} ), args );
		}
{{/SUPPORTS_NAME}}{{#SUPPORTS_INDEX}}
		/**
		 * Get the element in the collection at the provided index.
		 *
		 * @param name
		 */
		public function index (idx : Number) : {{METHOD_RETURN}} {
			return hostGetIndex( idx,  ( {{MOD_METHOD_RETURN}} ) );
		}
{{/SUPPORTS_INDEX}}{{/INDEX_METHODS}}
{{#FOR_EACH_METHODS}}
		/**
		 * Overriding this allows us to support for each...in
		 */
		override flash_proxy function nextNameIndex(idx:int): int {
			if (idx < this.length) return idx + 1;
			else return 0;
		}
		/**
		 * Overriding this allows us to support for each...in
		 */
	    override flash_proxy function nextValue(index:int):* {
	    	return this.{{FOR_EACH_ACCESSOR}}(index -1);
	    }
{{/FOR_EACH_METHODS}}
	}
}
