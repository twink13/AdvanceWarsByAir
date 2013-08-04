package game
{
	import com.twink.tools.air.file.FileReader;
	import com.twink.tools.game.slg.map.MapData2D;
	import com.twink.tools.game.slg.map.MapNodeData2D;
	import com.twink.tools.load.ReaderData;
	import com.twink.tools.load.ReaderTypes;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.filesystem.File;
	import flash.system.System;
	import flash.text.TextField;
	
	import game.system.model.map.AwGirdData;
	import game.system.GameSystem;

	/**
	 * 维护人：twink 2013-5-6 - 今
	 * <p>
	 * 游戏主环境
	 */
	public class Game extends Sprite
	{
		public static var instance:Game;
		
		//游戏系统相关
		public var system:GameSystem = new GameSystem();
		
		
		private var _fileReader:FileReader = new FileReader();//加载器
		
		public function Game()
		{
			super();
			
			Game.instance = this;
		}
		
		/**
		 * 总初始化接口
		 * 
		 */		
		public function init():void
		{
			this.system.init();
		}
		
		public function loadConfig():void
		{
			//测试加载配置文件
			var url:String = File.applicationDirectory.nativePath + "/config/terrains.txt";
			this.system.controller.mainReader.addListener(url, onRead);
			this.system.controller.mainReader.read(url, ReaderTypes.SOURCE_TYPE_LOCAL, ReaderTypes.FILE_TYPE_TXT);
		}
		
		/**
		 * 游戏启动入口
		 * 
		 */		
		public function startGame():void
		{
			var map:MapData2D = new MapData2D();
			map.setUp(10, 10);
			
			var list:Array = map.nodeList();
			var size:int = list.length;
			for ( var i:int = 0; i < size; i++ )
			{
				var node:MapNodeData2D = list[i];
				var grid:AwGirdData = new AwGirdData(node);
				
				node.content = grid;
				
				//随机设置一个已有的地形
				grid.terrainData.typeID = Game.instance.system.model.configData.getRandomTerrainConfig().typeID;
			}
			
//			//测试加载图片资源
//			url = File.applicationDirectory.nativePath + "/image/terrain/" + "croad" + ".gif";
//			_fileReader.addListener(url, onRead);
//			_fileReader.read(url);
		}
		
		private function onRead($readerData:ReaderData):void
		{
			var content:* = $readerData.contentData.value
			this.system.controller.mainReader.removeListener($readerData.url, onRead);
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
				this.system.controller.configParser.parseTerrainsConfig(arr);
				
				for ( i = 0; i < 10; i ++ )
				{
					$readerData.url = File.applicationDirectory.nativePath + "/image/terrain/" + arr[0][1] + ".gif";
					this.system.controller.mainReader.addListener($readerData.url, onRead);
					this.system.controller.mainReader.read($readerData.url, ReaderTypes.SOURCE_TYPE_LOCAL, ReaderTypes.FILE_TYPE_BMP);
				}
			}
			else
			{
				this.addChild(content as DisplayObject);
			}
		}
	}
}