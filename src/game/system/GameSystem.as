package game.system
{
	import game.system.controller.SystemController;
	import game.system.model.SystemModel;
	import game.system.view.SystemView;

	/**
	 * created by twink @ 2013-8-4 下午4:56:07
	 * <p>
	 * 系统
	 */
	public class GameSystem
	{
		public var controller:SystemController = new SystemController();
		public var model:SystemModel = new SystemModel();
		public var view:SystemView = new SystemView();
		
		public function GameSystem()
		{
		}
		
		/**
		 * 初始化
		 * 
		 */		
		public function init():void
		{
			this.controller.init();
		}
	}
}