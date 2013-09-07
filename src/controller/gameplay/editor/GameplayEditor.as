package controller.gameplay.editor
{
	import com.twink.tools.data.DataCell;
	
	import controller.consts.TerrainSubTypes;
	import controller.consts.Terrains;
	import controller.gameplay.base.GamePlay;
	import controller.map.AwGirdData;
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
			
			//默认
			this.setSelectedTerrain(Terrains.PLAIN, TerrainSubTypes.DEFAULT);
		}
		
		/**
		 * 设定选中的地形
		 * @param $terrainTypeID
		 * @param $terrainSubType
		 * 
		 */		
		public function setSelectedTerrain($terrainTypeID:String, $terrainSubType:String):void
		{
			selectedTerrainTypeIDData.setUp($terrainTypeID, $terrainSubType);
		}
		
		/**
		 * 点击地图上的小格
		 * @param $gridData
		 * 
		 */		
		public override function clickMapGrid($gridData:AwGirdData):void
		{
			//将选择的地形写入点击的地形
			$gridData.terrainData.setUp(this.selectedTerrainTypeIDData.typeID, this.selectedTerrainTypeIDData.subType);
			$gridData.changeSubType(true);
		}
	}
}