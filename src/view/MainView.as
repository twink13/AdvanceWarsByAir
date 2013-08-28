package view
{
	import controller.MainController;

	/**
	 * created by twink @ 2013-8-28 下午9:34:33
	 * <p>
	 * 主视图类
	 */
	public class MainView
	{
		public static var instance:MainView;
		
		private var _controller:MainController;
		
		public function MainView($controller:MainController)
		{
			_controller = $controller;
			
			instance = this;
		}
	}
}