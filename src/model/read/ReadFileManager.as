package model.read
{
	import com.twink.tools.library.Library;
	import com.twink.tools.load.Reader;
	import com.twink.tools.load.ReaderData;
	
	import model.MainModel;

	/**
	 * created by twink @ 2013-8-28 下午10:50:39
	 * <p>
	 * 文件加载管理
	 */
	public class ReadFileManager
	{
		//主加载器
		public var mainReader:Reader = new Reader(3);
		
		public function ReadFileManager($library:Library)
		{
			this.mainReader.addListener(Reader.FILE_COMPLETE, onFileComplete);
			this.mainReader.setLibrary($library);
		}
		
		private function onFileComplete($readerData:ReaderData):void
		{
			MainModel.instance.send(MainModel.FILE_LOADED, $readerData);
		}
	}
}