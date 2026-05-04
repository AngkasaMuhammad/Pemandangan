
"use strict"


//= * = * = * = * = * = *
let pi = Math.PI

//+ - + - + - + - + - + -





//=========================
//
//		KEYBOARD
//
//=========================
export let _key = class{
	static blur_contextmenu = (e,code,f,k) => {
		k.value && f?.(e,code,)
		k.value = false
	}
	constructor(code, f = null,target = window) {
		this.value = false

		target.addEventListener("keydown", e => {
			if (e.code === code){
				!this.value && f?.(e,code,)
				this.value = true
			}
		})
		target.addEventListener("keyup", e => {
			if (e.code === code){
				this.value && f?.(e,code,)
				this.value = false
			}
		})
		let k = this
		target.addEventListener("blur",e=>_key.blur_contextmenu(e,code,f,k,),)
		target.addEventListener("contextmenu",e=>_key.blur_contextmenu(e,code,f,k,),)
	}

	[Symbol.toPrimitive](hint) {
		return this.value
	}
}





//=========================
//
//		CAMERA SETUP 0
//
//=========================
export let _camsetup0 = class{
	static matrix4x4 = null //wgpu matrix lib
	
	static instarr = []
	static activecam = null
	static init = matrix4x4=>{
		let _c = _camsetup0
		_c.matrix4x4 = matrix4x4
		//pake e=> agar this tidak berupa window
		addEventListener('pointermove'	,e=>_c.activecam.fcamrot(e)	,{ passive: false }) //sampe sini, touch
		addEventListener('wheel'	,e=>_c.activecam.fmoucamzoom(e)	,)
		_c.init = 'single use'
	}
	
	constructor(camout,){
		let m4 = _camsetup0.matrix4x4
		
		this.camrx = -.5
		this.camry = 0
		this.zoom = m4.scaling(Array(3).fill(55))
		this.camout = camout
		_camsetup0.instarr.push(this)
	}
	
	
	
	fcamrot(e){
		let m4 = _camsetup0.matrix4x4
		let pi = Math.PI
		this.camrx -= e.movementY*.01
		this.camrx = Math.max(-pi/2,Math.min(this.camrx,pi/2,),)
		this.camry -= e.movementX*.01
	}
	fmoucamzoom(e){
		let m4 = _camsetup0.matrix4x4
		
		let s = Math.pow(1.001,e.deltaY,)
		m4.scale(this.zoom,[s,s,s,],this.zoom,)
	}
	fcam(pos){
		let m4 = _camsetup0.matrix4x4
		
		m4.translation(pos,this.camout,)
			m4.translate(this.camout,[0,3,0,],this.camout,)
			m4.rotateY(this.camout,this.camry,this.camout,)
			m4.rotateX(this.camout,this.camrx,this.camout,)
			m4.mul(this.camout,this.zoom,this.camout,)
			m4.translate(this.camout,[0,0,1,],this.camout,)
			m4.invert(this.zoom,this.zoom,)
				m4.mul(this.camout,this.zoom,this.camout,)
			m4.invert(this.zoom,this.zoom,)
		m4.invert(this.camout,this.camout,)
		
	}
}





//=========================
//
//		RESIZE CANVAS
//
//=========================
export let _resize3dcanvas = class{
	static resizenow = false
	static canvw = 0
	static canvh = 0
	static canvarea = 111111*6 //sekitar 1000*700
	
	static persp = null
	static canv3d = null
	static matrix4x4 = null
	static init = (persp,canv3d,matrix4x4,)=>{
		let _r = _resize3dcanvas
		_r.persp = persp
		_r.canv3d = canv3d
		_r.matrix4x4 = matrix4x4
		addEventListener('resize',_r.fresize, )
		_r.fresize()
		_r.init = 'single use'
	}
	
	static fresize = () => {
		let _r = _resize3dcanvas
		let m4 = _r.matrix4x4
		
		const sw = _r.canv3d.clientWidth
		const sh = _r.canv3d.clientHeight
	
		let aspect = sw / sh
		_r.canvw = Math.round(Math.sqrt(_r.canvarea * aspect))
		_r.canvh = Math.round(Math.sqrt(_r.canvarea / aspect))
		m4.perspectiveReverseZ(
			.9, //fov (rad)
			aspect,//aspect ratio
			.01, //zNear
			Number.MAX_SAFE_INTEGER, //zFar
		_r.persp,)
		_r.resizenow = true
	}
}





