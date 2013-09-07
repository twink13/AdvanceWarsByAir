package controller.util
{
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
		/**
		 * 生成可选择的地形列表
		 * @return [AwGirdData列表]
		 * 
		 */		
		public static function createCanEditTerrainList():Array
		{
			var result:Array = [];
			
			result.push(createTerrainGrid(Terrains.PLAIN, TerrainSubTypes.NONE));
			result.push(createTerrainGrid(Terrains.MOUNTAIN, TerrainSubTypes.NONE));
			result.push(createTerrainGrid(Terrains.SEA, TerrainSubTypes.NONE));
			result.push(createTerrainGrid(Terrains.WOOD, TerrainSubTypes.NONE));
			result.push(createTerrainGrid(Terrains.ROAD, TerrainSubTypes.NONE));
			result.push(createTerrainGrid(Terrains.RIVER, TerrainSubTypes.NONE));
			result.push(createTerrainGrid(Terrains.BRIDGE, TerrainSubTypes.NONE));
			result.push(createTerrainGrid(Terrains.SHOAL, TerrainSubTypes.NONE));
			result.push(createTerrainGrid(Terrains.REEF, TerrainSubTypes.NONE));
			result.push(createTerrainGrid(Terrains.PIPE, TerrainSubTypes.NONE));
			result.push(createTerrainGrid(Terrains.MISSILE, TerrainSubTypes.NONE));
			result.push(createTerrainGrid(Terrains.PIPESEAM, TerrainSubTypes.NONE));
			
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