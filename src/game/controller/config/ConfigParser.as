package game.controller.config
{
	import game.Game;
	import game.model.config.TerrainConfigData;

	/**
	 * created by twink @ 2013-5-8 下午10:03:18
	 * <p>
	 * 用于配置文件解析
	 */
	public class ConfigParser
	{
		public function ConfigParser()
		{
		}
		
		/**
		 * 解析地形
		 * @param $dataArr 二维数组 形如[["地形编号","资源名",防御力,晴,雨,雪],[...]]
		 * 
		 */		
		public function parseTerrainsConfig($dataArr:Array):void
		{
			var size:int = $dataArr.length;
			for ( var i:int = 0; i < size; i++ )
			{
				var dataItemArr:Array = $dataArr[i];
				
				var configData:TerrainConfigData = new TerrainConfigData();
				
				configData.typeID 				= dataItemArr[0];
				configData.resourceBaseName 	= dataItemArr[1];
				
				Game.instance.model.configData.terrainConfigDataDic.addData(configData.typeID, configData);
			}
		}
	}
}