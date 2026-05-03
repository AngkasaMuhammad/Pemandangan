
(module

	(func $fxauplay (import "main" "fxauplay" ) (param externref) (result externref))
	(func $fxaustop (export "fxaustop") (import "main" "fxaustop" ) (param externref) (result externref))
	(func $fxausetLR (import "main" "fxausetLR" ) (param externref i32 f32 f32) (result externref))
	
	(func $envad (export "envad") (import "main" "envad" ) (param externref))
	(func $envauplay (export "envauplay") (import "main" "envauplay"))
	(func $envaupause (export "envaupause") (import "main" "envaupause"))
	(func $envausetLR (import "main" "envausetLR") (param i32 f32 f32))
	(func $envausetTime (export "envausetTime") (import "main" "envausetTime") (param f32))
	(func $envaugetTime (export "envaugetTime") (import "main" "envaugetTime") (result f32))
	(func $envausetSpeed (export "envausetSpeed") (import "main" "envausetSpeed") (param f32))
	(func $envaugetSpeed (export "envaugetSpeed") (import "main" "envaugetSpeed") (result f32))
	(func $envaucount (export "envaucount") (import "main" "envaucount") (result i32))
	
	(global $str_contladang (import "myStrings" "env_ladang_array") externref)
	
	(global $str_contlari (import "myStrings" "contlari") externref)
	(global $str_contserang (import "myStrings" "contserang") externref)
	(global $str_conthit (import "myStrings" "conthit") externref)
	
	(global $str_contmonyet0 (import "myStrings" "contmonyet0") externref)
	(global $str_contmonyet1 (import "myStrings" "contmonyet1") externref)
	(global $str_contkejang (import "myStrings" "contkejang") externref)
	
	(global $str_contretak (import "myStrings" "contretak") externref)

	(func $getreso (import "main" "getreso") (param externref) (result externref))

;;chara0
(func $soundfx_lari (export "soundfx_lari") (result externref)
	global.get $str_contlari
	call $fxauplay
)
(func $soundfx_serang (export "soundfx_serang") (result externref)
	global.get $str_contserang
	call $fxauplay
)
(func $soundfx_hit (export "soundfx_hit") (result externref)
	global.get $str_conthit
	call $fxauplay
)



;;monyet
(func $soundfx_monyet0 (export "soundfx_monyet0") (result externref)
	global.get $str_contmonyet0
	call $fxauplay
)
(func $soundfx_monyet1 (export "soundfx_monyet1") (result externref)
	global.get $str_contmonyet1
	call $fxauplay
)
(func $soundfx_kejang (export "soundfx_kejang") (result externref)
	global.get $str_contkejang
	call $fxauplay
)



;;env
(func $soundfx_retak (export "soundfx_retak") (result externref)
	global.get $str_contretak
	call $fxauplay
)

(func $contladang (export "contladang") (result externref)
	global.get $str_contladang
	call $getreso
)

(func (export "fxsetpos")
	(param $cont externref) (param $x f32) (param $y f32) (param $z f32) (param $r f32) (param $i i32)
	(result externref)
	
		local.get $cont
		local.get $i
			local.get $x
			local.get $y
			local.get $z
			local.get $r
		call $setLR
	call $fxausetLR
)

(func (export "envsetpos")
	(param $x f32) (param $y f32) (param $z f32) (param $r f32) (param $i i32)
	
		local.get $i
			local.get $x
			local.get $y
			local.get $z
			local.get $r
		call $setLR
	call $envausetLR
)

(func $setLR
	(param $x f32) (param $y f32) (param $z f32) (param $r f32)
	(result f32 f32)
	(local $xn f32) (local $yn f32) (local $zn f32) (local $L f32) (local $R f32)

	;; normalize
		local.get $x
		local.get $r
	f32.div
	local.set $xn

		local.get $y
		local.get $r
	f32.div
	local.set $yn

		local.get $z
		local.get $r
	f32.div
	local.set $zn

	;; L = 1 / (distSq3(x,y,z,-1,0,0) + 1)
		f32.const 1
			f32.const 1
				local.get $xn
				local.get $yn
				local.get $zn
				f32.const -1
				f32.const 0
				f32.const 0
			call $distSq3
		f32.add
	f32.div
	local.set $L

	;; R = 1 / (distSq3(x,y,z, 1,0,0) + 1)
		f32.const 1
			f32.const 1
				local.get $xn
				local.get $yn
				local.get $zn
				f32.const 1
				f32.const 0
				f32.const 0
			call $distSq3
		f32.add
	f32.div
	local.set $R

	;; envausetLR(i, L, R)
		local.get $L
		local.get $R
)

(func $distSq3
	(param $x f32) (param $y f32) (param $z f32)
	(param $ax f32) (param $ay f32) (param $az f32)
	(result f32)

		;; (x-ax)^2
			local.get $x
			local.get $ax
		f32.sub
			local.get $x
			local.get $ax
		f32.sub
	f32.mul

		;; (y-ay)^2
			local.get $y
			local.get $ay
		f32.sub
			local.get $y
			local.get $ay
		f32.sub
	f32.mul
	f32.add

		;; (z-az)^2
			local.get $z
			local.get $az
		f32.sub
			local.get $z
			local.get $az
		f32.sub
	f32.mul
	f32.add
)


)
