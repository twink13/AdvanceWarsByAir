package controller.util
{
	/**
	 * created by twink @ 2013-8-11 下午1:34:38
	 * <p>
	 * 
	 */
	public class ConfigUtil
	{
		/**
		 * 解析获得字符串数组
		 * @param $str 传入的字符串
		 * @param $delim 分隔符
		 * @return 
		 * 
		 */		
		public static function getArrByStr($str:String, $delim:String):Array
		{
			var result:Array;
			
			result = $str.split($delim);
			
			return result;
		}
	}
}