package game.sub.map
{
	import game.sub.map.model.MapModel;
	import game.sub.map.view.MapView;

	/**
	 * created by twink @ 2013-8-10 上午11:36:06
	 * <p>
	 * 地图
	 */
	public class Map
	{
		//地图模型
		public var model:MapModel = new MapModel();
		//地图视图
		public var view:MapView = new MapView();
		
		public function Map()
		{
		}
	}
}