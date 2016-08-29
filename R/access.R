getPublic =
function(x, level = "public")
{
   x[  sapply(x, slot, "access") %in% level ]
}
