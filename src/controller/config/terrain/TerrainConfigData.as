package controller.config.terrain
{
	import com.twink.tools.data.DataCellTags;

	/**
	 * 维护人：twnik 2013-5-7 - 今
	 * <p>
	 * 地形配置信息
	 */
	public class TerrainConfigData
	{
		//类型编号
		public var typeID:String;
		//资源基本名称
		public var resourceBaseName:String;
		//防御星数
		public var defence:int;
		//标签
		public var tags:DataCellTags = new DataCellTags();
		//相关联的地形类型编号
		public var relatedTerrainTypeID:String;
		
		public function TerrainConfigData()
		{
		}
	}
}