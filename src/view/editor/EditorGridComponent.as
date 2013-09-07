package view.editor
{
	import com.twink.tools.component.Component;
	
	import flash.events.MouseEvent;
	
	import view.MainView;
	import view.map.GridComponent;

	/**
	 * created by twink @ 2013-9-5 下午5:00:38
	 * <p>
	 * 专门用于编辑器的小格
	 */
	public class EditorGridComponent extends GridComponent
	{
		public function EditorGridComponent()
		{
			super();
		}
		
		protected override function onThisClick($evt:MouseEvent):void
		{
			//选中当前项目
			MainView.instance.controller.editorSetSelectTerrain(this.gridData.terrainData.typeID, this.gridData.terrainData.subType);
		}
	}
}