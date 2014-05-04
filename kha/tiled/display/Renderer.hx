package kha.tiled.display;
import kha.Painter;

interface Renderer {
	public function setTiledMap(map:TiledMap):Void;
	public function drawLayer(painter : Painter, layer:Layer):Void;
	public function drawImageLayer(painter : Painter, imageLayer:ImageLayer):Void;
	public function clear(painter : Painter):Void;
}