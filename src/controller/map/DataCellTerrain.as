package controller.map
{
	/**
	 * created by twink @ 2013-5-12 下午3:33:13
	 * <p>
	 * 地上物类型信息
	 */
	import com.twink.tools.data.DataCell;
	
	import controller.MainController;
	import controller.config.terrain.TerrainConfigData;
	import controller.consts.TerrainTags;
	
	import model.consts.Urls;
	
	public class DataCellTerrain extends DataCell
	{
		//地形类型ID
		private var _typeID:String = null;
		//地形小类型/状态
		private var _subType:String = null;
		
		public function DataCellTerrain()
		{
			super(null);
		}
		
		//=============================================================
		//设置接口
		//=============================================================
		
		/**
		 * 初始化地形
		 * @param $typeID 地形类型ID
		 * @param $subType 地形小类型/状态
		 * 
		 */		
		public function setUp($typeID:String, $subType:String):void
		{
			_typeID = $typeID;
			_subType = $subType;
			this.update();
		}
		
		/**
		 * 设置地图类型ID
		 * @param $value
		 * 
		 */		
		public function set typeID($value:String):void
		{
			_typeID = $value;
			this.update();
		}
		
		/**
		 * 设置地图小类型/状态
		 * @param $value
		 * 
		 */		
		public function set subType($value:String):void
		{
			_subType = $value;
			this.update();
		}
		
		//=============================================================
		//查询接口
		//=============================================================
		
		/**
		 * 获得地图类型ID
		 * @return 
		 * 
		 */		
		public function get typeID():String
		{
			return _typeID;
		}
		
		/**
		 * 获得地图小类型/状态
		 * @return 
		 * 
		 */		
		public function get subType():String
		{
			return _subType;
		}
		
		/**
		 * 获得当前地形对应的配置信息
		 * @return 
		 * 
		 */		
		public function get configData():TerrainConfigData
		{
			return MainController.instance.terrainConfigParser.getDataByTypeID(this.typeID);
		}
		
		public function get imageUrl():String
		{
			var baseName:String = this.configData.resourceBaseName;
			
			//和自身相同地形的周围地形状态
			var sameTerrainAround:String = this.subType;
			//var sameTerrainAround:String = this.getAroundSame(this.typeID, this.configData.relatedTerrainTypeID);
			
			switch (sameTerrainAround)
			{
				case "1111":
					//中心
					if ( this.configData.tags.hasTag(TerrainTags.CROSS) )
					{
						baseName = "c" + baseName;
					}
					break;
				case "1010":
					//横竖
					if ( this.configData.tags.hasTag(TerrainTags.LINE) )
					{
						baseName = "v" + baseName;
					}
					break;
				case "0101":
					//横竖
					if ( this.configData.tags.hasTag(TerrainTags.LINE) )
					{
						baseName = "h" + baseName;
					}
					break;
				case "1100":
					//弯曲
					if ( this.configData.tags.hasTag(TerrainTags.BEND) )
					{
						baseName = "wn" + baseName;
					}
					break;
				case "0110":
					//弯曲
					if ( this.configData.tags.hasTag(TerrainTags.BEND) )
					{
						baseName = "sw" + baseName;
					}
					break;
				case "0011":
					//弯曲
					if ( this.configData.tags.hasTag(TerrainTags.BEND) )
					{
						baseName = "es" + baseName;
					}
					break;
				case "1001":
					//弯曲
					if ( this.configData.tags.hasTag(TerrainTags.BEND) )
					{
						baseName = "ne" + baseName;
					}
					break;
				case "1110":
					//丁字
					if ( this.configData.tags.hasTag(TerrainTags.BRANCH) )
					{
						baseName = "swn" + baseName;
					}
					break;
				case "0111":
					//丁字
					if ( this.configData.tags.hasTag(TerrainTags.BRANCH) )
					{
						baseName = "esw" + baseName;
					}
					break;
				case "1011":
					//丁字
					if ( this.configData.tags.hasTag(TerrainTags.BRANCH) )
					{
						baseName = "nes" + baseName;
					}
					break;
				case "1101":
					//丁字
					if ( this.configData.tags.hasTag(TerrainTags.BRANCH) )
					{
						baseName = "wne" + baseName;
					}
					break;
				case "1000":
					//起头
					if ( this.configData.tags.hasTag(TerrainTags.HEAD) )
					{
						baseName = "s" + baseName + "end";
					}
					else if ( this.configData.tags.hasTag(TerrainTags.LINE) )
					{
						baseName = "v" + baseName;
					}
					break;
				case "0100":
					//起头
					if ( this.configData.tags.hasTag(TerrainTags.HEAD) )
					{
						baseName = "e" + baseName + "end";
					}
					else if ( this.configData.tags.hasTag(TerrainTags.LINE) )
					{
						baseName = "h" + baseName;
					}
					break;
				case "0010":
					//起头
					if ( this.configData.tags.hasTag(TerrainTags.HEAD) )
					{
						baseName = "n" + baseName + "end";
					}
					else if ( this.configData.tags.hasTag(TerrainTags.LINE) )
					{
						baseName = "v" + baseName;
					}
					break;
				case "0001":
					//起头
					if ( this.configData.tags.hasTag(TerrainTags.HEAD) )
					{
						baseName = "w" + baseName + "end";
					}
					else if ( this.configData.tags.hasTag(TerrainTags.LINE) )
					{
						baseName = "h" + baseName;
					}
					break;
				default:
					break;
			}
			
			if ( baseName == this.configData.resourceBaseName )
			{
				//没变
				if ( this.configData.tags.hasTag(TerrainTags.LINE) )
				{
					//默认横
					baseName = "h" + baseName;
				}
				else if ( this.configData.tags.hasTag(TerrainTags.BEND) )
				{
					baseName = "wn" + baseName;
				}
				else if ( this.configData.tags.hasTag(TerrainTags.BRANCH) )
				{
					baseName = "swn" + baseName;
				}
				else if ( this.configData.tags.hasTag(TerrainTags.CROSS) )
				{
					baseName = "c" + baseName;
				}
				else if ( this.configData.tags.hasTag(TerrainTags.HEAD) )
				{
					baseName = "n" + baseName;
				}
			}
			
			return Urls.getTerrainImageUrl(baseName);
		}
	}
}