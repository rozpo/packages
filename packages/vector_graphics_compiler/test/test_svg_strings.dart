// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:vector_graphics_compiler/src/geometry/path.dart';

const List<String> allSvgTestStrings = <String>[
  ghostscriptTiger,
  simpleUseCircles,
  basicOpacity,
  groupOpacity,
  basicMask,
  groupMask,
  basicClip,
  multiClip,
  blendAndMask,
  outOfOrderGradientDef,
  xlinkGradient,
  basicText,
  pathAndParent,
  svgInlineImage,
  basicOverlap,
  opacityOverlap,
  solidOverTrasnparent,
  transparentOverSolid,
  complexOpacityTest,
];

const String kBase64ImageContents =
    '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';

/// https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/svg.svg
const String useStar = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100" fill="none">
 <g id='gtop' stroke-width="12" stroke="#000">
   <g id="svgstar" transform="translate(50,50)">
     <path id="svgbar" d="M-27-5a7,7,0,1,0,0,10h54a7,7,0,1,0,0-10z"/>
     <use id='use1' xlink:href="#svgbar" transform="rotate(45)"/>
     <use id='use2' xlink:href="#svgbar" transform="rotate(90)"/>
     <use id='use3' xlink:href="#svgbar" transform="rotate(135)"/>
   </g>
 </g>
 <use id="usetop" xlink:href="#svgstar" stroke="green" fill="#FB4"/>
</svg>
''';

const String useColor = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
    viewBox="0 0 224 144">
    <g transform="scale(5)">
        <path
            d="M 12,2                L 14.5,5.5                L 9.5,5.5                Z"
            id="triangle" fill="#ff0000" />
        <use transform="translate(12)" xlink:href="#triangle" />
    </g>
</svg>
''';

const String imageInDefs = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 192 192">
  <defs>
    <clipPath id="c">
      <circle cx="96" cy="96" r="96" fill="none"/>
    </clipPath>
    <image id="b" width="195" height="130" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAL4AAACCCAYAAAD4zHJLAAABEklEQVR42u3SQQ0AAAgDMeZfNOCCB22mYLl01Q5+ifARPggfhA/CB+GD8EH4IHwQPggfhA/CB+GD8EH4IHwQPggfhI/whY/wQfggfBA+CB+ED8IH4YPwQfggfBA+CB+ED8IH4YPwQfggfITvBoQPwgfhg/BB+CB8ED4IH4QPwgfhg/BB+CB8ED4IH4QPwgfhI3wQPggfhA/CB+GD8EH4IHwQPggfhA/CB+GD8EH4IHwQPggfhI/wQfggfBA+CB+ED8IH4YPwQfggfBA+CB+ED8IH4YPwQfggfBA+wgfhg/BB+CB8ED4IH4QPwgfhg/BB+CB8ED4IH4QPwgfhg/BB+AgfhA/CB+GD8EH4IHwQPggfrg0B6QOONbU1CAAAAABJRU5ErkJggg=="/>
  </defs>
  <g clip-path="url(#c)">
    <use data-name="pl0lBK" xlink:href="#b"/>
  </g>
</svg>
''';

const String transformedClip = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="375" height="407" viewBox="0 0 375 407">
  <defs>
    <clipPath id="clip-path">
      <rect id="Rectangle_2344" data-name="Rectangle 2344" width="375" height="407" transform="translate(0 177)" fill="#fff" stroke="#707070" stroke-width="1"/>
    </clipPath>
  </defs>
  <g id="_4" data-name="4" transform="translate(0 -177)" clip-path="url(#clip-path)">
    <g id="Polygon_19" data-name="Polygon 19" transform="translate(15 177)" fill="#fff">
      <path d="M 345 395.5 L 1 395.5 L 173 1 L 345 395.5 Z" stroke="black"/>
    </g>
  </g>
</svg>
''';

const String strokePropertyButNoStroke = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 120" stroke-miterlimit="3">
  <rect x="10" y="20" width="100" height="100" fill="red" />
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/mask
const String basicMask = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="-10 -10 120 120">
  <mask id="myMask">
    <!-- Everything under a white pixel will be visible -->
    <rect x="0" y="0" width="100" height="100" fill="white" />

    <!-- Everything under a black pixel will be invisible -->
    <path d="M10,35 A20,20,0,0,1,50,35 A20,20,0,0,1,90,35 Q90,65,50,95 Q10,65,10,35 Z" fill="black" />
  </mask>

  <polygon points="-10,110 110,110 110,-10" fill="orange" />

  <!-- with this mask applied, we "punch" a heart shape hole into the circle -->
  <circle cx="50" cy="50" r="50" mask="url(#myMask)" />
</svg>
''';

const String groupMask = '''
<svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" xmlns:usvg="https://github.com/RazrFalcon/usvg" usvg:version="0.8.0">
    <defs>
        <mask id="b" x="-0.1" y="-0.1" width="1.2" height="1.2">
            <path fill="#ffffff" fill-rule="evenodd" d="M 17.438 8.438 C 17.748 8.438 18 8.69 18 9 L 18 16.313 C 17.99834725871 17.24440923535 17.24341005121 17.99889920517 16.312 18 L 1.688 18 C 0.75620021668 17.99889792932 0.00110207068 17.24379978332 0 16.312 L 0 9 C 0.01271270943 8.69855860173 0.26079065383 8.46072235233 0.5625 8.46072235233 C 0.86420934617 8.46072235233 1.11228729057 8.69855860173 1.125 9 L 1.125 16.313 C 1.125 16.622 1.377 16.875 1.688 16.875 L 16.312 16.875 C 16.622 16.875 16.875 16.622 16.875 16.312 L 16.875 9 C 16.875 8.69 17.127 8.437 17.438 8.437 Z M 9 0 C 9.169 0 9.316 0.079 9.418 0.196 L 9.423 0.192 L 13.361 4.692 C 13.443 4.795 13.5 4.921 13.5 5.062 C 13.5 5.373 13.248 5.625 12.937 5.625 C 12.77572417052 5.6238681172 12.62300981305 5.55226042805 12.519 5.429 L 12.514 5.433 L 9.563 2.06 L 9.563 11.812 C 9.56299999183 12.12293630838 9.31093630838 12.3749999852 9 12.3749999852 C 8.68906369162 12.3749999852 8.43700000817 12.12293630838 8.437 11.812 L 8.437 2.06 L 5.486 5.433 C 5.37775998399 5.5529360201 5.22453705399 5.62248401669 5.063 5.625 C 4.75206368585 5.625 4.5 5.37293631415 4.5 5.062 C 4.5 4.921 4.557 4.795 4.644 4.696 L 4.639 4.692 L 8.577 0.192 C 8.68524001601 0.0720639799 8.83846294601 0.00251598331 9 0 Z"/>
        </mask>
    </defs>
    <path fill="#727272" fill-rule="evenodd" transform="matrix(0.00000000000000006123233995736766 1 -1 0.00000000000000006123233995736766 21 3)" d="M 17.438 8.438 C 17.748 8.438 18 8.69 18 9 L 18 16.313 C 17.99834725871 17.24440923535 17.24341005121 17.99889920517 16.312 18 L 1.688 18 C 0.75620021668 17.99889792932 0.00110207068 17.24379978332 0 16.312 L 0 9 C 0.01271270943 8.69855860173 0.26079065383 8.46072235233 0.5625 8.46072235233 C 0.86420934617 8.46072235233 1.11228729057 8.69855860173 1.125 9 L 1.125 16.313 C 1.125 16.622 1.377 16.875 1.688 16.875 L 16.312 16.875 C 16.622 16.875 16.875 16.622 16.875 16.312 L 16.875 9 C 16.875 8.69 17.127 8.437 17.438 8.437 Z M 9 0 C 9.169 0 9.316 0.079 9.418 0.196 L 9.423 0.192 L 13.361 4.692 C 13.443 4.795 13.5 4.921 13.5 5.062 C 13.5 5.373 13.248 5.625 12.937 5.625 C 12.77572417052 5.6238681172 12.62300981305 5.55226042805 12.519 5.429 L 12.514 5.433 L 9.563 2.06 L 9.563 11.812 C 9.56299999183 12.12293630838 9.31093630838 12.3749999852 9 12.3749999852 C 8.68906369162 12.3749999852 8.43700000817 12.12293630838 8.437 11.812 L 8.437 2.06 L 5.486 5.433 C 5.37775998399 5.5529360201 5.22453705399 5.62248401669 5.063 5.625 C 4.75206368585 5.625 4.5 5.37293631415 4.5 5.062 C 4.5 4.921 4.557 4.795 4.644 4.696 L 4.639 4.692 L 8.577 0.192 C 8.68524001601 0.0720639799 8.83846294601 0.00251598331 9 0 Z"/>
    <g mask="url(#b)" transform="matrix(1 0 0 1 3 3)">
        <path fill="#8e93a1" fill-rule="evenodd" d="M -3 -3 L 21 -3 L 21 21 L -3 21 Z"/>
    </g>
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/clipPath
const String basicClip = '''
<!-- Learn about this code on MDN: https://developer.mozilla.org/en-US/docs/Web/SVG/Element/clipPath -->
<svg viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <clipPath id="myClip">
      <circle cx="30" cy="30" r="20"/>
      <circle cx="70" cy="70" r="20"/>
    </clipPath>
  </defs>

  <rect x="10" y="10" width="100" height="100"
      clip-path="url(#myClip)"/>
</svg>
''';

/// Constructed example where clips cannot be trivially combined.
const String multiClip = '''
<!-- multiple clip-rules -->
<svg viewBox="0 0 800 400" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <clipPath id="myClip">
      <path d="M 250,75 L 323,301 131,161 369,161 177,301 z" clip-rule="evenodd"/>
      <path d="M 250,75 L 323,301 131,161 369,161 177,301 z" transform="translate(250, 0)" clip-rule="nonzero"/>
    </clipPath>
  </defs>
  <circle cx="400" cy="200" r="150" fill="green" fill-opacity=".5" stroke="black" clip-path="url(#myClip)" />
  <g clip-path="url(#myClip)">
    <circle cx="450" cy="300" r="150" fill="blue" fill-opacity=".6" stroke="black" />
  </g>
</svg>
''';

/// Constructed example based on [basicClip] that has refs.
const String useClip = '''
<svg viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <circle id="a" cx="30" cy="30" r="20"/>
    <clipPath id="myClip">
      <use xlink:href="#a" />
      <use xlink:href="#b" />
    </clipPath>
     <circle id="b" cx="70" cy="70" r="20"/>
  </defs>

  <rect x="10" y="10" width="100" height="100"
      clip-path="url(#myClip)"/>
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/opacity
const String basicOpacity = '''
<svg viewBox="0 0 200 100" xmlns="http://www.w3.org/2000/svg">
  <circle cx="50" cy="50" r="40" fill="black" />
  <circle cx="150" cy="50" r="40" fill="black" opacity="0.3" />
</svg>
''';

const String groupOpacity = '''
<?xml version="1.0" standalone="no"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg viewBox="0 0 200 200"
     xmlns="http://www.w3.org/2000/svg" version="1.1">
  <!-- Group opacity .5, semi-transparent green over red -->
  <g opacity=".5" >
    <circle cx="80" cy="100" r="50" fill="red" opacity=".5"  />
    <circle cx="120" cy="100" r="50" fill="green" opacity=".5"  />
  </g>
