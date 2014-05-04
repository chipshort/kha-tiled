package kha.tiled.display;
import kha.Painter;
import kha.Rectangle;
import kha.tiled.Layer;
import kha.tiled.TiledMap;
import kha.tiled.Tileset;

/**
 * ...
 * @author Christoph Otter
 */
class KhaRenderer implements Renderer
{
	
	private var map : TiledMap;
	
	public function new()
	{
		
	}
	
	public function setTiledMap(map : TiledMap):Void
	{
		this.map = map;
	}
	
	public function drawLayer(painter : Painter, layer : Layer):Void
	{
		var gidCounter:Int = 0;
		
		if (layer.visible) {
			for (y in 0...map.heightInTiles) {
				for (x in 0...map.widthInTiles) {
					var nextGID = layer.tiles[gidCounter].gid;

					if (nextGID != 0) {
						var destx : Float;
						var desty : Float;

						switch (map.orientation) {
							case TiledMapOrientation.Orthogonal:
								destx = x * map.tileWidth;
								desty = y * map.tileHeight;
							case TiledMapOrientation.Isometric:
								destx = (map.totalWidth + x - y - 1) * map.tileWidth * 0.5; //TODO: test
								desty = (y + x) * map.tileHeight * 0.5;
						}

						var tileset : Tileset = map.getTilesetByGID(nextGID);

						var rect : Rectangle = tileset.getTileRectByGID(nextGID);

						if(map.orientation == TiledMapOrientation.Isometric) { //Why?
							destx += map.totalWidth/2;
						}

						// draw
						painter.drawImage2(tileset.image.texture, rect.x, rect.y, rect.width, rect.height, destx, desty, map.tileWidth, map.tileHeight);
						//bitmapData.copyPixels(tileset.image.texture, rect, point, null, null, true);
					}
					
					gidCounter++;
				}
			}
		}
	}
	
	public function drawImageLayer(painter : Painter, imageLayer : ImageLayer):Void
	{
		painter.drawImage(imageLayer.image.texture, 0, 0);
	}
	
	public function clear(painter : Painter):Void
	{
		
	}
	
}