package controller
{
	import model.MainModel;

	/**
	 * created by twink @ 2013-8-28 下午9:23:07
	 * <p>
	 * 主控制类
	 */
	public class MainController
	{
		public static var instance:MainController;
		
		private var _model:MainModel;
		
		public function MainController($model:MainModel)
		{
			_model = $model;
			
			instance = this;
		}
		
		/**
		 * 程序入口
		 * 
		 */		
		public function start():void
		{
			
		}
	}
}