//=========================
//
//		MONYET
//
//=========================
export let _monyet = class{
	static matrix4x4 = null //wpgu matrix mat4
	static vector3 = null
	static monyetstruct = null //Object storage struct
	static monyet_count = null //Function
	static monyet_arr = [] //_monyet instances
	static arrive = null
	static f_envlightmode = null
	static soundfx_monyet1 = null
	static soundfx_kejang = null
	static audio = null
	
	static init = (
		monyetstruct,
		monyet_count,
		matrix4x4,
		vector3,
		f_envlightmode,
		audio,
		soundfx_monyet1,
		soundfx_kejang,
	)=>{
		let _m = _monyet
		_m.matrix4x4 = matrix4x4
		_m.vector3 = vector3
		_m.monyetstruct = monyetstruct
		_m.monyet_count = monyet_count
		_m.f_envlightmode = f_envlightmode
		_m.soundfx_monyet1 = soundfx_monyet1
		_m.soundfx_kejang = soundfx_kejang
		_m.audio = audio
		_m.init = 'single use'
	}
	
	static draw = (
		dt,
		camout,
	)=>{
		let _m = _monyet
		let m4 = _m.matrix4x4
		let v3 = _m.vector3
		
		if(
			_m.arrive &&
			_m.arrive.data.health[0] <= 0
		){
			_m.arrive = null
			_m.f_envlightmode(true)
		}
		
		for(let mo of _m.monyet_arr){
			let m = mo.data.matrix
			let aufx = mo.soundfx_monyet1
			if(aufx){
				for(let i = 0;i < aufx.length;i++){
					_m.audio.fxsetpos(
						aufx,
						...v3.transformMat4(m4.getTranslation(mo.data.matrix),camout,),//...[-.3,0,0,],
						5,
						i,
					)
				}
			}
			
			if(mo.fly){
				mo.speedy -= 21*dt
				let speedz = (Math.min(.5,v3.length([m[12],0,m[14],]),)-.05)*9
				m4.translate(m,[0,mo.speedy*dt,speedz*dt,],m,)
				if(m[13] < .6){
					mo.fly = false
					m[13] = .6
					mo.landtime = 0
				}
			}else{
				mo.landtime++
				if(mo.landlimit < mo.landtime && !_m.arrive){
					mo.fly = true
					mo.speedy = 22
				}
			}
			
			
			if(mo.kejang){
				mo.tkejang++
				if(77 < mo.tkejang){
					mo.remove()
				}
				for(let i = 0;i < mo.kejang.length;i++){
					_m.audio.fxsetpos(
						mo.kejang,
						...v3.transformMat4(m4.getTranslation(m),camout,),
						8,
						i,
					)
				}
			}
		}
	}
	static colldetect = async( //collision_detect
	)=>{
		let _m = _monyet
		let m4 = _m.matrix4x4
		let v3 = _m.vector3
		
		for(let mo of _m.monyet_arr){
			let m = mo.data.matrix
			let h = mo.data.health
			
			
			//env
			if(
				!_m.arrive &&
				v3.length(m4.getTranslation(m)) < 11 &&
				0 < h[0]
			){
				_m.arrive = mo
				_m.f_envlightmode(false)
			}
			
			
			//kejang
			if(!mo.kejang && h[0] <= 0){
				_m.audio.fxaustop(mo.soundfx_monyet1)
				mo.kejang = await _m.soundfx_kejang()
			}
		}
	}
	
	
	
	constructor(pos){
		let _m = _monyet
		let m4 = _m.matrix4x4
		
		this.kejang = null
		this.tkejang = 0
		this.fly = true
		this.landtime = 0
		this.landlimit = Math.random()*111
		this.speedy = 0
		this.data = _m.monyetstruct[_m.monyet_arr.length]
		this.data.health[0] = 2
		_m.soundfx_monyet1().then(a=>this.soundfx_monyet1 = a)
		
		let mm = this.data.matrix
		m4.identity(mm)
		m4.translate(mm,pos,mm,)
		
		_m.monyet_arr.push(this)
		_m.monyet_count(_m.monyet_arr.length)
		
		let mmo = this.data.matrix
		let xyz = m4.getTranslation(mmo)
		m4.cameraAim(
			xyz,
			[0,xyz[1],0,],
			[0,1,0,],
			mmo,
		)
		m4.rotateY(mmo,pi,mmo,)
		
		
	}
	remove(){
		if(!this.data){return 'already removed'}
		let _m = _monyet
		let m4 = _m.matrix4x4
		let icur = _m.monyetstruct.indexOf(this.data) //index in monyet_arr
		
		
		let molast = _m.monyet_arr.pop()
		if(icur < _m.monyet_arr.length){
			_m.monyet_arr[icur] = molast
		}
		//copy
		this.data.matrix	.set(molast.data.matrix	)
		this.data.health	.set(molast.data.health	)
		//pindah
		molast.data = this.data
		this.data = null
		//
		_m.monyet_count(_m.monyet_arr.length)
	}
}





