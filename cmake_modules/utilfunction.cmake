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