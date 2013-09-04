package controller.util
{
	import controller.MainController;

	/**
	 * created by twink @ 2013-9-2 下午2:50:12
	 * <p>
	 * 
	 */
	public class ControllerLog
	{
		/**
		 * 添加一个log
		 * @param $info
		 * 
		 */		
		public static function addLog($info:String):void
		{
			MainController.instance.addLog($info);
		}
	}
}