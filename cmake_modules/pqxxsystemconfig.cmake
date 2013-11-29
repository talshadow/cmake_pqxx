include(CheckIncludeFile)
include(CheckIncludeFileCXX)


#Detect config.h options
check_include_file(dlfcn.h HAVE_DLFCN_H) 
check_include_file(inttypes.h HAVE_INTTYPES_H)
check_include_file(memory.h HAVE_MEMORY_H)
check_include_file(stdint.h HAVE_STDINT_H)
check_include_file(stdlib.h HAVE_STDLIB_H)
check_include_file(strings.h HAVE_STRINGS_H)
check_include_file(string.h HAVE_STRING_H)
check_include_file(sys/stat.h HAVE_SYS_STAT_H)
check_include_file_cxx(boost/smart_ptr.hpp PQXX_HAVE_BOOST_SMART_PTR)





check_auto_ptr(PGSTD PQXX_HAVE_AUTO_PTR)
set(CMAKE_EXTRA_INCLUDE_FILES cmath)
check_in_namespace( PGSTD "isinf(0.44)" PQXX_HAVE_C_ISINF)
check_in_namespace( PGSTD "isnan(0.44)" PQXX_HAVE_C_ISNAN)
unset(CMAKE_EXTRA_INCLUDE_FILES)
if(CMAKE_COMPILER_IS_GNUCXX)
	check_attribute_gcc(const PQXX_HAVE_GCC_CONST)
	check_attribute_gcc(deprecated PQXX_HAVE_GCC_DEPRECATED)
	check_attribute_gcc(noreturn PQXX_HAVE_GCC_NORETURN)
	check_attribute_gcc(pure PQXX_HAVE_GCC_PURE)
endif(CMAKE_COMPILER_IS_GNUCXX)
#/* Define if compiler has move(). */
#undef PQXX_HAVE_MOVE
set(CMAKE_EXTRA_INCLUDE_FILES utility)
check_in_namespace( PGSTD "int i=5; int j=move(i)" PQXX_HAVE_MOVE)
set(CMAKE_EXTRA_INCLUDE_FILES)
set(CMAKE_EXTRA_INCLUDE_FILES cstring)
check_in_namespace( PGSTD "const char *it_is_a_string=strerror_r(0,1,10);" PQXX_HAVE_STRERROR_R_GNU)
set(CMAKE_EXTRA_INCLUDE_FILES)
set(CMAKE_EXTRA_INCLUDE_FILES memory)
check_in_namespace( PGSTD "unique_ptr<int> i(new int)" PQXX_HAVE_UNIQUE_PTR)
set(CMAKE_EXTRA_INCLUDE_FILES)
#/* Define to 1 if you have the ANSI C header files. */
#undef STDC_HEADERS