</svg>
''';

/// https://commons.wikimedia.org/wiki/File:Ghostscript_Tiger.svg
const String ghostscriptTiger = '''
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg id="svg2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 900 900" version="1.1">
 <g id="g4" fill="none" transform="matrix(1.7656463,0,0,1.7656463,324.90716,255.00942)">
  <g id="g6" stroke-width="0.17200001" stroke="#000" fill="#FFF">
   <path id="path8" d="m-122.3,84.285s0.1,1.894-0.73,1.875c-0.82-0.019-17.27-48.094-37.8-45.851,0,0,17.78-7.353,38.53,43.976z"/>
  </g>
  <g id="g10" stroke-width="0.17200001" stroke="#000" fill="#FFF">
   <path id="path12" d="m-118.77,81.262s-0.55,1.816-1.32,1.517c-0.77-0.298,0.11-51.104-19.95-55.978,0,0,19.22-0.864,21.27,54.461z"/>
  </g>
  <g id="g14" stroke-width="0.17200001" stroke="#000" fill="#FFF">
   <path id="path16" d="m-91.284,123.59s1.636,0.96,1.166,1.64c-0.471,0.67-49.642-12.13-59.102,6.23,0,0,3.68-18.89,57.936-7.87z"/>
  </g>
  <g id="g18" stroke-width="0.17200001" stroke="#000" fill="#FFF">
   <path id="path20" d="m-94.093,133.8s1.856,0.4,1.622,1.19c-0.233,0.79-50.939,4.13-54.129,24.53,0,0-2.46-19.08,52.507-25.72z"/>
  </g>
  <g id="g22" stroke-width="0.17200001" stroke="#000" fill="#FFF">
   <path id="path24" d="m-98.304,128.28s1.778,0.66,1.432,1.41-50.998-3.34-57.128,16.37c0,0,0.35-19.24,55.696-17.78z"/>
  </g>
  <g id="g26" stroke-width="0.17200001" stroke="#000" fill="#FFF">
   <path id="path28" d="m-109.01,110.07s1.31,1.38,0.67,1.9-44.38-25.336-58.53-10.29c0,0,8.74-17.147,57.86,8.39z"/>
  </g>
  <g id="g30" stroke-width="0.17200001" stroke="#000" fill="#FFF">
   <path id="path32" d="m-116.55,114.26s1.45,1.22,0.88,1.81c-0.58,0.59-46.97-20.148-59.32-3.6,0,0,6.74-18.023,58.44,1.79z"/>
  </g>
  <g id="g34" stroke-width="0.17200001" stroke="#000" fill="#FFF">
   <path id="path36" d="m-119.15,118.34s1.6,1,1.11,1.67c-0.49,0.66-49.27-13.56-59.25,4.51,0,0,4.22-18.77,58.14-6.18z"/>
  </g>
  <g id="g38" stroke-width="0.17200001" stroke="#000" fill="#FFF">
   <path id="path40" d="m-108.42,118.95s1.12,1.53,0.42,1.97c-0.7,0.43-40.77-30.818-56.73-17.71,0,0,10.87-15.884,56.31,15.74z"/>
  </g>
  <g id="g42" stroke-width="0.17200001" stroke="#000" fill="#FFF">
   <path id="path44" d="m-128.2,90s0.6,1.8-0.2,2-29.4-41.8-48.6-34.2c0,0,15.2-11.8,48.8,32.2z"/>
  </g>
  <g id="g46" stroke-width="0.17200001" stroke="#000" fill="#FFF">
   <path id="path48" d="m-127.5,96.979s0.97,1.629,0.23,1.996c-0.74,0.368-37.72-34.476-54.83-22.914,0,0,12.3-14.8,54.6,20.918z"/>
  </g>
  <g id="g50" stroke-width="0.17200001" stroke="#000" fill="#FFF">
   <path id="path52" d="m-127.62,101.35s1.12,1.53,0.42,1.97c-0.7,0.43-40.77-30.818-56.73-17.713,0,0,10.87-15.881,56.31,15.743z"/>
  </g>
  <g id="g54" stroke="#000" fill="#FFF">
   <path id="path56" d="m-129.83,103.06c0.5,6.05,1.49,12.62,3.23,15.74,0,0-3.6,12.4,5.2,25.6,0,0-0.4,7.2,1.2,10.4,0,0,4,8.4,8.8,9.2,3.88,0.65,12.607,3.72,22.468,5.12,0,0,17.132,14.08,13.932,26.88,0,0-0.4,16.4-4,18,0,0,11.6-11.2,2,5.6l-4.4,18.8s25.6-21.6,10-3.2l-10,26s19.6-18.4,12.4-10l-3.2,8.8s43.2-27.2,12.4,2.4c0,0,8-3.6,12.4-0.8,0,0,6.8-1.2,6,0.4,0,0-20.8,10.4-24.4,28.8,0,0,8.4-10,5.2,0.8l0.4,11.6s4-21.6,3.6,16c0,0,19.2-18,7.6,2.8v16.8s15.2-16.4,8.8-3.6c0,0,10-8.8,6,6.4,0,0-0.8,10.4,3.6-0.8,0,0,16-30.6,10-4.4,0,0-0.8,19.2,4,4.4,0,0,0.4,10.4,9.6,17.6,0,0-1.2-50.8,11.6-14.8l4,16.4s2.8-9.2,2.4-14.4l8,8s15.2-22.8,12-9.6c0,0-7.6,16-6,20.8,0,0,16.8-34.8,18-36.4,0,0-2,42.4,8.8,6.4,0,0,5.6,12,2.8,16.4,0,0,8-8,7.2-11.2,0,0,4.6-8.2,7.4,5.4,0,0,1.8,9.4,3.4,6.2,0,0,4,24,5.2,1.2,0,0,1.6-13.6-5.6-25.2,0,0,0.8-3.2-2-7.2,0,0,13.6,21.6,6.4-7.2,0,0,11.201,8,12.401,8,0,0-13.601-23.2-4.801-18.4,0,0-5.2-10.4,12.801,1.6,0,0-16.001-16,1.6-6.4,0,0,7.999,6.4,0.4-3.6,0,0-14.401-16,7.599,2,0,0,11.6,16.4,12.4,19.2,0,0-10-29.2-14.4-32,0,0,8.4-36.4,49.6-20.8,0,0,6.8,17.2,11.2-1.2,0,0,12.8-6.4,24,21.2,0,0,4-13.6,3.2-16.4,0,0,6.8,1.2,6,0,0,0,13.2,4.4,14.4,3.6,0,0,6.8,6.8,7.2,3.2,0,0,9.2,2.8,7.2-0.8,0,0,8.8,15.6,9.2,19.2l2.4-14,2,2.8s1.6-7.6,0.8-8.8,20,6.8,24.8,27.6l2,8.4s6-14.8,4.4-18.8c0,0,5.2,0.8,5.6,5.2,0,0,4-23.2-0.8-29.2,0,0,4.4-0.8,5.6,2.8v-7.2s7.2,0.8,7.2-1.6c0,0,4.4-4,6.4,0.8,0,0-12.4-35.2,6-16,0,0,7.2,10.8,3.6-8s-7.6-20.4-2.8-20.8c0,0,0.8-3.6-1.2-5.2s1.2,0,1.2,0,4.8,4-0.4-18c0,0,6.4,1.6-5.6-27.6,0,0,2.8-2.4-1.2-10.8,0,0,8,4.4,10.8,2.8,0,0-0.4-1.6-3.6-5.6,0,0-21.6-54.8-1.2-32.8,0,0,11.85,13.55,5.45-9.25,0,0-9.11-24.009-8.33-28.305l-429.55,23.015z"/>
  </g>
  <g id="g58" stroke="#000" fill="#cc7226">
   <path id="path60" d="m299.72,80.245c0.62,0.181,2.83,1.305,4.08,2.955,0,0,6.8,10.8,1.6-7.6,0,0-9.2-28.8-0.4-17.6,0,0,6,7.2,2.8-6.4-3.86-16.427-6.4-22.8-6.4-22.8s11.6,4.8-15.2-34.8l8.8,3.6s-19.6-39.6-41.2-44.8l-8-6s38.4-38,25.6-74.8c0,0-6.8-5.2-16.4,4,0,0-6.4,4.8-12.4,3.2,0,0-30.8,1.2-32.8,1.2s-36.8-37.2-102.4-19.6c0,0-5.2,2-9.599,0.8,0,0-18.401-16-67.201,6.8,0,0-10,2-11.6,2s-4.4,0-12.4,6.4-8.4,7.2-10.4,8.8c0,0-16.4,11.2-21.2,12,0,0-11.6,6.4-16,16.4l-3.6,1.2s-1.6,7.2-2,8.4c0,0-4.8,3.6-5.6,9.2,0,0-8.8,6-8.4,10.4,0,0-1.6,5.2-2.4,10,0,0-7.2,4.8-6.4,7.6,0,0-7.6,14-6.4,20.8,0,0-6.4-0.4-9.2,2,0,0-0.8,4.8-2.4,5.2,0,0-2.8,1.2-0.4,5.2,0,0-1.6,2.8-2,4.4,0,0,0.8,2.8-3.6,8.4,0,0-6.4,18.8-4.4,24,0,0,0.4,4.8-2.4,6.4,0,0-3.6-0.4,4.8,11.6,0,0,0.8,1.2-2.4,3.6,0,0-17.2,3.6-19.6,20,0,0-13.6,14.8-13.6,20,0,2.305,0.27,5.452,0.97,10.06,0,0-0.57,8.34,27.03,9.14s402.72-31.355,402.72-31.355z"/>
  </g>
  <g id="g62" fill="#cc7226">
   <path id="path64" d="m-115.6,102.6c-25-39.4-10.6,17-10.6,17,8.8,34.4,138.4-3.2,138.4-3.2s168.8-30.4,180-34.4,106.4,2.4,106.4,2.4l-5.6-16.8c-64.8-46.4-84-23.2-97.6-27.2s-11.2,5.6-14.4,6.4-42.4-24-48.8-23.2-31.74-22.951-16.8,8.8c16,34-58.4,39.2-75.2,28s7.2,18.4,7.2,18.4c18.4,20-16,3.2-16,3.2-34.4-12.8-58.4,12.8-61.6,13.6s-8,4-8.8-2.4-8.31-23.101-40,3.2c-20,16.6-33.8-5.4-33.8-5.4l-2.8,11.6z"/>
  </g>
  <g id="g66" fill="#e87f3a">
   <path id="path68" d="m133.51,25.346c-6.4,0.8-31.77-22.939-16.8,8.8,16.6,35.2-58.4,39.2-75.2,28-16.801-11.2,7.2,18.4,7.2,18.4,18.4,20.004-16.001,3.2-16.001,3.2-34.4-12.8-58.4,12.8-61.6,13.6s-8,4.004-8.8-2.4c-0.8-6.4-8.179-22.934-40,3.2-21.236,17.344-34.729-4.109-34.729-4.109l-3.2,10.113c-25-39.804-9.93,18.51-9.93,18.51,8.81,34.4,139.06-4.51,139.06-4.51s168.8-30.404,180-34.404,105.53,2.327,105.53,2.327l-5.53-17.309c-64.8-46.4-83.2-22.618-96.8-26.618s-11.2,5.6-14.4,6.4-42.4-24-48.8-23.2z"/>
  </g>
  <g id="g70" fill="#ea8c4d">
   <path id="path72" d="m134.82,27.091c-6.4,0.8-31.14-23.229-16.8,8.8,16.2,36.201-58.401,39.201-75.201,28.001s7.2,18.4,7.2,18.4c18.4,19.998-16,3.2-16,3.2-34.4-12.8-58.401,12.8-61.601,13.6s-8,3.998-8.8-2.4c-0.8-6.4-8.048-22.767-40,3.2-22.473,18.088-35.658-2.818-35.658-2.818l-3.6,8.616c-23.8-38.998-9.25,20.02-9.25,20.02,8.8,34.4,139.71-5.82,139.71-5.82s168.8-30.398,180-34.398,104.65,2.254,104.65,2.254l-5.45-17.818c-64.8-46.4-82.4-22.037-96-26.037s-11.2,5.6-14.4,6.401c-3.2,0.8-42.4-24.001-48.8-23.201z"/>
  </g>
  <g id="g74" fill="#ec9961">
   <path id="path76" d="m136.13,28.837c-6.4,0.8-31.13-23.232-16.8,8.8,16.8,37.556-58.936,38.845-75.202,28-16.8-11.2,7.2,18.4,7.2,18.4,18.4,20.003-16,3.2-16,3.2-34.4-12.8-58.4,12.803-61.6,13.603s-8,4-8.8-2.403c-0.8-6.4-7.917-22.598-40.001,3.203-23.709,18.83-36.587-1.53-36.587-1.53l-4,7.13c-21.8-36.803-8.58,21.52-8.58,21.52,8.8,34.4,140.37-7.12,140.37-7.12s168.8-30.403,180-34.403,103.78,2.182,103.78,2.182l-5.38-18.327c-64.8-46.401-81.6-21.455-95.2-25.455s-11.2,5.6-14.4,6.4-42.4-24-48.8-23.2z"/>
  </g>
  <g id="g78" fill="#eea575">
   <path id="path80" d="m137.44,30.583c-6.4,0.8-30.63-23.454-16.8,8.8,16.8,39.2-58.403,39.2-75.203,28s7.2,18.4,7.2,18.4c18.4,19.997-16,3.2-16,3.2-34.4-12.8-58.4,12.797-61.6,13.597s-8,4-8.8-2.4c-0.8-6.397-7.785-22.428-40,3.2-24.946,19.58-37.507-0.23-37.507-0.23l-4.4,5.63c-19.8-34.798-7.91,23.04-7.91,23.04,8.8,34.4,141.02-8.44,141.02-8.44s168.8-30.397,180-34.397,102.91,2.109,102.91,2.109l-5.31-18.837c-64.8-46.4-80.8-20.872-94.4-24.872s-11.2,5.6-14.4,6.4-42.4-24-48.8-23.2z"/>
  </g>
  <g id="g82" fill="#f1b288">
   <path id="path84" d="m138.75,32.328c-6.4,0.8-32.37-22.651-16.8,8.8,19.2,38.8-58.404,39.2-75.204,28s7.2,18.4,7.2,18.4c18.4,20.002-16,3.2-16,3.2-34.4-12.8-58.4,12.802-61.6,13.602s-8,4-8.8-2.4c-0.8-6.402-7.654-22.265-40,3.2-26.182,20.33-38.436,1.05-38.436,1.05l-4.8,4.15c-18-33.202-7.24,24.54-7.24,24.54,8.8,34.4,141.68-9.74,141.68-9.74s168.8-30.402,180-34.402,102.03,2.036,102.03,2.036l-5.23-19.345c-64.8-46.4-80-20.291-93.6-24.291s-11.2,5.6-14.4,6.4-42.4-24-48.8-23.2z"/>
  </g>
  <g id="g86" fill="#f3bf9c">
   <path id="path88" d="m140.06,34.073c-6.4,0.8-32.75-22.46-16.8,8.8,20.4,40.001-58.405,39.201-75.205,28.001s7.2,18.4,7.2,18.4c18.4,19.996-16,3.2-16,3.2-34.4-12.8-58.4,12.796-61.6,13.596s-8,4-8.8-2.4c-0.8-6.396-7.523-22.092-40,3.2-27.419,21.08-39.365,2.35-39.365,2.35l-5.2,2.65c-16-30.196-6.56,26.06-6.56,26.06,8.8,34.4,142.32-11.06,142.32-11.06s168.8-30.396,180-34.396,101.16,1.963,101.16,1.963l-5.16-19.854c-64.8-46.4-79.2-19.709-92.8-23.709-13.6-4.001-11.2,5.6-14.4,6.4s-42.4-24.001-48.8-23.201z"/>
  </g>
  <g id="g90" fill="#f5ccb0">
   <path id="path92" d="m141.36,35.819c-6.4,0.8-33.84-21.875-16.8,8.8,22,39.6-58.396,39.2-75.196,28s7.2,18.4,7.2,18.4c18.4,20.001-16,3.2-16,3.2-34.4-12.8-58.4,12.801-61.6,13.601s-8,4-8.8-2.4c-0.8-6.401-7.391-21.928-40,3.2-28.655,21.82-40.294,3.64-40.294,3.64l-5.6,1.16c-14.4-28.401-5.89,27.56-5.89,27.56,8.8,34.4,142.98-12.36,142.98-12.36s168.8-30.401,180-34.401,100.3,1.891,100.3,1.891l-5.1-20.364c-64.8-46.4-78.4-19.127-92-23.127s-11.2,5.6-14.4,6.4-42.4-24-48.8-23.2z"/>
  </g>
  <g id="g94" fill="#f8d8c4">
   <path id="path96" d="m142.67,37.565c-6.4,0.8-33.84-21.876-16.8,8.8,22,39.6-58.396,39.2-75.196,28s7.2,18.4,7.2,18.4c18.4,19.995-16,3.2-16,3.2-34.401-12.8-58.401,12.795-61.601,13.595s-8,4-8.8-2.4-7.259-21.755-40,3.2c-29.891,22.57-41.213,4.93-41.213,4.93l-6-0.33c-13.61-26.396-5.22,29.08-5.22,29.08,8.8,34.4,143.63-13.68,143.63-13.68s168.8-30.395,180-34.395,99.42,1.818,99.42,1.818l-5.01-20.873c-64.81-46.4-77.61-18.545-91.21-22.545s-11.2,5.6-14.4,6.4-42.4-24-48.8-23.2z"/>
  </g>
  <g id="g98" fill="#fae5d7">
   <path id="path100" d="m143.98,39.31c-6.4,0.8-33.45-22.087-16.8,8.8,22,40.8-58.397,39.2-75.197,28s7.2,18.4,7.2,18.4c18.4,20-16,3.2-16,3.2-34.4-12.8-58.4,12.8-61.6,13.6-3.201,0.8-8.001,4-8.801-2.4s-7.128-21.592-40,3.2c-31.127,23.31-42.142,6.22-42.142,6.22l-6.4-1.82c-13-24-4.55,30.58-4.55,30.58,8.8,34.4,144.29-14.98,144.29-14.98s168.8-30.4,180-34.4,98.55,1.746,98.55,1.746l-4.95-21.382c-64.8-46.401-76.8-17.964-90.4-21.964s-11.2,5.6-14.4,6.4-42.4-24-48.8-23.2z"/>
  </g>
  <g id="g102" fill="#fcf2eb">
   <path id="path104" d="m145.29,41.055c-6.4,0.8-32.37-22.644-16.8,8.8,21.2,42.801-58.398,39.201-75.198,28.001s7.2,18.4,7.2,18.4c18.4,20.004-16,3.2-16,3.2-34.4-12.8-58.4,12.804-61.6,13.604s-8,4-8.8-2.4-6.997-21.428-40,3.2c-32.365,24.05-43.072,7.5-43.072,7.5l-6.8-3.3c-12.8-23.204-3.87,32.09-3.87,32.09,8.8,34.4,144.94-16.29,144.94-16.29s168.8-30.4,180-34.404c11.2-4,97.67,1.674,97.67,1.674l-4.87-21.893c-64.8-46.4-76-17.381-89.6-21.381-13.6-4.001-11.2,5.6-14.4,6.4s-42.4-24.001-48.8-23.201z"/>
  </g>
  <g id="g106" fill="#FFF">
   <path id="path108" d="m-115.8,119.6c-12.8-22-3.2,33.6-3.2,33.6,8.8,34.4,145.6-17.6,145.6-17.6s168.8-30.4,180-34.4,96.8,1.6,96.8,1.6l-4.8-22.4c-64.8-46.4-75.2-16.8-88.8-20.8s-11.2,5.6-14.4,6.4-42.4-24-48.8-23.2-31.62-23.007-16.8,8.8c22.23,47.707-60.759,37.627-75.2,28-16.8-11.2,7.2,18.4,7.2,18.4,18.4,20-16,3.2-16,3.2-34.4-12.8-58.4,12.8-61.6,13.6s-8,4-8.8-2.4-6.865-21.256-40,3.2c-33.6,24.8-44,8.8-44,8.8l-7.2-4.8z"/>
  </g>
  <g id="g110" fill="#000">
   <path id="path112" d="m-74.2,149.6s-7.2,11.6,13.6,24.8c0,0,1.4,1.4-16.6-2.8,0,0-6.2-2-7.8-12.4,0,0-4.8-4.4-9.6-10s20.4,0.4,20.4,0.4z"/>
  </g>
  <g id="g114" fill="#CCC">
   <path id="path116" d="m65.8,102s17.698,26.82,17.1,31.6c-1.3,10.4-1.5,20,1.7,24,3.201,4,12.001,37.2,12.001,37.2s-0.4,1.2,11.999-36.8c0,0,11.6-16-8.4-34.4,0,0-35.2-28.8-34.4-21.6z"/>
  </g>
  <g id="g118" fill="#000">
   <path id="path120" d="m-54.2,176.4s11.2,7.2-3.2,38.4l6.4-2.4s-0.8,11.2-4,13.6l7.2-3.2s4.8,8,0.8,12.8c0,0,16.8,8,16,14.4,0,0,6.4-8,2.4-14.4s-11.2-2.4-10.4-20.8l-8.8,3.2s5.6-8.8,5.6-15.2l-8,2.4s15.469-26.58,4.8-28c-6-0.8-8.8-0.8-8.8-0.8z"/>
  </g>
  <g id="g122" fill="#CCC">
   <path id="path124" d="m-21.8,193.2s2.8-4.4,0-3.6-34,15.6-40,25.2c0,0,34.4-24.4,40-21.6z"/>
  </g>
  <g id="g126" fill="#CCC">
   <path id="path128" d="m-11.4,201.2s2.8-4.4,0-3.6-34,15.6-40,25.2c0,0,34.4-24.4,40-21.6z"/>
  </g>
  <g id="g130" fill="#CCC">
   <path id="path132" d="m1.8,186s2.8-4.4,0-3.6-34,15.6-40,25.2c0,0,34.4-24.4,40-21.6z"/>
  </g>
  <g id="g134" fill="#CCC">
   <path id="path136" d="m-21.4,229.6s0-6-2.8-5.2-38.8,18.4-44.8,28c0,0,42-25.6,47.6-22.8z"/>
  </g>
  <g id="g138" fill="#CCC">
   <path id="path140" d="m-20.2,218.8s1.2-4.8-1.6-4c-2,0-28.4,11.6-34.4,21.2,0,0,29.6-21.6,36-17.2z"/>
  </g>
  <g id="g142" fill="#CCC">
   <path id="path144" d="m-34.6,266.4-10,7.6s10.4-7.6,14-6.4c0,0-6.8,11.2-7.6,16.4,0,0,10.4-12.8,16-12.4,0,0,7.6,0.4,7.6,11.2,0,0,5.6-10.4,8.8-10,0,0,1.2,6.4,0,13.2,0,0,4-7.6,8-6,0,0,6.4-2,5.6,9.6,0,0,0,10.4-0.8,13.2,0,0,5.6-26.4,8-26.8,0,0,8-1.2,12.8,7.6,0,0-4-7.6,0.8-5.6,0,0,10.8,1.6,14,8.4,0,0-6.8-12-1.2-8.8l8,6.4s8.4,21.2,10.4,22.8c0,0-7.6-21.6-6-21.6,0,0-2-12,3.2,2.8,0,0-3.2-14,2.4-13.2s10,10.8,18.4,8.4c0,0,9.601,5.6,11.601-63.6l-124,46.8z"/>
  </g>
  <g id="g146" fill="#000">
   <path id="path148" d="m-29.8,173.6s14.8-6,54.8,0c0,0,7.2,0.4,14-8.4s33.6-16,40-14l9.601,6.4,0.8,1.2s12.399,10.4,12.799,18-14.399,55.6-24,71.6c-9.6,16-19.2,28.4-38.4,26,0,0-20.8-4-46.4,0,0,0-29.2-1.6-32-9.6s11.2-23.2,11.2-23.2,4.4-8.4,3.2-22.8-0.8-42.4-5.6-45.2z"/>
  </g>
  <g id="g150" fill="#e5668c">
   <path id="path152" d="M-7.8,175.6c8.4,18.4-21.2,83.6-21.2,83.6-2,1.6,12.66,7.65,22.8,5.2,10.946-2.64,51.2,1.6,51.2,1.6,23.6-15.6,36.4-60,36.4-60s10.401-24-7.2-27.2c-17.6-3.2-82-3.2-82-3.2z"/>
  </g>
  <g id="g154" fill="#b23259">
   <path id="path156" d="m-9.831,206.5c3.326-12.79,4.91-24.59,2.031-30.9,0,0,62.4,6.4,73.6-14.4,4.241-7.87,19.001,22.8,18.6,32.4,0,0-63,14.4-77.8,3.2l-16.431,9.7z"/>
  </g>
  <g id="g158" fill="#a5264c">
   <path id="path160" d="m-5.4,222.8s2,7.2-0.4,11.2c0,0-1.6,0.8-2.8,1.2,0,0,1.2,3.6,7.2,5.2,0,0,2,4.4,4.4,4.8s7.2,6,11.2,4.8,15.2-5.2,15.2-5.2,5.6-3.2,14.4,0.4c0,0,2.375-0.8,2.8-4.8,0.5-4.7,3.6-8.4,5.6-10.4s11.6-14.8,10.4-15.2-68,8-68,8z"/>
  </g>
  <g id="g162" stroke="#000" fill="#ff727f">
   <path id="path164" d="m-9.8,174.4s-2.8,22.4,0.4,30.8,2.4,10.4,1.6,14.4,3.6,14,9.2,20l12,1.6s15.2-3.6,24.4-0.8c0,0,8.994,1.34,12.4-13.6,0,0,4.8-6.4,12-9.2s14.4-44.4,10.4-52.4-18.4-12.4-34.4,3.2-18-1.2-48,6z"/>
  </g>
  <g id="g166" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path168" d="m-8.2,249.2s-0.8-2-5.2-2.4c0,0-22.4-3.6-30.8-16,0,0-6.8-5.6-2.4,6,0,0,10.4,20.4,17.2,23.2,0,0,16.4,4,21.2-10.8z"/>
  </g>
  <g id="g170" fill="#cc3f4c">
   <path id="path172" d="m71.742,185.23c0.659-7.91,2.612-16.52,0.858-20.03-6.446-12.89-23.419-7.5-34.4,3.2-16,15.6-18-1.2-48,6,0,0-1.745,13.96-0.905,23.98,0,0,37.305-11.58,38.105-5.98,0,0,1.6-3.2,10.8-3.2s31.942-1.17,33.542-3.97z"/>
  </g>
  <g id="g174" stroke-width="2" stroke="#a51926">
   <path id="path176" d="m28.6,175.2s4.8,4.8,1.2,14.4c0,0-14.4,16-12.4,30"/>
  </g>
  <g id="g178" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path180" d="m-19.4,260s-4.4-12.8,4.4-6l3.6,3.6c-1.2,1.6-6.8,5.6-8,2.4z"/>
  </g>
  <g id="g182" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path184" d="m-14.36,261.2s-3.52-10.24,3.52-4.8l2.88,2.88c-4.56,1.28,0,3.84-6.4,1.92z"/>
  </g>
  <g id="g186" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path188" d="m-9.56,261.2s-3.52-10.24,3.52-4.8l2.88,2.88c-3.36,1.28,0,3.84-6.4,1.92z"/>
  </g>
  <g id="g190" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path192" d="m-2.96,261.4s-3.52-10.24,3.52-4.8c0,0,4.383,2.33,2.881,2.88-2.961,1.08,0,3.84-6.401,1.92z"/>
  </g>
  <g id="g194" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path196" d="m3.52,261.32s-3.52-10.24,3.521-4.8l2.88,2.88c-0.96,1.28,0,3.84-6.401,1.92z"/>
  </g>
  <g id="g198" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path200" d="m10.2,262s-4.8-12.4,4.4-6l3.6,3.6c-1.2,1.6,0,4.8-8,2.4z"/>
  </g>
  <g id="g202" stroke-width="2" stroke="#a5264c">
   <path id="path204" d="m-18.2,244.8s13.2-2.8,19.2,0.4c0,0,6,1.2,7.2,0.8s4.4-0.8,4.4-0.8"/>
  </g>
  <g id="g206" stroke-width="2" stroke="#a5264c">
   <path id="path208" d="m15.8,253.6s12-13.6,24-9.2c7.016,2.57,6-0.8,6.8-3.6s1-7,6-10"/>
  </g>
  <g id="g210" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path212" d="m33,237.6s-4-10.8-6.8,2-6,16.4-7.6,19.2c0,0,0,5.2,8.4,4.8,0,0,10.8-0.4,11.2-3.2s-1.2-14.4-5.2-22.8z"/>
  </g>
  <g id="g214" stroke-width="2" stroke="#a5264c">
   <path id="path216" d="m47,244.8s3.6-2.4,6-1.2"/>
  </g>
  <g id="g218" stroke-width="2" stroke="#a5264c">
   <path id="path220" d="m53.5,228.4s2.9-4.9,7.7-5.7"/>
  </g>
  <g id="g222" fill="#b2b2b2">
   <path id="path224" d="m-25.8,265.2s18,3.2,22.4,1.6l0.4,2-20.8-1.2s-11.6-5.6-2-2.4z"/>
  </g>
  <g id="g226" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path228" d="m-11.8,172,19.6,0.8s7.2,30.8,3.6,38.4c0,0-1.2,2.8-4-2.8,0,0-18.4-32.8-21.6-34.8s1.2-1.6,2.4-1.6z"/>
  </g>
  <g id="g230" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path232" d="m-88.9,169.3s8.9,1.7,21.5,4.3c0,0,4.8,22.4,8,27.2s-0.4,4.8-4,2-18.4-16.8-20.4-21.2-5.1-12.3-5.1-12.3z"/>
  </g>
  <g id="g234" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path236" d="m-67.039,173.82s5.8,1.55,6.809,3.76c1.008,2.22-1.202,5.51-1.202,5.51s-1,3.31-2.202,1.15c-1.202-2.17-4.074-9.83-3.405-10.42z"/>
  </g>
  <g id="g238" fill="#000">
   <path id="path240" d="m-67,173.6s3.6,5.2,7.2,5.2,3.982-0.41,6.8,0.2c4.6,1,4.2-1,10.8,0.2,2.64,0.48,5.2-0.4,8,0.8s6,0.4,7.2-1.6,6-6.2,6-6.2-12.8,1.8-15.6,2.6c0,0-22.4,1.2-30.4-1.2z"/>
  </g>
  <g id="g242" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path244" d="m-22.4,173.8s-6.45,3.5-6.85,5.9,5.25,6.1,5.25,6.1,2.75,4.6,3.35,2.2-0.95-13.8-1.75-14.2z"/>
  </g>
  <g id="g246" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path248" d="m-59.885,179.26s7.007,11.19,7.224-0.02c0,0,0.557-1.26-1.203-1.28-6.075-0.07-4.554-4.18-6.021,1.3z"/>
  </g>
  <g id="g250" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path252" d="m-52.707,179.51s7.921,11.19,7.285-0.09c0,0,0.007-0.33-1.746-0.48-4.747-0.42-4.402-4.94-5.539,0.57z"/>
  </g>
  <g id="g254" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path256" d="m-45.494,179.52s7.96,10.63,7.291,0.96c0,0,0.119-1.23-1.535-1.53-3.892-0.71-4.103-3.95-5.756,0.57z"/>
  </g>
  <g id="g258" stroke-width="0.5" stroke="#000" fill="#FFC">
   <path id="path260" d="m-38.618,179.6s7.9,11.56,8.248,1.78c0,0,1.644-1.38-0.102-1.6-5.818-0.74-5.02-5.19-8.146-0.18z"/>
  </g>
  <g id="g262" fill="#e5e5b2">
   <path id="path264" d="m-74.792,183.13-7.658-1.53c-2.6-5-4.7-11.15-4.7-11.15s6.35,1,18.85,3.8c0,0,0.876,3.32,2.348,9.11l-8.84-0.23z"/>
  </g>
  <g id="g266" fill="#e5e5b2">
   <path id="path268" d="m-9.724,178.47c-1.666-2.51-2.983-4.26-3.633-4.67-3.013-1.88,1.13-1.51,2.259-1.51l18.454,0.76s0.524,2.24,1.208,5.63c0,0-10.088-2.01-18.288-0.21z"/>
  </g>
  <g id="g270" fill="#cc7226">
   <path id="path272" d="m43.88,40.321c27.721,3.96,53.241-31.68,55.001-41.361,1.759-9.68-8.36-21.56-8.36-21.56,1.32-3.08-3.52-17.16-8.8-26.4s-21.181-8.266-38.721-9.24c-15.84-0.88-34.32,22.44-35.64,24.2s4.84,40.041,6.16,45.761-1.32,32.12-1.32,32.12c34.24-9.1,3.96-7.48,31.68-3.52z"/>
  </g>
  <g id="g274" fill="#ea8e51">
   <path id="path276" d="m8.088-33.392c-1.296,1.728,4.752,39.313,6.048,44.929s-1.296,31.536-1.296,31.536c32.672-8.88,3.888-7.344,31.104-3.456,27.217,3.888,52.273-31.104,54.001-40.609,1.728-9.504-8.208-21.168-8.208-21.168,1.296-3.024-3.456-16.848-8.64-25.92s-20.795-8.115-38.017-9.072c-15.552-0.864-33.696,22.032-34.992,23.76z"/>
  </g>
  <g id="g278" fill="#efaa7c">
   <path id="path280" d="m8.816-32.744c-1.272,1.696,4.664,38.585,5.936,44.097s-1.272,30.952-1.272,30.952c31.404-9.16,3.816-7.208,30.528-3.392,26.713,3.816,51.305-30.528,53.001-39.857,1.696-9.328-8.056-20.776-8.056-20.776,1.272-2.968-3.392-16.536-8.48-25.44s-20.41-7.965-37.313-8.904c-15.264-0.848-33.072,21.624-34.344,23.32z"/>
  </g>
  <g id="g282" fill="#f4c6a8">
   <path id="path284" d="m9.544-32.096c-1.248,1.664,4.576,37.857,5.824,43.265s-1.248,30.368-1.248,30.368c29.436-9.04,3.744-7.072,29.952-3.328,26.209,3.744,50.337-29.952,52.001-39.104,1.664-9.153-7.904-20.385-7.904-20.385,1.248-2.912-3.328-16.224-8.32-24.96s-20.025-7.815-36.609-8.736c-14.976-0.832-32.448,21.216-33.696,22.88z"/>
  </g>
  <g id="g286" fill="#f9e2d3">
   <path id="path288" d="m10.272-31.448c-1.224,1.632,4.488,37.129,5.712,42.433s-1.224,29.784-1.224,29.784c27.868-8.92,3.672-6.936,29.376-3.264,25.705,3.672,49.369-29.376,51.001-38.353,1.632-8.976-7.752-19.992-7.752-19.992,1.224-2.856-3.264-15.912-8.16-24.48s-19.64-7.665-35.905-8.568c-14.688-0.816-31.824,20.808-33.048,22.44z"/>
  </g>
  <g id="g290" fill="#FFF">
   <path id="path292" d="M44.2,36.8c25.2,3.6,48.401-28.8,50.001-37.6s-7.6-19.6-7.6-19.6c1.2-2.8-3.201-15.6-8.001-24s-19.254-7.514-35.2-8.4c-14.4-0.8-31.2,20.4-32.4,22s4.4,36.4,5.6,41.6-1.2,29.2-1.2,29.2c25.5-8.6,3.6-6.8,28.8-3.2z"/>
  </g>
  <g id="g294" fill="#CCC">
   <path id="path296" d="m90.601,2.8s-27.801,7.6-39.401,6c0,0-15.8-6.6-24.6,15.2,0,0-3.6,7.2-5.6,9.2s69.601-30.4,69.601-30.4z"/>
  </g>
  <g id="g298" fill="#000">
   <path id="path300" d="m94.401,0.6s-29.001,12.2-39.001,11.8c0,0-16.4-4.6-24.8,10,0,0-8.4,9.2-11.6,10.8,0,0-0.4,1.6,6-2.4l10.4,5.2s14.8,9.6,24.4-6.4c0,0,4-11.2,4-13.2s21.2-7.6,22.801-8c1.6-0.4,8.2-4.6,7.8-7.8z"/>
  </g>
  <g id="g302" fill="#99cc32">
   <path id="path304" d="m47,36.514c-6.872,0-15.245-3.865-15.245-10.114,0-6.248,8.373-12.513,15.245-12.513,6.874,0,12.446,5.065,12.446,11.313,0,6.249-5.572,11.314-12.446,11.314z"/>
  </g>
  <g id="g306" fill="#659900">
   <path id="path308" d="m43.377,19.83c-4.846,0.722-9.935,2.225-9.863,2.009,1.54-4.619,7.901-7.952,13.486-7.952,4.296,0,8.084,1.978,10.32,4.988,0,0-5.316-0.33-13.943,0.955z"/>
  </g>
  <g id="g310" fill="#FFF">
   <path id="path312" d="m55.4,19.6s-4.4-3.2-4.4-1c0,0,3.6,4.4,4.4,1z"/>
  </g>
  <g id="g314" fill="#000">
   <path id="path316" d="m45.4,27.726c-2.499,0-4.525-2.026-4.525-4.526,0-2.499,2.026-4.525,4.525-4.525,2.5,0,4.526,2.026,4.526,4.525,0,2.5-2.026,4.526-4.526,4.526z"/>
  </g>
  <g id="g318" fill="#cc7226">
   <path id="path320" d="m-58.6,14.4s-3.2-21.2-0.8-25.6c0,0,10.8-10,10.4-13.6,0,0-0.4-18-1.6-18.8s-8.8-6.8-14.8-0.4c0,0-10.4,18-9.6,24.4v2s-7.6-0.4-9.2,1.6c0,0-1.2,5.2-2.4,5.6,0,0-2.8,2.4-0.8,5.2,0,0-2,2.4-1.6,6.4l7.6,4s2,14.4,12.8,19.6c4.836,2.329,8-4.4,10-10.4z"/>
  </g>
  <g id="g322" fill="#FFF">
   <path id="path324" d="m-59.6,12.56s-2.88-19.08-0.72-23.04c0,0,9.72-9,9.36-12.24,0,0-0.36-16.2-1.44-16.92s-7.92-6.12-13.32-0.36c0,0-9.36,16.2-8.64,21.96v1.8s-6.84-0.36-8.28,1.44c0,0-1.08,4.68-2.16,5.04,0,0-2.52,2.16-0.72,4.68,0,0-1.8,2.16-1.44,5.76l6.84,3.6s1.8,12.96,11.52,17.64c4.352,2.095,7.2-3.96,9-9.36z"/>
  </g>
  <g id="g326" fill="#eb955c">
   <path id="path328" d="m-51.05-42.61c-1.09-0.86-8.58-6.63-14.43-0.39,0,0-10.14,17.55-9.36,23.79v1.95s-7.41-0.39-8.97,1.56c0,0-1.17,5.07-2.34,5.46,0,0-2.73,2.34-0.78,5.07,0,0-1.95,2.34-1.56,6.24l7.41,3.9s1.95,14.04,12.48,19.11c4.714,2.27,7.8-4.29,9.75-10.14,0,0-3.12-20.67-0.78-24.96,0,0,10.53-9.75,10.14-13.26,0,0-0.39-17.55-1.56-18.33z"/>
  </g>
  <g id="g330" fill="#f2b892">
   <path id="path332" d="m-51.5-41.62c-0.98-0.92-8.36-6.46-14.06-0.38,0,0-9.88,17.1-9.12,23.18v1.9s-7.22-0.38-8.74,1.52c0,0-1.14,4.94-2.28,5.32,0,0-2.66,2.28-0.76,4.94,0,0-1.9,2.28-1.52,6.08l7.22,3.8s1.9,13.68,12.16,18.62c4.594,2.212,7.6-4.18,9.5-9.88,0,0-3.04-20.14-0.76-24.32,0,0,10.26-9.5,9.88-12.92,0,0-0.38-17.1-1.52-17.86z"/>
  </g>
  <g id="g334" fill="#f8dcc8">
   <path id="path336" d="m-51.95-40.63c-0.87-0.98-8.14-6.29-13.69-0.37,0,0-9.62,16.65-8.88,22.57v1.85s-7.03-0.37-8.51,1.48c0,0-1.11,4.81-2.22,5.18,0,0-2.59,2.22-0.74,4.81,0,0-1.85,2.22-1.48,5.92l7.03,3.7s1.85,13.32,11.84,18.13c4.473,2.154,7.4-4.07,9.25-9.62,0,0-2.96-19.61-0.74-23.68,0,0,9.99-9.25,9.62-12.58,0,0-0.37-16.65-1.48-17.39z"/>
  </g>
  <g id="g338" fill="#FFF">
   <path id="path340" d="m-59.6,12.46s-2.88-18.98-0.72-22.94c0,0,9.72-9,9.36-12.24,0,0-0.36-16.2-1.44-16.92-0.76-1.04-7.92-6.12-13.32-0.36,0,0-9.36,16.2-8.64,21.96v1.8s-6.84-0.36-8.28,1.44c0,0-1.08,4.68-2.16,5.04,0,0-2.52,2.16-0.72,4.68,0,0-1.8,2.16-1.44,5.76l6.84,3.6s1.8,12.96,11.52,17.64c4.352,2.095,7.2-4.06,9-9.46z"/>
  </g>
  <g id="g342" fill="#CCC">
   <path id="path344" d="m-62.7,6.2s-21.6-10.2-22.5-11c0,0,9.1,8.2,9.9,8.2s12.6,2.8,12.6,2.8z"/>
  </g>
  <g id="g346" fill="#000">
   <path id="path348" d="m-79.8,0s18.4,3.6,18.4,8c0,2.912-0.243,16.331-5.6,14.8-8.4-2.4-4.8-16.8-12.8-22.8z"/>
  </g>
  <g id="g350" fill="#99cc32">
   <path id="path352" d="m-71.4,3.8s8.978,1.474,10,4.2c0.6,1.6,1.263,9.908-4.2,11-4.552,0.911-6.782-9.31-5.8-15.2z"/>
  </g>
  <g id="g354" fill="#000">
   <path id="path356" d="m14.595,46.349c-0.497-1.742,0.814-1.611,2.605-2.149,2-0.6,14.2-4.4,15-7s14,1.8,14,1.8c1.8,0.8,6.2,3.4,6.2,3.4,4.8,1.2,11.4,1.6,11.4,1.6,2.4,1,5.8,3.8,5.8,3.8,14.6,10.2,27.001,3,27.001,3,19.999-6.6,13.999-23.8,13.999-23.8-3-9,0.2-12.4,0.2-12.4,0.2-3.8,7.4,2.6,7.4,2.6,2.6,4.2,3.4,9.2,3.4,9.2,8,11.2,4.6-6.6,4.6-6.6,0.2-1-2.6-4.6-2.6-5.8s-1.8-4.6-1.8-4.6c-3-3.4-0.6-10.4-0.6-10.4,1.8-13.8-0.4-12-0.4-12-1.2-1.8-10.4,8.2-10.4,8.2-2.2,3.4-8.2,5-8.2,5-2.799,1.8-6.199,0.4-6.199,0.4-2.6-0.4-8.2,6.6-8.2,6.6,2.8-0.2,5.2,4.2,7.6,4.4s4.2-2.4,5.799-3c1.6-0.6,4.4,5.2,4.4,5.2,0.4,2.6-5.2,7.4-5.2,7.4-0.4,4.6-1.999,3-1.999,3-3-0.6-4.2,3.2-5.2,7.8s-5.2,5-5.2,5c-1.6,7.4-2.801,4.4-2.801,4.4-0.2-5.6-6.2,0.2-6.2,0.2-1.2,2-5.8-0.2-5.8-0.2-6.8-2-4.4-4-4.4-4,1.8-2.2,13,0,13,0,2.2-1.6-5.8-5.6-5.8-5.6-0.6-1.8,0.4-6.2,0.4-6.2,1.2-3.2,8-8.8,8-8.8,9.401-1.2,6.601-2.8,6.601-2.8-6.2-5.2-12.001,2.4-12.001,2.4-2.2,6.2-19.6,21.2-19.6,21.2-4.8,3.4-2.2-3.4-6.2,0s-24.6-5.6-24.6-5.6c-11.562-1.193-14.294,14.549-17.823,11.429,0,0,5.418,8.52,3.818,2.92z"/>
  </g>
  <g id="g358" fill="#000">
   <path id="path360" d="m209.4-120s-25.6,8-28.4,26.8c0,0-2.4,22.8,18,40.4,0,0,0.4,6.4,2.4,9.6,0,0-1.6,4.8,17.2-2.8l27.2-8.4s6.4-2.4,11.6-11.2,20.4-27.6,16.8-52.8c0,0,1.2-11.2-4.8-11.6,0,0-8.4-1.6-15.6,6,0,0-6.8,3.2-9.2,2.8l-35.2,1.2z"/>
  </g>
  <g id="g362" fill="#000">
   <path id="path364" d="m264.02-120.99s2.1-8.93-2.74-4.09c0,0-7.04,5.72-14.52,5.72,0,0-14.52,2.2-18.92,15.4,0,0-3.96,26.84,3.96,32.56,0,0,4.84,7.48,11.88,0.88s22.54-36.83,20.34-50.47z"/>
  </g>
  <g id="g366" fill="#323232">
   <path id="path368" d="m263.65-120.63s2.09-8.75-2.66-3.99c0,0-6.92,5.61-14.26,5.61,0,0-14.26,2.16-18.58,15.12,0,0-3.89,26.354,3.89,31.97,0,0,4.75,7.344,11.66,0.864,6.92-6.48,22.11-36.184,19.95-49.574z"/>
  </g>
  <g id="g370" fill="#666">
   <path id="path372" d="m263.27-120.27s2.08-8.56-2.58-3.9c0,0-6.78,5.51-13.99,5.51,0,0-14,2.12-18.24,14.84,0,0-3.81,25.868,3.82,31.38,0,0,4.66,7.208,11.45,0.848,6.78-6.36,21.66-35.538,19.54-48.678z"/>
  </g>
  <g id="g374" fill="#999">
   <path id="path376" d="m262.9-119.92s2.07-8.37-2.51-3.79c0,0-6.65,5.41-13.73,5.41,0,0-13.72,2.08-17.88,14.56,0,0-3.75,25.372,3.74,30.78,0,0,4.58,7.072,11.23,0.832,6.66-6.24,21.23-34.892,19.15-47.792z"/>
  </g>
  <g id="g378" fill="#CCC">
   <path id="path380" d="m262.53-119.56s2.06-8.18-2.43-3.7c0,0-6.53,5.31-13.47,5.31,0,0-13.46,2.04-17.54,14.28,0,0-3.67,24.886,3.67,30.19,0,0,4.49,6.936,11.02,0.816,6.52-6.12,20.79-34.246,18.75-46.896z"/>
  </g>
  <g id="g382" fill="#FFF">
   <path id="path384" d="m262.15-119.2s2.05-8-2.35-3.6c0,0-6.4,5.2-13.2,5.2,0,0-13.2,2-17.2,14,0,0-3.6,24.4,3.6,29.6,0,0,4.4,6.8,10.8,0.8s20.35-33.6,18.35-46z"/>
  </g>
  <g id="g386" fill="#992600">
   <path id="path388" d="m50.6,84s-20.4-19.2-28.4-20c0,0-34.4-4-49.2,14,0,0,17.6-20.4,45.2-14.8,0,0-21.6-4.4-34-1.2l-26.4,14-2.8,4.8s4-14.8,22.4-20.8c0,0,22.8-4.8,33.6,0,0,0-21.6-6.8-31.6-4.8,0,0-30.4-2.4-43.2,24,0,0,4-14.4,18.8-21.6,0,0,13.6-8.8,34-6,0,0,14.4,3.2,19.6,5.6s4-0.4-4.4-5.2c0,0-5.6-10-19.6-9.6,0,0-42.8,3.6-53.2,15.6,0,0,13.6-11.2,24-14,0,0,22.4-8,30.8-7.2,0,0,24.8,1,32.4-3,0,0-11.2,5-8,8.2s10,10.8,10,12,24.2,23.3,27.8,27.7l2.2,2.3z"/>
  </g>
  <g id="g390" fill="#CCC">
   <path id="path392" d="m189,278s-15.5-36.5-28-46c0,0,26,16,29.5,34,0,0,0,10-1.5,12z"/>
  </g>
  <g id="g394" fill="#CCC">
   <path id="path396" d="m236,285.5s-26.5-55-45-79c0,0,43.5,37.5,48.5,64l0.5,5.5-3-2.5s-0.5,9-1,12z"/>
  </g>
  <g id="g398" fill="#CCC">
   <path id="path400" d="m292.5,237s-62.5-59.5-64-62c0,0,60.5,66,63.5,73.5,0,0-2-9,0.5-11.5z"/>
  </g>
  <g id="g402" fill="#CCC">
   <path id="path404" d="m104,280.5s19.5-52,38.5-29.5c0,0,15,10,14.5,13,0,0-4-6.5-22-6,0,0-19-3-31,22.5z"/>
  </g>
  <g id="g406" fill="#CCC">
   <path id="path408" d="m294.5,153s-45-28.5-52.5-30c-11.81-2.36,49.5,29,54.5,39.5,0,0,2-2.5-2-9.5z"/>
  </g>
  <g id="g410" fill="#000">
   <path id="path412" d="m143.8,259.6s20.4-2,27.2-8.8l4.4,3.6,17.6-38.4,3.6,5.2s14.4-14.8,13.6-22.8,12.8,6,12.8,6-0.8-11.6,6.4-4.8c0,0-2.4-15.6,6-7.6,0,0-10.54-30.16,12-4.4,5.6,6.4,1.2-0.4,1.2-0.4s-26-48-4.4-33.6c0,0,2-22.8,0.8-27.2s-3.2-26.8-8-32,0.4-6.8,6-1.6c0,0-11.2-24,2-12,0,0-3.6-15.2-8-18,0,0-5.6-17.2,9.6-6.4,0,0-4.4-12.4-7.6-15.6,0,0-11.6-27.6-4.4-22.8l4.4,3.6s-6.8-14-0.4-9.6,6.4,4,6.4,4-21.2-33.2-0.8-15.6c0,0-8.16-13.918-11.6-20.8,0,0-18.8-20.4-4.4-14l4.8,1.6s-8.8-10-16.8-11.6,2.4-8,8.8-6,22,9.6,22,9.6,12.8,18.8,16.8,19.2c0,0-20-7.6-14,0.4,0,0,14.4,14,7.2,13.6,0,0-6,7.2-1.2,16,0,0-18.46-18.391-3.6,7.2l6.8,16.4s-24.4-24.8-13.2-2.8c0,0,17.2,23.6,19.2,24s6.4,9.2,6.4,9.2l-4.4-2,5.2,8.8s-11.2-12-5.2,1.2l5.6,14.4s-20.4-22-6.8,7.6c0,0-16.4-5.2-7.6,12,0,0-1.6,16-1.2,21.2s1.6,33.6-2.8,41.6,6,27.2,8,31.2,5.6,14.8-3.2,5.6-4.4-3.6-2.4,5.2,8,24.4,7.2,30c0,0-1.2,1.2-4.4-2.4,0,0-14.8-22.8-13.2-8.4,0,0-1.2,8-4.4,16.8,0,0-3.2,10.8-3.2,2,0,0-3.2-16.8-6-9.2s-6.4,13.6-9.2,16-8-20.4-9.2-10c0,0-12-12.4-16.8,4l-11.6,16.4s-0.4-12.4-1.6-6.4c0,0-30,6-40.4,1.6z"/>
  </g>
  <g id="g414" fill="#000">
   <path id="path416" d="m109.4-97.2s-11.599-8-15.599-7.6,27.599-8.8,68.799,18.8c0,0,4.8,2.8,8.4,2.4,0,0,3.2,2.4,0.4,6,0,0-8.8,9.6,2.4,20.8,0,0,18.4,6.8,12.8-2,0,0,10.8,4,13.2,8s1.2,0,1.2,0l-12.4-12.4s-5.2-2-8-10.4-5.2-18.4-0.8-21.6c0,0-4,4.4-3.2,0.4s4.4-7.6,6-8,18-16.2,24.8-16.6c0,0-9.2,1.4-12.2,0.4s-29.6-12.4-35.6-13.6c0,0-16.8-6.6-4.8-4.6,0,0,35.8,3.8,54,17,0,0-7.2-8.4-25.6-15.4,0,0-22.2-12.6-57.4-7.6,0,0-17.8,3.2-25.6,5,0,0-2.599-0.6-3.199-1s-12.401-9.4-40.001-2.4c0,0-17,4.6-25.6,9.4,0,0-15.2,1.2-18.8,4.4,0,0-18.6,14.6-20.6,15.4s-13.4,8.4-14.2,8.8c0,0,24.6-6.6,27-9s19.8-5,22.2-3.6,10.8,0.8,1.2,1.4c0,0,75.6,14.8,76.4,16.8s4.8,0.8,4.8,0.8z"/>
  </g>
  <g id="g418" fill="#cc7226">
   <path id="path420" d="m180.8-106.4s-10.2-7.4-12.2-7.4-14.4-10.2-18.6-9.8-16.4-9.6-43.8-1.4c0,0-0.6-2,3-2.8,0,0,6.4-2.2,6.8-2.8,0,0,20.2-4.2,27.4-0.6,0,0,9.2,2.6,15.4,8.8,0,0,11.2,3.2,14.4,2.2,0,0,8.8,2.2,9.2,4,0,0,5.8,3,4,5.6,0,0,0.4,1.6-5.6,4.2z"/>
  </g>
  <g id="g422" fill="#cc7226">
   <path id="path424" d="m168.33-108.51c0.81,0.63,1.83,0.73,2.43,1.54,0.24,0.31-0.05,0.64-0.37,0.74-1.04,0.31-2.1-0.26-3.24,0.33-0.4,0.21-1.04,0.03-1.6-0.12-1.63-0.44-3.46-0.47-5.15,0.22-1.98-1.13-4.34-0.54-6.42-1.55-0.06-0.02-0.28,0.32-0.36,0.3-3.04-1.15-6.79-0.87-9.22-3.15-2.43-0.41-4.78-0.87-7.21-1.55-1.82-0.51-3.23-1.5-4.85-2.33-1.38-0.71-2.83-1.23-4.37-1.61-1.86-0.45-3.69-0.34-5.58-0.86-0.1-0.02-0.29,0.32-0.37,0.3-0.32-0.11-0.62-0.69-0.79-0.64-1.68,0.52-3.17-0.45-4.83-0.11-1.18-1.22-2.9-0.98-4.45-1.42-2.97-0.85-6.12,0.42-9.15-0.58,4.11-1.84,8.8-0.61,12.86-2.68,2.33-1.18,4.99-0.08,7.56-0.84,0.49-0.15,1.18-0.35,1.58,0.32,0.14-0.14,0.32-0.37,0.38-0.35,2.44,1.16,4.76,2.43,7.24,3.5,0.34,0.15,0.88-0.09,1.13,0.12,1.52,1.21,3.46,1.11,4.85,2.33,1.7-0.5,3.49-0.12,5.22-0.75,0.08-0.02,0.31,0.32,0.34,0.3,1.14-0.75,2.29-0.48,3.18-0.18,0.34,0.12,1,0.37,1.31,0.44,1.12,0.27,1.98,0.75,3.16,0.94,0.11,0.02,0.3-0.32,0.37-0.3,1.12,0.44,2.16,0.39,2.82,1.55,0.14-0.14,0.3-0.37,0.38-0.35,1.03,0.34,1.68,1.1,2.78,1.34,0.48,0.1,1.1,0.73,1.67,0.91,2.39,0.73,4.24,2.26,6.43,3.15,0.76,0.31,1.64,0.55,2.27,1.04z"/>
  </g>
  <g id="g426" fill="#cc7226">
   <path id="path428" d="m91.696-122.74c-2.518-1.72-4.886-2.83-7.328-4.62-0.181-0.13-0.541,0.04-0.743-0.08-1.007-0.61-1.895-1.19-2.877-1.89-0.539-0.38-1.36-0.37-1.868-0.63-2.544-1.29-5.173-1.85-7.68-3.04,0.682-0.64,1.804-0.39,2.4-1.2,0.195,0.28,0.433,0.56,0.786,0.37,1.678-0.9,3.528-1.05,5.204-0.96,1.704,0.09,3.424,0.39,5.199,0.67,0.307,0.04,0.506,0.56,0.829,0.66,2.228,0.66,4.617,0.14,6.736,0.98,1.591,0.63,3.161,1.45,4.4,2.72,0.252,0.26-0.073,0.57-0.353,0.76,0.388-0.11,0.661,0.1,0.772,0.41,0.084,0.24,0.084,0.54,0,0.78-0.112,0.31-0.391,0.41-0.765,0.46-1.407,0.19,0.365-1.19-0.335-0.74-1.273,0.82-0.527,2.22-1.272,3.49-0.28-0.19-0.51-0.41-0.4-0.8,0.234,0.52-0.368,0.81-0.536,1.13-0.385,0.72-1.284,2.14-2.169,1.53z"/>
  </g>
  <g id="g430" fill="#cc7226">
   <path id="path432" d="m59.198-115.39c-3.154-0.79-6.204-0.68-9.22-1.96-0.067-0.02-0.29,0.32-0.354,0.3-1.366-0.6-2.284-1.56-3.36-2.61-0.913-0.89-2.571-0.5-3.845-0.99-0.324-0.12-0.527-0.63-0.828-0.67-1.219-0.16-2.146-1.11-3.191-1.68,2.336-0.8,4.747-0.76,7.209-1.15,0.113-0.02,0.258,0.31,0.391,0.31,0.136,0,0.266-0.23,0.4-0.36,0.195,0.28,0.497,0.61,0.754,0.35,0.548-0.54,1.104-0.35,1.644-0.31,0.144,0.01,0.269,0.32,0.402,0.32,0.136,0,0.267-0.32,0.4-0.32,0.136,0,0.267,0.32,0.4,0.32,0.136,0,0.266-0.23,0.4-0.36,0.692,0.78,1.577,0.23,2.399,0.41,1.038,0.22,1.305,1.37,2.379,1.67,4.715,1.3,8.852,3.45,13.215,5.54,0.307,0.14,0.517,0.39,0.407,0.78,0.267,0,0.58-0.09,0.77,0.04,1.058,0.74,2.099,1.28,2.796,2.38,0.216,0.34-0.113,0.75-0.346,0.7-4.429-1-8.435-1.61-12.822-2.71z"/>
  </g>
  <g id="g434" fill="#cc7226">
   <path id="path436" d="m45.338-71.179c-1.592-1.219-2.176-3.25-3.304-5.042-0.214-0.34,0.06-0.654,0.377-0.743,0.56-0.159,1.103,0.319,1.512,0.521,1.745,0.862,3.28,2.104,5.277,2.243,1.99,2.234,6.25,2.619,6.257,6,0.001,0.859-1.427-0.059-1.857,0.8-2.451-1.003-4.84-0.9-7.22-2.367-0.617-0.381-0.287-0.834-1.042-1.412z"/>
  </g>
  <g id="g438" fill="#cc7226">
   <path id="path440" d="m17.8-123.76c0.135,0,7.166,0.24,7.149,0.35-0.045,0.31-7.775,1.36-8.139,1.19-0.164-0.08-7.676,2.35-7.81,2.22,0.268-0.14,8.534-3.76,8.8-3.76z"/>
  </g>
  <g id="g442" fill="#000">
   <path id="path444" d="m33.2-114s-14.8,1.8-19.2,3-23,8.8-26,10.8c0,0-13.4,5.4-30.4,25.4,0,0,7.6-3.4,9.8-6.2,0,0,13.6-12.6,13.4-10,0,0,12.2-8.6,11.6-6.4,0,0,24.4-11.2,22.4-8,0,0,21.6-4.6,20.6-2.6,0,0,18.8,4.4,16,4.6,0,0-5.8,1.2,0.6,4.8,0,0-3.4,4.4-8.8,0.4s-2.4-1.8-7.4-0.8c0,0-2.6,0.8-7.2-3.2,0,0-5.6-4.6-14.4-1,0,0-30.6,12.6-32.6,13.2,0,0-3.6,2.8-6,6.4,0,0-5.8,4.4-8.8,5.8,0,0-12.8,11.6-14,13,0,0-3.4,5.2-4.2,5.6,0,0,6.4-3.8,8.4-5.8,0,0,14-10,19.4-10.8,0,0,4.4-3,5.2-4.4,0,0,14.4-9.2,18.6-9.2,0,0,9.2,5.2,11.6-1.8,0,0,5.8-1.8,11.4-0.6,0,0,3.2-2.6,2.4-4.8,0,0,1.6-1.8,2.6,2,0,0,3.4,3.6,8.2,1.6,0,0,4-0.2,2,2.2,0,0-4.4,3.8-16.2,4,0,0-12.4,0.6-28.8,8.2,0,0-29.8,10.4-39,20.8,0,0-6.4,8.8-11.8,10,0,0-5.8,0.8-11.8,8.2,0,0,9.8-5.8,18.8-5.8,0,0,4-2.4,0.2,1.2,0,0-3.6,7.6-2,13,0,0-0.6,5.2-1.4,6.8,0,0-7.8,12.8-7.8,15.2s1.2,12.2,1.6,12.8-1-1.6,2.8,0.8,6.6,4,7.4,6.8-2-5.4-2.2-7.2-4.4-9-3.6-11.4c0,0,1,1,1.8,2.4,0,0-0.6-0.6,0-4.2,0,0,0.8-5.2,2.2-8.4s3.4-7,3.8-7.8,0.4-6.6,1.8-4l3.4,2.6s-2.8-2.6-0.6-4.8c0,0-1-5.6,0.8-8.2,0,0,7-8.4,8.6-9.4s0.2-0.6,0.2-0.6,6-4.2,0.2-2.6c0,0-4,1.6-7,1.6,0,0-7.6,2-3.6-2.2s14-9.6,17.8-9.4l0.8,1.6,11.2-2.4-1.2,0.8s-0.2-0.2,4-0.6,10,1,11.4-0.8,4.8-2.8,4.4-1.4-0.6,3.4-0.6,3.4,5-5.8,4.4-3.6-8.8,7.4-10.2,13.6l10.4-8.2,3.6-3s3.6,2.2,3.8,0.6,4.8-7.4,6-7.2,3.2-2.6,3,0,7.4,8,7.4,8,3.2-1.8,4.6-0.4,5.6-19.8,5.6-19.8l25-10.6,43.6-3.4-16.999-6.8-61.001-11.4z"/>
  </g>
  <g id="g446" stroke-width="2" stroke="#4c0000">
   <path id="path448" d="m51.4,85s-15-16.8-23.4-19.4c0,0-13.4-6.8-38,1"/>
  </g>
  <g id="g450" stroke-width="2" stroke="#4c0000">
   <path id="path452" d="m24.8,64.2s-25.2-8-40.6-3.8c0,0-18.4,2-26.8,15.8"/>
  </g>
  <g id="g454" stroke-width="2" stroke="#4c0000">
   <path id="path456" d="m21.2,63s-17-7.2-31.8-9.4c0,0-16.6-2.6-33.2,4.6,0,0-12.2,6-17.6,16.2"/>
  </g>
  <g id="g458" stroke-width="2" stroke="#4c0000">
   <path id="path460" d="m22.2,63.4s-15.4-11-16.4-12.4c0,0-7-11-20-11.4,0,0-21.4,0.8-38.6,8.8"/>
  </g>
  <g id="g462" fill="#000">
   <path id="path464" d="M20.895,54.407c1.542,1.463,28.505,30.393,28.505,30.393,35.2,36.6,7.2,2.4,7.2,2.4-7.6-4.8-16.8-23.6-16.8-23.6-1.2-2.8,14,7.2,14,7.2,4,0.8,17.6,20,17.6,20-6.8-2.4-2,4.8-2,4.8,2.8,2,23.201,17.6,23.201,17.6,3.6,4,7.599,5.6,7.599,5.6,14-5.2,7.6,8,7.6,8,2.4,6.8,8-4.8,8-4.8,11.2-16.8-5.2-14.4-5.2-14.4-30,2.8-36.8-13.2-36.8-13.2-2.4-2.4,6.4,0,6.4,0,8.401,2-7.2-12.4-7.2-12.4,2.4,0,11.6,6.8,11.6,6.8,10.401,9.2,12.401,7.2,12.401,7.2,17.999-8.8,28.399-1.2,28.399-1.2,2,1.6-3.6,8.4-2,13.6s6.4,17.6,6.4,17.6c-2.4,1.6-2,12.4-2,12.4,16.8,23.2,7.2,21.2,7.2,21.2-15.6-0.4-0.8,7.2-0.8,7.2,3.2,2,12,9.2,12,9.2-2.8-1.2-4.4,4-4.4,4,4.8,4,2,8.8,2,8.8-6,1.2-7.2,5.2-7.2,5.2,6.8,8-3.2,8.4-3.2,8.4,3.6,4.4-1.2,16.4-1.2,16.4-4.8,0-11.2,5.6-11.2,5.6,2.4,4.8-8,10.4-8,10.4-8.4,1.6-5.6,8.4-5.6,8.4-7.999,6-10.399,22-10.399,22-0.8,10.4-3.2,13.6,2,11.6,5.199-2,4.399-14.4,4.399-14.4-4.799-15.6,38-31.6,38-31.6,4-1.6,4.8-6.8,4.8-6.8,2,0.4,10.8,8,10.8,8,7.6,11.2,8,2,8,2,1.2-3.6-0.4-9.6-0.4-9.6,6-21.6-8-28-8-28-10-33.6,4-25.2,4-25.2,2.8,5.6,13.6,10.8,13.6,10.8l3.6-2.4c-1.6-4.8,6.8-10.8,6.8-10.8,2.8,6.4,8.8-1.6,8.8-1.6,3.6-24.4,16-10,16-10,4,1.2,5.2-5.6,5.2-5.6,3.6-10.4,0-24,0-24,3.6-0.4,13.2,5.6,13.2,5.6,2.8-3.6-6.4-20.4-2.4-18s8.4,4,8.4,4c0.8-2-9.2-14.4-9.2-14.4-4.4-2.8-9.6-23.2-9.6-23.2,7.2,3.6-2.8-11.6-2.8-11.6,0-3.2,6-14.4,6-14.4-0.8-6.8,0-6.4,0-6.4,2.8,1.2,10.8,2.8,4-3.6s0.8-11.2,0.8-11.2c4.4-2.8-9.2-2.4-9.2-2.4-5.2-4.4-4.8-8.4-4.8-8.4,8,2-6.4-12.4-8.8-16s7.2-8.8,7.2-8.8c13.2-3.6,1.6-6.8,1.6-6.8-19.6,0.4-8.8-10.4-8.8-10.4,6,0.4,4.4-2,4.4-2-5.2-1.2-14.8-7.6-14.8-7.6-4-3.6-0.4-2.8-0.4-2.8,16.8,1.2-12-10-12-10,8,0-10-10.4-10-10.4-2-1.6-5.2-9.2-5.2-9.2-6-5.2-10.8-12-10.8-12-0.4-4.4-5.2-9.2-5.2-9.2-11.6-13.6-17.2-13.2-17.2-13.2-14.8-3.6-20-2.8-20-2.8l-52.8,4.4c-26.4,12.8-18.6,33.8-18.6,33.8,6.4,8.4,15.6,4.6,15.6,4.6,4.6-6.2,16.2-4,16.2-4,20.401,3.2,17.801-0.4,17.801-0.4-2.4-4.6-18.601-10.8-18.801-11.4s-9-4-9-4c-3-1.2-7.4-10.4-7.4-10.4-3.2-3.4,12.6,2.4,12.6,2.4-1.2,1,6.2,5,6.2,5,17.401-1,28.001,9.8,28.001,9.8,10.799,16.6,10.999,8.4,10.999,8.4,2.8-9.4-9-30.6-9-30.6,0.4-2,8.6,4.6,8.6,4.6,1.4-2,2.2,3.8,2.2,3.8,0.2,2.4,4,10.4,4,10.4,2.8,13,6.4,5.6,6.4,5.6l4.6,9.4c1.4,2.6-4.6,10.2-4.6,10.2-0.2,2.8,0.6,2.6-5,10.2s-2.2,12-2.2,12c-1.4,6.6,7.4,6.2,7.4,6.2,2.6,2.2,6,2.2,6,2.2,1.8,2,4.2,1.4,4.2,1.4,1.6-3.8,7.8-1.8,7.8-1.8,1.4-2.4,9.6-2.8,9.6-2.8,1-2.6,1.4-4.2,4.8-4.8s-21.2-43.6-21.2-43.6c6.4-0.8-1.8-13.2-1.8-13.2-2.2-6.6,9.2,8,11.4,9.4s3.2,3.6,1.6,3.4-3.4,2-2,2.2,14.4,15.2,17.8,25.4,9.4,14.2,15.6,20.2,5.4,30.2,5.4,30.2c-0.4,8.8,5.6,19.4,5.6,19.4,2,3.8-2.2,22-2.2,22-2,2.2-0.6,3-0.6,3,1,1.2,7.8,14.4,7.8,14.4-1.8-0.2,1.8,3.4,1.8,3.4,5.2,6-1.2,3-1.2,3-6-1.6,1,8.2,1,8.2,1.2,1.8-7.8-2.8-7.8-2.8-9.2-0.6,2.4,6.6,2.4,6.6,8.6,7.2-2.8,2.8-2.8,2.8-4.6-1.8-1.4,5-1.4,5,3.2,1.6,20.4,8.6,20.4,8.6,0.4,3.8-2.6,8.8-2.6,8.8,0.4,4-1.8,7.4-1.8,7.4-1.2,8.2-1.8,9-1.8,9-4.2,0.2-11.6,14-11.6,14-1.8,2.6-12,14.6-12,14.6-2,7-20-0.2-20-0.2-6.6,3.4-4.6,0-4.6,0-0.4-2.2,4.4-8.2,4.4-8.2,7-2.6,4.4-13.4,4.4-13.4,4-1.4-7.2-4.2-7-5.4s6-2.6,6-2.6c8-2,3.6-4.4,3.6-4.4-0.6-4,2.4-9.6,2.4-9.6,11.6-0.8,0-17,0-17-10.8-7.6-11.8-13.4-11.8-13.4,12.6-8.2,4.4-20.6,4.6-24.2s1.4-25.2,1.4-25.2c-2-6.2-5-19.8-5-19.8,2.2-5.2,9.6-17.8,9.6-17.8,2.8-4.2,11.6-9,9.4-12s-10-1.2-10-1.2c-7.8-1.4-7.2,3.8-7.2,3.8-1.6,1-2.4,6-2.4,6-0.72,7.933-9.6,14.2-9.6,14.2-11.2,6.2-2,10.2-2,10.2,6,6.6-3.8,6.8-3.8,6.8-11-1.8-2.8,8.4-2.8,8.4,10.8,12.8,7.8,15.6,7.8,15.6-10.2,1,2.4,10.2,2.4,10.2s-0.8-2-0.6-0.2,3.2,6,4,8-3.2,2.2-3.2,2.2c0.6,9.6-14.8,5.4-14.8,5.4l-1.6,0.2c-1.6,0.2-12.8-0.6-18.6-2.8s-12.599-2.2-12.599-2.2-4,1.8-11.601,1.6c-7.6-0.2-15.6,2.6-15.6,2.6-4.4-0.4,4.2-4.8,4.4-4.6s5.8-5.4-2.2-4.8c-21.797,1.635-32.6-8.6-32.6-8.6-2-1.4-4.6-4.2-4.6-4.2-10-2,1.4,12.4,1.4,12.4,1.2,1.4-0.2,2.4-0.2,2.4-0.8-1.6-8.6-7-8.6-7-2.811-0.973-4.174-2.307-6.505-4.793z"/>
  </g>
  <g id="g466" fill="#4c0000">
   <path id="path468" d="m-3,42.8s11.6,5.6,14.2,8.4,16.6,14.2,16.6,14.2-5.4-2-8-3.8-13.4-10-13.4-10-3.8-6-9.4-8.8z"/>
  </g>
  <g id="g470" fill="#99cc32">
   <path id="path472" d="M-61.009,11.603c0.337-0.148-0.187-2.86-0.391-3.403-1.022-2.726-10-4.2-10-4.2-0.227,1.365-0.282,2.961-0.176,4.599,0,0,4.868,5.519,10.567,3.004z"/>
  </g>
  <g id="g474" fill="#659900">
   <path id="path476" d="M-61.009,11.403c-0.449,0.158-0.015-2.734-0.191-3.203-1.022-2.726-10.2-4.3-10.2-4.3-0.227,1.365-0.282,2.961-0.176,4.599,0,0,4.268,5.119,10.567,2.904z"/>
  </g>
  <g id="g478" fill="#000">
   <path id="path480" d="m-65.4,11.546c-0.625,0-1.131-1.14-1.131-2.546,0-1.405,0.506-2.545,1.131-2.545s1.132,1.14,1.132,2.545c0,1.406-0.507,2.546-1.132,2.546z"/>
  </g>
  <g id="g482" fill="#000">
   <path id="path484" d="M-65.4,9z"/>
  </g>
  <g id="g486" fill="#000">
   <path id="path488" d="m-111,109.6s-5.6,10,19.2,4c0,0,14-1.2,16.4-3.6,1.2,0.8,9.566,3.73,12.4,4.4,6.8,1.6,15.2-8.4,15.2-8.4s4.6-10.5,7.4-10.5-0.4,1.6-0.4,1.6-6.6,10.1-6.2,11.7c0,0-5.2,20-21.2,20.8,0,0-16.15,0.95-14.8,6.8,0,0,8.8-2.4,11.2,0,0,0,10.8-0.4,2.8,6l-6.8,11.6s0.14,3.92-10,0.4c-9.8-3.4-20.1-16.3-20.1-16.3s-15.95-14.55-5.1-28.5z"/>
  </g>
  <g id="g490" fill="#e59999">
   <path id="path492" d="m-112.2,113.6s-2,9.6,34.8-0.8l6.8,0.8c2.4,0.8,14.4,3.6,16.4,2.4,0,0-7.2,13.6-18.8,12,0,0-13.2,1.6-12.8,6.4,0,0,4,7.2,8.8,9.6,0,0,2.8,2.4,2.4,5.6s-3.2,4.8-5.2,5.6-5.2-2.4-6.8-2.4-10-6.4-14.4-11.2-12.8-16.8-12.4-19.6,1.2-8.4,1.2-8.4z"/>
  </g>
  <g id="g494" fill="#b26565">
   <path id="path496" d="m-109,131.05c2.6,3.95,5.8,8.15,8,10.55,4.4,4.8,12.8,11.2,14.4,11.2s4.8,3.2,6.8,2.4,4.8-2.4,5.2-5.6-2.4-5.6-2.4-5.6c-3.066-1.53-5.806-5.02-7.385-7.35,0,0,0.185,2.55-5.015,1.75s-10.4-3.6-12-6.8-4-5.6-2.4-2,4,7.2,5.6,7.6,1.2,1.6-1.2,1.2-5.2-0.8-9.6-6z"/>
  </g>
  <g id="g498" fill="#992600">
   <path id="path500" d="m-111.6,110s1.8-13.6,3-17.6c0,0-0.8-6.8,1.6-11s4.4-10.4,7.4-15.8,3.2-9.4,7.2-11,10-10.2,12.8-11.2,2.6-0.2,2.6-0.2,6.8-14.8,20.4-10.8c0,0-16.2-2.8-0.4-12.2,0,0-4.8,1.1-1.5-5.9,2.201-4.668,1.7,2.1-9.3,13.9,0,0-5,8.6-10.2,11.6s-17.2,10-18.4,13.8-4.4,9.6-6.4,11.2-4.8,5.8-5.2,9.2c0,0-1.2,4-2.6,5.2s-1.6,4.4-1.6,6.4-2,4.8-1.8,7.2c0,0,0.8,19,0.4,21l2-3.8z"/>
  </g>
  <g id="g502" fill="#FFF">
   <path id="path504" d="m-120.2,114.6s-2-1.4-6.4,4.6c0,0,7.3,33,7.3,34.4,0,0,1.1-2.1-0.2-9.3s-2.2-19.9-2.2-19.9l1.5-9.8z"/>
  </g>
  <g id="g506" fill="#992600">
   <path id="path508" d="m-98.6,54s-17.6,3.2-17.2,32.4l-0.8,24.8s-1.2-25.6-2.4-27.2,2.8-12.8-0.4-6.8c0,0-14,14-6,35.2,0,0,1.5,3.3-1.5-1.3,0,0-4.6-12.6-3.5-19,0,0,0.2-2.2,2.1-5,0,0,8.6-11.7,11.3-14,0,0,1.8-14.4,17.2-19.6,0,0,5.7-2.3,1.2,0.5z"/>
  </g>
  <g id="g510" fill="#000">
   <path id="path512" d="m40.8-12.2c0.66-0.354,0.651-1.324,1.231-1.497,1.149-0.344,1.313-1.411,1.831-2.195,0.873-1.319,1.066-2.852,1.648-4.343,0.272-0.7,0.299-1.655-0.014-2.315-1.174-2.481-1.876-4.93-3.318-7.356-0.268-0.45-0.53-1.244-0.731-1.842-0.463-1.384-1.72-2.375-2.58-3.695-0.288-0.441,0.237-1.366-0.479-1.45-0.897-0.105-2.346-0.685-2.579,0.341-0.588,2.587,0.423,5.11,1.391,7.552-0.782,0.692-0.448,1.613-0.296,2.38,0.71,3.606-0.488,6.958-1.249,10.432-0.023,0.104,0.319,0.302,0.291,0.364-1.222,2.686-2.674,5.131-4.493,7.512-0.758,0.992-1.63,1.908-2.127,2.971-0.368,0.787-0.776,1.753-0.526,2.741-3.435,2.78-5.685,6.625-8.296,10.471-0.462,0.68-0.171,1.889,0.38,2.158,0.813,0.398,1.769-0.626,2.239-1.472,0.389-0.698,0.742-1.348,1.233-1.991,0.133-0.175-0.046-0.594,0.089-0.715,2.633-2.347,4.302-5.283,6.755-7.651,1.95-0.329,3.487-1.327,5.235-2.34,0.308-0.179,0.832,0.07,1.122-0.125,1.753-1.177,1.751-3.213,1.857-5.123,0.05-0.884,0.246-2.201,1.386-2.812z"/>
  </g>
  <g id="g514" fill="#000">
   <path id="path516" d="m31.959-16.666c0.124-0.077-0.031-0.5,0.078-0.716,0.162-0.324,0.565-0.512,0.727-0.836,0.109-0.216-0.054-0.596,0.082-0.738,2.333-2.447,2.59-5.471,1.554-8.444,1.024-0.62,1.085-1.882,0.66-2.729-0.853-1.7-1.046-3.626-2.021-5.169-0.802-1.269-2.38-2.513-3.751-1.21-0.421,0.4-0.742,1.187-0.464,1.899,0.064,0.163,0.349,0.309,0.322,0.391-0.107,0.324-0.653,0.548-0.659,0.82-0.03,1.496-0.984,3.007-0.354,4.336,0.772,1.629,1.591,3.486,2.267,5.262-1.234,2.116-0.201,4.565-1.954,6.442-0.136,0.146-0.127,0.532-0.005,0.734,0.292,0.486,0.698,0.892,1.184,1.184,0.202,0.121,0.55,0.123,0.75-0.001,0.578-0.362,0.976-0.849,1.584-1.225z"/>
  </g>
  <g id="g518" fill="#000">
   <path id="path520" d="m94.771-26.977c1.389,1.792,1.679,4.587-0.37,5.977,0.55,3.309,3.901,1.33,5.999,0.8-0.11-0.388,0.12-0.732,0.4-0.737,1.06-0.015,1.74-1.047,2.8-0.863,0.44-1.557,2.07-2.259,2.72-3.639,1.72-3.695,1.13-7.968-1.45-11.214-0.2-0.254,0.01-0.771-0.11-1.133-0.76-2.211-2.82-2.526-4.76-3.214-1.176-3.875-1.837-7.906-3.599-11.6-1.614-0.25-2.312-1.989-3.649-2.709-1.333-0.719-1.901,0.86-1.86,1.906,0.007,0.205,0.459,0.429,0.289,0.794-0.076,0.164-0.336,0.275-0.336,0.409,0.001,0.135,0.222,0.266,0.356,0.4-0.918,0.82-2.341,1.297-2.636,2.442-0.954,3.71,1.619,6.835,3.287,10.036,0.591,1.135-0.145,2.406-0.905,3.614-0.438,0.695-0.33,1.822-0.054,2.678,0.752,2.331,2.343,4.07,3.878,6.053z"/>
  </g>
  <g id="g522" fill="#000">
   <path id="path524" d="m57.611-8.591c-1.487,1.851-4.899,4.42-1.982,6.348,0.194,0.129,0.564,0.133,0.737-0.001,2.021-1.565,4.024-2.468,6.46-3.05,0.124-0.029,0.398,0.438,0.767,0.277,1.613-0.703,3.623-0.645,4.807-1.983,3.767,0.224,7.332-0.892,10.723-2.2,1.161-0.448,2.431-1.007,3.632-1.509,1.376-0.576,2.58-1.504,3.692-2.645,0.133-0.136,0.487-0.046,0.754-0.046-0.04-0.863,0.922-0.99,1.169-1.612,0.092-0.232-0.058-0.628,0.075-0.73,2.138-1.63,3.058-3.648,1.889-6.025-0.285-0.578-0.534-1.196-1.1-1.672-1.085-0.911-2.187-0.057-3.234-0.361-0.159,0.628-0.888,0.456-1.274,0.654-0.859,0.439-2.192-0.146-3.051,0.292-1.362,0.695-2.603,0.864-4.025,1.241-0.312,0.082-1.09-0.014-1.25,0.613-0.134-0.134-0.282-0.368-0.388-0.346-1.908,0.396-3.168,0.61-4.469,2.302-0.103,0.133-0.545-0.046-0.704,0.089-0.957,0.808-1.362,2.042-2.463,2.714-0.201,0.123-0.553-0.045-0.747,0.084-0.646,0.431-1.013,1.072-1.655,1.519-0.329,0.229-0.729-0.096-0.697-0.352,0.245-1.947,0.898-3.734,0.323-5.61,2.077-2.52,4.594-4.469,6.4-7.2,0.015-2.166,0.707-4.312,0.594-6.389-0.01-0.193-0.298-0.926-0.424-1.273-0.312-0.854,0.594-1.92-0.25-2.644-1.404-1.203-2.696-0.327-3.52,1.106-1.838,0.39-3.904,1.083-5.482-0.151-1.007-0.787-1.585-1.693-2.384-2.749-0.985-1.302-0.65-2.738-0.58-4.302,0.006-0.128-0.309-0.264-0.309-0.398,0.001-0.135,0.221-0.266,0.355-0.4-0.706-0.626-0.981-1.684-2-2,0.305-1.092-0.371-1.976-1.242-2.278-1.995-0.691-3.672,1.221-5.564,1.294-0.514,0.019-0.981-1.019-1.63-1.344-0.432-0.216-1.136-0.249-1.498,0.017-0.688,0.504-1.277,0.618-2.035,0.823-1.617,0.436-2.895,1.53-4.375,2.385-1.485,0.857-2.44,2.294-3.52,3.614-0.941,1.152-1.077,3.566,0.343,4.066,1.843,0.65,3.147-2.053,5.113-1.727,0.312,0.051,0.518,0.362,0.408,0.75,0.389,0.109,0.607-0.12,0.8-0.4,0.858,1.019,2.022,1.356,2.96,2.229,0.97,0.904,2.716,0.486,3.731,1.483,1.529,1.502,0.97,4.183,2.909,5.488-0.586,1.313-1.193,2.59-1.528,4.017-0.282,1.206,0.712,2.403,1.923,2.312,1.258-0.094,1.52-0.853,2.005-1.929,0.267,0.267,0.736,0.564,0.695,0.78-0.457,2.387-1.484,4.38-1.942,6.811-0.059,0.317-0.364,0.519-0.753,0.409-0.468,4.149-4.52,6.543-7.065,9.708-0.403,0.502-0.407,1.751,0.002,2.154,1.403,1.387,3.363-0.159,5.063-0.662,0.213-1.206,1.072-2.148,2.404-2.092,0.256,0.01,0.491-0.532,0.815-0.662,0.348-0.138,0.85,0.086,1.136-0.112,1.729-1.195,3.137-2.301,4.875-3.49,0.192-0.131,0.536,0.028,0.752-0.08,0.325-0.162,0.512-0.549,0.835-0.734,0.348-0.2,0.59,0.09,0.783,0.37-0.646,0.349-0.65,1.306-1.232,1.508-0.775,0.268-1.336,0.781-2.01,1.228-0.292,0.193-0.951-0.055-1.055,0.124-0.598,1.028-1.782,1.466-2.492,2.349z"/>
  </g>
  <g id="g526" fill="#000">
   <path id="path528" d="m2.2-58s-9.238-2.872-20.4,22.8c0,0-2.4,5.2-4.8,7.2s-13.6,5.6-15.6,9.6l-10.4,16s14.8-16,18-18.4c0,0,8-8.4,4.8-1.6,0,0-14,10.8-12.8,20,0,0-5.6,14.4-6.4,16.4,0,0,16-32,18.4-33.2s3.6-1.2,2.4,2.4-1.6,20-4.4,22c0,0,8-20.4,7.2-23.6,0,0,3.2-3.6,5.6,1.6l-1.2,16,4.4,12s-2.4-11.2-0.8-26.8c0,0-2-10.4,2-4.8s13.6,11.6,13.6,16.4c0,0-5.2-17.6-14.4-22.4l-4,6-1.2-2s-3.6-0.8,0.8-7.6,4-7.6,4-7.6,6.4,7.2,8,7.2c0,0,13.2-7.6,14.4,16.8,0,0,6.8-14.4-2.4-21.2,0,0-14.8-2-13.6-7.2l7.2-12.4c3.6-5.2,2-2.4,2-2.4z"/>
  </g>
  <g id="g530" fill="#000">
   <path id="path532" d="m-17.8-41.6-16,5.2-7.2,9.6s17.2-10,21.2-11.2,2-3.6,2-3.6z"/>
  </g>
  <g id="g534" fill="#000">
   <path id="path536" d="m-57.8-35.2s-2,1.2-2.4,4-2.8,3.2-2,6,2.8,5.2,2.8,1.2,1.6-6,2.4-7.2,2.4-5.6-0.8-4z"/>
  </g>
  <g id="g538" fill="#000">
   <path id="path540" d="m-66.6,26s-8.4-4-11.6-7.6-2.748,1.566-7.6,1.2c-5.847-0.441-4.8-16.4-4.8-16.4l-4,7.6s-1.2,14.4,6.8,12c3.907-1.172,5.2,0.4,3.6,1.2s5.6,1.2,2.8,2.8,11.6-3.6,9.2,6.8l5.6-7.6z"/>
  </g>
  <g id="g542" fill="#000">
   <path id="path544" d="m-79.2,40.4s-15.4,4.4-19-5.2c0,0-4.8,2.4-2.6,5.4s3.4,3.4,3.4,3.4,5.4,1.2,4.8,2-3,4.2-3,4.2,10.2-6,16.4-9.8z"/>
  </g>
  <g id="g546" fill="#FFF">
   <path id="path548" d="m149.2,118.6c-0.43,2.14-2.1,2.94-4,3.6-1.92-0.96-4.51-4.06-6.4-2-0.47-0.48-1.25-0.54-1.6-1.2-0.46-0.9-0.19-1.94-0.53-2.74-0.55-1.28-1.25-2.64-1.07-4.06,1.81-0.71,2.4-2.62,1.93-4.38-0.07-0.26-0.5-0.45-0.3-0.8,0.19-0.33,0.5-0.55,0.77-0.82-0.13,0.14-0.28,0.37-0.39,0.35-0.61-0.11-0.49-0.75-0.36-1.13,0.59-1.75,2.6-2.01,3.95-0.82,0.26-0.56,0.77-0.37,1.2-0.4-0.05-0.58,0.36-1.11,0.56-1.53,0.52-1.09,2.14,0.01,2.94-0.6,1.08-0.83,2.14-1.52,3.22-0.92,1.81,1.01,3.52,2.22,4.72,3.97,0.57,0.83,0.81,2.11,0.75,3.07-0.04,0.65-1.42,0.29-1.76,1.22-0.65,1.75,1.19,2.27,1.94,3.61,0.2,0.35-0.06,0.65-0.38,0.75-0.41,0.13-1.19-0.06-1.06,0.39,0.98,3.19-1.78,3.87-4.13,4.44z"/>
  </g>
  <g id="g550" fill="#FFF">
   <path id="path552" d="m139.6,138.2c-0.01-1.74-1.61-3.49-0.4-5.2,0.14,0.14,0.27,0.36,0.4,0.36,0.14,0,0.27-0.22,0.4-0.36,1.5,2.22,5.15,3.14,5.01,5.99-0.03,0.45-1.11,1.37-0.21,2.01-1.81,1.35-1.87,3.72-2.8,5.6-1.24-0.28-2.45-0.65-3.6-1.2,0.35-1.48,0.24-3.17,1.06-4.49,0.43-0.7,0.14-1.78,0.14-2.71z"/>
  </g>
  <g id="g554" fill="#CCC">
   <path id="path556" d="m-26.6,129.2s-16.858,10.14-2.8-5.2c8.8-9.6,18.8-15.2,18.8-15.2s10.4-4.4,14-5.6,18.8-6.4,22-6.8,12.8-4.4,19.6-0.4,14.8,8.4,14.8,8.4-16.4-8.4-20-6-10.8,2-16.8,5.2c0,0-14.8,4.4-18,6.4s-13.6,13.6-15.2,12.8,0.4-1.2,1.6-4-0.8-4.4-8.8,2-9.2,8.4-9.2,8.4z"/>
  </g>
  <g id="g558" fill="#000">
   <path id="path560" d="m-19.195,123.23s1.41-13.04,9.888-11.37c0,0,8.226-4.17,10.948-6.14,0,0,8.139-1.7,9.449-2.32,18.479-8.698,33.198-4.179,33.745-5.299,0.546-1.119,20.171,5.999,23.78,10.079,0.391,0.45-10.231-5.59-19.929-7.48-8.273-1.617-29.875,0.24-40.781,5.78-2.973,1.51-11.918,7.29-14.449,7.18s-12.651,9.57-12.651,9.57z"/>
  </g>
  <g id="g562" fill="#CCC">
   <path id="path564" d="m-23,148.8s-15.2-2.4,1.6-4c0,0,18-2,22-7.2,0,0,13.6-9.2,16.4-9.6s32.8-7.6,33.2-10,6-2.4,7.6-1.6,0.8,2-2,2.8-34,17.2-40.4,18.4-18,8.8-22.8,10-15.6,1.2-15.6,1.2z"/>
  </g>
  <g id="g566" fill="#000">
   <path id="path568" d="m-3.48,141.4s-8.582-0.83,0.019-1.64c0,0,8.816-3.43,10.864-6.09,0,0,6.964-4.71,8.397-4.92,1.434-0.2,15.394-3.89,15.599-5.12s34.271-13.81,38.691-10.62c2.911,2.1-6.99,0.43-16.624,4.84-1.355,0.62-35.208,15.2-38.485,15.82-3.277,0.61-9.216,4.5-11.674,5.12-2.457,0.61-6.787,2.61-6.787,2.61z"/>
  </g>
  <g id="g570" fill="#000">
   <path id="path572" d="m-11.4,143.6s5.2-0.4,4,1.2-3.6,0.8-3.6,0.8l-0.4-2z"/>
  </g>
  <g id="g574" fill="#000">
   <path id="path576" d="m-18.6,145.2s5.2-0.4,4,1.2-3.6,0.8-3.6,0.8l-0.4-2z"/>
  </g>
  <g id="g578" fill="#000">
   <path id="path580" d="m-29,146.8s5.2-0.4,4,1.2-3.6,0.8-3.6,0.8l-0.4-2z"/>
  </g>
  <g id="g582" fill="#000">
   <path id="path584" d="m-36.6,147.6s5.2-0.4,4,1.2-3.6,0.8-3.6,0.8l-0.4-2z"/>
  </g>
  <g id="g586" fill="#000">
   <path id="path588" d="m1.8,108,3.2,1.6c-1.2,1.6-4.4,1.2-4.4,1.2l1.2-2.8z"/>
  </g>
  <g id="g590" fill="#000">
   <path id="path592" d="m-8.2,113.6s6.506-2.14,4,1.2c-1.2,1.6-3.6,0.8-3.6,0.8l-0.4-2z"/>
  </g>
  <g id="g594" fill="#000">
   <path id="path596" d="m-19.4,118.4s5.2-0.4,4,1.2-3.6,0.8-3.6,0.8l-0.4-2z"/>
  </g>
  <g id="g598" fill="#000">
   <path id="path600" d="m-27,124.4s5.2-0.4,4,1.2-3.6,0.8-3.6,0.8l-0.4-2z"/>
  </g>
  <g id="g602" fill="#000">
   <path id="path604" d="m-33.8,129.2s5.2-0.4,4,1.2-3.6,0.8-3.6,0.8l-0.4-2z"/>
  </g>
  <g id="g606" fill="#000">
   <path id="path608" d="m5.282,135.6s6.921-0.53,5.324,1.6c-1.597,2.12-4.792,1.06-4.792,1.06l-0.532-2.66z"/>
  </g>
  <g id="g610" fill="#000">
   <path id="path612" d="m15.682,130.8s6.921-0.53,5.324,1.6c-1.597,2.12-4.792,1.06-4.792,1.06l-0.532-2.66z"/>
  </g>
  <g id="g614" fill="#000">
   <path id="path616" d="m26.482,126.4s6.921-0.53,5.324,1.6c-1.597,2.12-4.792,1.06-4.792,1.06l-0.532-2.66z"/>
  </g>
  <g id="g618" fill="#000">
   <path id="path620" d="m36.882,121.6s6.921-0.53,5.324,1.6c-1.597,2.12-4.792,1.06-4.792,1.06l-0.532-2.66z"/>
  </g>
  <g id="g622" fill="#000">
   <path id="path624" d="m9.282,103.6s6.921-0.53,5.324,1.6c-1.597,2.12-5.592,1.86-5.592,1.86l0.268-3.46z"/>
  </g>
  <g id="g626" fill="#000">
   <path id="path628" d="m19.282,100.4s6.921-0.534,5.324,1.6c-1.597,2.12-5.992,1.86-5.992,1.86l0.668-3.46z"/>
  </g>
  <g id="g630" fill="#000">
   <path id="path632" d="m-3.4,140.4s5.2-0.4,4,1.2-3.6,0.8-3.6,0.8l-0.4-2z"/>
  </g>
  <g id="g634" fill="#992600">
   <path id="path636" d="m-76.6,41.2s-4.4,8.8-4.8,12c0,0,0.8-8.8,2-10.8s2.8-1.2,2.8-1.2z"/>
  </g>
  <g id="g638" fill="#992600">
   <path id="path640" d="m-95,55.2s-3.2,14.4-2.8,17.2c0,0-1.2-11.6-0.8-12.8s3.6-4.4,3.6-4.4z"/>
  </g>
  <g id="g642" fill="#CCC">
   <path id="path644" d="m-74.2-19.4-0.2,3.2-2.2,0.2s14.2,12.6,14.8,20.2c0,0,0.8-8.2-12.4-23.6z"/>
  </g>
  <g id="g646" fill="#000">
   <path id="path648" d="m-70.216-18.135c-0.431-0.416-0.212-1.161-0.62-1.421-0.809-0.516,1.298-0.573,1.07-1.289-0.383-1.206-0.196-1.227-0.318-2.503-0.057-0.598,0.531-2.138,0.916-2.578,1.446-1.652,0.122-4.584,1.762-6.135,0.304-0.289,0.68-0.841,0.965-1.259,0.659-0.963,1.843-1.451,2.793-2.279,0.318-0.276,0.117-1.103,0.686-1.011,0.714,0.115,1.955-0.015,1.91,0.826-0.113,2.12-1.442,3.84-2.722,5.508,0.451,0.704-0.007,1.339-0.291,1.896-1.335,2.62-1.146,5.461-1.32,8.301-0.005,0.085-0.312,0.163-0.304,0.216,0.353,2.335,0.937,4.534,1.816,6.763,0.366,0.93,0.837,1.825,0.987,2.752,0.111,0.686,0.214,1.519-0.194,2.224,2.035,2.89,0.726,5.541,1.895,9.072,0.207,0.625,1.899,2.539,1.436,2.378-2.513-0.871-2.625-1.269-2.802-2.022-0.146-0.623-0.476-2-0.713-2.602-0.064-0.164-0.235-2.048-0.313-2.17-1.513-2.382-0.155-2.206-1.525-4.564-1.428-0.68-2.394-1.784-3.517-2.946-0.198-0.204,0.945-0.928,0.764-1.141-1.092-1.289-2.245-2.056-1.909-3.549,0.155-0.69,0.292-1.747-0.452-2.467z"/>
  </g>
  <g id="g650" fill="#000">
   <path id="path652" d="m-73.8-16.4s0.4,6.8,2.8,8.4,1.2,0.8-2-0.4-2-2-2-2-2.8,0.4-0.4,2.4,6,4.4,4.4,4.4-9.2-4-9.2-6.8-1-6.9-1-6.9,1.1-0.8,5.9-0.7c0,0,1.4,0.7,1.5,1.6z"/>
  </g>
  <g id="g654" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path656" d="m-74.6,2.2s-8.52-2.791-27,0.6c0,0,9.031-2.078,27.8,0.2,10.3,1.25-0.8-0.8-0.8-0.8z"/>
  </g>
  <g id="g658" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path660" d="m-72.502,2.129s-8.246-3.518-26.951-1.737c0,0,9.178-1.289,27.679,2.603,10.154,2.136-0.728-0.866-0.728-0.866z"/>
  </g>
  <g id="g662" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path664" d="m-70.714,2.222s-7.962-4.121-26.747-3.736c0,0,9.248-0.604,27.409,4.654,9.966,2.885-0.662-0.918-0.662-0.918z"/>
  </g>
  <g id="g666" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path668" d="m-69.444,2.445s-6.824-4.307-23.698-5.405c0,0,8.339,0.17,24.22,6.279,8.716,3.353-0.522-0.874-0.522-0.874z"/>
  </g>
  <g id="g670" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path672" d="m45.84,12.961s-0.93,0.644-0.716-0.537c0.215-1.181,28.423-14.351,32.037-14.101,0,0-30.248,13.206-31.321,14.638z"/>
  </g>
  <g id="g674" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path676" d="m42.446,13.6s-0.876,0.715-0.755-0.479,27.208-16.539,30.83-16.573c0,0-29.117,15.541-30.075,17.052z"/>
  </g>
  <g id="g678" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path680" d="m39.16,14.975s-0.828,0.772-0.786-0.428c0.042-1.199,19.859-16.696,29.671-18.57,0,0-18.03,8.127-28.885,18.998z"/>
  </g>
  <g id="g682" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path684" d="m36.284,16.838s-0.745,0.694-0.707-0.385c0.038-1.08,17.872-15.027,26.703-16.713,0,0-16.226,7.314-25.996,17.098z"/>
  </g>
  <g id="g686" fill="#CCC">
   <path id="path688" d="m4.6,164.8s-15.2-2.4,1.6-4c0,0,18-2,22-7.2,0,0,13.6-9.2,16.4-9.6s19.2-4,19.6-6.4,6.4-4.8,8-4,1.6,10-1.2,10.8-21.6,8-28,9.2-18,8.8-22.8,10-15.6,1.2-15.6,1.2z"/>
  </g>
  <g id="g690" fill="#000">
   <path id="path692" d="m77.6,127.4s-3,1.6-4.2,4.2c0,0-6.4,10.6-20.6,13.8,0,0-23,9-30.8,11,0,0-13.4,5-20.8,4.2,0,0-7,0.2-0.8,1.8,0,0,20.2-2,23.6-3.8,0,0,15.6-5.2,18.6-7.8s21.2-7.6,23.4-9.6,12-10.4,11.6-13.8z"/>
  </g>
  <g id="g694" fill="#000">
   <path id="path696" d="m18.882,158.91s5.229-0.23,4.076,1.32-3.601,0.68-3.601,0.68l-0.475-2z"/>
  </g>
  <g id="g698" fill="#000">
   <path id="path700" d="m11.68,160.26s5.228-0.22,4.076,1.33c-1.153,1.55-3.601,0.67-3.601,0.67l-0.475-2z"/>
  </g>
  <g id="g702" fill="#000">
   <path id="path704" d="m1.251,161.51s5.229-0.23,4.076,1.32-3.601,0.68-3.601,0.68l-0.475-2z"/>
  </g>
  <g id="g706" fill="#000">
   <path id="path708" d="m-6.383,162.06s5.229-0.23,4.076,1.32-3.601,0.67-3.601,0.67l-0.475-1.99z"/>
  </g>
  <g id="g710" fill="#000">
   <path id="path712" d="m35.415,151.51s6.96-0.3,5.425,1.76c-1.534,2.07-4.793,0.9-4.793,0.9l-0.632-2.66z"/>
  </g>
  <g id="g714" fill="#000">
   <path id="path716" d="m45.73,147.09s5.959-3.3,5.425,1.76c-0.27,2.55-4.793,0.9-4.793,0.9l-0.632-2.66z"/>
  </g>
  <g id="g718" fill="#000">
   <path id="path720" d="m54.862,144.27s7.159-3.7,5.425,1.77c-0.778,2.44-4.794,0.9-4.794,0.9l-0.631-2.67z"/>
  </g>
  <g id="g722" fill="#000">
   <path id="path724" d="m64.376,139.45s4.359-4.9,5.425,1.76c0.406,2.54-4.793,0.9-4.793,0.9l-0.632-2.66z"/>
  </g>
  <g id="g726" fill="#000">
   <path id="path728" d="m26.834,156s5.228-0.23,4.076,1.32c-1.153,1.55-3.602,0.68-3.602,0.68l-0.474-2z"/>
  </g>
  <g id="g730" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path732" d="m62.434,34.603s-0.726,0.665-0.727-0.406c0-1.07,17.484-14.334,26.327-15.718,0,0-16.099,6.729-25.6,16.124z"/>
  </g>
  <g id="g734" fill="#000">
   <path id="path736" d="m65.4,98.4s22.001,22.4,31.201,26c0,0,9.199,11.2,5.199,37.2,0,0-3.199,7.6-6.399-13.2,0,0,3.2-25.2-8-9.2,0,0-8.401-9.9-2.001-9.6,0,0,3.201,2,3.601,0.4s-7.601-15.2-24.801-29.6,1.2-2,1.2-2z"/>
  </g>
  <g id="g738" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path740" d="m7,137.2s-0.2-1.8,1.6-1,96,7,127.6,31c0,0-45.199-23.2-129.2-30z"/>
  </g>
  <g id="g742" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path744" d="m17.4,132.8s-0.2-1.8,1.6-1,138.4-0.2,162,32.2c0,0-22-25.2-163.6-31.2z"/>
  </g>
  <g id="g746" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path748" d="m29,128.8s-0.2-1.8,1.6-1,175.2-12.2,198.8,20.2c0,0-9.6-25.6-200.4-19.2z"/>
  </g>
  <g id="g750" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path752" d="m39,124s-0.2-1.8,1.6-1,124-37.8,147.6-5.4c0,0-13.4-24.6-149.2,6.4z"/>
  </g>
  <g id="g754" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path756" d="m-19,146.8s-0.2-1.8,1.6-1,19.6,3,21.6,41.8c0,0-7.2-42-23.2-40.8z"/>
  </g>
  <g id="g758" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path760" d="m-27.8,148.4s-0.2-1.8,1.6-1,16-3.8,13.2,35c0,0,1.2-35.2-14.8-34z"/>
  </g>
  <g id="g762" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path764" d="m-35.8,148.8s-0.2-1.8,1.6-1,17.2,1.4,4.8,23.8c0,0,9.6-24-6.4-22.8z"/>
  </g>
  <g id="g766" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path768" d="m11.526,104.46s-0.444,2,1.105,0.79c16.068-12.628,48.51-71.53,104.2-77.164,0,0-38.312-12.11-105.3,76.374z"/>
  </g>
  <g id="g770" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path772" d="m22.726,102.66s-1.363-1.19,0.505-1.81c1.868-0.63,114.31-73.13,153.6-65.164,0,0-27.11-7.51-154.1,66.974z"/>
  </g>
  <g id="g774" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path776" d="m1.885,108.77s-0.509,1.6,1.202,0.62c8.975-5.12,12.59-62.331,56.167-63.586,0,0-32.411-14.714-57.369,62.966z"/>
  </g>
  <g id="g778" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path780" d="m-18.038,119.79s-1.077,1.29,0.876,1.03c10.246-1.33,31.651-42.598,76.09-37.519,0,0-31.966-14.346-76.966,36.489z"/>
  </g>
  <g id="g782" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path784" d="m-6.8,113.67s-0.811,1.47,1.058,0.84c9.799-3.27,22.883-47.885,67.471-51.432,0,0-34.126-7.943-68.529,50.592z"/>
  </g>
  <g id="g786" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path788" d="m-25.078,124.91s-0.873,1.04,0.709,0.84c8.299-1.08,25.637-34.51,61.633-30.396,0,0-25.893-11.62-62.342,29.556z"/>
  </g>
  <g id="g790" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path792" d="m-32.677,130.82s-1.005,1.05,0.586,0.93c4.168-0.31,34.806-33.39,53.274-17.89,0,0-12.015-18.721-53.86,16.96z"/>
  </g>
  <g id="g794" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path796" d="m36.855,98.898s-1.201-1.355,0.731-1.74c1.932-0.384,122.63-58.097,160.59-45.231,0,0-25.94-10.874-161.32,46.971z"/>
  </g>
  <g id="g798" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path800" d="m3.4,163.2s-0.2-1.8,1.6-1,17.2,1.4,4.8,23.8c0,0,9.6-24-6.4-22.8z"/>
  </g>
  <g id="g802" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path804" d="m13.8,161.6s-0.2-1.8,1.6-1,19.6,3,21.6,41.8c0,0-7.2-42-23.2-40.8z"/>
  </g>
  <g id="g806" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path808" d="m20.6,160s-0.2-1.8,1.6-1,26.4,4.2,50,36.6c0,0-35.6-36.8-51.6-35.6z"/>
  </g>
  <g id="g810" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path812" d="m28.225,157.97s-0.437-1.76,1.453-1.2c1.89,0.55,22.324-1.35,60.421,32.83,0,0-46.175-34.94-61.874-31.63z"/>
  </g>
  <g id="g814" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path816" d="m38.625,153.57s-0.437-1.76,1.453-1.2c1.89,0.55,36.724,5.05,88.422,40.03,0,0-74.176-42.14-89.875-38.83z"/>
  </g>
  <g id="g818" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path820" d="m-1.8,142s-0.2-1.8,1.6-1,55.2,3.4,85.6,30.2c0,0-34.901-24.77-87.2-29.2z"/>
  </g>
  <g id="g822" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path824" d="m-11.8,146s-0.2-1.8,1.6-1,26.4,4.2,50,36.6c0,0-35.6-36.8-51.6-35.6z"/>
  </g>
  <g id="g826" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path828" d="m49.503,148.96s-0.565-1.72,1.361-1.3c1.926,0.41,36.996,2.34,91.116,33.44,0,0-77.663-34.4-92.477-32.14z"/>
  </g>
  <g id="g830" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path832" d="m57.903,146.56s-0.565-1.72,1.361-1.3c1.926,0.41,36.996,2.34,91.116,33.44,0,0-77.063-34.8-92.477-32.14z"/>
  </g>
  <g id="g834" stroke-width="0.1" stroke="#000" fill="#FFF">
   <path id="path836" d="m67.503,141.56s-0.565-1.72,1.361-1.3c1.926,0.41,44.996,4.74,134.72,39.04,0,0-120.66-40.4-136.08-37.74z"/>
  </g>
  <g id="g838" fill="#000">
   <path id="path840" d="m-43.8,148.4s5.2-0.4,4,1.2-3.6,0.8-3.6,0.8l-0.4-2z"/>
  </g>
  <g id="g842" fill="#000">
   <path id="path844" d="m-13,162.4s5.2-0.4,4,1.2-3.6,0.8-3.6,0.8l-0.4-2z"/>
  </g>
  <g id="g846" fill="#000">
   <path id="path848" d="m-21.8,162s5.2-0.4,4,1.2-3.6,0.8-3.6,0.8l-0.4-2z"/>
  </g>
  <g id="g850" fill="#000">
   <path id="path852" d="m-117.17,150.18s5.05,1.32,3.39,2.44-3.67-0.42-3.67-0.42l0.28-2.02z"/>
  </g>
  <g id="g854" fill="#000">
   <path id="path856" d="m-115.17,140.58s5.05,1.32,3.39,2.44-3.67-0.42-3.67-0.42l0.28-2.02z"/>
  </g>
  <g id="g858" fill="#000">
   <path id="path860" d="m-122.37,136.18s5.05,1.32,3.39,2.44-3.67-0.42-3.67-0.42l0.28-2.02z"/>
  </g>
  <g id="g862" fill="#CCC">
   <path id="path864" d="m-42.6,211.2-5.6,2c-2,0-13.2,3.6-18.8,13.6,0,0,12.4-9.6,24.4-15.6z"/>
  </g>
  <g id="g866" fill="#CCC">
   <path id="path868" d="m45.116,303.85c0.141,0.25,0.196,0.67,0.488,0.69,0.658,0.04,1.891,0.34,1.766-0.29-0.848-4.31-1.722-9.25-5.855-11.05-0.639-0.28-2.081,0.13-2.155,1.02-0.127,1.52-0.244,2.87,0.065,4.33,0.3,1.43,2.458,1.43,3.375,0.05,0.936,1.67,1.368,3.52,2.316,5.25z"/>
  </g>
  <g id="g870" fill="#CCC">
   <path id="path872" d="m34.038,308.58c0.748,1.41,0.621,3.27,2.036,3.84,0.74,0.29,2.59-0.68,2.172-1.76-0.802-2.06-1.19-4.3-2.579-6.11-0.2-0.26,0.04-0.79-0.12-1.12-0.594-1.22-1.739-1.96-3.147-1.63-1.115,2.2,0.033,4.33,1.555,6.04,0.136,0.15-0.03,0.53,0.083,0.74z"/>
  </g>
  <g id="g874" fill="#CCC">
   <path id="path876" d="m-5.564,303.39c-0.108-0.38-0.146-0.84,0.019-1.16,0.531-1.03,1.324-2.15,0.987-3.18-0.348-1.05-1.464-0.87-2.114-0.3-1.135,0.99-1.184,2.82-1.875,4.18-0.196,0.38-0.145,0.96-0.586,1.35-0.474,0.42-0.914,1.94-0.818,2.51,0.053,0.32-0.13,10.22,0.092,9.96,0.619-0.73,3.669-10.47,3.738-11.36,0.057-0.73,0.789-1.19,0.557-2z"/>
  </g>
  <g id="g878" fill="#CCC">
   <path id="path880" d="m-31.202,296.6c2.634-2.5,5.424-5.46,4.982-9.17-0.116-0.98-1.891-0.45-2.078,0.39-0.802,3.63-2.841,6.29-5.409,8.68-2.196,2.05-4.058,8.39-4.293,8.9,3.697-5.26,5.954-8,6.798-8.8z"/>
  </g>
  <g id="g882" fill="#CCC">
   <path id="path884" d="m-44.776,290.64c0.523-0.38,0.221-0.87,0.438-1.2,0.953-1.46,2.254-2.7,2.272-4.44,0.003-0.28-0.375-0.59-0.71-0.36-0.277,0.18-0.619,0.31-0.727,0.44-2.03,2.45-3.43,5.12-4.873,7.93-0.183,0.36-1.327,4.85-1.014,4.96,0.239,0.09,1.959-4.09,2.169-4.21,1.263-0.68,1.275-2.3,2.445-3.12z"/>
  </g>
  <g id="g886" fill="#CCC">
   <path id="path888" d="m-28.043,310.18c0.444-0.87,2.02-2.07,1.907-2.96-0.118-0.93,0.35-2.37-0.562-1.68-1.257,0.94-4.706,2.29-4.976,8.1-0.026,0.57,2.948-2.12,3.631-3.46z"/>
  </g>
  <g id="g890" fill="#CCC">
   <path id="path892" d="m-13.6,293c0.4-0.67,1.108-0.19,1.567-0.46,0.648-0.37,1.259-0.93,1.551-1.58,0.97-2.14,2.739-3.96,2.882-6.36-1.491-1.4-2.17,0.64-2.8,1.6-1.323-1.65-2.322,0.23-3.622,0.75-0.07,0.03-0.283-0.32-0.358-0.29-1.177,0.44-1.857,1.52-2.855,2.3-0.171,0.13-0.576-0.05-0.723,0.09-0.652,0.6-1.625,0.93-1.905,1.61-1.11,2.7-4.25,4.8-6.137,12.34,0.381,0.91,4.512-6.64,4.999-7.34,0.836-1.2,0.954,1.66,2.23,1,0.051-0.03,0.237,0.21,0.371,0.34,0.194-0.28,0.412-0.51,0.8-0.4,0-0.4-0.134-0.96,0.067-1.11,1.237-0.98,1.153-2.05,1.933-3.29,0.458,0.79,1.519,0.07,2,0.8z"/>
  </g>
  <g id="g894" fill="#CCC">
   <path id="path896" d="m46.2,347.4s7.4-20.4,3-31.6c0,0,11.4,21.6,6.8,32.8,0,0-0.4-10.4-4.4-15.4,0,0-4,12.8-5.4,14.2z"/>
  </g>
  <g id="g898" fill="#CCC">
   <path id="path900" d="m31.4,344.8s5.4-8.8-2.6-27.2c0,0-0.8,20.4-7.6,31.4,0,0,14.2-20.2,10.2-4.2z"/>
  </g>
  <g id="g902" fill="#CCC">
   <path id="path904" d="m21.4,342.8s-0.2-20,0.2-23c0,0-3.8,16.6-14,26.2,0,0,14.4-12,13.8-3.2z"/>
  </g>
  <g id="g906" fill="#CCC">
   <path id="path908" d="m11.8,310.8s6,13.6-4,32c0,0,6.4-12.2,1.6-19.2,0,0,2.6-3.4,2.4-12.8z"/>
  </g>
  <g id="g910" fill="#CCC">
   <path id="path912" d="m-7.4,342.4s-1-15.6,0.8-17.8c0,0,0.2-6.4-0.2-7.4,0,0,4-6.2,4.2,1.2,0,0,1.4,7.8,4.2,12.4,0,0,3.6,5.4,3.4,11.8,0,0-10-30.2-12.4-0.2z"/>
  </g>
  <g id="g914" fill="#CCC">
   <path id="path916" d="m-11,314.8s-6.6,10.8-8.4,29.8c0,0-1.4-6.2,2.4-20.6,0,0,4.2-15.4,6-9.2z"/>
  </g>
  <g id="g918" fill="#CCC">
   <path id="path920" d="m-32.8,334.6s5-5.4,6.4-10.4c0,0,3.6-15.8-2.8-7.2,0,0,0.2,8-8,15.4,0,0,4.8-2.4,4.4,2.2z"/>
  </g>
  <g id="g922" fill="#CCC">
   <path id="path924" d="m-38.6,329.6s3.4-17.4,4.2-18.2c0,0,1.8-3.4-1-0.2,0,0-8.8,19.2-12.8,25.8,0,0,8-9.2,9.6-7.4z"/>
  </g>
  <g id="g926" fill="#CCC">
   <path id="path928" d="m-44.4,313s11.6-22.4-10.2,3.4c0,0,11-9.8,10.2-3.4z"/>
  </g>
  <g id="g930" fill="#CCC">
   <path id="path932" d="m-59.8,298.4s4.8-18.8,7.4-18.6l1.6,1.6s-6,9.6-5.4,19.4c0,0-0.6-9.6-3.6-2.4z"/>
  </g>
  <g id="g934" fill="#CCC">
   <path id="path936" d="m270.5,287s-12-10-14.5-13.5c0,0,13.5,18.5,13.5,25.5,0,0,2.5-7.5,1-12z"/>
  </g>
  <g id="g938" fill="#CCC">
   <path id="path940" d="m276,265s-21-15-24.5-22.5c0,0,26.5,29.5,26.5,34,0,0,0.5-9-2-11.5z"/>
  </g>
  <g id="g942" fill="#CCC">
   <path id="path944" d="m293,111s-12-8-13.5-6c0,0,10.5,6.5,13,15,0,0-1.5-9,0.5-9z"/>
  </g>
  <g id="g946" fill="#CCC">
   <path id="path948" d="m301.5,191.5-17.5-12s19,17,19.5,21l-2-9z"/>
  </g>
  <g id="g950" stroke="#000">
   <path id="path952" d="m-89.25,169,22,4.75"/>
  </g>
  <g id="g954" stroke="#000">
   <path id="path956" d="m-39,331s-0.5-3.5-9.5,7"/>
  </g>
  <g id="g958" stroke="#000">
   <path id="path960" d="m-33.5,336s2-6.5-4.5-2"/>
  </g>
  <g id="g962" stroke="#000">
   <path id="path964" d="m20.5,344.5s1.5-11-10,2"/>
  </g>
 </g>
