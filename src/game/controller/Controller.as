package game.controller
{
	import com.twink.tools.library.Library;
	import com.twink.tools.load.Reader;
	
	import game.controller.config.ConfigParser;

	/**
	 * created by twink @ 2013-5-8 下午10:02:31
	 * <p>
	 * 控制中心
	 */
	public class Controller
	{
		//资源存储器
		public var library:Library = new Library();
		//文件加载器
		public var reader:Reader = new Reader(3);
		
		//配置文件解析器
		public var configParser:ConfigParser = new ConfigParser();
		
		public function Controller()
		{
			reader.setLibrary(library);
		}
	}
}