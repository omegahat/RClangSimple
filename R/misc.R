# Function that shows the cursor details for those with a file name that matches a regular expression.
#
#
#
f =
# parseTU("../src/ExecEngine.cpp", f("ExecEngine\\.cpp"), args = args, inc = inc)
function(rx)
{
    function(cur, parent) {
       if(grepl(rx, getFileName(cur)))
          cat(getLocation(cur)$location[1], names(cur$kind), cur$kind, getName(cur), "\n") 
     CXChildVisit_Recurse
    }
}
