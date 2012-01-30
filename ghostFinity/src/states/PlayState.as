package states 
{
	import colliders.Collider;
	
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.system.System;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	
	import staff.Ghost;
	import staff.Player;
	
	import util.ConstService;
	import util.PlayStateService;

	/*.
	 * @author stephan&ric
	 */
	 
	public class PlayState extends FlxState 
	{
		[Embed(source="../assets/map2.png")] private var ImgMap:Class;
		[Embed(source="../assets/tiles.png")] private var ImgTiles:Class;
		
		[Embed(source='../assets/fonts/bavaria.ttf', embedAsCFF="false", fontName="bavaria", mimeType="application/x-font-truetype")]
		private static var bavaria:Class;
		
		Font.registerFont(bavaria);
		
		private var level:FlxTilemap;
		
		private var bob:Player;
		private var ghost1:Ghost;
		private var ghost2:Ghost;
		private var ghost3:Ghost;
		private var ghost4:Ghost;
		
		private var exit:FlxSprite;
		private var cam:FlxCamera;
		private var infoText:TextField;
		private var weekDayText:TextField;
		private var colliderGroup:FlxGroup;
		
		private var currentDay:String;
		private var frameCount:int;
		
		public static const TILE_WIDTH:uint = 8;
		
		private var playStateServiceInst:PlayStateService;

		public function PlayState(reset:Boolean = false)
		{
			playStateServiceInst = PlayStateService.getInstance(); 
			
			if(reset)
				startPlay();
		}
		
		override public function create():void
		{
			trace("#PlayState::create#");
			playStateServiceInst = PlayStateService.getInstance(); 
			
			createBackGround();
			
			FlxG.bgColor = 0xffffffff;
			
			createLevel();
			
			colliderGroup = new FlxGroup();
			add(colliderGroup);
			createAndAddColliders();
			
			setFrameCountByWeekDay(playStateServiceInst.currentWeekDay);
			createPlayerByWeekDay(playStateServiceInst.currentWeekDay);
		
			createForeGround();
			
			createExit();
			
			createCamera();
		}

		private function setFrameCountByWeekDay(weekDay:String):void
		{
			switch(weekDay)
			{
				case "MON":
					laterInOffice(50);
					break;
				case "TUE":
					laterInOffice(100);
					break;
				case "WED":
					laterInOffice(150);
					break;
				case "THU":
					laterInOffice(200);
					break;
				case "FRI":
					laterInOffice(250);
					break;
					
				default:
					laterInOffice(0);
					break;
			}
		}

		private function laterInOffice(inc:int):void
		{
			trace("Sorry, I'm "+inc+" to late ! ");
			
			for (var i:int = 0; i < inc; i++)
				playStateServiceInst.ghostPlayerArray.push(new Point(-20, 50));
		}

		private function createAndAddColliders():void
		{
			var colliderComputerArray:Array 	= PlayStateService.getColliderPositionArray(ConstService.ASSET_ID_COMPUTER);
			var colliderFlowerBigArray:Array 	= PlayStateService.getColliderPositionArray(ConstService.ASSET_ID_FLOWERS_BIG);
			var colliderFlowerSmallArray:Array 	= PlayStateService.getColliderPositionArray(ConstService.ASSET_ID_FLOWERS_SMALL);
			var colliderChairLeftArray:Array 	= PlayStateService.getColliderPositionArray(ConstService.ASSET_ID_CHAIR_LEFT);
			var colliderChairRightArray:Array 	= PlayStateService.getColliderPositionArray(ConstService.ASSET_ID_CHAIR_RIGHT);
			var colliderCupArray:Array 			= PlayStateService.getColliderPositionArray(ConstService.ASSET_ID_CUP);
		
			addColliders(colliderComputerArray, 	ConstService.ImgColliderComputer);
			addColliders(colliderFlowerSmallArray, 	ConstService.ImgColliderFlowersSmall);
			addColliders(colliderFlowerBigArray, 	ConstService.ImgColliderFlowersBig);
			addColliders(colliderChairLeftArray, 	ConstService.ImgColliderChairLeft);
			addColliders(colliderChairRightArray, 	ConstService.ImgColliderChairRight);
			addColliders(colliderCupArray, 			ConstService.ImgColliderCup);
		}


		private function createLevel():void
		{
			level = new FlxTilemap();
			level.loadMap(FlxTilemap.arrayToCSV(PlayStateService.LELVEL_MAP_0, 75), ConstService.ImgTiles, 0, 0, FlxTilemap.OFF, 1, 1, 1);
			add(level);
		}


		private function createBackGround():void
		{
			var bg:FlxSprite = new FlxSprite(0,0, ConstService.ImgBG);
			bg.active = false;
			bg.allowCollisions = 0;
			add(bg);
		}
		
		private function createForeGround():void
		{
			var fg:FlxSprite = new FlxSprite(0,0, ConstService.ImgFG);
			fg.active = false;
			fg.allowCollisions = 0;
			add(fg);
		}


		private function addColliders(positionsArray:Array, image:Class):void
		{
			var spawn:Point; 
			for(var i:uint = 0; i < positionsArray.length; i ++)
			{
				spawn = positionsArray[i] as Point;
				addCollider(spawn.x, spawn.y, image, ConstService.WEIGHT_MONITOR);
			}
		}
		
		private function addCollider(X:Number,Y:Number, image:Class, mass:int = 50 ):void
		{
			var col:Collider = new Collider(X, Y, image, mass);
			colliderGroup.add(col);
		}
		
		private function createExit():void
		{
			exit = new FlxSprite(571, 70).makeGraphic(10, 5, 0x00ffff00);
			add(exit);
		}
		
		private function createPlayerByWeekDay(weekDay:String):void
		{
			if(playStateServiceInst.currentWeekDay == "MON")
			{
				trace("#createPlayer::MO");
				bob = createPlayer(0xFFFF0000);
				
				add(bob);
			}
			else if(playStateServiceInst.currentWeekDay == "TUE")
			{
				trace("#createPlayer::DI");
				bob = createPlayer(0xFFFF0000);
				ghost1 = createGhost(0xFF8CF1FF);
				
				add(bob);
				add(ghost1);
			}
			else if(playStateServiceInst.currentWeekDay == "WED")
			{
				trace("#createPlayer::MI");
				bob = createPlayer(0xFFFF0000);
				ghost1 = createGhost(0xFF8CF1FF);
				ghost2 = createGhost(0xFF8CF1FF);
				
				add(bob);
				add(ghost1);
				add(ghost2);
			}
			else if(playStateServiceInst.currentWeekDay == "THU")
			{
				trace("#createPlayer::DO");
				bob = createPlayer(0xFFFF0000);
				ghost1 = createGhost(0xFF8CF1FF);
				ghost2 = createGhost(0xFF8CF1FF);
				ghost3 = createGhost(0xFF8CF1FF);
				
				add(bob);
				add(ghost1);
				add(ghost2);
				add(ghost3);
			}
			else if(playStateServiceInst.currentWeekDay == "FRI")
			{
				trace("#createPlayer::FR");
				bob = createPlayer(0xFFFF0000);
				ghost1 = createGhost(0xFF8CF1FF);
				ghost2 = createGhost(0xFF8CF1FF);
				ghost3 = createGhost(0xFF8CF1FF);
				ghost4 = createGhost(0xFF8CF1FF);
				
				add(bob);
				add(ghost1);
				add(ghost2);
				add(ghost3);
				add(ghost4);
			}
		}
		
		private function createPlayer(color:uint, x:Number=20, y:Number=50):Player
		{
			var flxSpr:Player = new Player(x,y);
			flxSpr.health = 100;
			return flxSpr;
		}
		
		private function createGhost(color:uint, x:Number=10, y:Number=10):Ghost
		{
			var flxSpr:Ghost = new Ghost(x,y)
			return flxSpr;
		}
		
		private function createCamera():void
		{
			cam = new FlxCamera(0, 0, FlxG.width/4, FlxG.height/4);
			cam.follow(bob);
			cam.setBounds(0, 0, level.width, level.height, false);
			cam.color = 0xFFFFFF; 
			
			var textFormat:TextFormat = new TextFormat();
			textFormat.font = "bavaria";
			textFormat.align = TextFormatAlign.CENTER;
			textFormat.color = 0xffffff;
			textFormat.size = 5;

			infoText = new TextField();
			infoText.antiAliasType = AntiAliasType.ADVANCED;
			infoText.selectable = false;
			infoText.embedFonts = true;
			infoText.text="HEALTH: 100";
			infoText.defaultTextFormat = textFormat;
			infoText.y = 29;
			infoText.x = 0;

			weekDayText = new TextField();
			weekDayText.antiAliasType = AntiAliasType.ADVANCED;
			weekDayText.selectable = false;
			weekDayText.embedFonts = true;
			weekDayText.text = playStateServiceInst.currentWeekDay ? playStateServiceInst.currentWeekDay : " ";
			weekDayText.defaultTextFormat = textFormat;
			weekDayText.y = 29;
			weekDayText.x = -112;
			
			infoText.setTextFormat(textFormat);
			weekDayText.setTextFormat(textFormat);
			
			var spr:Sprite = cam.getContainerSprite();
			spr.addChild(infoText);
			spr.addChild(weekDayText);
			
			FlxG.addCamera(cam);
		}
		
		
		override public function update():void
		{
			frameCount++;
			
			FlxG.collide();
			
			updatePlayer();
			
			updateGhost();
			
			FlxG.overlap(exit, bob, onExit);
			
			if(FlxG.keys.justPressed("R"))
			{
				startPlay();
				FlxG.switchState(new PlayState());
			}
				
			super.update();
		}

		private function updatePlayer():void
		{
			if(bob)
			{
				playerControl(bob);
				var point:Point = new Point(bob.x, bob.y);
		
				playStateServiceInst.ghostPlayerArray.push(point); 
			}
		}

		private function updateGhost():void
		{
			if(ghost1)
				setGhostPositionByDay("MON", ghost1);
		
			if(ghost2)
				setGhostPositionByDay("TUE", ghost2);
		
			if(ghost3)
				setGhostPositionByDay("WED", ghost3);
		
			if(ghost4)
				setGhostPositionByDay("THU", ghost4);
		}

		private function setGhostPositionByDay(day:String, ghost:Ghost):void
		{
			if(playStateServiceInst.ghostPlayerDict[day] && frameCount <playStateServiceInst.ghostPlayerDict[day].length && playStateServiceInst.ghostPlayerDict[day][frameCount])
			{
				ghost1.x = playStateServiceInst.ghostPlayerDict[day][frameCount].x;
				ghost1.y = playStateServiceInst.ghostPlayerDict[day][frameCount].y;
			}
		
			FlxG.overlap(exit, ghost, dieNow);
			FlxG.overlap(bob, ghost, overlapPlayer);
		}


		private function overlapPlayer(player:FlxSprite, ghost:FlxSprite):void
		{
			if(player.health != 0)
			{
				player.health -= 1;
			}
			else
			{
				FlxG.switchState(new GameOverState());
				resetWeek();
			}
			
			infoText.text = "HEALTH: "+player.health;
			
			trace("Achtung !!! "+player.health);
		}


		private function dieNow(exit:FlxSprite, ghost:FlxSprite):void
		{
			trace("die now, Du Ghost");
			ghost.kill();
		}

		// exit, player
		private function onExit(exit:FlxSprite, player:FlxSprite):void
		{
			
			startPlay();
			
			if(playStateServiceInst.currentWeekDay != "SAT")
			{
				FlxG.switchState(new ElevatorState(300));
			}
			else
			{
				FlxG.switchState(new WeekendState());
			}
		}

		private function playerControl(player:FlxSprite):void
		{
			player.acceleration.x = 0;
		
			if(FlxG.keys.LEFT)
				player.acceleration.x = -player.maxVelocity.x*4;
		
			if(FlxG.keys.RIGHT)
				player.acceleration.x = player.maxVelocity.x*4;
		
			if(FlxG.keys.justPressed("UP") && bob.isTouching(FlxObject.FLOOR))
				player.velocity.y -= player.maxVelocity.y/1.5;
			
		}

		private function resetWeek():void
		{
			
			playStateServiceInst.ghostPlayerArray = [];
			playStateServiceInst.ghostPlayerDict = [];
			playStateServiceInst.currentWeekDay = "MON";
			resetGarbageCollection();
		}
		
		private function startPlay():void
		{
			var arr:Array = playStateServiceInst.ghostPlayerArray.slice(0, playStateServiceInst.ghostPlayerArray.length);
			playStateServiceInst.ghostPlayerArray = [];
			playStateServiceInst.ghostPlayerDict[playStateServiceInst.currentWeekDay] = arr; 
			
			var weekDayIndex:int = ConstService.WEEK_DAYS.indexOf(playStateServiceInst.currentWeekDay);
			weekDayIndex = (weekDayIndex+1)%ConstService.WEEK_DAYS.length;
			playStateServiceInst.currentWeekDay = ConstService.WEEK_DAYS[weekDayIndex];
			
			resetGarbageCollection();
		}

		private function resetGarbageCollection():void
		{
			System.gc();
			System.gc();
		}
	}
}