package game
{
	import com.twink.tools.air.file.FileReader;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.filesystem.File;
	import flash.text.TextField;

	/**
	 * 维护人：twink 2013-5-6 - 今
	 * <p>
	 * 游戏主环境
	 */
	public class Game extends Sprite
	{
		private var _fileReader:FileReader = new FileReader();//加载器
		
		public function Game()
		{
			super();
		}
		
		/**
		 * 游戏启动入口
		 * 
		 */		
		public function startUp():void
		{
			//var url:String = File.applicationDirectory.nativePath + "/image/terrain/" + "croad" + ".gif";
			var url:String = File.applicationDirectory.nativePath + "/config/terrains.txt";
			_fileReader.addListener(url, onRead);
			_fileReader.read(url);
			
			url = File.applicationDirectory.nativePath + "/image/terrain/" + "croad" + ".gif";
			_fileReader.addListener(url, onRead);
			_fileReader.read(url);
		}
		
		private function onRead(url:String, content:*):void
		{
			_fileReader.removeListener(url, onRead);
			if ( content is String )
			{
				var text:TextField = new TextField();
				
				text.text = content;
				text.x = 10;
				text.y = 10;
				text.width = 300;
				text.height = 300;
				
				this.addChild(text);
				trace(content);
			}
			else
			{
				this.addChild(content as DisplayObject);
			}
		}
	}
}