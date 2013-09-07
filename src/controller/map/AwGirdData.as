package controller.map
{
	/**
	 * created by twink @ 2013-5-12 下午3:30:02
	 * <p>
	 * 高级战争的地图小格信息
	 */
	import com.twink.tools.game.map.IMapContent;
	import com.twink.tools.game.map.MapNodeData;
	import com.twink.tools.game.slg.map.MapData2D;
	import com.twink.tools.game.slg.map.MapNodeData2D;
	
	import controller.consts.TerrainSubTypes;
	import controller.consts.TerrainTags;
	import controller.util.MapUtil;
	
	import model.consts.Urls;
	
	public class AwGirdData implements IMapContent
	{
		//所在地图节点
		private var _parent:MapNodeData2D;
		
		public var terrainData:DataCellTerrain = new DataCellTerrain();
		
		public function AwGirdData($parent:MapNodeData2D)
		{
			_parent = $parent;
		}
		
		//获得周围的相同地形状态
		private function getAroundSame($targetTerrainTypeID:String, $otherTerrainTypeID:String):String
		{
			if ( !this.parent )
			{
				return TerrainSubTypes.DEFAULT;
			}
			
			var result:String = "";
			var aroundNodes:Array = (this.parent as MapNodeData2D).getAround();
			var size:int = aroundNodes.length;
			for ( var i:int; i < size; i++ )
			{
				var node:MapNodeData2D = aroundNodes[i];
				if ( !node )
				{
					result += "1";
					continue;
				}
				
				var dirGridData:AwGirdData = node.content as AwGirdData;
				if ( dirGridData && ( (dirGridData.terrainData.typeID == $targetTerrainTypeID) || (dirGridData.terrainData.typeID == $otherTerrainTypeID) ) )
				{
					result += "1";
				}
				else
				{
					result += "0";
				}
			}
			return result;
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
		
		/**
		 * 自动变更地形小类型
		 * 
		 */		
		public function autoChangeSubType($withAround:Boolean):void
		{
			this.terrainData.subType = MapUtil.getSubTypeByGrid(this);
			
			if ( $withAround )
			{
				var list:Array = (this.parent as MapNodeData2D).getAround();
				for each ( var mapData2D:MapNodeData2D in list )
				{
					if ( mapData2D )
					{
						(mapData2D.content as AwGirdData).autoChangeSubType(false);
					}
				}
			}
		}
	}
}