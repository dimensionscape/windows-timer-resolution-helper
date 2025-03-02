package;

/**
 * ...
 * @author Christopher Speciale
 */
@:cppInclude("Windows.h")
@:cppNamespaceCode('#pragma comment(lib, "winmm.lib")')
class WindowsTimerResolutionHelper
{
	
	private static function _atExit():Void {
		untyped __cpp__("timeEndPeriod(1);");
	}
	
	static function main() 
	{
		// let us know the process isnt just frozen
		Sys.println("Windows Timer Resolution Helper Started");
		
		// lets change the timer resolution to 1ms
		untyped __cpp__("timeBeginPeriod(1);");
		
		// specify that we want to make sure windows doesnt need to automatically reset the timer
		//by doing it ourselves on sys atExit
		untyped __cpp__("static cpp::Function<void()> exitCallback = {0};", _atExit);
		untyped __cpp__("std::atexit([](){ exitCallback(); });");
		
		// make sure this process stays open so that the effects persist until it's closed
		untyped __cpp__("WaitForSingleObject(GetCurrentProcess(), INFINITE);");

	}
	
	
}