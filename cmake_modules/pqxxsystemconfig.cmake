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
check_include_file(sys/types.h HAVE_SYS_TYPES_H)
check_include_file(unistd.h HAVE_UNISTD_H)
check_include_file_cxx(boost/smart_ptr.hpp PQXX_HAVE_BOOST_SMART_PTR)
check_include_file_cxx(locale PQXX_HAVE_LOCALE)



CHECK_FUNCTION_EXISTS(sleep PQXX_HAVE_SLEEP)
CHECK_FUNCTION_EXISTS(fnan PQXX_HAVE_NAN)
CHECK_SYMBOL_EXISTS(NAN "limits" PQXX_HAVE_C_NAN)
if(NOT PQXX_HAVE_NAN AND NOT PQXX_HAVE_C_NAN)
  set(PQXX_HAVE_QUIET_NAN 1)
endif(NOT PQXX_HAVE_NAN AND NOT PQXX_HAVE_C_NAN)


#/* name of standard library namespace (normally "std") */
#undef PGSTD
#/* namespace of TR1 standard extensions (e.g. "std" or "std::tr1") */
#undef PQXXTR1
#/* Define if <iterator> lacks an iterator template definition */
#undef PQXX_BROKEN_ITERATOR
#/* Define if function overloading using "using" breaks */
#undef PQXX_BROKEN_USING_DECL
#/* Define if compiler has auto_ptr */
#undef PQXX_HAVE_AUTO_PTR
#/* Define if std provides the char_traits template and <char> specialization  */
#undef PQXX_HAVE_CHAR_TRAITS
#/* Define if count_if() works according to the standard */
#undef PQXX_HAVE_COUNT_IF
#/* Define if preprocessor supports pragma "message" */
#undef PQXX_HAVE_CPP_PRAGMA_MESSAGE
#/* Define if preprocessor supports nonstandard "warning" directive */
#undef PQXX_HAVE_CPP_WARNING
/#* Define if math.h defines C99 isinf() */
#undef PQXX_HAVE_C_ISINF
#/* Define if math.h defines C99 isnan() */
#undef PQXX_HAVE_C_ISNAN
#/* Define if C math header defines NAN */
#undef PQXX_HAVE_C_NAN
#/* Define if distance() works according to the standard */
#undef PQXX_HAVE_DISTANCE
/#* Define if g++ supports const attribute */
#undef PQXX_HAVE_GCC_CONST
/#* Define if g++ supports deprecated attribute, as in g++ 4.0 */
#undef PQXX_HAVE_GCC_DEPRECATED
#/* Define if g++ supports noreturn attribute */
#undef PQXX_HAVE_GCC_NORETURN
#/* Define if g++ supports pure attribute */
#undef PQXX_HAVE_GCC_PURE
#/* Define if g++ supports visibility attribute, as in g++ 4.0 */
#undef PQXX_HAVE_GCC_VISIBILITY
#/* Define if stringstream::imbue works */
#undef PQXX_HAVE_IMBUE
#/* Define if you have the <ios> header */
#undef PQXX_HAVE_IOS
#/* Define if <limits> exists */
#undef PQXX_HAVE_LIMITS
#/* Define if you have the <locale> header */
#undef PQXX_HAVE_LOCALE
#/* Define if the compiler supports the standard "long double" type */
#undef PQXX_HAVE_LONG_DOUBLE
#/* Define if the compiler supports "long long" types */
#undef PQXX_HAVE_LONG_LONG
#/* Define if compiler has move(). */
#undef PQXX_HAVE_MOVE
#/* Define if C99 fnan()/nan()/lnan() are available */
#undef PQXX_HAVE_NAN
#/* Define if the system has the poll() function (mainly GNU/Linux) */
#undef PQXX_HAVE_POLL
#/* Define if std::numeric_limits has quiet_NaN() */
#undef PQXX_HAVE_QUIET_NAN
#/* Define if reverse_iterator template works as expected */
#undef PQXX_HAVE_REVERSE_ITERATOR
#/* Define if compiler has shared_ptr */
#undef PQXX_HAVE_SHARED_PTR
#/* Define if POSIX sleep() exists */
#undef PQXX_HAVE_SLEEP
#/* Define if strerror_r exists */
#undef PQXX_HAVE_STRERROR_R
#/* Define for GNU-style strerror_r */
#undef PQXX_HAVE_STRERROR_R_GNU
#/* Define if string class has the clear() function */
#undef PQXX_HAVE_STRING_CLEAR
#/* Define if strlcpy exists */
#undef PQXX_HAVE_STRLCPY
#/* Define if strnlen exists */
#undef PQXX_HAVE_STRNLEN
#/* Define if the sys/select.h header defines a working select() and friends,  as per POSIX 1003.1-2001 */
#undef PQXX_HAVE_SYS_SELECT_H
#/* Define if compiler has unique_ptr */
#undef PQXX_HAVE_UNIQUE_PTR

#/* Define if select() accepts NULL fd_set arguments */
#undef PQXX_SELECT_ACCEPTS_NULL

#/* Define if headers for TR1 extension to standard live in tr1/ */
#undef PQXX_TR1_HEADERS
#/* Define to 1 if you have the ANSI C header files. */
#undef STDC_HEADERS

#/* Version number of package */
#undef VERSION