</svg>''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/use
const String simpleUseCircles = '''
<svg viewBox="0 0 30 10"
    xmlns="http://www.w3.org/2000/svg">
    <circle id="myCircle" cx="5" cy="5" r="4"/>
    <use href="#myCircle" x="10" fill="blue"/>
    <use href="#myCircle" x="20" fill="white" stroke="blue"/>
</svg>
''';

const String simpleUseCirclesOoO = '''
<svg viewBox="0 0 30 10"
    xmlns="http://www.w3.org/2000/svg">
    <use href="#myCircle" x="20" fill="white" stroke="blue"/>
    <circle id="myCircle" cx="5" cy="5" r="4"/>
    <use href="#myCircle" x="10" fill="blue"/>
</svg>
''';

const String simpleUseCirclesWithoutHref = '''
<svg viewBox="0 0 30 10"
    xmlns="http://www.w3.org/2000/svg">
    <circle id="myCircle" cx="5" cy="5" r="4"/>
    <use x="10" fill="blue"/>
    <use x="20" fill="white" stroke="blue"/>
</svg>
''';

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/text
const String basicText = '''
<svg viewBox="0 0 240 80" xmlns="http://www.w3.org/2000/svg">
  <text x="20" y="35" class="small">My</text>
  <text x="40" y="35" class="heavy">cat</text>
  <text x="55" y="55" class="small">is</text>
  <text x="65" y="55" class="Rrrrr">Grumpy!</text>
</svg>
''';

