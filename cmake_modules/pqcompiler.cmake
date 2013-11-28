include(CheckIncludeFileCXX)
INCLUDE (CheckTypeSize)
include(utilfunction)
include(CheckFunctionExists)
#public compiller
check_std_names(PGSTD)
check_broken_iterator(PGSTD PQXX_BROKEN_ITERATOR)
check_broken_using_decl(PQXX_BROKEN_USING_DECL)
check_char_traits(PGSTD PQXX_HAVE_CHAR_TRAITS)
check_pragma_message(PQXX_HAVE_CPP_PRAGMA_MESSAGE)
check_cpp_warning(PQXX_HAVE_CPP_WARNING)
check_reverse_iterator(PGSTD PQXX_HAVE_REVERSE_ITERATOR)
check_include_file_cxx(ios PQXX_HAVE_IOS)
check_include_file_cxx(limits PQXX_HAVE_LIMITS)
check_type_size("long double" PQXX_HAVE_LONG_DOUBLE)
check_type_size("long long" PQXX_HAVE_LONG_LONG)
check_include_file_cxx(streambuf PQXX_HAVE_STREAMBUF)
#******************************************************************
#PQXX_PQ_IN_NAMESPACE - unknown test - don't understand what this
#******************************************************************
#undef PQXX_HAVE_STRERROR_S <string.h>
set(CMAKE_EXTRA_INCLUDE_FILES string.h)
check_function_exists(strerror_s PQXX_HAVE_STRERROR_S)

#undef PQXXTR1 std::tr1
#undef PQXX_HAVE_SHARED_PTR





#internal compiller
#undef HAVE_SYS_TYPES_H
#undef HAVE_UNISTD_H 					WIN GCC
#undef PQXX_HAVE_C_NAN
#undef PQXX_HAVE_NAN
#undef PQXX_HAVE_QUIET_NAN
#undef PQXX_HAVE_COUNT_IF
#undef PQXX_HAVE_DISTANCE
#undef PQXX_HAVE_GCC_VISIBILITY 		GCC
#undef PQXX_HAVE_IMBUE 
#undef PQXX_HAVE_LOCALE
#undef PQXX_HAVE_SLEEP					GCC
#undef PQXX_HAVE_STRING_CLEAR
#undef PQXX_HAVE_SYS_SELECT_H 
#undef PQXX_SELECT_ACCEPTS_NULL
#undef PQXX_HAVE_POLL					NOTWINGCC
#undef PQXX_HAVE_SLEEP 1
#undef PQXX_HAVE_STRERROR_R
#undef PQXX_HAVE_STRING_CLEAR
#undef PQXX_HAVE_STRLCPY
#undef PQXX_HAVE_STRNLEN 
#undef HAVE_VSNPRINTF_DECL 				WIN























