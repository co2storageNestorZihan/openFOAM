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
define(hex2D, hex ($1b $2b $3b $4b $1f $2f $3f $4f)) dnl>

define(quad2D, ($1f $1b $2b $2f))  dnl>

define(frontQuad, ($1f $2f $3f $4f)) dnl>
define(backQuad, ($4b $3b $2b $1b)) dnl>
dnl>
dnl> </STANDARD DEFINTIONS>
dnl> -----------------------------------------------------------------
dnl>

//refine times
define(refine,1)   

define(n1, calc(refine*50)) dnl>
define(n2, calc(refine*5)) dnl>
define(n3, calc(refine*70)) dnl>
define(n4, calc(refine*5)) dnl>
define(n5, calc(refine*10)) dnl>
define(n6, calc(refine*50)) dnl>

define(L1,5)            //domain length 1
define(L2,0.5)          //domain length 2, step width
define(L3,7)            //domain length 3
define(L4,0.6)          //domain length 4, step height
define(L5,1)            //domain length 5
define(L6,5)          //domain length 5, channel width

define(x0,0) dnl>
define(x1,calc(L1)) dnl>
define(x2,calc(L1)) dnl>
define(x3,calc(L1+L2)) dnl>
define(x4,calc(L1+L2)) dnl>
define(x5,calc(L1+L2+L3)) dnl>
define(x6,calc(L1+L2+L3)) dnl>
define(x7,calc(L1+L2+L3)) dnl>
define(x8,calc(L1+L2)) dnl>
define(x9,calc(L1)) dnl>
define(x10,0) dnl>
define(x11,0) dnl>

define(y0,0) dnl>
define(y1,0) dnl>
define(y2,calc(L4)) dnl>
define(y3,calc(L4)) dnl>
define(y4,0) dnl>
define(y5,0) dnl>
define(y6,calc(L4)) dnl>
define(y7,calc(L4+L5)) dnl>
define(y8,calc(L4+L5)) dnl>
define(y9,calc(L4+L5)) dnl>
define(y10,calc(L4+L5)) dnl>
define(y11,calc(L4)) dnl>

define(zFront,0) dnl>
define(zBack,calc(-L6)) dnl>

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

convertToMeters 1;

vertices
(
    //vertex on the front
    (x0   y0 zFront)  vlabel(a0f)
    (x1   y1 zFront)  vlabel(a1f)
    (x2   y2 zFront)  vlabel(a2f)
    (x3   y3 zFront)  vlabel(a3f)
    (x4   y4 zFront)  vlabel(a4f)
    (x5   y5 zFront)  vlabel(a5f)
    (x6   y6 zFront)  vlabel(a6f)
    (x7   y7 zFront)  vlabel(a7f)
    (x8   y8 zFront)  vlabel(a8f)
    (x9   y9 zFront)  vlabel(a9f)
    (x10   y10 zFront)  vlabel(a10f)
    (x11   y11 zFront)  vlabel(a11f)

    //vertex on the back
    (x0   y0 zBack)  vlabel(a0b)
    (x1   y1 zBack)  vlabel(a1b)
    (x2   y2 zBack)  vlabel(a2b)
    (x3   y3 zBack)  vlabel(a3b)
    (x4   y4 zBack)  vlabel(a4b)
    (x5   y5 zBack)  vlabel(a5b)
    (x6   y6 zBack)  vlabel(a6b)
    (x7   y7 zBack)  vlabel(a7b)
    (x8   y8 zBack)  vlabel(a8b)
    (x9   y9 zBack)  vlabel(a9b)
    (x10   y10 zBack)  vlabel(a10b)
    (x11   y11 zBack)  vlabel(a11b)
);

blocks
(
    // block 1
    hex2D(a0, a1, a2, a11)
    block1 ( n1 n4 n6 )  simpleGrading (gradingp1 1 gradingp3)

    // block 2
    hex2D(a4, a5, a6, a3)
    block2 ( n3 n4 n6 )  simpleGrading (1 1 gradingp3)

    // block 3
    hex2D(a11, a2, a9, a10)
    block3 ( n1 n5 n6 )  simpleGrading (1 1 gradingp3)

    // block 4
    hex2D(a2, a3, a8, a9)
    block4 ( n2 n5 n6 )  simpleGrading (1 1 gradingp3)

    // block 5
    hex2D(a3, a6, a7, a8)
    block5 ( n3 n5 n6 )  simpleGrading (1 1 gradingp3)
);

edges
(
);

patches
(
    patch inlet
    (
      quad2D(a0, a11)
      quad2D(a11, a10)
    )

    patch outlet 
    (
      quad2D(a5, a6)
      quad2D(a6, a7)
    )

    symmetryPlane top 
    (
      quad2D(a10, a9)
      quad2D(a9, a8)
      quad2D(a8, a7)
    )

    wall bottom
    (
      quad2D(a0, a1)
      quad2D(a1, a2)
      quad2D(a2, a3)
      quad2D(a3, a4)
      quad2D(a4, a5)
    )

    wall sides 
    (
      frontQuad(a0, a1, a2, a11)
      frontQuad(a4, a5, a6, a3)
      frontQuad(a11, a2, a9, a10)
      frontQuad(a2, a3, a8, a9)
      frontQuad(a3, a6, a7, a8)

      backQuad(a0, a1, a2, a11)
      backQuad(a4, a5, a6, a3)
      backQuad(a11, a2, a9, a10)
      backQuad(a2, a3, a8, a9)
      backQuad(a3, a6, a7, a8)
    )
);

mergePatchPairs
(
);

// ************************************************************************* //
