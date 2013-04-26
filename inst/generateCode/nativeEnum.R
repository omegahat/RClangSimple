
#
# Generate the native code for an enum
#

# For a simple enum (not bitwise enum), we want to generate
# a routine that has a large switch statemnent with a case
# for each possible value. Each case sets the name (elName)
# Then we can can call a routine that creates the instance
#  R_makeEnum(value, elName,  className).
#

makeEnumConverter =
function(values, name)
{

    
   
}
