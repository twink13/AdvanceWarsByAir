package test
{
	public class Test1
	{		
		[Before]
		public function setUp():void
		{
			trace("111");
		}
		
		[After]
		public function tearDown():void
		{
			trace("222");
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
			trace("333");
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
			trace("444");
		}
		
		
	}
}