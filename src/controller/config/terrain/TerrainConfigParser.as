package controller.config.terrain
{
	import com.twink.tools.dataContainer.DataCellDic;
	
	import controller.consts.Consts;
	import controller.util.ConfigUtil;
	

	/**
	 * created by twink @ 2013-9-1 下午1:53:45
	 * <p>
	 * 解析和存储地形配置文件信息
	 */
	public class TerrainConfigParser
	{
		//存储地形配置信息容器
		public var terrainConfigDataDic:DataCellDic = new DataCellDic();
		
		public function TerrainConfigParser()
		{
		}
		
		/**
		 * 解析地形
		 * @param $dataArr 二维数组 形如[["地形编号","资源名",防御力,晴,雨,雪],[...]]
		 * 
		 */		
		public function parse($dataArr:Array):void
		{
			var size:int = $dataArr.length;
			for ( var i:int = 0; i < size; i++ )
			{
				var dataItemArr:Array = $dataArr[i];
				
				var configData:TerrainConfigData = new TerrainConfigData();
				
				configData.typeID 				= dataItemArr[0];
				configData.resourceBaseName 	= dataItemArr[1];
				
				var tags:Array = ConfigUtil.getArrByStr(dataItemArr[2], Consts.DELIM_CONFIG_ARR);
				for each( var tag:String in tags )
				{
					configData.tags.addTag(tag);
				}
				
				configData.relatedTerrainTypeID 	= dataItemArr[3];
				
				this.terrainConfigDataDic.addData(configData.typeID, configData);
			}
		}
		
		/**
		 * 通过配置编号获得配置内容
		 * @param $TypeID
		 * @return 
		 * 
		 */		
		public function getDataByTypeID($TypeID:String):TerrainConfigData
		{
			return this.terrainConfigDataDic.getDataByID($TypeID);
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