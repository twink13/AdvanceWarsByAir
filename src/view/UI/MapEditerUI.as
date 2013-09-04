package view.UI
{
	import com.twink.tools.game.slg.map.MapData2D;
	
	import flash.display.Sprite;
	
	import view.MainView;
	import view.map.MapComponent;
	import view.util.ViewLog;

	/**
	 * created by twink @ 2013-9-4 下午4:17:59
	 * <p>
	 * 地图编辑器UI
	 */
	public class MapEditerUI
	{
		//private var _container:Sprite = null;
		
		private var _mapCompoent:MapComponent = null;
		
		public function MapEditerUI()
		{
		}
		
		/**
		 * 打开地图编辑器UI
		 * @param $mapData 初始地图数据
		 * 
		 */		
		public function open($mapData:MapData2D):void
		{
			ViewLog.addLog("打开地图编辑器UI! ");
			
			_mapCompoent = new MapComponent();
			
			_mapCompoent.setData($mapData);
			
			var mapDisplay:Sprite = new Sprite();
			_mapCompoent.relate(mapDisplay);
			MainView.instance.addChild(mapDisplay);
		}
		
		/**
		 * 关闭地图编辑器UI
		 * 
		 */		
		public function close():void
		{
			ViewLog.addLog("关闭地图编辑器UI! ");
			_mapCompoent.display.parent.removeChild(_mapCompoent.display);
			_mapCompoent = null;
		}
	}
}