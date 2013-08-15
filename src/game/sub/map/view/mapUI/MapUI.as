package game.sub.map.view.mapUI
{
	/**
	 * created by twink @ 2013-8-10 下午2:35:56
	 * <p>
	 * 地图UI
	 */
	import com.twink.tools.UI.UI;
	import com.twink.tools.game.slg.map.MapData2D;
	import com.twink.tools.game.slg.map.MapNodeData2D;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import game.Game;
	import game.sub.map.model.map.AwGirdData;
	import game.sub.map.view.mapUI.gird.MapGridComponent;
	import game.system.model.consts.MainConst;
	
	public class MapUI extends UI
	{
		//暂存的地图数据
		private var _mapData:MapData2D = null;
		//小格列表
		private var _grids:Array = [];
		
		public function MapUI()
		{
			super();
		}
		
		public function openWithMapData($mapData:MapData2D):void
		{
			_mapData = $mapData;
			
			super.open();
		}
		
		protected override function onAddToStage($evt:Event):void
		{
			super.onAddToStage($evt);
			
			var list:Array = _mapData.nodeList();
			var size:int = list.length;
			for ( var i:int = 0; i < size; i++ )
			{
				var node:MapNodeData2D = list[i];
				var gridData:AwGirdData = node.content as AwGirdData;
				
				var sp:Sprite = new Sprite();
				sp.x = node.position.x * MainConst.PIXL_GRID_WIDTH;
				sp.y = node.position.y * MainConst.PIXL_GRID_HEIGHT;
				(this.display as DisplayObjectContainer).addChild(sp);
				
				var gridComponent:MapGridComponent = new MapGridComponent();
				gridComponent.relateWithData(sp, gridData);
				
				_grids.push(gridComponent);
			}
		}
		
		protected override function onRemoveFromStage($evt:Event):void
		{
			var size:int = _grids.length;
			for ( var i:int = 0; i < size; i++ )
			{
				var gridComponent:MapGridComponent = _grids[i];
				gridComponent.unrelate();
			}
			
			_mapData = null;
			_grids = [];
			
			super.onRemoveFromStage($evt);
		}
		
		protected override function addUIToStage():void
		{
			Game.instance.addChild(this.display);
		}
	}
}