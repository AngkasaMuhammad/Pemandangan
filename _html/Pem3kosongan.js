
"use strict"


//import {main} from 'https://angkasamuhammad.github.io/Poly-Landhep-5/js/PL5.js'
import {main} from 'http://127.0.0.1:8080/cobafolder/WebGPU/Poly-Landhep-5/js/PL5.js'
import {
	mat4 as m4,
	//vec4 as v4,
	vec3 as v3,
} from 'https://wgpu-matrix.org/dist/3.x/wgpu-matrix.module.js';




;(async ()=>{



let canv3d = document.querySelector('#canv3d')
let PL5 = await main(
	canv3d,
	canv3d.getContext('webgpu'),
	'../resource%20links.txt',
	'../wasm%20links.txt',
)
let render = PL5.wasmsrc[1].instance.exports
let audio = PL5.wasmsrc[2].instance.exports

//+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
//silakan bikin di sini






//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


})()