package game.sub.map.model.map
{
	/**
	 * created by twink @ 2013-5-12 下午3:33:13
	 * <p>
	 * 地上物类型信息
	 */
	import com.twink.tools.data.DataCell;
	
	import game.Game;
	import game.system.model.config.TerrainConfigData;
	import game.system.model.consts.Urls;
	
	public class DataCellTerrain extends DataCell
	{
		//地形类型ID
		private var _typeID:String = null;
		//地形小类型/状态
		private var _subType:String = null;
		
		public function DataCellTerrain()
		{
			super(null);
		}
		
		//=============================================================
		//设置接口
		//=============================================================
		
		/**
		 * 初始化地形
		 * @param $typeID 地形类型ID
		 * @param $subType 地形小类型/状态
		 * 
		 */		
		public function setUp($typeID:String, $subType:String):void
		{
			_typeID = $typeID;
			_subType = $subType;
			this.update();
		}
		
		/**
		 * 设置地图类型ID
		 * @param $value
		 * 
		 */		
		public function set typeID($value:String):void
		{
			_typeID = $value;
		}
		
		/**
		 * 设置地图小类型/状态
		 * @param $value
		 * 
		 */		
		public function set subType($value:String):void
		{
			_subType = $value;
		}
		
		//=============================================================
		//查询接口
		//=============================================================
		
		/**
		 * 获得地图类型ID
		 * @return 
		 * 
		 */		
		public function get typeID():String
		{
			return _typeID;
		}
		
		/**
		 * 获得地图小类型/状态
		 * @return 
		 * 
		 */		
		public function get subType():String
		{
			return _subType;
		}
		
		/**
		 * 获得当前地形对应的配置信息
		 * @return 
		 * 
		 */		
		public function get configData():TerrainConfigData
		{
			return Game.instance.system.model.configData.terrainConfigDataDic.getDataByID(this.typeID) as TerrainConfigData;
		}
	}
}