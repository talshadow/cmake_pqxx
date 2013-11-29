cmake_minimum_required (VERSION 2.8)
project(LIBPQXX CXX C)
include(cmake_helper_macros.cmake)

include(CheckFunctionExists)
include(CheckLibraryExists)
include(CheckSymbolExists)
set(CMAKE_MODULE_PATH ${${PROJECT_NAME}_SOURCE_DIR}/cmake_modules ${CMAKE_MODULE_PATH})
message(>>>>>>>>>> "PROJECT_NAME ${PROJECT_NAME}" <<<<<<<<<<)
include(pqxxversion)
project_setup(LIBPQXX PQXX_MAJOR PQXX_MINOR PQXX_PATCH)
include(pqcompiler)
include(pqxxsystemconfig)
#########################################################################################################
if(GNU OR MINGW)
	set(CMAKE_C_FLAGS_RELEASE "-O2 -pipe -march=native -mmmx -msse3 -falign-functions=0 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -DNDEBUG -funroll-all-loops -fmerge-all-constants -fbranch-target-load-optimize2 -fcx-limited-range  -ftree-loop-im -ftree-vectorize -Wno-literal-suffix -Wno-deprecated")
	set(CMAKE_CXX_FLAGS_RELEASE ${CMAKE_C_FLAGS_RELEASE})
endif(GNU OR MINGW)
#########################################################################################################
if(MSVC)
	add_definitions(-D_WIN32_WINNT=0x0501 -D_CRT_SECURE_NO_WARNINGS -D_SCL_SECURE_NO_WARNINGS) 
endif(MSVC)
#########################################################################################################
message(FATAL_ERROR "Timed end of configuration")
include(pqxxlibpqconfig)
find_path(LIBPQFE libpq-fe.h REQUIRED)
if(WIN32)
  find_library(HAVE_LIBPQ libpq REQUIRED)
else(WIN32)
  find_library(HAVE_LIBPQ pq REQUIRED)
  if(NOT LIBPQFE)
    find_path(LIBPQFE postgresql/libpq-fe.h REQUIRED)
    set(LIBPQFE "${LIBPQFE}/postgresql")
  endif(NOT LIBPQFE)
endif(WIN32)
include_directories(${LIBPQXX_SOURCE_DIR}/include ${LIBPQFE})
#include_directories(${LIBPQXX_SOURCE_DIR}/include ${PostgreSQL_INCLUDE_DIRS})
message(STATUS "${HAVE_LIBPQ}")
#########################################################################################################
#compiller public tests
message( >>>> "CMAKE_STD_NAMESPACE ${CMAKE_STD_NAMESPACE}")

#########################################################################################################
#Detect config.h options
#CHECK_INCLUDE_FILE(dlfcn.h HAVE_DLFCN_H) 
#CHECK_INCLUDE_FILE(inttypes.h HAVE_INTTYPES_H)
#CHECK_INCLUDE_FILE(memory.h HAVE_MEMORY_H)
#CHECK_INCLUDE_FILE(stdint.h HAVE_STDINT_H)
#CHECK_INCLUDE_FILE(stdlib.h HAVE_STDLIB_H)
#CHECK_INCLUDE_FILE(strings.h HAVE_STRINGS_H)
#CHECK_INCLUDE_FILE(string.h HAVE_STRING_H)
#CHECK_INCLUDE_FILE(sys/stat.h HAVE_SYS_STAT_H)
#CHECK_INCLUDE_FILE(sys/types.h HAVE_SYS_TYPES_H)
#CHECK_INCLUDE_FILE(unistd.h HAVE_UNISTD_H)
#CHECK_INCLUDE_FILE_CXX(boost/smart_ptr.hpp PQXX_HAVE_BOOST_SMART_PTR)
#CHECK_INCLUDE_FILE_CXX(ios PQXX_HAVE_IOS)
#CHECK_INCLUDE_FILE_CXX(limits PQXX_HAVE_LIMITS)
#CHECK_INCLUDE_FILE_CXX(locale PQXX_HAVE_LOCALE)
#CHECK_INCLUDE_FILE_CXX(streambuf PQXX_HAVE_STREAMBUF)
#CHECK_FUNCTION_EXISTS(sleep PQXX_HAVE_SLEEP)
#CHECK_FUNCTION_EXISTS(fnan PQXX_HAVE_NAN)
#CHECK_SYMBOL_EXISTS(NAN "limits" PQXX_HAVE_C_NAN)
#if(NOT PQXX_HAVE_NAN AND NOT PQXX_HAVE_C_NAN)
#  set(PQXX_HAVE_QUIET_NAN 1)
#endif(NOT PQXX_HAVE_NAN AND NOT PQXX_HAVE_C_NAN)
#set(PQXX_HAVE_LONG_DOUBLE 1)


