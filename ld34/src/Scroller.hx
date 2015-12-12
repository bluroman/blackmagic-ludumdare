
class Scroller {
	var sb : h2d.SpriteBatch;
	public var size : Int;
	
	public static var GLB_SPEED = 1.0;
	public var speed = 1.0;
	public var nb : Int;
	public var originY = 0;
	public var tiles : Array<h2d.Tile> = [];
	public var deck : Array<h2d.Tile>=[];
	
	public function new(size,nb,masterTile,tiles,p){
		sb = new h2d.SpriteBatch(masterTile, p);
		this.size = size;
		this.nb = nb;
		this.tiles = tiles;
		init();
	}
	
	function getTile() {
		if ( deck.length == 0)
			deck = tiles.copy();
		var r = Std.random(deck.length);
		var e = deck[r];
		deck.remove( e );
		return e;
	}
	
	public function init() {
		sb.removeAllElements();
		for ( i in 0...nb ) {
			var r = sb.alloc( getTile() );
			r.x = i * size;
			r.y = originY;
		}
	}
	
	public function update() {
		for ( e in sb.getElements()) {
			e.x -= speed * GLB_SPEED;
			if ( e.x <= -size )
				e.x += size * nb;
		}
	}
}