/* This exhibits how we can handle comments */

// This is for global 
//  \brief  some text
int global = 0;


/* Comment about the routine foo */
int
// doesn't do much 
foo()
{
    // in foo
    return(3);
}


