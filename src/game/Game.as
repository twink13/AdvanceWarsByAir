package game
{
	import com.twink.tools.air.file.FileReader;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.filesystem.File;
	import flash.text.TextField;
	
	import game.controller.Controller;
	import game.model.Model;
	import game.view.View;

	/**
	 * 维护人：twink 2013-5-6 - 今
	 * <p>
	 * 游戏主环境
	 */
	public class Game extends Sprite
	{
		public static var instance:Game;
		
		//游戏数据中心
		public var model:Model = new Model();
		//游戏控制中心
		public var controller:Controller = new Controller();
		//游戏视图中心
		public var view:View = new View();
		
		
		private var _fileReader:FileReader = new FileReader();//加载器
		
		public function Game()
		{
			super();
			
			Game.instance = this;
		}
		
		/**
		 * 游戏启动入口
		 * 
		 */		
		public function startUp():void
		{
			//测试加载配置文件
			var url:String = File.applicationDirectory.nativePath + "/config/terrains.txt";
			_fileReader.addListener(url, onRead);
			_fileReader.read(url);
			
//			//测试加载图片资源
//			url = File.applicationDirectory.nativePath + "/image/terrain/" + "croad" + ".gif";
//			_fileReader.addListener(url, onRead);
//			_fileReader.read(url);
		}
		
		private function onRead(url:String, content:*):void
		{
			_fileReader.removeListener(url, onRead);
			if ( content is String )
			{
//				var text:TextField = new TextField();
//				
//				text.text = content;
//				text.x = 10;
//				text.y = 10;
//				text.width = 300;
//				text.height = 300;
//				
//				this.addChild(text);
//				trace(content);
				
				var arr:Array = content.split("\n");
				//trace(arr);
				for ( var i:int = 0; i < arr.length; i++ )
				{
					arr[i] = arr[i].split("\t");
				}
				//trace(arr);
				arr.shift();
				this.controller.configParser.parseTerrainsConfig(arr);
				
				for ( i = 0; i < 10; i ++ )
				{
					url = File.applicationDirectory.nativePath + "/image/terrain/" + arr[0][1] + ".gif";
					_fileReader.addListener(url, onRead);
					_fileReader.read(url);
				}
			}
			else
			{
				this.addChild(content as DisplayObject);
			}
		}
	}
}