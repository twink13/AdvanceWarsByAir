package game.model.terrain
{
	import game.model.consts.Dir;

	/**
	 * 维护人：车征 2013-5-4 - 今
	 * <p>
	 * 
	 */
	public class TerrainData
	{
		private var _mapSaveData:MapSaveData = null;
		public var typeID:String = null;
		public var x:int = 0;
		public var y:int = 0;
		
		public function TerrainData($mapSaveData:MapSaveData)
		{
			_mapSaveData = $mapSaveData;
		}
		
		public function get saveFlag():String
		{
			return AW.singleton.model.configData.getSaveFlagByID(this.typeID);
		}
		
		public function get linkageID():String
		{
			var linkage:String = AW.singleton.model.configData.getLinkageByFlag(this.typeID);
			
			var dirData:String = getDirEqualData(this.typeID);
			
			switch (this.typeID)
			{
				case Terrains.PIPE:
					if ( dirData == "1100" )
					{
						linkage = "wn" + linkage;
						break;
					}
					if ( dirData == "1001" )
					{
						linkage = "ne" + linkage;
						break;
					}
					if ( dirData == "1010" )
					{
						linkage = "v" + linkage;
						break;
					}
					if ( dirData == "0110" )
					{
						linkage = "sw" + linkage;
						break;
					}
					if ( dirData == "0011" )
					{
						linkage = "es" + linkage;
						break;
					}
					if ( dirData == "1000" )
					{
						linkage = "s" + linkage + "end";
						break;
					}
					if ( dirData == "0100" )
					{
						linkage = "e" + linkage + "end";
						break;
					}
					if ( dirData == "0010" )
					{
						linkage = "n" + linkage + "end";
						break;
					}
					if ( dirData == "0001" )
					{
						linkage = "w" + linkage + "end";
						break;
					}
					linkage = "h" + linkage;
					break;
				
				case Terrains.RIVER:
				case Terrains.ROAD:
					//4
					if ( dirData == "1111" )
					{
						linkage = "c" + linkage;
						break;
					}
					
					//3
					if ( dirData == "0111" )
					{
						linkage = "esw" + linkage;
						break;
					}
					if ( dirData == "1011" )
					{
						linkage = "nes" + linkage;
						break;
					}
					if ( dirData == "1110" )
					{
						linkage = "swn" + linkage;
						break;
					}
					if ( dirData == "1101" )
					{
						linkage = "wne" + linkage;
						break;
					}
					
					//2 拐弯
					if ( dirData == "1100" )
					{
						linkage = "wn" + linkage;
						break;
					}
					if ( dirData == "0011" )
					{
						linkage = "es" + linkage;
						break;
					}
					if ( dirData == "1001" )
					{
						linkage = "ne" + linkage;
						break;
					}
					if ( dirData == "0110" )
					{
						linkage = "sw" + linkage;
						break;
					}
					
					//1
					if ( dirData == "1000" )
					{
						linkage = "v" + linkage;
						break;
					}
					if ( dirData == "0100" )
					{
						linkage = "h" + linkage;
						break;
					}
					if ( dirData == "0010" )
					{
						linkage = "v" + linkage;
						break;
					}
					if ( dirData == "0001" )
					{
						linkage = "h" + linkage;
						break;
					}
					
					//2 直
					if ( dirData == "1010" )
					{
						linkage = "v" + linkage;
						break;
					}
					linkage = "h" + linkage;
					break;
				
				case Terrains.BRIDGE:
					//2 直
					var riverLeft:String = isEquile(_mapSaveData, x, y, Dir.LEFT, Terrains.RIVER);
					var riverRight:String = isEquile(_mapSaveData, x, y, Dir.RIGHT, Terrains.RIVER);
					if ( riverLeft == "1" && riverRight == "1" )
					{
						linkage = "v" + linkage;
						break;
					}
					if ( dirData == "1010" )
					{
						linkage = "v" + linkage;
						break;
					}
					linkage = "h" + linkage;
					break;
				
				case Terrains.SHOAL:
					
					var shoalSeaEqual:String = getDirEqualData(Terrains.SEA);
					//2 拐弯
					if ( dirData == "1100" )
					{
						linkage = linkage + "wn";
						break;
					}
					if ( dirData == "0011" )
					{
						linkage = linkage + "es";
						break;
					}
					if ( dirData == "1001" )
					{
						linkage = linkage + "ne";
						break;
					}
					if ( dirData == "0110" )
					{
						linkage = linkage + "sw";
						break;
					}
					
					//1
					if ( shoalSeaEqual == "1000" )
					{
						linkage = "h" + linkage + "n";
						break;
					}
					if ( shoalSeaEqual == "0100" )
					{
						linkage = "v" + linkage;
						break;
					}
					if ( shoalSeaEqual == "0001" )
					{
						linkage = "v" + linkage + "e";
						break;
					}
					linkage = "h" + linkage;
					break;
			}
			
			return linkage;
		}
		
		private function getDirEqualData(targetTypeID:String):String
		{
			var up:String = isEquile(_mapSaveData, x, y, Dir.UP, targetTypeID);
			var left:String = isEquile(_mapSaveData, x, y, Dir.LEFT, targetTypeID);
			var down:String = isEquile(_mapSaveData, x, y, Dir.DOWN, targetTypeID);
			var right:String = isEquile(_mapSaveData, x, y, Dir.RIGHT, targetTypeID);
			
			return up + left + down + right;
		}
		
		private function isEquile(mapSaveData:MapSaveData, x:int, y:int, dir:int, terrain:String):String
		{
			var dirT:String = getDir(mapSaveData, x, y, dir);
			if ( dirT == terrain )
			{
				return "1";
			}
			return "0";
		}
		
		private function getDir(mapSaveData:MapSaveData, x:int, y:int, dir:int):String
		{
			switch (dir)
			{
				case Dir.UP:
					y--;
					break;
				case Dir.LEFT:
					x--;
					break;
				case Dir.DOWN:
					y++;
					break;
				case Dir.RIGHT:
					x++;
					break;
			}
			
			if ( x < 0 || x >= mapSaveData.width )
			{
				return Terrains.BLANK;
			}
			
			if ( y < 0 || y >= mapSaveData.height )
			{
				return Terrains.BLANK;
			}
			
			return mapSaveData.terrianMap[y][x].typeID;
		}
	}
}