//=========================
//
//		CHARA0
//
//=========================
export let _chara0 = class{
	static matrix4x4 = null //wpgu matrix mat4
	static vector3 = null //wpgu matrix vec3
	static audio = null //wasm audio
	static chara0pos = null
	static ani_berdiri = null
	static ani_lari = null
	static ani_serang = null
		static aufxlari = null
		static aufxserang = null
	
	static chara0xyz = null
	static chara0ry = 0
	static t_ani = 0
	static moudown = false
	static toustart = false
	static toumoved = false
	static keyW = null
	static keyA = null
	static keyS = null
	static keyD = null
	static attacking = false
	
	static init = (
		matrix4x4	,
		vector3	,
		chara0pos	,
		ani_berdiri	,
		ani_lari	,
		ani_serang	,
		aufxlari	,
		aufxserang	,
		
		get_t0	,
		keyD,keyA,keyS,keyW,
		audio,
	)=>{
		let _c = _chara0
		let m4 = _c.matrix4x4	= matrix4x4
		let v3 = _c.vector3	= vector3
		
		_c.chara0pos	= chara0pos
		_c.ani_berdiri	= ani_berdiri
		_c.ani_lari	= ani_lari
		_c.ani_serang	= ani_serang
		_c.aufxlari	= aufxlari
		_c.aufxserang = aufxserang
		_c.chara0xyz	= v3.create(0,0,0,)
		_c.keyW = keyW
		_c.keyA = keyA
		_c.keyS = keyS
		_c.keyD = keyD
		_c.audio = audio
		
		addEventListener('mousedown',e=>{
			_c.moudown = true
			_c.t_ani = get_t0()
		},)
		addEventListener('mouseup',e=>{
			_c.moudown = false
		},)
		addEventListener('touchstart',e=>{
			_c.toudown = true
			_c.t_ani = get_t0()
		},)
		addEventListener('pointermove',e=>{
			if(
				e.pointerType !== 'touch' || (
					Math.abs(e.movementX) < 4 &&
					Math.abs(e.movementY) < 4
				)
			){return}
			
			_c.toumoved = true
		},)
		addEventListener('touchend',e=>{
			_c.toudown =
			_c.toumoved = false
		},)
		
		_c.init = 'single use'
	}
	
	static draw = async (
		camry,
		dt,t1,
		camout,
	)=>{
		let _c = _chara0
		let m4 = _c.matrix4x4
		let v3 = _c.vector3
		let keyWtm = _c.toumoved || _c.keyW // keyW dan toumoved
		let keyA = _c.keyA
		let keyS = _c.keyS
		let keyD = _c.keyD
		
		let moving = (+keyD-+keyA||+keyS-+keyWtm)
		_c.chara0ry =
			moving
			?Math.atan2(+keyD-+keyA,+keyS-+keyWtm)+camry
			:_c.chara0ry
		
		m4.translation(_c.chara0xyz,_c.chara0pos,)
		m4.rotateY(_c.chara0pos,_c.chara0ry,_c.chara0pos,)
		
		_c.attacking = (_c.moudown || _c.toudown) && !_c.toumoved
		if(moving && !_c.attacking){
			m4.translate(_c.chara0pos,[0,0,dt*16,],_c.chara0pos,)
			m4.getTranslation(_c.chara0pos,_c.chara0xyz,)
		}
		
		//sound
		if(moving && !_c.attacking){
			await _c.aufxlari.play(dt)
			_c.f_aufx(_c.aufxlari,camout,22,)
		}else{
			_c.aufxlari.stop()
		}
		if(_c.attacking){
			await _c.aufxserang.play(dt)
			_c.f_aufx(_c.aufxserang,camout,44,)
		}else{
			_c.aufxserang.stop()
		}
		
		
		//
		_c.attacking?_c.ani_serang(t1-_c.t_ani):
		moving?_c.ani_lari(t1-_c.t_ani):
		_c.ani_berdiri(t1)
		
		
	}
	static f_aufx(aufx,camout,r,){
		let _c = _chara0
		let m4 = _c.matrix4x4
		let v3 = _c.vector3
		for(let i = 0;i < aufx.au.length;i++){
			_c.audio.fxsetpos(
				aufx.au,
				...v3.transformMat4(_c.chara0xyz,camout,),//...[-.3,0,0,],
				r,
				i,
			)
		}
	}
}





