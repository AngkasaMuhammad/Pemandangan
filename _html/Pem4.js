/*
sampe sini

V	| class chara, rapihin (keyD,keyA,keyS,keyW,soundfx_serang,fxaustop,)
V	| bikin class aufx
v	| bikin aufx kaki
V	| suara ayunan & jaraknya
V	| suara (lari,serang) & jaraknya
V	| class env
v	| dunia gelap
v	| bikin crowd monyet, env light mode
V	| attacking monyet ,health
V	| spawn monyet
x	| UI
V	| touch (ga pake zoom)

*/
"use strict"


import {main} from 'https://angkasamuhammad.github.io/Poly-Landhep-5/js/PL5.js'
//import {main} from 'http://127.0.0.1:8080/cobafolder/WebGPU/Poly-Landhep-5/js/PL5.js'
import {
	_key,
	_aufx,
	_camsetup0,
	_resize3dcanvas,
	_monyet,
	_chara0,
	_envau,
} from './Pem4class.js'
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

let lih = a=>{
	console.log(a)
	return a
}
let pi = Math.PI
lih(PL5)



//keyboard
let keyW = new _key('KeyW')
let keyA = new _key('KeyA')
let keyS = new _key('KeyS')
let keyD = new _key('KeyD')



//env
let envtime = await render.envtime()
let envlight = await PL5.resosrc.get('envlight_array');
envlight[0] = 0
let cle_rumput = await audio.contladang()
let envspeed = 1

//monyet
let monyetstruct = await render.monyetstruct()
_monyet.init(
	monyetstruct,
	await render.monyet_count,
	m4,
	v3,
	cerah=>{
		if(cerah){
			envlight[0] = 0
		}else{
			envlight[0] = 1.1
			audio.soundfx_retak()
		}
	},
	audio,
	audio.soundfx_monyet1,
	audio.soundfx_kejang,
)
let tspawnmonyet = 9999999
let spawnmonyet = ()=>{
	if(tspawnmonyet++ < 2222){ //delay spawn
		return
	}
	lih('spawwwnnnn')
	tspawnmonyet = 0
	
	let acak0 = a=>Math.random()*a
	let addn = Math.min(// +sebanyak
		Math.ceil(Math.random()*11)+9,
		monyetstruct.length-_monyet.monyet_arr.length,
	)
	lih(addn)
	addn && audio.soundfx_monyet0()
	for(let a = 0;a < addn;a++){//max 64
		let sudut = acak0(3333)
		let jarak = acak0(111)+77
		new _monyet([
			Math.sin(sudut)*jarak,
			acak0(33),
			Math.cos(sudut)*jarak,
		])
	}
}
spawnmonyet()





//aufx
_aufx.init(await audio.fxaustop)

//chara0
_chara0.init(
	m4,
	v3,
	await render.chara0pos(),
	await render.ani_berdiri,
	await render.ani_lari,
	await render.ani_serang,
	new _aufx(
		(await PL5.resosrc.get('laristart')).value,//lari
		(await PL5.resosrc.get('lariend')).value,//lari
		audio.soundfx_lari,//lari
	),
	new _aufx(
		(await PL5.resosrc.get('serangstart')).value,//serang
		(await PL5.resosrc.get('serangend')).value,//serang
		audio.soundfx_serang,//serang
	),
	()=>t0,
	keyD,keyA,keyS,keyW,
	audio,
)

//cam
let camout = await render.cam_transform()
_camsetup0.init(m4)
let cam0 = new _camsetup0(camout,)
_camsetup0.activecam = cam0

//posisi & radius suara ladang & ayunan [x,y,z,r,]
//let xyzr_la = [cle_rumput[3],11,11,]
let xyzr_la = [
	cle_rumput,
	[4,11,0,11,],
	[4,11,0,11,],
]

_envau.init(
	v3,
	audio,
	'contenv',
	(await PL5.resosrc.get('contenv')).length,
)



//
let thit = 0//batas time hit 
let thitstep = 0//batas time hit confirm
let collision_detect = async ()=>{
	_monyet.colldetect()
	
	
	
	//chara0 hit monyet
	for(let mo of _monyet.monyet_arr){
		let m = mo.data.matrix
		let h = mo.data.health
		
		if(
			_chara0.attacking &&
			v3.distance(
				m4.getTranslation(m),
				_chara0.chara0xyz,
			) < 7
		){
			h[0] -= .1
			let re = _chara0.aufxserang.repeat
			if(re < thit){
				thitstep = 0
			}
			thit = re
			if(
				(thitstep === 0 && .3 < re) ||
				(thitstep === 1 && .5 < re) ||
				(thitstep === 2 && .77 < re)
			){
				thitstep++
				
				
				let aufxhit = await audio.soundfx_hit()
				let playi = Math.floor(Math.random()*aufxhit.length)
				for(let i = 0;i < aufxhit.length;i++){
					audio.fxsetpos( //posisi suara fixed, tidak di dalam world
						aufxhit,
						0,0,11,
						111*(i === playi)+1,
						i,
					)
				}
			}
		}
	}
	
	
	
}
setInterval(collision_detect,55,)



//
let t0 = 0
let dt = 0
let draw = async t1=>{
	t1 *= .001 //detik
	dt = t1-t0
	dt = Math.min(dt,1,)
	t0 = t1
	envtime[0] = await audio.envaugetTime()//t1
	spawnmonyet()
	
	audio.envausetSpeed(envspeed += .01*(.5-(_monyet.arrive != null)))
	envspeed = Math.max(.3,envspeed,)
	envspeed = Math.min(1,envspeed,)
	
	
	if(_resize3dcanvas.resizenow){
		await render.resize_canvas(_resize3dcanvas.canvw,_resize3dcanvas.canvh,)
		_resize3dcanvas.resizenow = false
	}
	_monyet.draw(dt,camout,)
	
	_chara0.draw(
		cam0.camry,
		dt,t1,
		camout,
	)
	cam0.fcam(_chara0.chara0xyz)
	
	_envau.draw(
		xyzr_la,
		camout,
	)
	await render.draw()
}
let ss = 1 //skip steps
let step = 0 //frame step
let loop = async t=>{ //milisecond
	if(ss <= ++step){
		step = 0
		await draw(t)
	}
	
	requestAnimationFrame(loop)
}
requestAnimationFrame(loop)
setTimeout(draw,0,0,)



_resize3dcanvas.init(
	await render.persp(),
	canv3d,
	m4,
)
cam0.fcam(_chara0.chara0xyz)


//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


})()