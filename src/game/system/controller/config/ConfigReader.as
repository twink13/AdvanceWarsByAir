package game.system.controller.config
{
	import com.twink.tools.load.Reader;
	import com.twink.tools.load.ReaderData;
	import com.twink.tools.load.ReaderTypes;
	
	import game.Game;
	import game.system.model.consts.Urls;

	/**
	 * created by twink @ 2013-8-4 下午5:38:53
	 * <p>
	 * 配置文件加载控制
	 */
	public class ConfigReader
	{
		//加载器
		public var reader:Reader = new Reader(1);
		
		//加载完成后的回调
		private var _completeCB:Function = null;
		
		public function ConfigReader()
		{
			
		}
		
		/**
		 * 初始化
		 * 
		 */		
		public function init():void
		{
			this.reader.setLibrary(Game.instance.system.model.library);
			this.reader.addListener(Reader.FILE_COMPLETE, onFileComplete);
			this.reader.addListener(Reader.ALL_COMPLETE, onAllComplete);
		}
		
		/**
		 * 开始加载
		 * 
		 */		
		public function startRead($completeCB:Function):void
		{
			_completeCB = $completeCB;
			
			var url:String = Urls.getConfigUrl("terrains.txt");
			this.reader.read(url, ReaderTypes.SOURCE_TYPE_LOCAL, ReaderTypes.FILE_TYPE_TXT);
		}
		
		private function onFileComplete($data:ReaderData):void
		{
			var spliter:Array = $data.url.split("/");
			var lastName:String = spliter[spliter.length-1];
			
			var content:String = $data.contentData.value;
			
			var arr:Array;
			if ( content.indexOf("\n") != -1 )
			{
				//windows换行符
				arr = content.split("\n");
			}
			else if ( content.indexOf("\r") != -1 )
			{
				//mac换行符
				arr = content.split("\r");
			}
			
			//trace(arr);
			for ( var i:int = 0; i < arr.length; i++ )
			{
				arr[i] = arr[i].split("\t");
			}
			//trace(arr);
			arr.shift();
			
			switch (lastName)
			{
				case "terrains.txt":
					//地形解析
					Game.instance.system.controller.configParser.parseTerrainsConfig(arr);
					break;
			}
		}
		
		//全部完成
		private function onAllComplete():void
		{
			this.reader.removeListener(Reader.FILE_COMPLETE, onFileComplete);
			this.reader.removeListener(Reader.ALL_COMPLETE, onAllComplete);
			
			_completeCB();
			_completeCB = null;
		}
	}
}