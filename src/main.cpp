// Beast implementation is in this TU.
//#include <boost/beast/src.hpp>

#include <spdlog/spdlog.h>

#ifdef _MSC_VER
	#ifndef WIN32_LEAN_AND_MEAN // VC_EXTRALEAN
		#define WIN32_LEAN_AND_MEAN
		#include <windows.h>
		#undef WIN32_LEAN_AND_MEAN
	#else
		#include <windows.h>
	#endif
#endif

int main(int argc, char** argv) {

	// Enable leak-check if on MSVC crt
#if defined(BOOST_MSVC) && defined(_DEBUG)
	{
		int flags = _CrtSetDbgFlag(_CRTDBG_REPORT_FLAG);
		flags |= _CRTDBG_LEAK_CHECK_DF;
		_CrtSetDbgFlag(flags);
	}
#endif

	spdlog::info("Hi, world!");

	// TODO: bring up server

	// on linux offer daemon / daemon user options that will automatically daemonize and handle everything
	// The Right Way (TM)

	return 0;
}
