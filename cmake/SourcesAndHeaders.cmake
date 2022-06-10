set(sources src/betterls.cpp src/core.cpp src/config.cpp)

set(exe_sources ${sources})

set(headers
	include/argh/argh.h
	include/betterls/betterls.hpp
	include/betterls/colors.hpp
	include/fmt/args.h
	include/fmt/color.h
	include/fmt/format.h
	include/fmt/os.h
	include/fmt/printf.h
	include/fmt/xchar.h
	include/fmt/chrono.h
	include/fmt/compile.h
	include/fmt/format-inl.h
	include/fmt/locale.h
	include/fmt/ostream.h
	include/fmt/ranges.h
	include/rapidjson/allocators.h
	include/rapidjson/encodings.h
	include/rapidjson/fwd.h
	include/rapidjson/memorystream.h
	include/rapidjson/prettywriter.h
	include/rapidjson/stream.h
	include/rapidjson/cursorstreamwrapper.h
	include/rapidjson/rapidjson.h
	include/rapidjson/stringbuffer.h
	include/rapidjson/document.h
	include/rapidjson/filereadstream.h
	include/rapidjson/istreamwrapper.h
	include/rapidjson/ostreamwrapper.h
	include/rapidjson/reader.h
	include/rapidjson/uri.h
	include/rapidjson/encodedstream.h
	include/rapidjson/filewritestream.h
	include/rapidjson/memorybuffer.h
	include/rapidjson/pointer.h
	include/rapidjson/schema.h
	include/rapidjson/writer.h
	include/rapidjson/error/en.h
	include/rapidjson/error/error.h
	include/rapidjson/msinttypes/inttypes.h
	include/rapidjson/msinttypes/stdint.h)
# ./include/rapidjson/internal: biginteger.h diyfp.h ieee754.h meta.h regex.h strfunc.h swap.h clzll.h dtoa.h itoa.h pow10.h stack.h
# strtod.h
set(test_sources temp_test.cpp)
