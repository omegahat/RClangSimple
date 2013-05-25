getRHeaderPath =
function()
{
   h = R.home()
   i = sprintf("%s/include", h)
   if(file.exists(i))
     return(i)

 # R_ARCH
 # Use R CMD config
}