//=========================
//
//		AUDIO FX
//
//=========================
export let _aufx = class{
	static fxaustop = null
	
	static init(fxaustop){
		_aufx.fxaustop = fxaustop
		_aufx.init = 'single use'
	}
	
	
	
	constructor(
		start,
		end,
		f_soundfx,
	){
		this.start	= start
		this.end	= end
		this.f_soundfx	= f_soundfx
		this.au	= null
		this.repeat	= this.start
		//this.	= 
	}
	async play(dt){
		if(this.end < this.repeat){
			this.repeat %= this.end-this.start
			this.au = null
		}
		if(!this.au){
			this.au = await this.f_soundfx()
		}
		this.repeat += dt
	}
	stop(){
		if(this.au){
			_aufx.fxaustop(this.au)
			this.au = null
			this.repeat = this.start
		}
	}
}





//=========================
//
//		ENV AUDIO
//
//=========================
export let _envau = class{
	static vector3 = null //wpgu matrix vec3
	static audio = null
	static conlen = 0//controller length
	
	static async init(
		vector3,
		audio,
		ad,//audio data
		conlen,
	){
		_envau.vector3 = vector3
		_envau.audio = audio
		_envau.conlen = conlen
		
		audio.envad('contenv')
		audio.envauplay()
		
		_envau.init = 'single use'
	}
	
	static draw(
		xyzr,//posisi & radius
		camout,
	){
		for(let i = 0;i < _envau.conlen;i++){
			_envau.audio.envsetpos(
				..._envau.vector3.transformMat4(xyzr[i],camout,),
				xyzr[i][3],
				i,
			)
		}
	}
}





//=========================
//
//		DETECT FETCHES
//
//=========================
export let _showfetch = class{
	static init(fetchinfo){
		console.log(fetchinfo)
		new PerformanceObserver((list) => {
			list.getEntries().forEach((entry) => {
				if (entry.initiatorType === "fetch") {
					let mes = '+-+- fetching.... '+entry.name
					console.log(mes)
					let div = document.createElement('div')
					div.textContent = mes
					fetchinfo.appendChild(div)
					fetchinfo.scroll(0,Number.MAX_SAFE_INTEGER,)
				}
			});
		}).observe({ entryTypes: ["resource"] });
		_showfetch.init = 'single use'
	}
}