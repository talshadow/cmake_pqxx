cmake_minimum_required (VERSION 2.8)
project(PQXX CXX C)
#include(cmake_helper_macros.cmake)
set(CMAKE_MODULE_PATH ${${PROJECT_NAME}_SOURCE_DIR}/cmake_modules ${CMAKE_MODULE_PATH})
message(>>>>>>>>>> "PROJECT_NAME ${PROJECT_NAME}" <<<<<<<<<<)
include(pqxxversion)
include(utilfunction)
project_setup(PQXX PQXX_MAJOR PQXX_MINOR PQXX_PATCH)
include(pqconfiguretests)
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
configure_file(${${PROJECT_NAME}_SOURCE_DIR}/cmake_modules/masks/config.cmake.in ${${PROJECT_NAME}_BINARY_DIR}/include/pqxx/config.h)
configure_file(${${PROJECT_NAME}_SOURCE_DIR}/cmake_modules/masks/config-internal-compiler.cmake.in ${${PROJECT_NAME}_BINARY_DIR}/include/pqxx/config-internal-compiler.h)
configure_file(${${PROJECT_NAME}_SOURCE_DIR}/cmake_modules/masks/config-internal-libpq.cmake.in ${${PROJECT_NAME}_BINARY_DIR}/include/pqxx/config-internal-libpq.h)
configure_file(${${PROJECT_NAME}_SOURCE_DIR}/cmake_modules/masks/config-public-compiler.cmake.in ${${PROJECT_NAME}_BINARY_DIR}/include/pqxx/config-public-compiler.h)
include_directories(${PQXX_SOURCE_DIR}/include ${LIBPQFE} ${${PROJECT_NAME}_BINARY_DIR}/include)
#########################################################################################################
add_definitions(-DPQXX_SHARED -DHAVE_CONFIG)
include(pqxx_sources)
include(pqxx_headers)
add_library(pqxx SHARED ${${PROJECT_NAME}_hds} ${${PROJECT_NAME}_src})
target_link_libraries(pqxx ${HAVE_LIBPQ})
if(WIN32)
	target_link_libraries(pqxx ws2_32)
endif(WIN32)
install(TARGETS pqxx
		EXPORT pqxx
		RUNTIME DESTINATION bin
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		)
install(FILES ${${PROJECT_NAME}_hds_cfg} DESTINATION include/pqxx)		
install(DIRECTORY ${PQXX_SOURCE_DIR}/include/pqxx 		DESTINATION include)

