package game.system.model
{
	import com.twink.tools.library.Library;
	
	import game.system.model.config.ConfigData;

	/**
	 * created by twink @ 2013-8-4 下午5:14:41
	 * <p>
	 * 
	 */
	public class SystemModel
	{
		//资源存储器
		public var library:Library = new Library();
		//配置信息中心
		public var configData:ConfigData = new ConfigData();
		
		public function SystemModel()
		{
		}
	}
}