# ~~~
# Try to find the OpenSSL library.
#
# Defines:
#
#  OPENSSL_FOUND - set if the system has the OpenSSL library
#  OPENSSL_LIBRARIES - the linker libraries needed to use the OpenSSL library
#  OPENSSL_INCLUDE_DIR - the path to the include files of the OpenSSL library
#
# Copyright (c) 2017 Peter Nirschl <peter.nirschl@gmail.com>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.
# ~~~

if (NOT OPENSSL_FOUND)

	# Use Homebrew version of OpenSSL on macOS, if OpenSSL is installed and `OPENSSL_ROOT_DIR` is not set.
	if (APPLE
	    AND NOT
		DEFINED
		OPENSSL_ROOT_DIR)
		execute_process (COMMAND brew list openssl
				 RESULT_VARIABLE FAILURE
				 OUTPUT_QUIET
				 ERROR_QUIET)
		if (NOT FAILURE)
			set (OPENSSL_ROOT_DIR /usr/local/opt/openssl)
		endif (NOT FAILURE)
	endif (APPLE AND NOT DEFINED OPENSSL_ROOT_DIR)

	find_package (OpenSSL QUIET)
endif ()

if (OPENSSL_FOUND)

	# try to compile and link a minimal sample program against libcrypto
	try_compile (HAS_OPENSSL_4SURE
		     "${CMAKE_BINARY_DIR}"
		     "${PROJECT_SOURCE_DIR}/src/plugins/crypto/compile_openssl.c"
		     CMAKE_FLAGS -DINCLUDE_DIRECTORIES:STRING=${OPENSSL_INCLUDE_DIR}
				 -DLINK_LIBRARIES:PATH=${OPENSSL_LIBRARIES})

	if (NOT HAS_OPENSSL_4SURE)
		message (STATUS "OpenSSL compile/linker test failed")
		set (OPENSSL_FOUND OFF)
		set (OPENSSL_INCLUDE_DIR "")
		set (OPENSSL_LIBRARIES "")
	endif ()

	unset (HAS_OPENSSL_4SURE)
endif ()
