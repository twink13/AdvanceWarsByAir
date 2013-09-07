package view.map
{
	/**
	 * created by twink @ 2013-9-6 下午10:06:23
	 * <p>
	 * 通过url显示图像到容器的组件
	 */
	import com.twink.tools.component.Component;
	import com.twink.tools.load.ReaderData;
	import com.twink.tools.load.ReaderTypes;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	import org.hamcrest.object.nullValue;
	
	import view.MainView;
	import view.consts.ViewConsts;
	
	public class UrlImageComponent extends Component
	{
		//图片加载完毕 无参数
		public static const IMAGE_LOADED:String = "IMAGE_LOADED";
		
		//加载的url
		private var _url:String = null;
		//加载的图片结果
		private var _image:DisplayObject = null;
		
		public function UrlImageComponent()
		{
			super();
		}
		
		/**
		 * 通过url显示图像
		 * @param $url
		 * 
		 */		
		public function loadImage($url:String):void
		{
			this.clearImage();
			
			_url = $url;
			
			MainView.instance.addListener(_url, onImageRead);
			MainView.instance.read(_url, Configer.SOURCE_TYPE_PIC, ReaderTypes.FILE_TYPE_BMP);
		}
		
		/**
		 * 清除图像内容
		 * 
		 */		
		public function clearImage():void
		{
			if ( _url )
			{
				MainView.instance.removeListener(_url, onImageRead);
			}
			if ( _image && _image.parent )
			{
				_image.parent.removeChild(_image);
			}
			
			_url = null;
			_image = null;
		}
		
		/**
		 * 获得显示的图像
		 * @return 
		 * 
		 */		
		public function get imageDisplay():DisplayObject
		{
			return _image;
		}
		
		public override function relate($display:DisplayObject):void
		{
			super.relate($display);
			
			
		}
		
		public override function unrelate():void
		{
			this.clearImage();
			super.unrelate();
		}
		
		//加载图片完毕
		private function onImageRead($readerData:ReaderData):void
		{
			//默认位置为0 0点
			MainView.instance.removeListener(_url, onImageRead);
			_image = new Bitmap($readerData.contentData.value);
			
			(this.display as DisplayObjectContainer).addChild(_image);
			
			this.send(UrlImageComponent.IMAGE_LOADED);
		}
	}
}