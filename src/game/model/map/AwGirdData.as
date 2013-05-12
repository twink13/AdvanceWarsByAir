package game.model.map
{
	/**
	 * created by twink @ 2013-5-12 下午3:30:02
	 * <p>
	 * 高级战争的地图小格信息
	 */
	import com.twink.tools.game.map.IMapContent;
	import com.twink.tools.game.map.MapNodeData;
	
	public class AwGirdData implements IMapContent
	{
		//所在地图节点
		private var _parent:MapNodeData;
		
		public var terrainData:DataCellTerrain = new DataCellTerrain();
		
		public function AwGirdData($parent:MapNodeData)
		{
			_parent = $parent;
		}
		
		/**
		 * 获得所在的地图节点
		 * @return 
		 * 
		 */		
		public function get parent():MapNodeData
		{
			return _parent;
		}
	}
}