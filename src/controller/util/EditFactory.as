package controller.util
{
	import controller.map.AwGirdData;

	/**
	 * created by twink @ 2013-9-4 下午10:14:46
	 * <p>
	 * 编辑器的工厂类
	 */
	public class EditFactory
	{
		/**
		 * 生成可选择的地形列表
		 * @return 
		 * 
		 */		
		public static function createCanEditTerrainList():Array
		{
			var result:Array = [];
			
			result.push(createTerrainGrid());
			
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