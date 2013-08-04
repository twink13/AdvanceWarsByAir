package game.system.controller
{
	import com.twink.tools.load.Reader;
	
	import game.Game;
	import game.system.controller.config.ConfigParser;
	import game.system.controller.config.ConfigReader;

	/**
	 * created by twink @ 2013-8-4 下午5:11:44
	 * <p>
	 * 系统控制器
	 */
	public class SystemController
	{
		//主加载器
		public var mainReader:Reader = new Reader(3);
		
		//配置文件解析器
		public var configParser:ConfigParser = new ConfigParser();
		//配置文件读取器
		public var configReader:ConfigReader = new ConfigReader();
		
		public function SystemController()
		{
			
		}
		
		/**
		 * 初始化
		 * 
		 */		
		public function init():void
		{
			this.mainReader.setLibrary(Game.instance.system.model.library);
			
			this.configReader.init();
		}
	}
}