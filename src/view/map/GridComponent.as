package view.map
{
	import com.twink.tools.component.Component;
	import com.twink.tools.data.DataCell;
	
	import controller.map.AwGirdData;
	import controller.map.DataCellTerrain;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	import view.consts.ViewConsts;

	/**
	 * created by twink @ 2013-9-7 上午11:37:36
	 * <p>
	 * 小格子组件
	 */
	public class GridComponent extends Component
	{
		//小格数据
		private var _gridData:AwGirdData = null;
		//图片容器
		private var _imageContainer:UrlImageComponent = null;
		
		public function GridComponent()
		{
			super();
		}
		
		public function setData($gridData:AwGirdData):void
		{
			_gridData = $gridData;
		}
		
		public function get gridData():AwGirdData
		{
			return _gridData;
		}
		
		public override function relate($display:DisplayObject):void
		{
			super.relate($display);
			
			//图片容器相关
			_imageContainer = new UrlImageComponent();
			_imageContainer.relate(this.display);
			_imageContainer.addListener(UrlImageComponent.IMAGE_LOADED, onImageLoaded);
			_imageContainer.loadImage(_gridData.terrainData.imageUrl);
			
			//数据变化相关
			_gridData.terrainData.addListener(DataCell.UPDATE, onTerrainDataUpdate);
			
			//操作相关
			this.display.addEventListener(MouseEvent.CLICK, onThisClick);
		}
		
		public override function unrelate():void
		{
			_gridData.terrainData.removeListener(DataCell.UPDATE, onTerrainDataUpdate);
			this.display.removeEventListener(MouseEvent.CLICK, onThisClick);
			//
			_imageContainer.removeListener(UrlImageComponent.IMAGE_LOADED, onImageLoaded);
			_imageContainer.unrelate();
			_imageContainer = null;
			
			super.unrelate();
		}
		
		/**
		 * 点击自身
		 * @param $evt
		 * 
		 */		
		protected function onThisClick($evt:MouseEvent):void
		{
			//子类自己实现去
		}
		
		//图片加载完毕
		private function onImageLoaded():void
		{
			//修正图片位置
			_imageContainer.imageDisplay.y = ViewConsts.PIXL_GRID_HEIGHT - _imageContainer.imageDisplay.height;
		}
		
		//地形变化
		private function onTerrainDataUpdate($terrainData:DataCellTerrain):void
		{
			_imageContainer.loadImage(_gridData.terrainData.imageUrl);//test
		}
	}
}