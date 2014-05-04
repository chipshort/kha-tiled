package;

import kha.Color;
import kha.Configuration;
import kha.Game;
import kha.Loader;
import kha.LoadingScreen;
import kha.Painter;
import kha.tiled.TiledMap;

class Test extends Game {
	var map : TiledMap;
	
	public function new() {
		super("Test", false);
	}
	
	override public function init(): Void {
		Configuration.setScreen(new LoadingScreen());
		Loader.the.loadRoom("test", loadingFinished);
	}
	
	override public function render(painter:Painter):Void
	{
		startRender(painter);
		
		painter.setColor(Color.White); //this is important
		map.render(painter);
		
		endRender(painter);
	}
	
	private function loadingFinished(): Void {
		map = TiledMap.fromAssets("test");
		
		Configuration.setScreen(this);
	}
}