# tests for config-internal-libpq
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} lo_tell "" PQXX_HAVE_LO_TELL)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQcancel "" PQXX_HAVE_PQCANCEL)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQclientEncoding "" PQXX_HAVE_PQCLIENTENCODING)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQdescribePortal "" PQXX_HAVE_PQDESCRIBEPORTAL)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQencryptPassword "" PQXX_HAVE_PQENCRYPTPASSWORD)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQescapeBytea "" PQXX_HAVE_PQESCAPEBYTEA)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQescapeByteaConn "" PQXX_HAVE_PQESCAPEBYTEACONN)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQescapeString "" PQXX_HAVE_PQESCAPESTRING)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQescapeStringConn "" PQXX_HAVE_PQESCAPESTRINGCONN)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQexecParams "" PQXX_HAVE_PQEXECPARAMS)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQexecPrepared "" PQXX_HAVE_PQEXECPREPARED)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQfreemem "" PQXX_HAVE_PQFREEMEM)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQfreeNotify "" PQXX_HAVE_PQFREENOTIFY)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQftable "" PQXX_HAVE_PQFTABLE)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQftablecol "" PQXX_HAVE_PQFTABLECOL)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQisthreadsafe "" PQXX_HAVE_PQISTHREADSAFE)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQmblen "" PQXX_HAVE_PQMBLEN)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQprepare "" PQXX_HAVE_PQPREPARE)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQprotocolVersion "" PQXX_HAVE_PQPROTOCOLVERSION)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQputCopyData "" PQXX_HAVE_PQPUTCOPY)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQresultErrorField "" PQXX_HAVE_PQRESULTERRORFIELD)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQserverVersion "" PQXX_HAVE_PQSERVERVERSION)
#CHECK_LIBRARY_EXISTS(${HAVE_LIBPQ} PQunescapeBytea "" PQXX_HAVE_PQUNESCAPEBYTEA)
 


configure_file(${LIBPQXX_SOURCE_DIR}/config.cmk ${LIBPQXX_SOURCE_DIR}/include/pqxx/config.h)
configure_file(${LIBPQXX_SOURCE_DIR}/config-internal-compiler.cmk ${LIBPQXX_SOURCE_DIR}/include/pqxx/config-internal-compiler.h)
configure_file(${LIBPQXX_SOURCE_DIR}/config-internal-libpq.cmk ${LIBPQXX_SOURCE_DIR}/include/pqxx/config-internal-libpq.h)



#/* Define if std provides the char_traits template and <char> specialization*/
#define PQXX_HAVE_CHAR_TRAITS 1
#/* Define if count_if() works according to the standard */
#define PQXX_HAVE_COUNT_IF 1

#/* Define if preprocessor supports nonstandard "warning" directive */
#define PQXX_HAVE_CPP_WARNING 1
#/* Define if math.h defines C99 isinf() */
#/* #undef PQXX_HAVE_C_ISINF */
#/* Define if math.h defines C99 isnan() */
#/* #undef PQXX_HAVE_C_ISNAN */
#/* Define if C math header defines NAN */
#define PQXX_HAVE_C_NAN 1
#/* Define if distance() works according to the standard */
#define PQXX_HAVE_DISTANCE 1
#/* Define if g++ supports deprecated attribute, as in g++ 4.0 */
#define PQXX_HAVE_GCC_DEPRECATED 1
#/* Define if g++ supports visibility attribute, as in g++ 4.0 */
#define PQXX_HAVE_GCC_VISIBILITY 1
#/* Define if stringstream::imbue works */
#define PQXX_HAVE_IMBUE 1






#########################################################################################################
add_definitions(-DPQXX_SHARED -DHAVE_CONFIG)
create_sources(${LIBPQXX_SOURCE_DIR}/src pqxx_src)
if(WIN32)
	set(pqxx_src ${pqxx_src} ${LIBPQXX_SOURCE_DIR}/src/win32/libpqxx.cxx)
endif(WIN32)
create_headers(${LIBPQXX_SOURCE_DIR}/include/pqxx pqxx_hdr)
create_headers(${LIBPQXX_SOURCE_DIR}/include/pqxx/internal pqxx_hdr)
add_library(pqxx SHARED ${pqxx_src} ${pqxx_hdr})
target_link_libraries(pqxx ${HAVE_LIBPQ})
if(WIN32)
	target_link_libraries(pqxx ws2_32)
endif(WIN32)

