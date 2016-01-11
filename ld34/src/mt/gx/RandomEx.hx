package mt.gx;	
/**
 * ...
 * @author de
 */
class RandomEx {
	
	public static inline function randI( n : Int)
	{
		return Std.random( n );
	}
	
	public static inline function randF() : Float
	{
		return Math.random();
	}
	
	public static inline function randB() : Bool
	{
		return (randI(1024) & 2) == 1;
	}
	
	public static inline function rf(f : Float) : Float
	{
		return Math.random() * f ;
	}
	
	//fast start
	public static function SqrtFilter( f : Float ) : Float
	{
		return Math.sqrt(f);
	}
	
	//slow start
	public static function SqrFilter( f : Float ) : Float
	{
		return f * f;
	}
	
	//very linear early then very slow end
	public static function SinFilter( f : Float ) : Float
	{
		return Math.sin( f * Math.PI / 2 );
	}
	
	//very steep early then grows linearly
	public static  function CosFilter( f : Float ) : Float
	{
		return 1 - Math.cos(f * Math.PI * 0.5);
	}

	public static inline function randFilteredI( n : Int , filter : Float->Float ) : Int
	{
		var i = Std.int( filter( randF()) * (n - 1) + 0.5 );
		i = MathEx.clampi(i, 0, n - 1);
		return i;
	}
	
}