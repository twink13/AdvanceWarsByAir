package controller.consts
{
	/**
	 * created by twink @ 2013-9-5 上午10:59:53
	 * <p>
	 * 地形的二级类型
	 */
	public class TerrainSubTypes
	{
		//尽头型
		public static const HEAD_U:String 	= "1000";	//
		public static const HEAD_L:String 	= "0100";	//
		public static const HEAD_D:String 	= "0010";	//
		public static const HEAD_R:String 	= "0001";	//
		
		//直线型
		public static const LINE_UD:String 	= "1010";	//
		public static const LINE_LR:String 	= "0101";	//
		
		//弯曲型
		public static const BEND_UL:String 	= "1100";	//
		public static const BEND_UR:String 	= "1001";	//
		public static const BEND_LD:String 	= "0110";	//
		public static const BEND_DR:String 	= "0011";	//
		
		//分支型
		public static const BRANCH_ULD:String 	= "1110";	//
		public static const BRANCH_ULR:String 	= "1101";	//
		public static const BRANCH_UDR:String 	= "1011";	//
		public static const BRANCH_LDR:String 	= "0111";	//
		
		//其他
		public static const CROSS_ULDR:String 	= "1111";	//
		public static const NONE:String 	= "0000";	//
	}
}