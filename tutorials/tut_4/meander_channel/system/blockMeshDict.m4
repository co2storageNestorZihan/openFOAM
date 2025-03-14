/*--------------------------------*- C++ -*----------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  5.0                                   |
|   \\  /    A nd           | Web:      www.OpenFOAM.org                      |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/
FoamFile
{
    version     2.0;
    format      ascii;
    class       dictionary;
    object      blockMeshDict;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
//
dnl> -----------------------------------------------------------------
dnl> <STANDARD DEFINTIONS>
dnl>
changecom(//)changequote([,]) dnl>
define(calc, [esyscmd(perl -e 'print ($1)')]) dnl>
define(VCOUNT, 0)  dnl>
define(vlabel, [[// ]pt VCOUNT ($1) define($1, VCOUNT)define([VCOUNT], incr(VCOUNT))])  dnl>
dnl>
define(hex2D, hex ($1b $2b $3b $4b $1t $2t $3t $4t)) dnl>

define(quad2D, ($1t $1b $2b $2t))  dnl>

define(topQuad, ($1t $2t $3t $4t)) dnl>
define(bottomQuad, ($4b $3b $2b $1b)) dnl>
dnl>
dnl> </STANDARD DEFINTIONS>
dnl> -----------------------------------------------------------------
dnl>

//refine times
define(refine,2)   

define(n1, calc(refine*10)) dnl>
define(n2, calc(refine*10)) dnl>
define(n3, calc(refine*10)) dnl>
define(n4, calc(refine*10)) dnl>
define(n5, calc(refine*10)) dnl>
define(n6, calc(refine*3)) dnl>

define(L1,10.0)            //domain length 1
define(L2,5.0)          //domain length 2
define(L3,10.0)            //domain length 3
define(L4,2.0)            //domain length 4
 
define(R1, 2.0)
define(R2, 2.0)

define(x0,0) dnl>
define(x1,calc(L1)) dnl>
define(x2,calc(L1+R1+L2)) dnl>
define(x3,calc(L1+R1+L2+R2)) dnl>
define(x4,calc(L1+R1+L2+R2+L3)) dnl>
define(x5,calc(L1+R1+L2+R2+L3)) dnl>
define(x6,calc(L1+R1+L2+R2)) dnl>
define(x7,calc(L1+R1)) dnl>
define(x8,calc(L1)) dnl>
define(x9,0) dnl>

define(y0,0) dnl>
define(y1,0) dnl>
define(y2,calc(L2+R1)) dnl>
define(y3,calc(L2+R1+R2)) dnl>
define(y4,calc(L2+R1+R2)) dnl>
define(y5,calc(L2+R1+R2+L2)) dnl>
define(y6,calc(L2+R1+R2+L2)) dnl>
define(y7,calc(L2+R1)) dnl>
define(y8,calc(L2)) dnl>
define(y9,calc(L2)) dnl>

define(zBottom,0) dnl>
define(zTop,calc(L4)) dnl>

define(O1x, calc(L1)) dnl>
define(O2x, calc(L1+R1+L2+R2)) dnl>

define(O1y, calc(L2+R1)) dnl>
define(O2y, calc(L2+R1)) dnl>

define(theta, calc(3.1415926/4))   //45 degrees
define(C1x, calc(O1x+(R1+L2)*sin(theta)))
define(C1y, calc(O1y-(R1+L2)*cos(theta)))
define(C2x, calc(O1x+R1*sin(theta)))
define(C2y, calc(O1y-R1*cos(theta)))

define(C3x, calc(O2x-R2*sin(theta)))
define(C3y, calc(O2y+R2*cos(theta)))
define(C4x, calc(O2x-(R2+L2)*sin(theta)))
define(C4y, calc(O2y+(R2+L2)*cos(theta)))

define(gradingp1,1) dnl>
define(gradingp2,1) dnl>
define(gradingp3,1) dnl>
define(gradingp4,1) dnl>
define(gradingp5,1) dnl>
define(gradingp6,1) dnl>

//define(gradingp1,0.1) dnl>
//define(gradingp2,10) dnl>
//define(gradingp3,10) dnl>
//define(gradingp4,10) dnl>
//define(gradingp5,10) dnl>
//define(gradingp6,10) dnl>

scale 1;

vertices
(
    //vertex on the bottom
    (x0   y0 zBottom)  vlabel(a0b)
    (x1   y1 zBottom)  vlabel(a1b)
    (x2   y2 zBottom)  vlabel(a2b)
    (x3   y3 zBottom)  vlabel(a3b)
    (x4   y4 zBottom)  vlabel(a4b)
    (x5   y5 zBottom)  vlabel(a5b)
    (x6   y6 zBottom)  vlabel(a6b)
    (x7   y7 zBottom)  vlabel(a7b)
    (x8   y8 zBottom)  vlabel(a8b)
    (x9   y9 zBottom)  vlabel(a9b)

    //vertex on the top
    (x0   y0 zTop)  vlabel(a0t)
    (x1   y1 zTop)  vlabel(a1t)
    (x2   y2 zTop)  vlabel(a2t)
    (x3   y3 zTop)  vlabel(a3t)
    (x4   y4 zTop)  vlabel(a4t)
    (x5   y5 zTop)  vlabel(a5t)
    (x6   y6 zTop)  vlabel(a6t)
    (x7   y7 zTop)  vlabel(a7t)
    (x8   y8 zTop)  vlabel(a8t)
    (x9   y9 zTop)  vlabel(a9t)
);

blocks
(
    // block 1
    hex2D(a0, a1, a8, a9) ( n1 n5 n6 ) simpleGrading (gradingp1 1 gradingp3)

    // block 2
    hex2D(a1, a2, a7, a8) ( n2 n5 n6 )  simpleGrading (1 1 gradingp3)

    // block 3 
    hex2D(a2, a3, a6, a7) ( n3 n5 n6 )  simpleGrading (1 1 gradingp3)

    // block 4
    hex2D(a3, a4, a5, a6) ( n4 n5 n6 )  simpleGrading (1 1 gradingp3)
);

edges
(
   arc a1b a2b   (C1x C1y zBottom)
   arc a7b a8b   (C2x C2y zBottom)
   arc a2b a3b   (C3x C3y zBottom)
   arc a6b a7b   (C4x C4y zBottom)

   arc a1t a2t   (C1x C1y zTop)
   arc a7t a8t   (C2x C2y zTop)
   arc a2t a3t   (C3x C3y zTop)
   arc a6t a7t   (C4x C4y zTop)
);

patches
(
    patch inlet
    (
      quad2D(a0, a9)
    )

    patch outlet 
    (
      quad2D(a4, a5)
    )

    symmetryPlane top 
    (
      topQuad(a0, a1, a8, a9)
      topQuad(a1, a2, a7, a8)
      topQuad(a2, a3, a6, a7)
      topQuad(a3, a4, a5, a6)
    )

    wall bottom
    (
      bottomQuad(a0, a1, a8, a9)
      bottomQuad(a1, a2, a7, a8)
      bottomQuad(a2, a3, a6, a7)
      bottomQuad(a3, a4, a5, a6)
    )

    wall sides 
    (
      quad2D(a0, a1)
      quad2D(a1, a2)
      quad2D(a2, a3)
      quad2D(a3, a4)

      quad2D(a5, a6)
      quad2D(a6, a7)
      quad2D(a7, a8)
      quad2D(a8, a9)
    )
);

mergePatchPairs
(
);

// ************************************************************************* //
