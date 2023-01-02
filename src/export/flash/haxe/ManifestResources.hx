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

		data = '{"name":null,"assets":"aoy4:sizei29196y4:typey5:SOUNDy9:classNamey25:__ASSET__assets_click_wavy2:idy18:assets%2Fclick.wavgoR0i908R1y5:IMAGER3y24:__ASSET__assets_coin_pngR5y17:assets%2Fcoin.pnggoR0i31756R1R2R3y24:__ASSET__assets_coin_wavR5y17:assets%2Fcoin.wavgoR0i26062R1R2R3y23:__ASSET__assets_die_wavR5y16:assets%2Fdie.wavgoR0i1033R1R7R3y23:__ASSET__assets_egg_pngR5y16:assets%2Fegg.pnggoR0i42704R1y4:FONTR3y24:__ASSET__assets_font_otfR5y17:assets%2Ffont.otfgoR0i15126R1R2R3y26:__ASSET__assets_launch_wavR5y19:assets%2Flaunch.wavgoR0i14627R1R7R3y24:__ASSET__assets_lava_pngR5y17:assets%2Flava.pnggoR0i19476R1R7R3y24:__ASSET__assets_logo_pngR5y17:assets%2Flogo.pnggoR0i846R1R7R3y28:__ASSET__assets_platform_pngR5y21:assets%2Fplatform.pnggoR0i637R1R7R3y28:__ASSET__assets_scorebox_pngR5y21:assets%2Fscorebox.pnggoR0i4846R1R2R3y26:__ASSET__assets_select_wavR5y19:assets%2Fselect.wavgoR0i25068R1R2R3y26:__ASSET__assets_splash_wavR5y19:assets%2Fsplash.wavgoR0i1335R1R7R3y30:__ASSET__assets_splash_egg_pngR5y23:assets%2Fsplash_egg.pnggoR0i2114R1y5:MUSICR3y31:__ASSET__flixel_sounds_beep_mp3R5y26:flixel%2Fsounds%2Fbeep.mp3goR0i39706R1R35R3y33:__ASSET__flixel_sounds_flixel_mp3R5y28:flixel%2Fsounds%2Fflixel.mp3goR0i15744R1R16R3y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfgoR0i29724R1R16R3y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfgoR0i519R1R7R3y36:__ASSET__flixel_images_ui_button_pngR5y33:flixel%2Fimages%2Fui%2Fbutton.pnggoR0i3280R1R7R3y39:__ASSET__flixel_images_logo_default_pngR5y36:flixel%2Fimages%2Flogo%2Fdefault.pnggh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_click_wav extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_coin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_coin_wav extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_die_wav extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_egg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_font_otf extends flash.text.Font { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_launch_wav extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_lava_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_platform_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_scorebox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_select_wav extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_splash_wav extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_splash_egg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends flash.utils.ByteArray { }


#elseif (desktop || cpp)

@:keep @:file("assets/click.wav") @:noCompletion #if display private #end class __ASSET__assets_click_wav extends haxe.io.Bytes {}
@:keep @:image("assets/coin.png") @:noCompletion #if display private #end class __ASSET__assets_coin_png extends lime.graphics.Image {}
@:keep @:file("assets/coin.wav") @:noCompletion #if display private #end class __ASSET__assets_coin_wav extends haxe.io.Bytes {}
@:keep @:file("assets/die.wav") @:noCompletion #if display private #end class __ASSET__assets_die_wav extends haxe.io.Bytes {}
@:keep @:image("assets/egg.png") @:noCompletion #if display private #end class __ASSET__assets_egg_png extends lime.graphics.Image {}
@:keep @:font("assets/font.otf") @:noCompletion #if display private #end class __ASSET__assets_font_otf extends lime.text.Font {}
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
@:keep @:font("C:/HaxeToolkit/haxe/lib/flixel/5,1,0/assets/fonts/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("C:/HaxeToolkit/haxe/lib/flixel/5,1,0/assets/fonts/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/5,1,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/5,1,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_font_otf') @:noCompletion #if display private #end class __ASSET__assets_font_otf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/font.otf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Toon Around"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Monsterrat"; super (); }}


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