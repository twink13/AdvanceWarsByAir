package controller.data
{
	import com.twink.tools.data.DataCell;
	
	import controller.consts.GameModes;

	/**
	 * created by twink @ 2013-9-4 下午9:54:42
	 * <p>
	 * 保存系统信息
	 */
	public class SystemData
	{
		//游戏模式
		public var gameModeData:DataCell = new DataCell(GameModes.NONE);
		
		public function SystemData()
		{
		}
	}
}