const String blendAndMask = '''
<svg xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100">
  <defs>
    <linearGradient x1="46.9782516%" y1="60.9121966%" x2="60.4227947%" y2="90.6839734%" id="linearGradient-3">
      <stop stop-color="white" offset="0%"/>
      <stop stop-color="blue" offset="100%"/>
    </linearGradient>
  </defs>
  <mask id="mask-2" fill="white">
    <circle cx="50" cy="50" r="40"  fill="url(#linearGradient-3)" opacity="0.599190848" />
  </mask>
  <circle fill="lightblue" cx="50" cy="50" r="50" />
  <circle cx="50" cy="50" r="50"  fill="url(#linearGradient-3)" opacity="0.599190848" style="mix-blend-mode: multiply;" mask="url(#mask-2)"/>
</svg>
''';

const String outOfOrderGradientDef = '''
<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" viewBox="0 0 20 20">
    <path fill="url(#paint0_linear)" d="M10 20c5.523 0 10-4.477 10-10S15.523 0 10 0 0 4.477 0 10s4.477 10 10 10z"/>
    <defs>
        <linearGradient id="paint0_linear" x1="10" x2="10" y1="0" y2="19.852" gradientUnits="userSpaceOnUse">
            <stop stop-color="blue"/>
            <stop offset="1" stop-color="yellow"/>
        </linearGradient>
    </defs>
</svg>
''';

