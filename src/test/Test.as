package test
{
	import com.twink.tools.message.Messager;
	import com.twink.tools.test.Tester;

	/**
	 * 维护人：车征 2013-5-22 - 今
	 * <p>
	 * 用于编写测试用例
	 */
	public class Test extends Messager
	{
		//测试完成 无参数
		public static const TEST_COMPLETE:String = "TEST_COMPLETE";
		
		private var _tester:Tester = new Tester();
		
		public function Test()
		{
			_tester.addListener(Tester.TEST_COMPLETE, onTestComplete);
			_tester.addTest(testParseTerrainConfig, "地形配置文件解析");
		}
		
		/**
		 * 开始测试
		 * 
		 */		
		public function start():void
		{
			_tester.startTest();
		}
		
		private function onTestComplete():void
		{
			this.send(Test.TEST_COMPLETE);
		}
		
		//测试地形配置文件的解析
		private function testParseTerrainConfig():void
		{
			_tester.next();
		}
	}
}