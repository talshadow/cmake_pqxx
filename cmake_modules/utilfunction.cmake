include(CheckCXXSourceCompiles)
function(check_std_names result)
	if(NOT ${result})
	set( _names std _STL stlp_std )
	foreach(_in ${_names} )
		if(NOT ${result})
			unset(_result CACHE)
#			message(STATUS "chack namespace for stadrat library is ${_in}?")
			CHECK_CXX_SOURCE_COMPILES("#include <list>
									int main(int, char*[]){
										${_in}::list<int> _lst;
										return 0;
									}" ${result} )
		if(${result})
			set(${result} ${_in} CACHE INTERNAL "Set to ${result}")
		endif(${result})
		endif(NOT ${result})
	endforeach(_in _names)
#	message(STATUS "std namespace name is \"${${result}}\"")
	endif(NOT ${result})
endfunction(check_std_names result)

function(check_broken_iterator _std result)
	if(NOT ${result})
#		message(STATUS "check unbroken iterator " )
		CHECK_CXX_SOURCE_COMPILES("#include <iterator>
									using namespace ${${_std}};
									int main (int, char*[]){
									struct I:iterator<random_access_iterator_tag,int>{};
									return 0;}" ${result})
#		message(STATUS "unbroken interator is ${${result}}")
	endif(NOT ${result})
endfunction(check_broken_iterator _std result)

function(check_broken_using_decl result)
	if(NOT ${result})
#		message(STATUS "check using declaration " )
		CHECK_CXX_SOURCE_COMPILES("struct A {A(){} void f(int){}};
								   struct B:A {B(){} using A::f; void f(int,bool){}};
									int main (int, char*[]){
									B b;b.f(1,true);
									return 0;}" ${result})
#		message(STATUS "using declaration is ${${result}}")
	endif(NOT ${result})
endfunction(check_broken_using_decl result)

function(check_char_traits _std result)
	if(NOT ${result})
#		message(STATUS "check char traits " )
		CHECK_CXX_SOURCE_COMPILES("#include <string>
									using namespace ${${_std}};
									int main (int, char*[]){
									char_traits<char>::eof();
									return 0;}" ${result})
#		message(STATUS "char traits is ${${result}}")
	endif(NOT ${result})
endfunction(check_char_traits _std result)

function(check_pragma_message result)
	if(NOT ${result})
#		message(STATUS "check pragma message " )
		CHECK_CXX_SOURCE_COMPILES("#pragma message(\"cpp supports message pragma\")
									int main (int, char*[]){
									;
									return 0;}" ${result})
#		message(STATUS "pragma message is ${${result}}")
	endif(NOT ${result})
endfunction(check_pragma_message result)

function(check_cpp_warning result)
	if(NOT ${result})
#		message(STATUS "check supports warning directive " )
		CHECK_CXX_SOURCE_COMPILES("#warning cpp supports warning directive
									int main (int, char*[]){
									;
									return 0;}" ${result})
#		message(STATUS "pragma supports warning directive is ${${result}}")
	endif(NOT ${result})
endfunction(check_cpp_warning result)

function(check_reverse_iterator _std result)
	if(NOT ${result})
#		message(STATUS "check reverse iterator " )
		CHECK_CXX_SOURCE_COMPILES("#include <iterator>
									using namespace ${${_std}};
									int main (int, char*[]){
									struct I:iterator<random_access_iterator_tag,int>{};
									reverse_iterator<I> rit;
									return 0;}" ${result})
#		message(STATUS "reverse interator is ${${result}}")
	endif(NOT ${result})
endfunction(check_reverse_iterator _std result)

function(check_tr1_dir result)
	if(NOT ${result})
		CHECK_CXX_SOURCE_COMPILES("#include <tr1/memory>
									int main (int, char*[]){
									return 0;}" ${result})
	endif(NOT ${result})
endfunction(check_tr1_dir result)

function(check_tr1_namespace _std _trdir result)
	if(NOT ${result})
		if(${_trdir})
			set(_code "#include <tr1/memory>")
		else(${_trdir})
			set(_code "#include <memory>")
		endif(${_trdir})
		set(_code "${_code}
				   int main (int, char*[]){
				   using namespace ${${_std}}::tr1
				   return 0;}")
		CHECK_CXX_SOURCE_COMPILES("${_code}" ${result})
		if(${result})
			set(${result} "${${_std}}::tr1" CACHE INTERNAL "Set to check_tr1_namespace ${result}")
		else(${result})
			set(${result} "${${_std}}" CACHE INTERNAL "Set to check_tr1_namespace ${result}")
		endif(${result})
	endif(NOT ${result})
endfunction(check_tr1_namespace _std _trdir result)

function(check_shared_ptr _trdir _std_tr1 result)
	if(NOT ${result})
		if(${_trdir})
			set(_code "#include <tr1/memory>")
		else(${_trdir})
			set(_code "#include <memory>")
		endif(${_trdir})
		set(_code "${_code}
				   int main (int, char*[]){
				   ${${_std_tr1}}::shared_ptr<int> i(new int(1));
				   return *i;}")
		CHECK_CXX_SOURCE_COMPILES("${_code}" ${result})
	endif(NOT ${result})
endfunction(check_shared_ptr _trdir _std_tr1 result)

function(check_count_if _std result)
	if(NOT ${result})
#		message(STATUS "check count_if " )
		CHECK_CXX_SOURCE_COMPILES(" #include <algorithm>
									#include <functional>
									using namespace ${${_std}};
									struct P{P(){}bool operator()(const int&)const{return false;}}p;
									int main (int, char*[]){
									int v;return int(count_if(&v,&v,p));}" ${result})
#		message(STATUS "count_if is ${${result}}")
	endif(NOT ${result})
endfunction(check_count_if _std result)

function(check_distance _std result)
	if(NOT ${result})
#		message(STATUS "check distance " )
		CHECK_CXX_SOURCE_COMPILES(" #include <iterator>
									using namespace ${${_std}};
									int main (int, char*[]){
									int i[1]; return distance(i, i+1);return 0;}" ${result})
#		message(STATUS "distance is ${${result}}")
	endif(NOT ${result})
endfunction(check_distance _std result)

function(check_imbue _std _locale result)
	if(NOT ${result})
		if(${_locale})
			set(_code "#include <locale>
						#include <sstream>")
		else(${_locale})
			set(_code "#include <locale>")
		endif(${_locale})
		if(CMAKE_COMPILER_IS_GNUCXX)
			set(CMAKE_REQUIRED_LIBRARIES stdc++)	
		endif(CMAKE_COMPILER_IS_GNUCXX)
#		message(STATUS "check imbue " )
		CHECK_CXX_SOURCE_COMPILES(" ${_code}
									using namespace ${${_std}};
									int main (int, char*[]){
									stringstream S;S.imbue(locale(\"C\"));return 0;}" ${result})
#		message(STATUS "imbue is ${${result}}")
	endif(NOT ${result})
endfunction(check_imbue _std _locale result)

function(check_string_clear _std result)
	if(NOT ${result})
#		message(STATUS "check distance " )
		CHECK_CXX_SOURCE_COMPILES(" #include <string>
									using namespace ${${_std}};
									int main (int, char*[]){
									string i;i.clear();return 0;}" ${result})
#		message(STATUS "distance is ${${result}}")
	endif(NOT ${result})
endfunction(check_string_clear _std result)

function(check_std_strnlen _std result)
	if(NOT ${result})
#		message(STATUS "check strnlen " )
		CHECK_CXX_SOURCE_COMPILES(" #include <cstring>
									using namespace ${${_std}};
									int main (int, char*[]){
									return strnlen(\" \",1);}" ${result})
#		message(STATUS "strnlen is ${${result}}")
	endif(NOT ${result})
endfunction(check_std_strnlen _std result)

function(check_std_strlcpy _std result)
	if(NOT ${result})
#		message(STATUS "check strnlen " )
		CHECK_CXX_SOURCE_COMPILES(" #include <cstring>
									using namespace ${${_std}};
									int main (int, char*[]){
									char buf[2];return strlcpy(buf,\" \",1);}" ${result})
#		message(STATUS "strnlen is ${${result}}")
	endif(NOT ${result})
endfunction(check_std_strlcpy _std result)

function(check_std_strerror_r _std result)
	if(NOT ${result})
#		message(STATUS "check strnlen " )
		CHECK_CXX_SOURCE_COMPILES(" #include <cstring>
									using namespace ${${_std}};
									bool f(char x[]) { return strerror_r(0,x,10) != 0; }
									int main (int, char*[]){return 0;}" ${result})
#		message(STATUS "strnlen is ${${result}}")
	endif(NOT ${result})
endfunction(check_std_strerror_r _std result)

function(check_select_accepts_null _std _sys_select _unistd result)
	if(NOT ${result})
		if(${_sys_select})
			set(_code "#include <sys/select.h>")
		else(${_sys_select})
			set(_code "#include <ctime>
					   #include <sys/types.h> ")
		endif(${_sys_select})
		if(${_unistd})
			set(_code "${_code}
						 #include <unistd.h>}")
		endif(${_unistd})
		set(_code "${_code}
				   #ifdef _WIN32
						#include <winsock2.h>
				   #endif
				   using namespace ${${_std}};
				   extern \"C\" int foo(){fd_set f; FD_SET(1,&f); return select(2,0,&f,&f,0)<0;}
				   int main (int, char*[]){
				   return foo();}")
		if(WIN32)
			set(CMAKE_REQUIRED_LIBRARIES Ws2_32)
		endif(WIN32)
		CHECK_CXX_SOURCE_COMPILES("${_code}" ${result})
		set(CMAKE_REQUIRED_LIBRARIES)
	endif(NOT ${result})
endfunction(check_select_accepts_null _std _sys_select _unistd result)

function(check_auto_ptr _std result)
	if(NOT ${result})
#		message(STATUS "check auto_ptr " )
		CHECK_CXX_SOURCE_COMPILES(" #include <memory>
									using namespace ${${_std}};
									int main (int, char*[]){auto_ptr<int> ptr;}" ${result})
#		message(STATUS "auto_ptr is ${${result}}")
	endif(NOT ${result})
endfunction(check_auto_ptr _std result)

function(check_in_namespace _namespace _control_code result)
	if(NOT ${result})
#		message(STATUS "check isinf " )
		CHECK_CXX_SOURCE_COMPILES(" #include <cmath>
									using namespace ${${_namespace}};
									int main (int, char*[]){${${_control_code}}; return 0;}" ${result})
#		message(STATUS "isinf is ${${result}}")
	endif(NOT ${result})
endfunction(check_in_namespace _namespace _control_code result)

function(check_attribute_gcc attr result)
	if(NOT ${result})
		set(CMAKE_REQUIRED_FLAGS -Werror)
		message(STATUS "check attribute " ${attr} )
		CHECK_CXX_SOURCE_COMPILES(" void __attribute__ ((${attr})) f();
									int main (int, char*[]){return 0;}" ${result})
		set(CMAKE_REQUIRED_FLAGS)
#		message(STATUS "attribute is ${${result}}")
	endif(NOT ${result})
endfunction(check_attribute_gcc attr result)