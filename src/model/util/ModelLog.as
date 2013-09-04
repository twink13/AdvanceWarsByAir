package model.util
{
	import model.MainModel;

	/**
	 * created by twink @ 2013-9-2 下午2:41:45
	 * <p>
	 * 数据中心log
	 */
	public class ModelLog
	{
		/**
		 * 添加一句log
		 * @param $info
		 * 
		 */		
		public static function addLog($info:String):void
		{
			MainModel.instance.addLog($info);
		}
	}
}