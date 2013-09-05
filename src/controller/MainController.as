package controller
{
	import com.twink.tools.game.slg.map.MapData2D;
	import com.twink.tools.game.slg.map.MapNodeData2D;
	import com.twink.tools.load.ReaderData;
	import com.twink.tools.message.Messager;
	
	import controller.config.terrain.TerrainConfigData;
	import controller.config.terrain.TerrainConfigParser;
	import controller.consts.GameModes;
	import controller.data.SystemData;
	import controller.gameplay.GameplayManager;
	import controller.map.AwGirdData;
	import controller.util.ControllerLog;
	import controller.util.EditorFactory;
	
	import model.MainModel;

	/**
	 * created by twink @ 2013-8-28 下午9:23:07
	 * <p>
	 * 主控制类
	 */
	public class MainController extends Messager
	{
		//游戏初始化完毕 无参数
		public static const INIT_READY:String = "INIT_READY";
		//[编辑器]创建默认地图 参数[MapData2D]
		public static const EDIT_CREATE_MAP:String = "EDIT_CREATE_MAP";
		//文件加载完毕 参数[ReaderData]
		public static const FILE_LOADED:String = "FILE_LOADED";
		
		//单例
		public static var instance:MainController;
		
		//数据模块
		private var _model:MainModel;
		
		//系统信息
		public var systemData:SystemData = new SystemData();
		//地形配置文件
		public var terrainConfigParser:TerrainConfigParser = new TerrainConfigParser();
		//玩法相关模块
		public var gameplayManager:GameplayManager = new GameplayManager();
		
		public function MainController($model:MainModel)
		{
			_model = $model;
			_model.addListener(MainModel.CONFIG_FILE_LOADED, onConfigFileLoaded);
			_model.addListener(MainModel.CONFIG_FILE_ALL_LOADED, onConfigFileAllLoaded);
			_model.addListener(MainModel.FILE_LOADED, onFileLoaded);
			
			instance = this;
		}
		
		//====================================================================================
		//对外接口
		//====================================================================================
		
		/**
		 * 程序入口
		 * 
		 */		
		public function start():void
		{
			ControllerLog.addLog("进入游戏启动函数! ");
			ControllerLog.addLog("请求加载配置文件! ");
			//最先加载配置文件
			_model.readConfigDatas();
		}
		
		/**
		 * 进入编辑器模式
		 * 
		 */		
		public function enterEditMode():void
		{
			ControllerLog.addLog("进入编辑器模式! ");
			this.gameplayManager.enterEditorMode();
			
			//这里先打开一个默认的UI
			var map:MapData2D = new MapData2D();
			map.setUp(20, 20);
			
			var list:Array = map.nodeList();
			var size:int = list.length;
			for ( var i:int = 0; i < size; i++ )
			{
				var node:MapNodeData2D = list[i];
				var grid:AwGirdData = new AwGirdData(node);
				
				node.content = grid;
				
				//随机设置一个已有的地形
				var terrainConfig:TerrainConfigData = this.terrainConfigParser.getRandomTerrainConfig();
				grid.terrainData.typeID = terrainConfig.typeID;
				//trace("terrainConfig.typeID = " + terrainConfig.typeID);
			}
			
			//生成可操控的地形列表
			var canEditTerrainList:Array = EditorFactory.createCanEditTerrainList();
			
			this.send(MainController.EDIT_CREATE_MAP, map, canEditTerrainList);
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
			_model.read($url, $sourceType, $fileType, $saveToLibrary, $priority);
		}
		
		/**
		 * 编辑器 设定选中地形
		 * @param $terrainTypeID
		 * @param $terrainSubType
		 * 
		 */		
		public function editorSetSelectTerrain($terrainTypeID:String, $terrainSubType:String):void
		{
			ControllerLog.addLog("编辑模式选中了地形! $terrainTypeID = " + $terrainTypeID);
			this.gameplayManager.gameplayEditor.setSelectedTerrain($terrainTypeID, $terrainSubType);
		}
		
		//====================================================================================
		//对内接口
		//====================================================================================
		
		/**
		 * 添加一个log
		 * @param $info
		 * 
		 */		
		public function addLog($info:String):void
		{
			trace("[controller]" + $info);
		}
		
		//====================================================================================
		//私有侦听
		//====================================================================================
		
		//单个配置文件加载完毕
		private function onConfigFileLoaded($readerData:ReaderData):void
		{
			ControllerLog.addLog("开始解析配置文件! ");
			//解析这个配置文件
			var spliter:Array = $readerData.url.split("/");
			var lastName:String = spliter[spliter.length-1];
			
			var content:String = $readerData.contentData.value;
			
			var arr:Array;
			if ( content.indexOf("\n") != -1 )
			{
				//windows换行符
				arr = content.split("\n");
			}
			else if ( content.indexOf("\r") != -1 )
			{
				//mac换行符
				arr = content.split("\r");
			}
			
			//trace(arr);
			for ( var i:int = 0; i < arr.length; i++ )
			{
				arr[i] = arr[i].split("\t");
			}
			//trace(arr);
			arr.shift();
			
			switch (lastName)
			{
				case "terrains.txt":
					//地形解析
					this.terrainConfigParser.parse(arr);
					break;
			}
		}
		
		//配置文件全部加载完毕
		private function onConfigFileAllLoaded():void
		{
			ControllerLog.addLog("配置文件全部解析完毕! ");
			//配置文件解析完毕 开始下一个步骤
			
			ControllerLog.addLog("游戏初始化完毕! ");
			//通知外界配置文件解析完毕
			this.send(MainController.INIT_READY);
		}
		
		//单个普通文件加载完毕
		private function onFileLoaded($readerData:ReaderData):void
		{
			this.send(MainController.FILE_LOADED, $readerData);
		}
	}
}