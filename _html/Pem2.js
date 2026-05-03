
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



//UI
let forward	= false
let reverse	= false
let left	= false
let right	= false
document.querySelector('#forward'	).addEventListener('mousedown',()=>forward	= true)
document.querySelector('#reverse'	).addEventListener('mousedown',()=>reverse	= true)
document.querySelector('#left'	).addEventListener('mousedown',()=>left	= true)
document.querySelector('#right'	).addEventListener('mousedown',()=>right	= true)
addEventListener('mouseup',()=>forward = reverse = left = right = false)


//+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
//silakan bikin di sini








	console.log(m4)
	console.log(v3)



let t0 = 0


let chara0pos = await render.chara0pos()
let ry = 0
let rx = 0
let camzoom = 1

let draw = async t=>{
	t *= .001
	let dt = t-t0
	t0 = t
	
	
	
	let speed = [
		(left-right)*dt*5,
		0,
		(forward-reverse)*dt*5,
	]
	let gerak = 
		forward ||
		reverse ||
		left ||
		right
	gerak && m4.translate(chara0pos,speed,chara0pos,)
	
	
	
	await render.draw()
	requestAnimationFrame(draw)
}
requestAnimationFrame(draw)




//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


})()