const String xlinkGradient = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 94.4 94.4">
  <defs>
    <linearGradient id="a">
      <stop offset="0" stop-color="#0f12cb"/>
      <stop offset="1" stop-color="#fded3a"/>
    </linearGradient>
    <linearGradient id="b" x1="-157.994" x2="-9.071" y1="122.753" y2="122.753" gradientUnits="userSpaceOnUse" xlink:href="#a"/>
  </defs>
  <circle cx="-83.533" cy="122.753" r="74.461" fill="url(#b)" transform="matrix(.63388 0 0 .63388 100.15 -30.611)"/>
</svg>
''';

const String xlinkGradientOoO = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 94.4 94.4">
  <defs>
    <linearGradient id="b" x1="-157.994" x2="-9.071" y1="122.753" y2="122.753" gradientUnits="userSpaceOnUse" xlink:href="#a"/>
    <linearGradient id="a">
      <stop offset="0" stop-color="#0f12cb"/>
      <stop offset="1" stop-color="#fded3a"/>
    </linearGradient>
  </defs>
  <circle cx="-83.533" cy="122.753" r="74.461" fill="url(#b)" transform="matrix(.63388 0 0 .63388 100.15 -30.611)"/>
</svg>
''';

const String linearGradientThatInheritsUnitMode = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 412 412">
  <defs>
    <linearGradient id="a" x1="236.702" y1="9.99" x2="337.966" y2="241.771" gradientUnits="userSpaceOnUse">
      <stop offset="0" stop-color="#fff" />
      <stop offset=".229" stop-color="#c2c3c3" stop-opacity=".728" />
      <stop offset=".508" stop-color="#7d7e80" stop-opacity=".419" />
      <stop offset=".739" stop-color="#4b4c4e" stop-opacity=".193" />
      <stop offset=".909" stop-color="#2c2d30" stop-opacity=".053" />
      <stop offset="1" stop-color="#202124" stop-opacity="0" />
    </linearGradient>
    <linearGradient id="d" x1="0" y1="50.243" x2="0" y2="330.779" xlink:href="#a" />
  </defs>
  <path d="M216.091 211.2H412v-84.88h-23.56" fill="url(#a)" />
  <path d="M412 256.565v155.9h-824v-99.456l334.7-90.165a677.363 677.363 0 01183.33-23.69c35.17.36 73.37 3.551 110.06 12.051z" fill="url(#d)" />
