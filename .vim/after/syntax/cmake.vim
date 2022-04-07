syn keyword athenaCmakeCommand
            \ athena_internal_dependencies
            \ athena_external_dependencies
            \ athena_add_library
            \ athena_add_executable
            \ athena_python_setup
            \ athena_install_export
            \ athena_add_unit_test
            \ athena_add_unit_tests
            \ install_python_executables

syn keyword cmakeKWathena_add_library contained
            \ SOURCES
            \ LINK_LIBRARIES
            \ ENABLE_WERROR

syn keyword cmakeKWathena_internal_dependencies contained
            \ PUBLIC
            \ PRIVATE
            \ INTERFACE


hi def link athenaCmakeCommand Function
hi def link cmakeKWathena_add_library ModeMsg
hi def link cmakeKWathena_internal_dependencies Keyword "ModeMsg
