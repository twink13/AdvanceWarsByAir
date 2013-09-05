package view.editor
{
	/**
	 * created by twink @ 2013-9-5 下午6:32:00
	 * <p>
	 * 编辑器选择用地形列表
	 */
	import com.twink.tools.component.Component;
	
	import controller.map.AwGirdData;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import view.consts.ViewConsts;
	
	public class EditorGridListComponent extends Component
	{
		//小格数据列表
		private var _gridDataList:Array = null;
		//小格列表
		private var _grids:Array = [];
		
		public function EditorGridListComponent()
		{
			super();
		}
		
		public function setData($gridList:Array):void
		{
			_gridDataList = $gridList;
		}
		
		public override function relate($display:DisplayObject):void
		{
			super.relate($display);
			
			
			var list:Array = _gridDataList;
			var size:int = list.length;
			for ( var i:int = 0; i < size; i++ )
			{
				var gridData:AwGirdData = list[i];
				
				var sp:Sprite = new Sprite();
				sp.x = i * ViewConsts.PIXL_GRID_WIDTH;
				
				(this.display as DisplayObjectContainer).addChild(sp);
				
				var gridComponent:EditorGridComponent = new EditorGridComponent();
				gridComponent.setData(gridData);
				gridComponent.relate(sp);
				
				//_grids.push(gridComponent);
			}
		}
		
		public override function unrelate():void
		{
			var size:int = _grids.length;
			for ( var i:int = 0; i < size; i++ )
			{
				var gridComponent:EditorGridComponent = _grids[i];
				gridComponent.unrelate();
			}
			
			_gridDataList = null;
			_grids = [];
			
			super.unrelate();
		}
	}
}