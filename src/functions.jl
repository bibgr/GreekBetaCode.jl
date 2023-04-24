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
#                                 Greek-Aware Helper Functions                                 #
#----------------------------------------------------------------------------------------------#

# Final Sigma
function fσ(b::AbstractString)
    LA = length(b) == 1 ? SubString(b, 1) : SubString(b, 1, cInd(b, 2))
    return begin
        (b[1] == 'S') && (
            occursin(r"S\b", LA) ||
            occursin(r"S$", LA)
        )
    end
end

export fσ

#----------------------------------------------------------------------------------------------#
#                      Single-Character Transcoding: BetaCode --> Unicode                      #
#----------------------------------------------------------------------------------------------#

"""
`b2u1(b::AbstractString, qs::Bool = false)`\n
Returns a 5-tuple `(succ, theB, theU, iAdv, qs)` with info on the conversion of ONE piece of
BetaCode at the START of `b`, where:\n
- `succ::Bool` indicates whether there was a successful conversion;
- `theB::String` is the matched BetaCode (or an unmatched piece if failed);
- `theU::String` is the converted Unicode (or a copy of `theB` if failed);
- `iAdv::Int` (index advance on next `b`'s conversion) is the current length of matching BetaCode; and
- `qs::Bool` is the conversion state for single quote ("\""), to be passed in a subsequent call to `b2u1`.
"""
function b2u1(b::AbstractString, qs::Bool = false)
    succ, theB, theU, iAdv = false, "", "", min(length(b), maxB) # current key length
    if iAdv == 0; return (succ, theB, theU, iAdv, qs); end # empty `b` case
    while (iAdv > 0) && (!succ)
        theB = b[cRng(b, 1, iAdv)]
        if theB in kol(iAdv, true)
            succ = true
            theU = fwdB[theB]
            if length(theU) == 1;
                theU = theU[1];
            else
                if theB == "S"
                    theU = fσ(b) ? theU[1] : theU[2]
                elseif theB == "\""
                    qs = !qs
                    theU = qs ? theU[1] : theU[2]
                end
            end
        else; iAdv -= 1; end
    end
    if !succ
        theU = theB # No transcoding
        iAdv = length(theU)
    end
    return (succ, theB, theU, iAdv, qs)
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
            elseif theU == "σ"
                theB = (length(u) == 1) || (u[cInd(u, 2)] in " \t\n,.:;'-_·;’‐—") ? theB[1] : theB[2]
            else
                # Defaults to the form that ends with "+"
                theB = endswith(theB[1], "+") ? theB[1] : theB[2]
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
`b2u(b::String, st::Bool = false)`\n
Transcodes `b` from BetaCode into Unicode.
"""
function b2u(b::String, st::Bool = false)
    U = String[]
    B = String[]
    while length(b) > 0
        succ, theB, theU, curL, st = b2u1(b, st)
        theU isa Vector ? append!(U, [theU[1]]) : append!(U, [theU])
        theB isa Vector ? append!(B, [theB[1]]) : append!(B, [theB])
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
        theB isa Vector ? append!(B, [theB[1]]) : append!(B, [theB])
        theU isa Vector ? append!(U, [theU[1]]) : append!(U, [theU])
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

