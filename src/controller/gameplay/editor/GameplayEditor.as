package controller.gameplay.editor
{
	import com.twink.tools.data.DataCell;
	
	import controller.gameplay.base.GamePlay;
	import controller.map.DataCellTerrain;

	/**
	 * created by twink @ 2013-9-5 下午5:35:48
	 * <p>
	 * 编辑器玩法
	 */
	public class GameplayEditor extends GamePlay
	{
		//选中的地形信息
		public var selectedTerrainTypeIDData:DataCellTerrain = new DataCellTerrain();
		
		public function GameplayEditor()
		{
			super();
		}
		
		/**
		 * 设定选中的地形
		 * @param $terrainTypeID
		 * @param $terrainSubType
		 * 
		 */		
		public function setSelectedTerrain($terrainTypeID:String, $terrainSubType:String):void
		{
			this.selectedTerrainTypeIDData.typeID = $terrainTypeID;
			this.selectedTerrainTypeIDData.subType = $terrainSubType;
		}
	}
}