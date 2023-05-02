using Luxor

SIDE=500
iSCALE=0.975
RADIUS=iSCALE*SIDE/(2√3)
yOFF=-0.25*RADIUS
LW=4.0
BCJ = Dict("b" => (0.298, 0.388, 0.682),
           "g" => (0.224, 0.592, 0.275),
           "p" => (0.573, 0.349, 0.639),
           "𝑔" => (0.851, 0.855, 0.792))
letters = ["Gr", "Be", "Co"]

const colors = (BCJ["b"], BCJ["g"], BCJ["p"], BCJ["𝑔"])
corners = ngon(Point(0, yOFF),
               RADIUS, 3, π/2,
               vertices=true)

function drawLetter(txt, coords)
    fontface("InknutAntiqua")
    # fontface("ImFellDWPica")
    # fontface("SBL BibLit")
    fontsize(RADIUS * 1.0)
    vadj = Point(0, RADIUS * 0.0)
    offsets = ngon(Point(0,0), LW, 12, 0π/4, vertices=true) .+ vadj
    setcolor("black")
    for j in 1:length(offsets)
        text(txt, coords + offsets[j], valign = :middle, halign = :center)
    end
    setcolor(BCJ["𝑔"])
    text(txt, coords + vadj, valign = :middle, halign = :center)
end

function main(filename)
    Drawing(SIDE, SIDE, filename)
    origin()
    for i in 1:3
        # Fills
        setcolor(colors[i])
        circle(corners[i], (√3/2)*RADIUS, action = :fill)
        # Draw stokes
        setline(LW)
        setcolor("black")
        circle(corners[i], (√3/2)*RADIUS, action = :stroke)
        # Draws Letters
        drawLetter(letters[i], corners[i])
    end
    finish()
end

#----------------------------------------------------------------------------------------------#
#                                         main() calls                                         #
#----------------------------------------------------------------------------------------------#

# SVG output
main("logo.svg")

# PNG output (poorer result than conversion through inkscape)
# main("logo.png")

