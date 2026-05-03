
"use strict"







//import {main} from 'https://angkasamuhammad.github.io/Poly-Landhep-5/js/PL5.js'
import {main} from 'http://127.0.0.1:8080/cobafolder/WebGPU/Poly-Landhep-5/js/PL5.js'
import {
	mat4 as m4,
} from 'https://wgpu-matrix.org/dist/3.x/wgpu-matrix.module.js';


;(async ()=>{




let lih = a=>{
	console.log(a)
	return a
}
let canv3d = document.querySelector('#canv3d')
let cx3d = canv3d.getContext('webgpu')

let PL5 = await main(
	canv3d,
	cx3d,
	'../resource%20links.txt',
	'../wasm%20links.txt',
	//sampe sini, repo github Pemandangan
)
lih('lihat PL5')
lih(PL5)



let exp0 = PL5.wasmsrc[0].instance.exports
//let exp1 = PL5.wasmsrc[1].instance.exports

let offsetinfo = await exp0.fmyinfo0offsetinfo() //dari reso
lih(offsetinfo)
//let mypersp0	= new window[offsetinfo.perspective.type](	exp0.myinfo0mem.buffer,	offsetinfo.perspective.byteOffset,	offsetinfo.perspective.length,	)
//let mycampos0out	= new window[offsetinfo.perspective.type](	exp0.myinfo0mem.buffer,	offsetinfo.cam_transform.byteOffset,	offsetinfo.cam_transform.length,	)
//let seek	= new window[offsetinfo.perspective.type](	exp0.myinfo0mem.buffer,	offsetinfo.env_time.byteOffset,	offsetinfo.env_time.length,	)
/*
mypersp0.set(exp1.mypersp(
	.9, //fov (rad)
	canv3d.width,//aspect ratio
	canv3d.height, //aspect ratio
	.01, //zNear
	Number.MAX_SAFE_INTEGER, //zFar
))
*/
//setTimeout(()=>{
	//lih(new Float32Array(exp0.myinfo0mem.buffer,0,32,))
	exp0.lari(.73)
	exp0.main()
//},1111,)

/*
let mycampos0 = m4.identity()
	m4.rotateY(mycampos0,.5,mycampos0,)
	m4.rotateX(mycampos0,-.3,mycampos0,)
	m4.translate(mycampos0,[0,0,22,],mycampos0,)
	m4.invert(mycampos0,mycampos0out,)
*/

let draw = async t=>{
	t *= .001
	
	//seek[0] = t
	;(t < 5)
		?exp0.berdiri(t)
		:((t < 9)
			?exp0.lari(t)
			:exp0.serang(t)
		)
	/*
	m4.identity(mycampos0)
	m4.rotateY(mycampos0,t*.1-2,mycampos0,)
	m4.translate(mycampos0,[0,4,6,],mycampos0,)
	m4.rotateX(mycampos0,-.3,mycampos0,)
	m4.invert(mycampos0,mycampos0out,)
	*/
	
	await exp0.main()
}
/*
let delay = 0
let loop = async t0=>{
	if(delay < t0){
		delay += 22
		await draw(t0)
	}
	requestAnimationFrame(loop)
}
requestAnimationFrame(loop)
*/








})()