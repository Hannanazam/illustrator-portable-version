//****************************************************************************
// ActionScript Standard Library
// flash.geom.Transform object
//****************************************************************************
import flash.geom.Matrix;
import flash.geom.Rectangle;
import flash.geom.ColorTransform;

intrinsic class flash.geom.Transform
{
	var matrix:Matrix;
	var colorTransform:ColorTransform;
	var concatenatedMatrix:Matrix;
	var concatenatedColorTransform:ColorTransform;
	var pixelBounds:Rectangle;

	function Transform(mc:MovieClip);
}