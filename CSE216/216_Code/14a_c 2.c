// Week 14: C, continued

/*
    #define preprocessor: defines variables before compilation
    const __ __: defines variables during compilation

    const __: immutable; value cannot be changed. 
    Good for compiler optimization, as const variables will be replaced by constants (immediate values) 
    without having to allocate memory for each variable.

    static __: exists during the entire lifetime of the program.
    For instance, in an increment function, a static int count will increment properly when it is called multiple times in main.
    Defining it as a default, local variable will make it unable to keep track of count.

    auto __: default allocation mode; 
    automatically allocates memory for a variable once it enters the scope of the program, 
    and deallocates when it exits the scope. 
    auto is redundant when variables are local, i.e., only used in one particular scope.

    register __: enforces local variables to be stored in a register instead of RAM.
    Modern compilers decide which vars should be stored in RAM and in a register.
    Less of a problem for modern computers; might be used for more thorough compiler optimization.
    Important for older systems or those with limited processing power and/or memory, i.e., embedded systems.

    extern __: a global variable that is visible to ALL program files.
    A promise that the function/variable in question is defined somewhere else.
    The extern keyword for variables DOES NOT ALLOCATE any space; 
    it only declares variables and defines them as variables stored in other locations.
*/