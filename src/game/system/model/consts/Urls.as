package game.system.model.consts
{
	import flash.filesystem.File;

	/**
	 * created by twink @ 2013-8-4 下午5:33:22
	 * <p>
	 * 加载所需的url清单
	 */
	public class Urls
	{
		/**
		 * 获得配置文件路径
		 * @param $configName
		 * @return 
		 * 
		 */		
		public static function getConfigUrl($configName:String):String
		{
			var url:String = File.applicationDirectory.nativePath + "/config/" + $configName;
		}
	}
}