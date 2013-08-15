package game.sub.map.view.mapUI.gird
{
	import com.twink.tools.UI.UI;
	import com.twink.tools.component.Component;
	import com.twink.tools.load.Reader;
	import com.twink.tools.load.ReaderData;
	import com.twink.tools.load.ReaderTypes;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	import game.Game;
	import game.sub.map.model.map.AwGirdData;
	import game.system.model.consts.MainConst;

	/**
	 * created by twink @ 2013-8-10 下午2:40:41
	 * <p>
	 * 地图小格UI
	 */
	public class MapGridComponent extends Component
	{
		//小格数据
		private var _gridData:AwGirdData = null;
		//加载的图片资源
		private var _imageContent:DisplayObject = null;
		
		public function MapGridComponent()
		{
			super();
		}
		
		public function relateWithData($display:DisplayObject, $gridData:AwGirdData):void
		{
			_gridData = $gridData;
			
			super.relate($display);
			
			
			Game.instance.system.controller.mainReader.addListener(_gridData.imageUrl, onImageRead);
			Game.instance.system.controller.mainReader.read(_gridData.imageUrl, ReaderTypes.SOURCE_TYPE_LOCAL, ReaderTypes.FILE_TYPE_BMP);
		}
		
		public override function unrelate():void
		{
			//
			Game.instance.system.controller.mainReader.removeListener(_gridData.imageUrl, onImageRead);
			
			if ( _imageContent && _imageContent.parent )
			{
				_imageContent.parent.removeChild(_imageContent);
			}
			
			_imageContent = null;
			
			super.unrelate();
		}
		
		private function onImageRead($readerData:ReaderData):void
		{
			Game.instance.system.controller.mainReader.removeListener(_gridData.imageUrl, onImageRead);
			_imageContent = new Bitmap($readerData.contentData.value);
			
			_imageContent.y = MainConst.PIXL_GRID_HEIGHT - _imageContent.height;
			
			(this.display as DisplayObjectContainer).addChild(_imageContent);
		}
	}
}