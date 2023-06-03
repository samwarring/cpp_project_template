# Each target defined in their own subdirectory.
add_subdirectory(mymath)

# Unit-test applications also each get their own subdirectory, but they are only
# built if CPP_PROJECT_TEMPLATE_TEST is enabled.
if(CPP_PROJECT_TEMPLATE_TEST)
    add_subdirectory(mymath_test)
endif()
