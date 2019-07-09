getBinOpOperator =
function(x)
{
    top = getCursorTokens(x)
    sub = sapply(x, getCursorTokens)
    top[!(top %in% unlist(sub))]
}
