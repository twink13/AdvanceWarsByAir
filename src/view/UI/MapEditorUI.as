package view.UI
{
	import com.twink.tools.game.slg.map.MapData2D;
	
	import flash.display.Sprite;
	
	import view.MainView;
	import view.consts.ViewConsts;
	import view.editor.EditorGridListComponent;
	import view.map.MapComponent;
	import view.util.ViewLog;

	/**
	 * created by twink @ 2013-9-4 下午4:17:59
	 * <p>
	 * 地图编辑器UI
	 */
	public class MapEditorUI
	{
		//private var _container:Sprite = null;
		
		private var _mapCompoent:MapComponent = null;
		private var _editGridListComponent:EditorGridListComponent = null;
		
		public function MapEditorUI()
		{
		}
		
		/**
		 * 打开地图编辑器UI
		 * @param $mapData 初始地图数据
		 * 
		 */		
		public function open($mapData:MapData2D, $canEditTerrainList:Array):void
		{
			ViewLog.addLog("打开地图编辑器UI! ");
			
			_mapCompoent = new MapComponent();
			_mapCompoent.setData($mapData);
			var mapDisplay:Sprite = new Sprite();
			_mapCompoent.relate(mapDisplay);
			MainView.instance.addChild(mapDisplay);
			
			var editGridListDisplay:Sprite = new Sprite();
			editGridListDisplay.y = $mapData.hight * ViewConsts.PIXL_GRID_HEIGHT + 20;
			
			_editGridListComponent = new EditorGridListComponent();
			_editGridListComponent.setData($canEditTerrainList);
			_editGridListComponent.relate(editGridListDisplay);
			MainView.instance.addChild(editGridListDisplay);
		}
		
		/**
		 * 关闭地图编辑器UI
		 * 
		 */		
		public function close():void
		{
			ViewLog.addLog("关闭地图编辑器UI! ");
			_mapCompoent.display.parent.removeChild(_mapCompoent.display);
			_editGridListComponent.display.parent.removeChild(_editGridListComponent.display);
			
			_mapCompoent.unrelate();
			_editGridListComponent.unrelate();
			
			_mapCompoent = null;
			_editGridListComponent = null;
		}
	}
}