</svg>
''';

const String xformObbGradient = '''
<svg viewBox="0 0 667 667" fill="none" xmlns="http://www.w3.org/2000/svg">
    <defs>
      <linearGradient id="paint1_linear" x1="0%" y1="0%" x2="50%" y2="50%" gradientTransform="translate(0.4 0.7)">
        <stop stop-color="blue" stop-opacity="0.5"/>
        <stop offset="1" stop-color="red" stop-opacity="0.1"/>
      </linearGradient>
    </defs>
    <rect x="300" y="0" width="500" height="400" transform="translate(0 100) rotate(45, 250, 250)" fill="url(#paint1_linear)"/>
</svg>
''';

const String xformUsosRadial = '''
<svg viewBox="0 0 667 667" fill="none"
    xmlns="http://www.w3.org/2000/svg">
    <defs>
        <radialGradient id="paint0_radial" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(901 787) rotate(39.029) scale(557.396)">
            <stop stop-color="#47E9FF" stop-opacity="0.8"/>
            <stop offset="1" stop-color="#414CBE" stop-opacity="0"/>
        </radialGradient>
    </defs>
    <rect x="667" y="667" width="667" height="667" transform="rotate(180 667 667)" fill="url(#paint0_radial)"/>
</svg>
''';

const String focalRadial = '''
<svg viewBox="0 0 150 150"  xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient id="radial"
      cx="50%" cy="50%" fx="50%" fy="15%" r="50%">
      <stop offset="0%" style="stop-color: red;"/>
      <stop offset="50%" style="stop-color: green;"/>
      <stop offset="100%" style="stop-color: blue;"/>
    </radialGradient>

    </defs>
    <rect x="10" y="10" width="120" height="120"
      style="fill: url(#radial); stroke: black;"/>
