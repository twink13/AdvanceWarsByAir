package view.util
{
	import view.MainView;

	/**
	 * created by twink @ 2013-9-2 下午2:58:58
	 * <p>
	 * 
	 */
	public class ViewLog
	{
		/**
		 * 添加一句log
		 * @param $info
		 * 
		 */		
		public static function addLog($info:String):void
		{
			MainView.instance.addLog($info);
		}
	}
}