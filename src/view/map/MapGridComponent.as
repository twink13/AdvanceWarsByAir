package view.map
{
	import com.twink.tools.UI.UI;
	import com.twink.tools.component.Component;
	import com.twink.tools.data.DataCell;
	import com.twink.tools.load.Reader;
	import com.twink.tools.load.ReaderData;
	import com.twink.tools.load.ReaderTypes;
	
	import controller.map.AwGirdData;
	import controller.map.DataCellTerrain;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.hamcrest.object.nullValue;
	
	import view.MainView;
	import view.consts.ViewConsts;

	/**
	 * created by twink @ 2013-8-10 下午2:40:41
	 * <p>
	 * 地图小格UI
	 */
	public class MapGridComponent extends GridComponent
	{
		public function MapGridComponent()
		{
			super();
		}
		
		public override function relate($display:DisplayObject):void
		{
			super.relate($display);
			
			this.display.addEventListener(MouseEvent.ROLL_OVER, onRollOver);
		}
		
		public override function unrelate():void
		{
			this.display.removeEventListener(MouseEvent.ROLL_OVER, onRollOver);
			
			super.unrelate();
		}
		
		/**
		 * 点击自身
		 * @param $evt
		 * 
		 */		
		protected override function onThisClick($evt:MouseEvent):void
		{
			MainView.instance.controller.clickMapGrid(this.gridData);
		}
		
		private function onRollOver($evt:MouseEvent):void
		{
			if ( $evt.buttonDown )
			{
				MainView.instance.controller.clickMapGrid(this.gridData);
			}
		}
	}
}