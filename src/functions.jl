#----------------------------------------------------------------------------------------------#
#                                     Auxiliary Functions                                      #
#----------------------------------------------------------------------------------------------#

"""
`kol(n::Int, fw::Bool = true)`\n
Returns a `Vector{String}` with `keys(fw ? fwdB : revB)` of length = `n`.
Parameter `fw::Bool` controls the dictionary in use:\n
- `fw = true`: Dictionary `fwdB`;
- `fw = false`: Dictionary `revB`.
"""
kol(n::Int, fw::Bool = true) = [ j for j in keys(fw ? fwdB : revB) if length(j) == n ]

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
`b2u1(b::AbstractString, st::Dict{String,Bool} = st0())`\n
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
        if theB in kol(curL, true)
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

export b2u1


#----------------------------------------------------------------------------------------------#
#                      Single-Character Transcoding: Unicode --> BetaCode                      #
#----------------------------------------------------------------------------------------------#

"""
`u2b1(u::AbstractString)`\n
Returns a 4-tuple `(stop, theB, theU, curL)` with info on the conversion of ONE piece of
BetaCode at the START of `b`, where:

- `stop::Bool` indicates whether there was a successful conversion;
- `theB::String` is the matched BetaCode (or an unmatched piece if failed);
- `theU::String` is the converted Unicode (or a copy of `theB` if failed);
- `curL::Int` is the current length of matching BetaCode (or <= 1 if failed); and
- `st::Dict{String,Bool}` is the conversion state, to be passed in a subsequent call to `b2u1`.
"""
function u2b1(u::AbstractString)
    stop, theB, theU = false, "", ""
    curL = min(length(u), maxU) # current key length
    if curL == 0; return (stop, theB, theU, curL); end
    while (curL > 0) && (!stop)
        theU = u[cRng(u, 1, curL)]
        if theU in kol(curL, false)
            stop = true
            theB = revB[theU]
        else
            curL -= 1
        end
    end
    if stop
        if length(theB) > 1
            if theU == "ς"
                theB = (length(u) == 1) || (u[cInd(u, 2)] in " \t\n,.:;'-_·;’‐—") ? theB[2] : theB[1]
            end
            if theU == "σ"
                theB = (length(u) == 1) || (u[cInd(u, 2)] in " \t\n,.:;'-_·;’‐—") ? theB[1] : theB[2]
            end
            if occursin(theU, "’„῭“")
                theB = theB[1]
            end
        else
            theB = theB[1]
        end
    else
        theB = theU # No transcoding
        curL = length(theB)
    end
    return (stop, theB, theU, curL)
end

export u2b1


#----------------------------------------------------------------------------------------------#
#                                   Full String Transcoding                                    #
#----------------------------------------------------------------------------------------------#

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
    return B, U
end

"""
`u2b(u::String)`\n
Transcodes `u` from Unicode into BetaCode.
"""
function u2b(u::String)
    B = String[]
    U = String[]
    while length(u) > 0
        succ, theB, theU, curL = u2b1(u)
        append!(B, [theB])
        append!(U, [theU])
        u = SubString(u, cInd(u, curL+1))
    end
    return U, B
end

"""
`U(b::String)`\n
Returns the Unicode "version" of `b`.
"""
U(b::String) = join(b2u(b)[2])

"""
`B(u::String)`\n
Returns the BetaCode "version" of `u`.
"""
B(u::String) = join(u2b(u)[2])

export b2u, u2b, U, B

