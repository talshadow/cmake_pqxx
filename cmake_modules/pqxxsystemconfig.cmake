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





#/* Define if compiler has auto_ptr */
#undef PQXX_HAVE_AUTO_PTR
/#* Define if math.h defines C99 isinf() */
#undef PQXX_HAVE_C_ISINF
#/* Define if math.h defines C99 isnan() */
#undef PQXX_HAVE_C_ISNAN
/#* Define if g++ supports const attribute */
#undef PQXX_HAVE_GCC_CONST
/#* Define if g++ supports deprecated attribute, as in g++ 4.0 */
#undef PQXX_HAVE_GCC_DEPRECATED
#/* Define if g++ supports noreturn attribute */
#undef PQXX_HAVE_GCC_NORETURN
#/* Define if g++ supports pure attribute */
#undef PQXX_HAVE_GCC_PURE
#/* Define if compiler has move(). */
#undef PQXX_HAVE_MOVE
#/* Define for GNU-style strerror_r */
#undef PQXX_HAVE_STRERROR_R_GNU
#/* Define if compiler has unique_ptr */
#undef PQXX_HAVE_UNIQUE_PTR
#/* Define to 1 if you have the ANSI C header files. */
#undef STDC_HEADERS
#/* Version number of package */
#undef VERSION
