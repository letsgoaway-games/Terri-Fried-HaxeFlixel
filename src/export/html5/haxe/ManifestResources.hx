package;

import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_font_otf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:sizei29196y4:typey5:SOUNDy2:idy18:assets%2Fclick.wavy9:pathGroupaR4hy7:preloadtgoy4:pathy17:assets%2Fcoin.pngR0i908R1y5:IMAGER3R8R6tgoR0i31756R1R2R3y17:assets%2Fcoin.wavR5aR10hR6tgoR0i26062R1R2R3y16:assets%2Fdie.wavR5aR11hR6tgoR7y16:assets%2Fegg.pngR0i1033R1R9R3R12R6tgoR0i42704R1y4:FONTy9:classNamey24:__ASSET__assets_font_otfR3y17:assets%2Ffont.otfR6tgoR0i15126R1R2R3y19:assets%2Flaunch.wavR5aR17hR6tgoR7y17:assets%2Flava.pngR0i14627R1R9R3R18R6tgoR7y17:assets%2Flogo.pngR0i19476R1R9R3R19R6tgoR7y21:assets%2Fplatform.pngR0i846R1R9R3R20R6tgoR7y21:assets%2Fscorebox.pngR0i637R1R9R3R21R6tgoR0i4846R1R2R3y19:assets%2Fselect.wavR5aR22hR6tgoR0i25068R1R2R3y19:assets%2Fsplash.wavR5aR23hR6tgoR7y23:assets%2Fsplash_egg.pngR0i1335R1R9R3R24R6tgoR0i2114R1y5:MUSICR3y26:flixel%2Fsounds%2Fbeep.mp3R5aR26y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR0i39706R1R25R3y28:flixel%2Fsounds%2Fflixel.mp3R5aR28y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR0i5794R1R2R3R27R5aR26R27hgoR0i33629R1R2R3R29R5aR28R29hgoR0i15744R1R13R14y35:__ASSET__flixel_fonts_nokiafc22_ttfR3y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR0i29724R1R13R14y36:__ASSET__flixel_fonts_monsterrat_ttfR3y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR7y33:flixel%2Fimages%2Fui%2Fbutton.pngR0i519R1R9R3R34R6tgoR7y36:flixel%2Fimages%2Flogo%2Fdefault.pngR0i3280R1R9R3R35R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_click_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_coin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_coin_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_die_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_egg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_font_otf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_launch_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_lava_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_platform_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_scorebox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_select_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_splash_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_splash_egg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/click.wav") @:noCompletion #if display private #end class __ASSET__assets_click_wav extends haxe.io.Bytes {}
@:keep @:image("assets/coin.png") @:noCompletion #if display private #end class __ASSET__assets_coin_png extends lime.graphics.Image {}
@:keep @:file("assets/coin.wav") @:noCompletion #if display private #end class __ASSET__assets_coin_wav extends haxe.io.Bytes {}
@:keep @:file("assets/die.wav") @:noCompletion #if display private #end class __ASSET__assets_die_wav extends haxe.io.Bytes {}
@:keep @:image("assets/egg.png") @:noCompletion #if display private #end class __ASSET__assets_egg_png extends lime.graphics.Image {}
@:keep @:font("export/html5/obj/webfont/font.otf") @:noCompletion #if display private #end class __ASSET__assets_font_otf extends lime.text.Font {}
@:keep @:file("assets/launch.wav") @:noCompletion #if display private #end class __ASSET__assets_launch_wav extends haxe.io.Bytes {}
@:keep @:image("assets/lava.png") @:noCompletion #if display private #end class __ASSET__assets_lava_png extends lime.graphics.Image {}
@:keep @:image("assets/logo.png") @:noCompletion #if display private #end class __ASSET__assets_logo_png extends lime.graphics.Image {}
@:keep @:image("assets/platform.png") @:noCompletion #if display private #end class __ASSET__assets_platform_png extends lime.graphics.Image {}
@:keep @:image("assets/scorebox.png") @:noCompletion #if display private #end class __ASSET__assets_scorebox_png extends lime.graphics.Image {}
@:keep @:file("assets/select.wav") @:noCompletion #if display private #end class __ASSET__assets_select_wav extends haxe.io.Bytes {}
@:keep @:file("assets/splash.wav") @:noCompletion #if display private #end class __ASSET__assets_splash_wav extends haxe.io.Bytes {}
@:keep @:image("assets/splash_egg.png") @:noCompletion #if display private #end class __ASSET__assets_splash_egg_png extends lime.graphics.Image {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,1,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,1,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,1,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,1,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/5,1,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/5,1,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_font_otf') @:noCompletion #if display private #end class __ASSET__assets_font_otf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/font"; #else ascender = 1811; descender = -460; height = 2356; numGlyphs = 222; underlinePosition = -292; underlineThickness = 150; unitsPerEM = 2048; #end name = "Toon Around"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_font_otf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_font_otf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_font_otf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_font_otf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_font_otf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_font_otf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end

#end