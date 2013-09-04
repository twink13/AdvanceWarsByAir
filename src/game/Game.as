package game
{
	import com.twink.tools.game.slg.map.MapData2D;
	import com.twink.tools.game.slg.map.MapNodeData2D;
	import com.twink.tools.load.Reader;
	import com.twink.tools.load.ReaderData;
	import com.twink.tools.load.ReaderTypes;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.filesystem.File;
	import flash.system.System;
	import flash.text.TextField;
	
	import controller.map.AwGirdData;
	import controller.config.terrain.TerrainConfigData;

	/**
	 * 维护人：twink 2013-5-6 - 今
	 * <p>
	 * 游戏主环境
	 */
	public class Game extends Sprite
	{
		public static var instance:Game;
		
		public function Game()
		{
			super();
			
			Game.instance = this;
		}
		
		private function onConfigComplete():void
		{
			var map:MapData2D = new MapData2D();
			map.setUp(20, 20);
			
			var list:Array = map.nodeList();
			var size:int = list.length;
			for ( var i:int = 0; i < size; i++ )
			{
				var node:MapNodeData2D = list[i];
				var grid:AwGirdData = new AwGirdData(node);
				
				node.content = grid;
				
				//随机设置一个已有的地形
				//var terrainConfig:TerrainConfigData = Game.instance.system.model.configData.getRandomTerrainConfig();
				//grid.terrainData.typeID = terrainConfig.typeID;
				//trace("terrainConfig.typeID = " + terrainConfig.typeID);
			}
			//Game.instance.map.view.mapUI.openWithMapData(map);
		}
		
		private function onRead($readerData:ReaderData):void
		{
			var content:* = $readerData.contentData.value;
			if ( content is String )
			{
				var arr:Array = content.split("\n");
				//trace(arr);
				for ( var i:int = 0; i < arr.length; i++ )
				{
					arr[i] = arr[i].split("\t");
				}
				//trace(arr);
				arr.shift();
				//this.system.controller.configParser.parseTerrainsConfig(arr);
				
				for ( i = 0; i < 10; i ++ )
				{
					$readerData.url = File.applicationDirectory.nativePath + "/image/terrain/" + arr[0][1] + ".gif";
					//this.system.controller.mainReader.addListener($readerData.url, onRead);
					//this.system.controller.mainReader.read($readerData.url, ReaderTypes.SOURCE_TYPE_LOCAL, ReaderTypes.FILE_TYPE_BMP);
				}
			}
			else
			{
				this.addChild(content as DisplayObject);
			}
		}
	}
}