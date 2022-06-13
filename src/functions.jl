
"""
`kol(n::Int)`\n
Returns a `Vector{String}` with `keys(fwdB)` of length = `n`.
"""
kol(n::Int) = [ j for j in keys(fwdB) if length(j) == n ]

"""
`st0()`\n
Returns a reset (initial) state as a `Dict{String, Bool}`.
"""
st0() = Dict("\"" => false, "\"3" => false, "\"6" => false, "\"7" => false, "\"8" => false)

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
function b2u1(b::String, st::Dict{String,Bool} = st0())
    stop, theB, theU = false, "", ""
    curL = min(length(b), maxB) # current key length
    if curL == 0; return (stop, theB, theU, curL); end
    while (curL > 0) && (!stop)
        theB = string(b[1:curL])
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
                theU = (length(b) == 1) || (b[2] == " ") ? theU[1] : theU[2]
            end
            if theB in keys(st)
                theU = st[theB] ? theU[2] : theU[1]
                st[theB] = !st[theB]
            end
        else
            theU = theU[1]
        end
    end
    return (stop, theB, theU, curL, st)
end

# export kol
# export b2u1

"""
Converts `b` from BetaCode into Unicode.
"""
function b2u(b::String,
             fail::Vector{Symbol} = [:pass, :skip, :fail],
             st::Dict{String,Bool} = st0())
    U = String[]
    B = String[]
    while length(b) > 0
        succ, theB, theU, curL, st = b2u1(b, st)
        if (succ) || (fail[1] == :pass)
            append!(U, [theU])
            append!(B, [theB])
        elseif fail[1] == :fail
            throw(Exception())
        end
        b = b[(curL+1):end]
    end
    return B, U
end


