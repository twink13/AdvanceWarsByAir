package controller.util
{
	import com.twink.tools.game.slg.map.MapNodeData2D;
	
	import controller.consts.TerrainSubTypes;
	import controller.map.AwGirdData;

	/**
	 * created by twink @ 2013-9-7 下午2:50:39
	 * <p>
	 * 
	 */
	public class MapUtil
	{
		public static function getSubTypeByGrid($gridData:AwGirdData):String
		{
			if ( !$gridData.parent )
			{
				return TerrainSubTypes.DEFAULT;
			}
			
			var result:String = "";
			var aroundNodes:Array = ($gridData.parent as MapNodeData2D).getAround();
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
				if ( dirGridData && ( (dirGridData.terrainData.typeID == $gridData.terrainData.typeID) || 
					(dirGridData.terrainData.typeID == $gridData.terrainData.configData.relatedTerrainTypeID) ) )
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
	}
}