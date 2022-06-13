#----------------------------------------------------------------------------------------------#
#                                     Auxiliary Functions                                      #
#----------------------------------------------------------------------------------------------#

"""
`kol(n::Int)`\n
Returns a `Vector{String}` with `keys(fwdB)` of length = `n`.
"""
kol(n::Int, d = fwdB) = [ j for j in keys(d) if length(j) == n ]

"""
`cInd(b::AbstractString, i::Int)`\n
Returns the appropriate `i`-th `Char` index in `b`.
"""
function cInd(b::AbstractString, i::Int)
    j = nextind(b, 0)
    for k in 2:i; j = nextind(b, j); end
    return j
end

"""
`cRng(b::AbstractString, i::Int, e::Int)`\n
Returns the appropriate `i:j` `Char` range for `b`.
"""
function cRng(b::AbstractString, i::Int, e::Int = length(b))
    ji = je = cInd(b, i)
    for k in (i+1):e; je = nextind(b, je); end
    return ji:je
end


#----------------------------------------------------------------------------------------------#
#                                   Initialization Functions                                   #
#----------------------------------------------------------------------------------------------#

"""
`st0()`\n
Returns a reset (initial) state as a `Dict{String, Bool}`.
"""
st0() = Dict{String, Bool}("\"" => 0, "\"3" => 0, "\"6" => 0, "\"7" => 0, "\"8" => 0)


#----------------------------------------------------------------------------------------------#
#                      Single-Character Transcoding: BetaCode --> Unicode                      #
#----------------------------------------------------------------------------------------------#

"""
`b2u1(b::String, st::Dict{String,Bool} = st0())`\n
Returns a 5-tuple `(stop, theB, theU, curL, st)` with info on the conversion of ONE piece of
BetaCode at the START of `b`, where:

- `stop::Bool` indicates whether there was a successful conversion;
- `theB::String` is the matched BetaCode (or an unmatched piece if failed);
- `theU::String` is the converted Unicode (or a copy of `theB` if failed);
- `curL::Int` is the current length of matching BetaCode (or <= 1 if failed); and
- `st::Dict{String,Bool}` is the conversion state, to be passed in a subsequent call to `b2u1`.
"""
function b2u1(b::AbstractString, st::Dict{String,Bool} = st0())
    stop, theB, theU = false, "", ""
    curL = min(length(b), maxB) # current key length
    if curL == 0; return (stop, theB, theU, curL); end
    while (curL > 0) && (!stop)
        theB = b[cRng(b, 1, curL)]
        if theB in kol(curL)
            stop = true
            theU = fwdB[theB]
        else
            curL -= 1
        end
    end
    if stop
        if length(theU) > 1
            if theB == "S"
                theU = (length(b) == 1) || (b[cInd(b, 2)] == " ") ? theU[1] : theU[2]
            end
            if theB in keys(st)
                theU = st[theB] ? theU[2] : theU[1]
                st[theB] = !st[theB]
            end
        else
            theU = theU[1]
        end
    else
        theU = theB # No transcoding
        curL = length(theU)
    end
    return (stop, theB, theU, curL, st)
end

export kol
export b2u1

"""
`b2u(b::String, st::Dict{String,Bool} = st0())`\n
Transcodes `b` from BetaCode into Unicode.
"""
function b2u(b::String, st::Dict{String,Bool} = st0())
    U = String[]
    B = String[]
    while length(b) > 0
        succ, theB, theU, curL, st = b2u1(b, st)
        append!(U, [theU])
        append!(B, [theB])
        b = SubString(b, cInd(b, curL+1))
    end
    return join(U)
end

export b2u

