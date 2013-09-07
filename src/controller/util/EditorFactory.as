package controller.util
{
	import com.twink.tools.game.slg.map.MapData2D;
	import com.twink.tools.game.slg.map.MapNodeData2D;
	
	import controller.MainController;
	import controller.config.terrain.TerrainConfigData;
	import controller.consts.TerrainSubTypes;
	import controller.consts.Terrains;
	import controller.map.AwGirdData;

	/**
	 * created by twink @ 2013-9-4 下午10:14:46
	 * <p>
	 * 编辑器的工厂类
	 */
	public class EditorFactory
	{
		public static function createDefaultMap():MapData2D
		{
			var result:MapData2D = new MapData2D();
			result.setUp(20, 20);
			
			var list:Array = result.nodeList();
			var size:int = list.length;
			for ( var i:int = 0; i < size; i++ )
			{
				var node:MapNodeData2D = list[i];
				var grid:AwGirdData = new AwGirdData(node);
				
				node.content = grid;
				
				//随机设置一个已有的地形
				var terrainConfig:TerrainConfigData = MainController.instance.terrainConfigParser.getRandomTerrainConfig();
				grid.terrainData.typeID = terrainConfig.typeID;
				//trace("terrainConfig.typeID = " + terrainConfig.typeID);
			}
			
			//改变地形方向
			for ( i = 0; i < size; i++ )
			{
				node = list[i];
				grid = node.content as AwGirdData;
				grid.changeSubType(false);
			}
			return result;
		}
		
		/**
		 * 生成可选择的地形列表
		 * @return [AwGirdData列表]
		 * 
		 */		
		public static function createCanEditTerrainList():Array
		{
			var result:Array = [];
			
			result.push(createTerrainGrid(Terrains.PLAIN, TerrainSubTypes.DEFAULT));
			result.push(createTerrainGrid(Terrains.MOUNTAIN, TerrainSubTypes.DEFAULT));
			result.push(createTerrainGrid(Terrains.SEA, TerrainSubTypes.DEFAULT));
			result.push(createTerrainGrid(Terrains.WOOD, TerrainSubTypes.DEFAULT));
			result.push(createTerrainGrid(Terrains.ROAD, TerrainSubTypes.DEFAULT));
			result.push(createTerrainGrid(Terrains.RIVER, TerrainSubTypes.DEFAULT));
			result.push(createTerrainGrid(Terrains.BRIDGE, TerrainSubTypes.DEFAULT));
			result.push(createTerrainGrid(Terrains.SHOAL, TerrainSubTypes.DEFAULT));
			result.push(createTerrainGrid(Terrains.REEF, TerrainSubTypes.DEFAULT));
			result.push(createTerrainGrid(Terrains.PIPE, TerrainSubTypes.DEFAULT));
			result.push(createTerrainGrid(Terrains.MISSILE, TerrainSubTypes.DEFAULT));
			result.push(createTerrainGrid(Terrains.PIPESEAM, TerrainSubTypes.DEFAULT));
			
			return result;
		}
		
		/**
		 * 
		 * @param $terrainTypeID 地形编号
		 * @param $subType 小类型
		 * @return 
		 * 
		 */		
		private static function createTerrainGrid($terrainTypeID:String, $subType:String):AwGirdData
		{
			var result:AwGirdData = new AwGirdData(null);//这里的小格信息是没有parent的
			
			result.terrainData.typeID = $terrainTypeID;
			result.terrainData.subType = $subType;
			
			return result;
		}
	}
}