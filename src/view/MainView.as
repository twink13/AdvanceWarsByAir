package view
{
	import com.twink.tools.game.slg.map.MapData2D;
	import com.twink.tools.load.ReaderData;
	import com.twink.tools.message.Messager;
	
	import controller.MainController;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import view.UI.MapEditerUI;
	import view.consts.ViewMessages;
	import view.map.MapComponent;
	import view.util.ViewLog;

	/**
	 * created by twink @ 2013-8-28 下午9:34:33
	 * <p>
	 * 主视图类
	 */
	public class MainView extends Messager
	{
		//单例
		public static var instance:MainView;
		
		//地图编辑器UI
		public var mapEditerUI:MapEditerUI = new MapEditerUI();
		
		//存储的控制器
		private var _controller:MainController;
		//容器
		private var _contianer:Sprite = new Sprite();
		
		
		public function MainView($controller:MainController)
		{
			_controller = $controller;
			
			_controller.addListener(MainController.INIT_READY, onInitReady);
			_controller.addListener(MainController.EDIT_CREATE_MAP, onEditCreateMap);
			_controller.addListener(MainController.FILE_LOADED, onFileLoaded);
			
			instance = this;
		}
		
		//======================================================
		//对外接口
		//======================================================
		
		/**
		 * 获得容器
		 * @return 
		 * 
		 */		
		public function get container():Sprite
		{
			return _contianer;
		}
		
		//======================================================
		//对内接口
		//======================================================
		
		/**
		 * 添加一个log
		 * @param $info
		 * 
		 */		
		public function addLog($info:String):void
		{
			trace("[view]" + $info);
		}
		
		/**
		 * 添加到显示列表
		 * @param $display
		 * 
		 */		
		public function addChild($display:DisplayObject):void
		{
			ViewLog.addLog("向容器中添加美术资源! $display = " + $display);
			_contianer.addChild($display);
		}
		
		/**
		 * 加载文件
		 * @param $url
		 * @param $sourceType
		 * @param $fileType
		 * @param $saveToLibrary
		 * @param $priority
		 * 
		 */		
		public function read($url:String, $sourceType:String, $fileType:String, $saveToLibrary:Boolean = true, $priority:int = 0):void
		{
			_controller.read($url, $sourceType, $fileType, $saveToLibrary, $priority);
		}
		
		//======================================================
		//私有处理
		//======================================================
		
		//游戏初始化完毕
		private function onInitReady():void
		{
			ViewLog.addLog("得知游戏初始化完毕! ");
			
			_controller.enterEditMode();
		}
		
		//显示编辑器默认地图
		private function onEditCreateMap($mapData:MapData2D):void
		{
			ViewLog.addLog("收到编辑器的默认地图! ");
			this.mapEditerUI.open($mapData);
		}
		
		//单个普通文件加载完毕
		private function onFileLoaded($readerData:ReaderData):void
		{
			this.send(ViewMessages.FILE_LOADED, $readerData);
			this.send($readerData.url, $readerData);
		}
	}
}