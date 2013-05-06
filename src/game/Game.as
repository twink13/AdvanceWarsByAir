package game
{
	import com.twink.tools.air.file.FileReader;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.filesystem.File;

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
		
		public function startUp():void
		{
			var url:String = File.applicationDirectory.nativePath + "/image/terrain/" + "croad" + ".gif";
			_fileReader.addListener(url, onRead);
			_fileReader.read(url);
		}
		
		private function onRead(url:String, content:*):void
		{
			this.addChild(content as DisplayObject);
		}
	}
}