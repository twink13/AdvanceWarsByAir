package model
{
	import com.twink.tools.library.Library;
	import com.twink.tools.message.Messager;
	
	import model.read.ReadConfigFileManager;
	import model.read.ReadFileManager;

	/**
	 * created by twink @ 2013-8-28 下午9:30:22
	 * <p>
	 * 主数据类
	 */
	public class MainModel extends Messager
	{
		//文件加载完毕 参数[ReaderData]
		public static const FILE_LOADED:String = "FILE_LOADED";
		
		//配置文件单个文件加载完毕 参数[ReaderData]
		public static const CONFIG_FILE_LOADED:String = "CONFIG_FILE_LOADED";
		//配置文件全部加在完毕 无参数
		public static const CONFIG_FILE_ALL_LOADED:String = "CONFIG_FILE_ALL_LOADED";
		
		public static var instance:MainModel;
		
		//资源存储器
		public var library:Library = new Library();
		//一般文件加载器
		public var readFileManager:ReadFileManager = new ReadFileManager(library);
		//配置文件用的
		public var readConfigFileManager:ReadConfigFileManager = new ReadConfigFileManager(library);
		
		public function MainModel()
		{
			instance = this;
		}
		
		//============================================================
		//对外接口
		//============================================================
		
		/**
		 * 加载配置文件
		 * 
		 */		
		public function readConfigDatas():void
		{
			this.readConfigFileManager.startRead();
		}
		
		/**
		 * 加载文件
		 * @param $url
		 * @param $sourceType
		 * @param $fileType
		 * @param $saveToLibrary
		 * @param $priority
		 * 
		 */		
		public function read($url:String, $sourceType:String, $fileType:String, $saveToLibrary:Boolean = true, $priority:int = 0):void
		{
			this.readFileManager.mainReader.read($url, $sourceType, $fileType, $saveToLibrary, $priority);
		}
		
		//============================================================
		//模块内部使用接口
		//============================================================
		
		/**
		 * 添加log
		 * @param $info
		 * 
		 */		
		public function addLog($info:String):void
		{
			trace("[model]" + $info);
		}
		
		//============================================================
		//私有处理
		//============================================================
	}
}