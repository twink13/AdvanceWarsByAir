package game.system.controller.config
{
	import com.twink.tools.load.Reader;
	
	import game.Game;

	/**
	 * created by twink @ 2013-8-4 下午5:38:53
	 * <p>
	 * 配置文件加载控制
	 */
	public class ConfigReader
	{
		//加载器
		public var reader:Reader = new Reader(1);
		
		public function ConfigReader()
		{
			
		}
		
		/**
		 * 初始化
		 * 
		 */		
		public function init():void
		{
			reader.setLibrary(Game.instance.system.model.library);
		}
	}
}