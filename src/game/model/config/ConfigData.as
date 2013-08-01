package game.model.config
{
	import com.twink.tools.dataContainer.DataCellDic;

	/**
	 * created by twink @ 2013-5-8 下午10:22:16
	 * <p>
	 * 配置文件信息
	 */
	public class ConfigData
	{
		//存储地形配置信息容器
		public var terrainConfigDataDic:DataCellDic = new DataCellDic();
		
		public function ConfigData()
		{
		}
		
		/**
		 * 随机获得一个地形配置
		 * @return 
		 * 
		 */		
		public function getRandomTerrainConfig():TerrainConfigData
		{
			var list:Array = this.terrainConfigDataDic.dataArrData.arr;
			var randomNum:int = int(Math.random() * list.length);
			return list[randomNum];
		}
	}
}