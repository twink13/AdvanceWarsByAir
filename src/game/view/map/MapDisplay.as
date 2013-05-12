package game.view.map
{
	/**
	 * created by twink @ 2013-5-11 下午4:52:12
	 * <p>
	 * 地图元件视图
	 */
	import com.twink.tools.game.slg.map.MapData2D;
	import com.twink.tools.game.slg.map.MapNodeData2D;
	
	import flash.display.Sprite;
	
	import game.model.consts.MainConst;
	
	public class MapDisplay extends Sprite
	{
		public function MapDisplay()
		{
			super();
		}
		
		//===================================================================
		//初始化接口
		//===================================================================
		
		/**
		 * 创建节点容器资源
		 * @param $mapData 地图数据
		 * 
		 */		
		public function createNodeDisplay($mapData:MapData2D):void
		{
			var nodeList:Array = $mapData.nodeList();
			var size:int = nodeList.length;
			for ( var i:int = 0; i < size; i++ )
			{
				var node:MapNodeData2D = nodeList[i];
				
				//创建容器
				var container:Sprite = new Sprite();
				
				//初始化容器
				container.x = node.position.x * MainConst.PIXL_GRID_WIDTH;
				container.y = node.position.y * MainConst.PIXL_GRID_HEIGHT;
				container.name = node.ID;//子容器通过ID查询
				
				//添加到自身
				this.addChild(container);
			}
		}
		
		//===================================================================
		//数据读取接口
		//===================================================================
		/**
		 * 获得节点容器资源
		 * @param $ID 节点ID
		 * @return 
		 * 
		 */		
		public function getContainerDisplayByID($ID:String):Sprite
		{
			return this.getChildByName($ID) as Sprite;
		}
	}
}