</svg>
''';

/// A constructed SVG with a bunch of missing references.
const String missingRefs = '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 120 120">
  <rect x="5" y="5" width="100" height="100" mask="url(#myMask)" clip="url(#myClip)" fill="red" stroke="url(#gradient)"/>
  <use xlink:href="url(#nope)" />
</svg>
''';

/// An SVG string to test if path node and parent node count stays the same for [MaskingOptimizer] and [ClippingOptimizer]
const String pathAndParent =
    ''' <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 64 64" fill="none"><mask id="a" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="64" height="64"><circle cx="32" cy="32" r="32" fill="#C4C4C4"/></mask><g clip-path="url(#clip0_2630_58398)" mask="url(#a)"><path d="M65.564 0H-3.041v65.807h68.605V0z" fill="#669DF6"/><path d="M69.185-14.857h-77.29v65.143h77.29v-65.143z" fill="#D2E3FC"/><path d="M21.792 2.642l-24.045.056.124 51.288 24.028-.039-.107-51.305z" fill="#FBBC04"/><path d="M1.931 10.286a1.543 1.543 0 013.086-.008v2.26a1.543 1.543 0 01-3.086.007v-2.26zm1.571 12.292a1.545 1.545 0 01-1.544-1.537l-.006-2.26a1.543 1.543 0 013.086-.006v2.26a1.545 1.545 0 01-1.536 1.543zM8.33 10.27a1.543 1.543 0 013.086-.007l.006 2.26a1.543 1.543 0 01-3.086.006l-.006-2.26zM9.9 22.563a1.546 1.546 0 01-1.545-1.534v-2.261a1.543 1.543 0 113.086-.007v2.26a1.546 1.546 0 01-1.54 1.542zm4.828-12.308a1.544 1.544 0 012.13-1.431 1.542 1.542 0 01.956 1.423v2.26a1.54 1.54 0 01-1.54 1.546 1.542 1.542 0 01-1.546-1.539v-2.26zm1.57 12.292a1.545 1.545 0 01-1.544-1.537l-.005-2.26a1.544 1.544 0 012.63-1.096 1.542 1.542 0 01.455 1.09v2.26a1.545 1.545 0 01-1.536 1.543zM1.959 27.278a1.543 1.543 0 113.086-.007v2.26a1.543 1.543 0 11-3.086.007v-2.26zM3.53 39.571a1.544 1.544 0 01-1.545-1.537l-.006-2.263a1.543 1.543 0 113.086-.008v2.261a1.545 1.545 0 01-1.536 1.547zm4.826-12.308a1.543 1.543 0 113.086-.008v2.26a1.542 1.542 0 01-3.086.007v-2.26zm1.571 12.292a1.545 1.545 0 01-1.544-1.536v-2.26a1.543 1.543 0 113.086-.007l.005 2.26a1.544 1.544 0 01-1.547 1.543zm4.828-12.308a1.542 1.542 0 113.086-.007l.006 2.26a1.543 1.543 0 11-3.086.007l-.006-2.26zm1.571 12.296a1.544 1.544 0 01-1.544-1.537v-2.26a1.543 1.543 0 013.085-.008l.006 2.26a1.546 1.546 0 01-1.547 1.545z" fill="#FDE293"/><path d="M22.783 5.54a1.077 1.077 0 001.05-1.306L22.83-.393a1.387 1.387 0 00-1.325-.978l-23.456.037a1.39 1.39 0 00-1.322.98l-.989 4.633A1.077 1.077 0 00-3.208 5.58l25.99-.042z" fill="#F9AB00"/><path d="M43.051 53.973h65.009l.046-36.144a2.921 2.921 0 00-2.924-2.924l-59.16.404a2.924 2.924 0 00-2.925 2.923l-.046 35.74z" fill="#81C995"/><path d="M62.483 15.148h3.275l-.248 7.893c-.01.057-.019.114-.035.17v.014c-.03.11-.071.216-.12.319a1.744 1.744 0 01-2.244.895 1.989 1.989 0 01-1.282-2.136l.654-7.155zm-21.512 7.023v-.013c.01-.059.029-.115.043-.167l2.138-6.838h3.174l-2.124 7.967h-.006a1.7 1.7 0 01-1.581 1.29 1.793 1.793 0 01-1.674-1.896c0-.115.01-.23.03-.343zm12.132-7.023h3.187l-1.704 8.1h-.006a1.62 1.62 0 01-1.581 1.29 1.793 1.793 0 01-1.675-1.891c.002-.077.009-.153.021-.229l-.203.836h-.006a1.703 1.703 0 01-1.582 1.289 1.792 1.792 0 01-1.668-1.897c0-.113.01-.224.03-.335l-.23.937h-.006a1.704 1.704 0 01-1.582 1.29 1.792 1.792 0 01-1.674-1.891c.001-.115.011-.23.03-.343v-.014c.009-.058.027-.114.04-.168l1.84-6.971h6.776l-.007-.003z" fill="#EA4335"/><path d="M62.483 15.126l-.718 7.885a1.715 1.715 0 01-1.7 1.53 1.654 1.654 0 01-1.852-1.667 2.581 2.581 0 010-.343l-.086.53-.02.15a1.696 1.696 0 01-1.546 1.318 1.758 1.758 0 01-1.79-1.752 2.31 2.31 0 01.01-.343v-.013c.007-.058.017-.115.03-.172l1.486-7.096 3.126-.022 3.06-.005z" fill="#EA4335"/><path d="M62.483 15.148h3.275l-.248 7.893c-.01.057-.019.114-.035.17v.014c-.03.11-.071.216-.12.319a1.745 1.745 0 01-2.244.896 1.99 1.99 0 01-1.276-2.137l.648-7.155zm-16.156 0h-3.174l-2.138 6.837c-.014.055-.032.114-.042.167v.015c-.02.113-.03.228-.031.343a1.794 1.794 0 001.675 1.89 1.7 1.7 0 001.58-1.29h.008l2.122-7.962zm6.776 0h-3.419l-1.73 6.97a1.671 1.671 0 00-.042.169v.014a2.13 2.13 0 00-.03.343 1.792 1.792 0 001.673 1.89 1.704 1.704 0 001.582-1.29h.006l1.96-8.096z" fill="#81CA95"/><path d="M49.685 15.148h-3.358l-1.839 6.97c-.014.057-.032.115-.041.169v.014a2.264 2.264 0 00-.03.343 1.792 1.792 0 001.675 1.89 1.703 1.703 0 001.581-1.29h.007l2.005-8.096z" fill="#35A853"/><path d="M59.416 15.126l-3.126.021-1.485 7.096a1.716 1.716 0 00-.031.172v.014a2.308 2.308 0 00-.01.342 1.759 1.759 0 001.79 1.752 1.696 1.696 0 001.545-1.317l.021-.151 1.296-7.93z" fill="#81CA95"/><path d="M62.483 15.126h-3.067l-1.182 7.21a1.71 1.71 0 00-.025.171v.015a2.515 2.515 0 000 .343 1.654 1.654 0 001.853 1.666 1.714 1.714 0 001.7-1.529l.721-7.876zm-6.193.022h-3.187l-1.705 6.97c-.015.057-.032.115-.043.169v.014a1.97 1.97 0 00-.03.343A1.793 1.793 0 0053 24.534a1.617 1.617 0 001.58-1.29h.008l1.702-8.096z" fill="#35A853"/><path d="M40.94 26.533h68.963v-4.221H40.941v4.22z" fill="#35A853"/><path d="M54.314 42.22l3.623.005a1.558 1.558 0 001.557-1.552l.009-5.845a1.559 1.559 0 00-1.552-1.556h-3.622a1.561 1.561 0 00-1.558 1.552l-.009 5.845a1.55 1.55 0 001.552 1.55z" fill="#A8DAB5"/><path d="M46.155 53.943l-25.27.04-.04-26.081a2.001 2.001 0 011.993-1.998l21.28-.034a2.001 2.001 0 011.997 1.992l.04 26.08z" fill="#AFCBFA"/><path d="M22.838 25.904a2.006 2.006 0 00-1.91 1.416l-2.065 7.9a3.656 3.656 0 107.314-.01l1.199-9.313-4.538.007z" fill="#669DF7"/><path d="M46.032 27.28a2.008 2.008 0 00-1.918-1.41l-4.538.008 1.229 9.307a3.656 3.656 0 107.314-.011l-2.087-7.894zm-12.554-1.393l-6.102.01-1.199 9.312a3.66 3.66 0 003.664 3.651 3.66 3.66 0 003.65-3.663l-.013-9.31z" fill="#E8F0FD"/><path d="M33.478 25.887l.015 9.31a3.658 3.658 0 007.314-.012l-1.229-9.307-6.1.009z" fill="#669DF7"/><path d="M38.03 53.973l-9.02.013-.015-10.026a1.652 1.652 0 011.65-1.655l5.715-.009a1.654 1.654 0 011.656 1.65l.015 10.027z" fill="#E8F0FE"/><path d="M27.578 11.599h-.006l.052.124.025.061 4.552 10.938a.868.868 0 001.6-.008l4.412-10.873a5.75 5.75 0 00.496-2.47 5.763 5.763 0 00-11.526.143 5.74 5.74 0 00.395 2.085z" fill="#EA4335"/><path d="M32.946 10.998a1.787 1.787 0 100-3.575 1.787 1.787 0 000 3.575z" fill="#A50E0E"/></g><defs><clipPath id="clip0_2630_58398"><path fill="#fff" d="M0 0h64v64H0z"/></clipPath></defs></svg> ''';

