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

