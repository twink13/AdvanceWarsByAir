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
	
	import model.consts.Urls;
	
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
		 * 图片url
		 * @return 
		 * 
		 */		
		public function get imageUrl():String
		{
			var baseName:String = this.terrainData.configData.resourceBaseName;
			
			//和自身相同地形的周围地形状态
			var sameTerrainAround:String = this.getAroundSame(this.terrainData.typeID, this.terrainData.configData.relatedTerrainTypeID);
			
			switch (sameTerrainAround)
			{
				case "1111":
					//中心
					if ( this.terrainData.configData.tags.hasTag(TerrainTags.CROSS) )
					{
						baseName = "c" + baseName;
					}
					break;
				case "1010":
					//横竖
					if ( this.terrainData.configData.tags.hasTag(TerrainTags.LINE) )
					{
						baseName = "v" + baseName;
					}
					break;
				case "0101":
					//横竖
					if ( this.terrainData.configData.tags.hasTag(TerrainTags.LINE) )
					{
						baseName = "h" + baseName;
					}
					break;
				case "1100":
					//弯曲
					if ( this.terrainData.configData.tags.hasTag(TerrainTags.BEND) )
					{
						baseName = "wn" + baseName;
					}
					break;
				case "0110":
					//弯曲
					if ( this.terrainData.configData.tags.hasTag(TerrainTags.BEND) )
					{
						baseName = "sw" + baseName;
					}
					break;
				case "0011":
					//弯曲
					if ( this.terrainData.configData.tags.hasTag(TerrainTags.BEND) )
					{
						baseName = "es" + baseName;
					}
					break;
				case "1001":
					//弯曲
					if ( this.terrainData.configData.tags.hasTag(TerrainTags.BEND) )
					{
						baseName = "ne" + baseName;
					}
					break;
				case "1110":
					//丁字
					if ( this.terrainData.configData.tags.hasTag(TerrainTags.BRANCH) )
					{
						baseName = "swn" + baseName;
					}
					break;
				case "0111":
					//丁字
					if ( this.terrainData.configData.tags.hasTag(TerrainTags.BRANCH) )
					{
						baseName = "esw" + baseName;
					}
					break;
				case "1011":
					//丁字
					if ( this.terrainData.configData.tags.hasTag(TerrainTags.BRANCH) )
					{
						baseName = "nes" + baseName;
					}
					break;
				case "1101":
					//丁字
					if ( this.terrainData.configData.tags.hasTag(TerrainTags.BRANCH) )
					{
						baseName = "wne" + baseName;
					}
					break;
				case "1000":
					//起头
					if ( this.terrainData.configData.tags.hasTag(TerrainTags.HEAD) )
					{
						baseName = "s" + baseName + "end";
					}
					else if ( this.terrainData.configData.tags.hasTag(TerrainTags.LINE) )
					{
						baseName = "v" + baseName;
					}
					break;
				case "0100":
					//起头
					if ( this.terrainData.configData.tags.hasTag(TerrainTags.HEAD) )
					{
						baseName = "e" + baseName + "end";
					}
					else if ( this.terrainData.configData.tags.hasTag(TerrainTags.LINE) )
					{
						baseName = "h" + baseName;
					}
					break;
				case "0010":
					//起头
					if ( this.terrainData.configData.tags.hasTag(TerrainTags.HEAD) )
					{
						baseName = "n" + baseName + "end";
					}
					else if ( this.terrainData.configData.tags.hasTag(TerrainTags.LINE) )
					{
						baseName = "v" + baseName;
					}
					break;
				case "0001":
					//起头
					if ( this.terrainData.configData.tags.hasTag(TerrainTags.HEAD) )
					{
						baseName = "w" + baseName + "end";
					}
					else if ( this.terrainData.configData.tags.hasTag(TerrainTags.LINE) )
					{
						baseName = "h" + baseName;
					}
					break;
				default:
					break;
			}
			
			if ( baseName == this.terrainData.configData.resourceBaseName )
			{
				//没变
				if ( this.terrainData.configData.tags.hasTag(TerrainTags.LINE) )
				{
					//默认横
					baseName = "h" + baseName;
				}
				else if ( this.terrainData.configData.tags.hasTag(TerrainTags.BEND) )
				{
					baseName = "wn" + baseName;
				}
				else if ( this.terrainData.configData.tags.hasTag(TerrainTags.BRANCH) )
				{
					baseName = "swn" + baseName;
				}
				else if ( this.terrainData.configData.tags.hasTag(TerrainTags.CROSS) )
				{
					baseName = "c" + baseName;
				}
				else if ( this.terrainData.configData.tags.hasTag(TerrainTags.HEAD) )
				{
					baseName = "n" + baseName;
				}
			}
			
			return Urls.getTerrainImageUrl(baseName);
		}
		
		//获得周围的相同地形状态
		private function getAroundSame($targetTerrainTypeID:String, $otherTerrainTypeID:String):String
		{
			if ( !this.parent )
			{
				return TerrainSubTypes.NONE;
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
	}
}