const String svgInlineImage = '''
<svg width="248" height="100" viewBox="0 0 248 100">
<image id="image0" width="50" height="50" xlink:href="data:image/png;base64,$kBase64ImageContents">
</svg>
''';

const String basicOverlapWithStroke = '''
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="600">
 <g id="Layer_1">
  <rect id="svg_2" height="95" width="593" y="221.5" x="99" stroke="green" fill="red"/>
  <rect  id="svg_4" height="485.99998" width="81" y="41.50001" x="367" fill="blue"/>
 </g>
</svg>
''';

const String basicOverlap = '''
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="600">
 <g id="Layer_1">
  <rect id="svg_2" height="95" width="593" y="221.5" x="99" stroke-width="0" fill="red"/>
  <rect  id="svg_4" height="485.99998" width="81" y="41.50001" x="367" fill="blue"/>
 </g>
</svg>
''';

const String opacityOverlap = '''
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="600">
 <g id="Layer_1">
  <rect opacity="0.5" id="svg_1" height="126" width="623" y="240.5" x="88" fill="#ff0000"/>
  <rect opacity="0.3" id="svg_10" height="502.00001" width="141" y="63.5" x="343" fill="#0000ff"/>
 </g>
</svg>
''';

const String transparentOverSolid = '''
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="600">
 <g id="Layer_1">
  <rect  id="svg_1" height="126" width="623" y="240.5" x="88" fill="#ff0000"/>
  <rect  opacity="0.5" id="svg_10" height="502.00001" width="141" y="63.5" x="343" fill="#0000ff"/>
 </g>
</svg>''';

const String solidOverTrasnparent = '''
 <svg xmlns="http://www.w3.org/2000/svg" width="800" height="600">
 <g id="Layer_1">
  <rect opacity="0.5" id="svg_1" height="126" width="623" y="240.5" x="88" fill="#ff0000"/>
  <rect id="svg_10" height="502.00001" width="141" y="63.5" x="343" fill="#0000ff"/>
 </g>
</svg>''';

const String complexOpacityTest = '''
<svg width="12cm" height="3.5cm" viewBox="0 0 1200 350"
     xmlns="http://www.w3.org/2000/svg" version="1.1">
  <rect x="100" y="100" width="1000" height="150" fill="#0000ff"  />
  <circle cx="200" cy="100" r="50" fill="red" opacity="1"  />
  <circle cx="400" cy="100" r="50" fill="red" opacity=".8"  />
  <circle cx="600" cy="100" r="50" fill="red" opacity=".6"  />
  <circle cx="800" cy="100" r="50" fill="red" opacity=".4"  />
  <circle cx="1000" cy="100" r="50" fill="red" opacity=".2"  />
  <circle cx="182.5" cy="250" r="50" fill="red"  />
  <circle cx="217.5" cy="250" r="50" fill="green" />
  <circle cx="382.5" cy="250" r="50" fill="red" opacity=".75"  />
  <circle cx="417.5" cy="250" r="50" fill="green" opacity=".75"  />
  <circle cx="582.5" cy="250" r="50" fill="red" opacity=".5"  />
  <circle cx="617.5" cy="250" r="50" fill="green" opacity=".5"  />
  <circle cx="817.5" cy="250" r="50" fill="green" opacity=".5"  />
  <circle cx="782.5" cy="250" r="50" fill="red" opacity=".5"  />
  <circle cx="982.5" cy="250" r="50" fill="red" opacity=".25"  />
  <circle cx="1017.5" cy="250" r="50" fill="green" opacity=".25"  />
</svg>
''';

const String alternatingPattern = '''
<svg viewBox="0.0 0.0 180.4 249.4">
  <defs>
    <pattern id="star" viewBox="0,0,10,10" width="10%" height="10%">
      <polygon points="0,0 2,5 0,10 5,8 10,10 8,5 10,0 5,2"/>
    </pattern>
    <pattern id="arrow" viewBox="0,0,10,10" width="10%" height="10%">
      <path d="M0,0 L7,0 L3.5,7 z" fill="red" stroke="blue"/>
    </pattern>
  </defs>
  <circle id="0" cx="-20" cy="150" r="30" fill="url(#star)" stroke-width="20" stroke="none"/>
  <circle id="1" cx="50" cy="150" r="30" fill="url(#arrow)" stroke-width="20" stroke="none"/>
  <circle id="2" cx="120" cy="150" r="30" fill="url(#star)" stroke-width="20" stroke="none"/>
  <circle id="3" cx="190" cy="150" r="30" fill="url(#arrow)" stroke-width="20" stroke="none"/>
</svg>''';

const String starPatternCircles = '''
 <svg viewBox="0 0 230 100" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <pattern id="star" viewBox="0,0,10,10" width="10%" height="10%">
      <polygon points="0,0 2,5 0,10 5,8 10,10 8,5 10,0 5,2" fill="red"/>
    </pattern>
  </defs>

  <circle cx="50"  cy="50" r="50" fill="url(#star)"/>
  <circle cx="180" cy="50" r="40" fill="none" stroke-width="20" stroke="url(#star)"/>
</svg>''';

const String textDecorations = '''
<?xml version="1.0" encoding="UTF-8"?>
<svg viewBox="0 0 500 200"
     xmlns="http://www.w3.org/2000/svg" version="1.1">
  <desc>Example text05 - Text decoration</desc>

  <text x="100" y="60"
      font-family="Roboto" font-size="55" font-style="normal" fill="blue"
      text-decoration="overline" text-decoration-color="red">
    Overline text</text>

  <text x="100" y="120"
      font-family="Roboto" font-size="55" font-style="normal" fill="blue"
      text-decoration="line-through" text-decoration-color="green">
    Strike text</text>

  <text x="100" y="180"
      font-family="Roboto" font-size="55" font-style="normal" fill="blue"
      text-decoration="underline" text-decoration-color="green" text-decoration-style="double">
    Underline text</text>

</svg>
''';

const String textAnchors = '''
<?xml version="1.0" encoding="UTF-8"?>
<svg viewBox="0 0 200 200"
     xmlns="http://www.w3.org/2000/svg" version="1.1">
  <desc>Example text 06 - Text anchor</desc>
  <g fill="black">
    <text x="100" y="50"
        font-family="Roboto" font-size="10" font-style="normal" text-anchor="start">
      Text anchor start</text>

    <text x="100" y="100"
        font-family="Roboto" font-size="10" font-style="normal" text-anchor="middle">
      Text anchor middle</text>

    <text x="100" y="150"
        font-family="Roboto" font-size="10" font-style="normal" text-anchor="end">
      Text anchor end</text>
  </g>
</svg>
''';

/// Excpected groupMask result when [MaskingOptimizer] is applied
List<Path> groupMaskForMaskingOptimizer = <Path>[
  Path(fillType: PathFillType.evenOdd, commands: const <PathCommand>[
    MoveToCommand(12.562000000000001, 20.438),
    CubicToCommand(12.562000000000001, 20.748, 12.310000000000002, 21.0,
        12.000000000000002, 21.0),
    LineToCommand(4.687000000000001, 21.0),
    CubicToCommand(3.755590764649998, 20.998347258709998, 3.0011007948299984,
        20.24341005121, 3.0, 19.312),
    LineToCommand(3.0, 4.6880000000000015),
    CubicToCommand(3.0011020706799982, 3.7562002166800013, 3.75620021668,
        3.001102070680001, 4.687999999999999, 3.000000000000001),
    LineToCommand(12.0, 3.0000000000000004),
    CubicToCommand(12.30144139827, 3.0127127094300006, 12.53927764767,
        3.2607906538300004, 12.53927764767, 3.5625000000000004),
    CubicToCommand(12.53927764767, 3.864209346170001, 12.30144139827,
        4.11228729057, 12.0, 4.125),
    LineToCommand(4.687000000000001, 4.125000000000001),
    CubicToCommand(4.378, 4.125000000000001, 4.125, 4.377000000000001, 4.125,
        4.6880000000000015),
    LineToCommand(4.125, 19.312),
    CubicToCommand(4.125, 19.622, 4.378, 19.875, 4.687999999999999, 19.875),
    LineToCommand(12.000000000000002, 19.875),
    CubicToCommand(12.310000000000002, 19.875, 12.563000000000002, 20.127,
        12.563000000000002, 20.438),
    CloseCommand(),
    MoveToCommand(21.0, 12.0),
    CubicToCommand(21.0, 12.169, 20.921, 12.316, 20.804000000000002, 12.418),
    LineToCommand(20.808, 12.423),
    LineToCommand(16.308, 16.361),
    CubicToCommand(
        16.205000000000002, 16.442999999999998, 16.079, 16.5, 15.938, 16.5),
    CubicToCommand(15.627, 16.5, 15.375, 16.247999999999998, 15.375, 15.937),
    CubicToCommand(15.376131882800001, 15.77572417052, 15.44773957195,
        15.62300981305, 15.571000000000002, 15.519),
    LineToCommand(15.567, 15.514),
    LineToCommand(18.94, 12.563),
    LineToCommand(9.188, 12.563),
    CubicToCommand(8.87706369162, 12.56299999183, 8.6250000148, 12.31093630838,
        8.6250000148, 12.0),
    CubicToCommand(8.6250000148, 11.68906369162, 8.87706369162, 11.43700000817,
        9.188, 11.437),
    LineToCommand(18.94, 11.437),
    LineToCommand(15.567, 8.486),
    CubicToCommand(15.447063979900001, 8.37775998399, 15.37751598331,
        8.22453705399, 15.375, 8.062999999999999),
    CubicToCommand(
        15.375, 7.75206368585, 15.62706368585, 7.5, 15.937999999999999, 7.5),
    CubicToCommand(16.079, 7.5, 16.205, 7.557, 16.304000000000002, 7.644),
    LineToCommand(16.308, 7.639),
    LineToCommand(20.808, 11.577),
    CubicToCommand(20.9279360201, 11.68524001601, 20.997484016690002,
        11.83846294601, 21.0, 12.0),
    CloseCommand()
  ]),
  Path(fillType: PathFillType.evenOdd, commands: const <PathCommand>[
    MoveToCommand(12.418000221252441, 3.196000099182129),
    CubicToCommand(12.315999984741211, 3.0789999961853027, 12.168999671936035,
        3.0, 12.0, 3.0),
    CubicToCommand(11.838462829589844, 3.002516031265259, 11.685239791870117,
        3.07206392288208, 11.57699966430664, 3.191999912261963),
    LineToCommand(7.638999938964844, 7.691999912261963),
    LineToCommand(7.644000053405762, 7.696000099182129),
    CubicToCommand(7.557000160217285, 7.795000076293945, 7.5, 7.921000003814697,
        7.5, 8.062000274658203),
    CubicToCommand(7.5, 8.372936248779297, 7.752063751220703, 8.625,
        8.062999725341797, 8.625),
    CubicToCommand(8.224536895751953, 8.62248420715332, 8.37775993347168,
        8.552935600280762, 8.486000061035156, 8.432999610900879),
    LineToCommand(11.437000274658203, 5.059999942779541),
    LineToCommand(11.437000274658203, 14.812000274658203),
    CubicToCommand(11.437000274658203, 15.122936248779297, 11.689064025878906,
        15.375, 12.0, 15.375),
    CubicToCommand(12.310935974121094, 15.375, 12.562999725341797,
        15.122936248779297, 12.562999725341797, 14.812000274658203),
    LineToCommand(12.562999725341797, 5.059999942779541),
    LineToCommand(15.513999938964844, 8.432999610900879),
    LineToCommand(15.519000053405762, 8.428999900817871),
    CubicToCommand(15.62300968170166, 8.552260398864746, 15.775724411010742,
        8.623867988586426, 15.937000274658203, 8.625),
    CubicToCommand(16.24799919128418, 8.625, 16.5, 8.373000144958496, 16.5,
        8.062000274658203),
    CubicToCommand(16.5, 7.921000003814697, 16.44300079345703,
        7.795000076293945, 16.361000061035156, 7.691999912261963),
    LineToCommand(12.42300033569336, 3.191999912261963),
    LineToCommand(12.418000221252441, 3.196000099182129),
    CloseCommand(),
    MoveToCommand(21.0, 12.0),
    CubicToCommand(21.0, 11.6899995803833, 20.74799919128418,
        11.437999725341797, 20.437999725341797, 11.437999725341797),
    LineToCommand(20.437999725341797, 11.437000274658203),
    CubicToCommand(20.12700080871582, 11.437000274658203, 19.875,
        11.6899995803833, 19.875, 12.0),
    LineToCommand(19.875, 19.312000274658203),
    CubicToCommand(19.875, 19.621999740600586, 19.621999740600586, 19.875,
        19.312000274658203, 19.875),
    LineToCommand(4.688000202178955, 19.875),
    CubicToCommand(4.376999855041504, 19.875, 4.125, 19.621999740600586, 4.125,
        19.312999725341797),
    LineToCommand(4.125, 12.0),
    CubicToCommand(4.112287521362305, 11.698558807373047, 3.8642094135284424,
        11.460721969604492, 3.5625, 11.460721969604492),
    CubicToCommand(3.2607905864715576, 11.460721969604492, 3.0127127170562744,
        11.698558807373047, 3.0, 12.0),
    LineToCommand(3.0, 19.312000274658203),
    CubicToCommand(3.0011019706726074, 20.243799209594727, 3.7562003135681152,
        20.998897552490234, 4.688000202178955, 21.0),
    LineToCommand(19.312000274658203, 21.0),
    CubicToCommand(20.243410110473633, 20.998899459838867, 20.99834632873535,
        20.244409561157227, 21.0, 19.312999725341797),
    LineToCommand(21.0, 12.0),
    CloseCommand()
  ])
];

/// Excpected groupMask result when [MaskingOptimizer] is applied
List<Path> blendsAndMasksForMaskingOptimizer = <Path>[
  Path(
    commands: const <PathCommand>[
      MoveToCommand(50.0, 0.0),
      CubicToCommand(77.5957512247, 0.0, 100.0, 22.4042487753, 100.0, 50.0),
      CubicToCommand(100.0, 77.5957512247, 77.5957512247, 100.0, 50.0, 100.0),
      CubicToCommand(22.4042487753, 100.0, 0.0, 77.5957512247, 0.0, 50.0),
      CubicToCommand(0.0, 22.4042487753, 22.4042487753, 0.0, 50.0, 0.0),
      CloseCommand(),
    ],
  ),
  Path(
    fillType: PathFillType.evenOdd,
    commands: const <PathCommand>[
      MoveToCommand(90.0, 50.0),
      CubicToCommand(
          90.0, 27.923398971557617, 72.07659912109375, 10.0, 50.0, 10.0),
      CubicToCommand(
          27.923398971557617, 10.0, 10.0, 27.923398971557617, 10.0, 50.0),
      CubicToCommand(
          10.0, 72.07659912109375, 27.923398971557617, 90.0, 50.0, 90.0),
      CubicToCommand(
          72.07659912109375, 90.0, 90.0, 72.07659912109375, 90.0, 50.0),
      CloseCommand(),
    ],
  ),
];

/// Expected basicClips result when [Clipping Optimizer] is applied

List<Path> basicClipsForClippingOptimzer = <Path>[
  Path(
    fillType: PathFillType.evenOdd,
    commands: const <PathCommand>[
      MoveToCommand(50.0, 30.0),
      CubicToCommand(
          50.0, 18.961700439453125, 41.038299560546875, 10.0, 30.0, 10.0),
      CubicToCommand(
          18.961700439453125, 10.0, 10.0, 18.961700439453125, 10.0, 30.0),
      CubicToCommand(
          10.0, 41.038299560546875, 18.961700439453125, 50.0, 30.0, 50.0),
      CubicToCommand(
          41.038299560546875, 50.0, 50.0, 41.038299560546875, 50.0, 30.0),
      CloseCommand(),
      MoveToCommand(90.0, 70.0),
      CubicToCommand(
          90.0, 58.961700439453125, 81.03829956054688, 50.0, 70.0, 50.0),
      CubicToCommand(
          58.961700439453125, 50.0, 50.0, 58.961700439453125, 50.0, 70.0),
      CubicToCommand(
          50.0, 81.03829956054688, 58.961700439453125, 90.0, 70.0, 90.0),
      CubicToCommand(
          81.03829956054688, 90.0, 90.0, 81.03829956054688, 90.0, 70.0),
      CloseCommand()
    ],
  ),
];

/// https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/bzrfeed.svg
const String signWithScaledStroke = '''
<svg xmlns="http://www.w3.org/2000/svg" stroke-linejoin="round" viewBox="0 0 100 100" fill="none">
  <path d="M50,4L4,50L50,96L96,50Z" stroke="#FE4" stroke-width="3"/>
  <path d="M50,5L5,50L50,95L95,50Z" stroke="#333" fill="#FE4" stroke-width="3"/>
  <g transform="scale(0.8) translate(14,30)">
    <path d="M37,42c-1,0,11-20,13-20c1,0,15,20,13,20h-9c0,8,9,22,12,25l-4,4l-8,-7v13h-10v-35z" stroke="#CA0" fill="#CA0"/>
    <path d="M35,40c-1,0,11-20,13-20c1,0,15,20,13,20h-9c0,8,9,22,12,25l-4,4l-8,-7v13h-10v-35z" stroke="#333" fill="#555"/>
  </g>
 <g transform="translate(50,26) scale(0.25)" stroke-width="2">
   <g fill="none">
    <ellipse stroke="#469" rx="6" ry="44"/>
    <ellipse stroke="#ba5" rx="6" ry="44" transform="rotate(-66)"/>
    <ellipse stroke="#68c" rx="6" ry="44" transform="rotate(66)"/>
    <circle  stroke="#331" r="44"/>
   </g>
   <g fill="#689" stroke="#FE4">
    <circle fill="#80a3cf" r="13"/>
    <circle cy="-44" r="9"/>
    <circle cx="-40" cy="18" r="9"/>
    <circle cx="40" cy="18" r="9"/>
   </g>
 </g>
</svg>
''';

const String textTspan = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400">
  <g>
    <text transform="translate(33 38)" fill="rgba(0,0,0,0.6)" font-size="16"
      font-family="Roboto-Regular, Roboto" letter-spacing="0.009em">
      <tspan x="0" y="15">Some text </tspan>
      <tspan x="0" y="35">more text.</tspan>
    </text>
    <text transform="translate(35 337)" fill="rgba(0,0,0,0.6)" font-size="16"
      font-family="Roboto-Regular, Roboto" letter-spacing="0.009em">
      <tspan x="0" y="15">Even more text </tspan>
      <tspan x="0" y="35">text everywhere </tspan>
      <tspan x="0" y="55">so many lines</tspan>
    </text>
  </g>
</svg>
''';

const String numberBubbles = '''
<svg width="64" height="16" viewBox="0 0 64 16" xmlns="http://www.w3.org/2000/svg">
    <g fill="none" fill-rule="evenodd">
        <circle fill="#878D91" cx="56" cy="8" r="8"/>
        <circle stroke="#878D91" cx="8" cy="8" r="7.5"/>
        <path fill="#878D91" d="M15 7.5h10v1H15zM39 7.5h10v1H39z"/>
        <circle stroke="#878D91" cx="32" cy="8" r="7.5"/>
        <text font-family="AvenirNext-Medium, Avenir Next" font-size="11" font-weight="400" fill="#878D91">
                    <tspan x="28.727" y="12">2</tspan>
                </text>
        <text font-family="AvenirNext-Medium, Avenir Next" font-size="11" font-weight="400" fill="#FFF">
                    <tspan x="52.727" y="12">3</tspan>
                </text>
        <text font-family="AvenirNext-Medium, Avenir Next" font-size="11" font-weight="400" fill="#878D91">
                    <tspan x="4.728" y="12">1</tspan>
                </text>
    </g>
</svg>
''';

/// Via https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/fill-rule
const String inheritFillRule = '''
<svg viewBox="-10 -10 220 120" xmlns="http://www.w3.org/2000/svg">
  <!-- Default value for fill-rule -->
  <polygon
    fill-rule="nonzero"
    stroke="red"
    points="50,0 21,90 98,35 2,35 79,90" />

  <!--
  The center of the shape has two
  path segments (shown by the red stroke)
  between it and infinity. It is therefore
  considered outside the shape, and not filled.
  -->
  <polygon
    fill-rule="evenodd"
    stroke="red"
    points="150,0 121,90 198,35 102,35 179,90" />
</svg>

''';
