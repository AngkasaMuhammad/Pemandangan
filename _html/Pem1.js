
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



//+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
//silakan edit di sini
let lih = a=>{
	console.log(a)
	return a
}
let pi = Math.PI
let render = PL5.wasmsrc[1].instance.exports
let audio = PL5.wasmsrc[2].instance.exports




//putar cam
let rx = 0
let camout = await render.cam_transform()
let camxzry = m4.identity()//simpan x z ry
let btnmove = document.querySelector('#move')
let btnrotate = document.querySelector('#rotate')
let reqpoi = async e=>{
	await e.currentTarget.requestPointerLock({unadjustedMovement:true,})
}

let fmove = e=>{
	m4.translate(camxzry,[e.movementX*.1,0,e.movementY*.1,],camxzry,)
}
let frotate = e=>{
	rx -= e.movementY*.01
	rx = Math.max(-pi/2,Math.min(rx,pi/2,),)
	m4.rotateY(camxzry,-e.movementX*.01,camxzry,)
	
}
btnmove.addEventListener('mousedown',reqpoi,)
btnrotate.addEventListener('mousedown',reqpoi,)
addEventListener('mouseup',async e=>{
	await document.exitPointerLock()
},)
/*
addEventListener('mousewheel',e=>{
	let poiele = document.pointerLockElement
	switch(poiele){
		case btnmove	:fmove	break
		case btnrotate	:frotate	break
	}
})*/
addEventListener('mousemove',async e=>{
	let poiele = document.pointerLockElement
	switch(poiele){
		case btnmove	:fmove(e)	;break
		case btnrotate	:frotate(e)	;break
	}
},)
let tocx = 0
let tocy = 0
let tocstart = e=>{
	tocx = e.touches[0].clientX
	tocy = e.touches[0].clientY
}
btnmove.addEventListener('touchstart',tocstart,)
btnrotate.addEventListener('touchstart',tocstart,)
btnmove.addEventListener('touchmove',e=>fcam(e,fmove,),)
btnrotate.addEventListener('touchmove',e=>fcam(e,frotate,),)
let fcam = (e,f,)=>{
	let tocini = e.touches[0]
	let clx = tocini.clientX
	let cly = tocini.clientY
	f({
		movementX:clx-tocx,
		movementY:cly-tocy,
	})
	tocx = clx
	tocy = cly
}
let chara0pos = await render.chara0pos()
let envtime = await render.envtime()
let ani_berdiri = await render.ani_berdiri
let contlistenv = await audio.contlistenv()
let ani_lari = await render.ani_lari
let ani_serang = await render.ani_serang
let loop = async t=>{
	t *= .001
	envtime[0] = t
	//ani_berdiri(t)
	//ani_lari(t)
	ani_serang(t)
	
	m4.copy(camxzry,camout,)
	m4.rotateX(camout,rx,camout,)
	m4.invert(camout,camout,)
	audio.envsetLR(
		...v3.transformMat4(contlistenv,camout,),
		contlistenv[3],
		0,
	)
	audio.fxsetLR(
		fxserang,
		...v3.transformMat4([11,0,0,],camout,),
		1,
		1,
	)
	setTimeout(loop,1000/60,performance.now(),)
}
let draw = async t=>{
	await render.draw()
	setTimeout(()=>requestAnimationFrame(draw),1000/30)
	//requestAnimationFrame(draw)
}


m4.identity(chara0pos)
chara0pos[12] = 11

let fxserang = lih(await audio.soundfx_serang())

setTimeout(loop,0,0,)
requestAnimationFrame(draw)



/*
//env ani
let envtime = await render.envtime()
let loop = async t=>{
	t *= .001
	envtime[0] = t
	await render.draw()
	requestAnimationFrame(loop)
}
requestAnimationFrame(loop)
*/




//audio
audio.envad('contenv')
audio.envauplay()





//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


})()