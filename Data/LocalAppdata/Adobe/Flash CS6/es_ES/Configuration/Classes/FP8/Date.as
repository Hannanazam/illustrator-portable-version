//****************************************************************************
// ActionScript Standard Library
// Date object
//****************************************************************************

intrinsic class Date
{
	function Date(yearOrTimevalue:Number,month:Number,date:Number,hour:Number,minute:Number,second:Number,millisecond:Number);

	static function UTC(year:Number,month:Number,date:Number,
                        hour:Number,minute:Number,second:Number,millisecond:Number):Number;

	function getDate():Number;
	function getDay():Number;
	function getFullYear():Number;
	function getHours():Number;
	function getMilliseconds():Number;
	function getMinutes():Number;
	function getMonth():Number;
	function getSeconds():Number;
	function getTime():Number;
	function getTimezoneOffset():Number;
	function getUTCDate():Number;
	function getUTCDay():Number;
	function getUTCFullYear():Number;
	function getUTCHours():Number;
	function getUTCMilliseconds():Number;
	function getUTCMinutes():Number;
	function getUTCMonth():Number;
	function getUTCSeconds():Number;
	function getUTCYear():Number;
	function getYear():Number;
	function setDate(date:Number):Number;
	function setFullYear(year:Number, month:Number, date:Number):Number;
	function setHours(hour:Number):Number;
	function setMilliseconds(millisecond:Number):Number;
	function setMinutes(minute:Number):Number;
	function setMonth(month:Number, date:Number):Number;
	function setSeconds(second:Number):Number;
	function setTime(millisecond:Number):Number;
	function setUTCDate(date:Number):Number;
	function setUTCFullYear(year:Number, month:Number, date:Number):Number;
	function setUTCHours(hour:Number, minute:Number, second:Number, millisecond:Number):Number;
	function setUTCMilliseconds(millisecond:Number):Number;
	function setUTCMinutes(minute:Number, second:Number, millisecond:Number):Number;
	function setUTCMonth(month:Number, date:Number):Number;
	function setUTCSeconds(second:Number, millisecond:Number):Number;
	function setYear(year:Number):Number;
	function toString():String;
	function valueOf():Number;

	// Mobile specific
	function getLocaleLongDate():String;
	function getLocaleShortDate():String;
	function getLocaleTime():String;
}