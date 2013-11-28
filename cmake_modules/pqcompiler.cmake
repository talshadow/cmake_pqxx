include(CheckIncludeFileCXX)
include(CheckIncludeFile)
include(CheckTypeSize)
include(utilfunction)
include(CheckFunctionExists)
include(CheckCXXCompilerFlag)
include(CheckSymbolExists)
include(CheckCXXSymbolExists)
#public compiller
check_std_names(PGSTD)
check_broken_iterator(PGSTD PQXX_BROKEN_ITERATOR)
check_broken_using_decl(PQXX_BROKEN_USING_DECL)
check_char_traits(PGSTD PQXX_HAVE_CHAR_TRAITS)
check_pragma_message(PQXX_HAVE_CPP_PRAGMA_MESSAGE)
check_cpp_warning(PQXX_HAVE_CPP_WARNING)
check_reverse_iterator(PGSTD PQXX_HAVE_REVERSE_ITERATOR)
check_tr1_dir(PQXX_TR1_HEADERS)
check_include_file_cxx(ios PQXX_HAVE_IOS)
check_include_file_cxx(limits PQXX_HAVE_LIMITS)
check_type_size("long double" PQXX_HAVE_LONG_DOUBLE)
check_type_size("long long" PQXX_HAVE_LONG_LONG)
check_include_file_cxx(streambuf PQXX_HAVE_STREAMBUF)
#******************************************************************
#PQXX_PQ_IN_NAMESPACE - unknown test - don't understand what this
#******************************************************************
set(CMAKE_EXTRA_INCLUDE_FILES string.h)
check_function_exists(strerror_s PQXX_HAVE_STRERROR_S)
unset(CMAKE_EXTRA_INCLUDE_FILES)
check_tr1_namespace(PGSTD PQXX_TR1_HEADERS PQXXTR1)
check_shared_ptr(PQXX_TR1_HEADERS PQXXTR1 PQXX_HAVE_SHARED_PTR)
#internal compiller
check_include_file(sys/types.h HAVE_SYS_TYPES_H)
check_include_file(unistd.h HAVE_UNISTD_H)			#WIN GCC
check_include_file_cxx(locale PQXX_HAVE_LOCALE)
check_cxx_symbol_exists(NAN cmath PQXX_HAVE_C_NAN)
set(CMAKE_EXTRA_INCLUDE_FILES cmath)
check_function_exists(nan PQXX_HAVE_NAN)
unset(CMAKE_EXTRA_INCLUDE_FILES)
if(PQXX_HAVE_LIMITS)
	check_cxx_symbol_exists(${PGSTD}::numeric_limits<double>::quiet_NaN limits PQXX_HAVE_QUIET_NAN)
endif(PQXX_HAVE_LIMITS)
check_count_if(PGSTD PQXX_HAVE_COUNT_IF)
check_distance(PGSTD PQXX_HAVE_DISTANCE)
if(CMAKE_COMPILER_IS_GNUCXX)
	check_cxx_compiler_flag(-fvisibility=hidden PQXX_HAVE_GCC_VISIBILITY)   # Test for GCC visibility
endif (CMAKE_COMPILER_IS_GNUCXX)
#undef PQXX_HAVE_IMBUE 
#undef PQXX_HAVE_SLEEP					GCC
#undef PQXX_HAVE_STRING_CLEAR
check_include_file(sys/select.h PQXX_HAVE_SYS_SELECT_H)
#undef PQXX_SELECT_ACCEPTS_NULL
#undef PQXX_HAVE_POLL					NOTWINGCC
#undef PQXX_HAVE_SLEEP
#undef PQXX_HAVE_STRERROR_R
#undef PQXX_HAVE_STRING_CLEAR
#undef PQXX_HAVE_STRLCPY
#undef PQXX_HAVE_STRNLEN 
#undef HAVE_VSNPRINTF_DECL 				WIN























