find_path(NGSPICE_INCLUDE_DIR
          NAMES ngspice/sharedspice.h
          PATH_SUFFIXES include 
          HINTS ${ngspice_DIR}
        )

find_library(NGSPICE_LIBRARY
    NAMES ngspice
    PATH_SUFFIXES lib
    HINTS ${ngspice_DIR}
)


mark_as_advanced(NGSPICE_LIBRARY)

set(NGSPICE_LIBRARIES ${NGSPICE_LIBRARY})
set(NGSPICE_FOUND TRUE)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(ngspice
                            REQUIRED_VARS
                                NGSPICE_LIBRARY
                                NGSPICE_INCLUDE_DIR
                            VERSION_VAR
                                NGSPICE_VERSION
                            HANDLE_VERSION_RANGE
                            HANDLE_COMPONENTS
                          )


add_library(ngspice UNKNOWN IMPORTED)
set_target_properties(ngspice PROPERTIES
                    INTERFACE_INCLUDE_DIRECTORIES "${NGSPICE_INCLUDE_DIR}")       
set_target_properties(ngspice PROPERTIES
                    IMPORTED_LINK_INTERFACE_LANGUAGES "C"
                    IMPORTED_LOCATION "${NGSPICE_LIBRARY}")
                    
set_property( TARGET ngspice APPEND PROPERTY INTERFACE_LINK_LIBRARIES psapi shlwapi)
        
# add_library(OpenSSL::SSL UNKNOWN IMPORTED)
# set_target_properties(OpenSSL::SSL PROPERTIES
#           INTERFACE_INCLUDE_DIRECTORIES "${OPENSSL_INCLUDE_DIR}")
# set_target_properties(OpenSSL::SSL PROPERTIES
#             IMPORTED_LINK_INTERFACE_LANGUAGES "C"
#             IMPORTED_LOCATION "${OPENSSL_SSL_LIBRARY}")

# set_property( TARGET OpenSSL::SSL APPEND PROPERTY INTERFACE_LINK_LIBRARIES ws2_32 )
# set_property( TARGET OpenSSL::SSL APPEND PROPERTY INTERFACE_LINK_LIBRARIES crypt32 )