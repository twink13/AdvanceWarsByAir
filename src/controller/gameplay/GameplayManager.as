package controller.gameplay
{
	import com.twink.tools.data.DataCell;
	
	import controller.consts.GameModes;
	import controller.gameplay.base.GamePlay;
	import controller.gameplay.editor.GameplayEditor;

	/**
	 * created by twink @ 2013-9-5 下午5:33:59
	 * <p>
	 * 用于管理玩法
	 */
	public class GameplayManager
	{
		//游戏模式
		public var gameModeData:DataCell = new DataCell(GameModes.NONE);
		
		//编辑器玩法
		public var gameplayEditor:GameplayEditor = new GameplayEditor();
		
		//当前选择的玩法
		public var currentGameplay:GamePlay = gameplayEditor;
		
		public function GameplayManager()
		{
			
		}
		
		/**
		 * 进入编辑器模式
		 * 
		 */		
		public function enterEditorMode():void
		{
			this.gameModeData.value = GameModes.EDIT;
			this.currentGameplay = gameplayEditor;
		}
	}
}