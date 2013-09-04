package view.map
{
	/**
	 * created by twink @ 2013-8-10 下午2:35:56
	 * <p>
	 * 地图UI
	 */
	import com.twink.tools.UI.UI;
	import com.twink.tools.component.Component;
	import com.twink.tools.game.slg.map.MapData2D;
	import com.twink.tools.game.slg.map.MapNodeData2D;
	
	import controller.consts.Consts;
	import controller.map.AwGirdData;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import game.Game;
	
	import view.MainView;
	
	public class MapComponent extends Component
	{
		//暂存的地图数据
		private var _mapData:MapData2D = null;
		//小格列表
		private var _grids:Array = [];
		
		public function MapComponent()
		{
			super();
		}
		
		/**
		 * 显示地图
		 * @param $mapData
		 * 
		 */		
		public function setData($mapData:MapData2D):void
		{
			_mapData = $mapData;
		}
		
		public override function relate($display:DisplayObject):void
		{
			super.relate($display);
			
			var list:Array = _mapData.nodeList();
			var size:int = list.length;
			for ( var i:int = 0; i < size; i++ )
			{
				var node:MapNodeData2D = list[i];
				var gridData:AwGirdData = node.content as AwGirdData;
				
				var sp:Sprite = new Sprite();
				sp.x = node.position.x * Consts.PIXL_GRID_WIDTH;
				sp.y = node.position.y * Consts.PIXL_GRID_HEIGHT;
				(this.display as DisplayObjectContainer).addChild(sp);
				
				var gridComponent:MapGridComponent = new MapGridComponent();
				gridComponent.relateWithData(sp, gridData);
				
				_grids.push(gridComponent);
			}
		}
		
		public override function unrelate():void
		{
			var size:int = _grids.length;
			for ( var i:int = 0; i < size; i++ )
			{
				var gridComponent:MapGridComponent = _grids[i];
				gridComponent.unrelate();
			}
			
			_mapData = null;
			_grids = [];
			
			super.unrelate();
		}
	}
}