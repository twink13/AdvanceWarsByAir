package test
{
	/**
	 * 维护人：车征 2013-5-22 - 今
	 * <p>
	 * 用于编写测试用例
	 */
	public class Test
	{
		//错误示例
		private var _a1:int;
		private var _a2:int;
		
		//正确示例
		private var _maxCount:int;
		private var _minCount:int;
		
		//正确示例
		public static const MAX_COUNT:itn = 3;
		
		public function Test()
		{
		}
		
		//错误示例
		public function pgUp():void
		{
			
		}
		
		//正确示例
		public function pageUp():void
		{
			
		}
		
		//正确示例
		private var _mySelfName:String;
		
		
		/**
		 * 进入游戏
		 * @param nick 昵称
		 * @return 是否成功
		 * 
		 */		
		public function enterGame(nick:String):Boolean
		{
			var x:int;
			var y:int;
			
			//错误示例
			x = 1; y = 2;
			
			//正确示例
			x = 1;
			y = 2;
			
			//错误示例
			x = getX();
			y = getY();
			this.enterWorld(x, y);
			
			//正确示例
			x = getX();
			y = getY();
			
			this.enterWorld(x, y);
			
			//错误示例
			x = a + b * c;
			
			//正确示例
			x = a + (b * c);
			
			//错误示例
			if ( length > 10 )
			{
				
			}
			//正确示例
			if ( length > MAX_COUNT )
			{
				
			}
			
			//错误示例
			x=a+b;
			
			//正确示例
			x = a + b;
			
			//错误示例
			if ( ( a < b ) && ( a < c ) )
			{
				
			}
			
			//正确示例
			if ( (a<b) && (a<c) )
			{
				
			}
			
			//错误示例
			var i,j,k;
			this.enterWorld(x,y);
			
			//正确示例
			var i, j, k;
			this.enterWorld(x, y);
			
			//错误示例
			if ( a > b ){
				
			}
			
			//正确示例
			if ( a > b )
			{
				
			}
			
			//错误示例
			if ( a > b )
				count++;
			
			//正确示例
			if ( a > b )
			{
				count++;
			}
			
			//错误示例
			switch (type)
			{
				case TANK:
					tankCount++;
					break;
			}
			
			//正确示例
			switch (type)
			{
				case TANK:
				{
					tankCount++;
					break;
				}
			}
			
			//错误示例
			//正确示例
			
			//正确示例
			switch (type)
			{
				case TANK:
				{
					tankCount++;
					break;
				}
				case ITEM:
				{
					itemCount++;
					break;
				}
				default:
				{
					break;
				}
			}
			
			//错误示例
			for ( var i:int = 0; i < size; i++ )
			{
				if ( i == 5 )
				{
					i = i + 1;
				}
			}
			
			//正确示例
			for ( var i:int = 0; i < size; i++ )
			{
				if ( i == 5 )
				{
					continue;
				}
			}
			
			//错误示例
			//正确示例
			
		}
	}
}