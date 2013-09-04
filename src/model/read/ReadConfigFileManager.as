package model.read
{
	import com.twink.tools.library.Library;
	import com.twink.tools.load.Reader;
	import com.twink.tools.load.ReaderData;
	import com.twink.tools.load.ReaderTypes;
	
	import model.MainModel;
	import model.consts.Files;
	import model.consts.Urls;
	import model.util.ModelLog;

	/**
	 * created by twink @ 2013-8-31 下午10:09:43
	 * <p>
	 * 配置文件加载器
	 */
	public class ReadConfigFileManager
	{
		//配置文件加载器
		public var configReader:Reader = new Reader(1);
		
		public function ReadConfigFileManager($library:Library)
		{
			this.configReader.addListener(Reader.FILE_COMPLETE, onConfigFileComplete);
			this.configReader.addListener(Reader.ALL_COMPLETE, onConfigAllComplete);
			
			this.configReader.setLibrary($library);
		}
		
		/**
		 * 加载配置文件
		 * 
		 */		
		public function startRead():void
		{
			ModelLog.addLog("开始加载配置文件! ");
			var url:String = Urls.getConfigUrl(Files.CONFIG_TERRAIN);//地形配置文件
			this.configReader.read(url, ReaderTypes.SOURCE_TYPE_LOCAL, ReaderTypes.FILE_TYPE_TXT);
		}
		
		private function onConfigFileComplete($readerData:ReaderData):void
		{
			ModelLog.addLog("单个配置文件加载完成! url = " + $readerData.url);
			MainModel.instance.send(MainModel.CONFIG_FILE_LOADED, $readerData);
		}
		
		private function onConfigAllComplete():void
		{
			ModelLog.addLog("配置文件全部加载完毕! ");
			MainModel.instance.send(MainModel.CONFIG_FILE_ALL_LOADED);
		}
	}
}