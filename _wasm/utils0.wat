
(module

(;
	(import "main" "getreso" (func $getreso (param externref) (result externref)))
(export "getreso" (func $getreso))
	
	(global $strmyinfo0offsetinfo (import "myStrings" "myinfo0offsetinfo") externref)
;)
	(import "table" "wasmtable0" (table 2 funcref))
	(global $strkerennn (import "myStrings" "kerennn") externref)
(func $mypersp (export "mypersp")
  (param $fovy f32)
  (param $width f32)
  (param $height f32)
  (param $znear f32)
  (param $zfar f32)

  (result 
    f32 f32 f32 f32
    f32 f32 f32 f32
    f32 f32 f32 f32
    f32 f32 f32 f32
  )

  ;; locals
  (local $aspect f32)
  (local $x f32)
  (local $x2 f32)
  (local $x3 f32)
  (local $x5 f32)
  (local $tanv f32)
  (local $f f32)
  (local $n f32)
  (local $f2 f32)
  (local $den f32)
  (local $zp f32)

  ;; aspect = width/height
  local.get $width
  local.get $height
  f32.div
  local.set $aspect

  ;; x = fovy * 0.5
  local.get $fovy
  f32.const 0.5
  f32.mul
  local.set $x

  ;; x²
  local.get $x
  local.get $x
  f32.mul
  local.set $x2

  ;; x³
  local.get $x2
  local.get $x
  f32.mul
  local.set $x3

  ;; x⁵
  local.get $x3
  local.get $x2
  f32.mul
  local.set $x5

  ;; tan(x) ≈ x + 1/3 x³ + 2/15 x⁵
  local.get $x
  local.get $x3
  f32.const 0.3333333333
  f32.mul
  f32.add
  local.get $x5
  f32.const 0.1333333333
  f32.mul
  f32.add
  local.set $tanv

  ;; f = 1/tan(x)
  f32.const 1
  local.get $tanv
  f32.div
  local.set $f

  ;; n = zNear
  local.get $znear
  local.set $n

  ;; f2 = zFar
  local.get $zfar
  local.set $f2

  ;; den = zfar - znear
  local.get $f2
  local.get $n
  f32.sub
  local.set $den

  ;; zp = zNear*zFar/(zFar-zNear)
  local.get $n
  local.get $f2
  f32.mul
  local.get $den
  f32.div
  local.set $zp


  ;; ------------------------
  ;; return 16-float matrix
  ;; ------------------------

  ;; row 0
  local.get $f
  local.get $aspect
  f32.div     ;; m00 = f/aspect
  f32.const 0 ;; m01
  f32.const 0 ;; m02
  f32.const 0 ;; m03

  ;; row 1
  f32.const 0 ;; m10
  local.get $f ;; m11
  f32.const 0 ;; m12
  f32.const 0 ;; m13

  ;; row 2
  f32.const 0  ;; m20
  f32.const 0  ;; m21
  f32.const 0  ;; m22
  f32.const -1 ;; m23

  ;; row 3
  f32.const 0 ;; m30
  f32.const 0 ;; m31
  local.get $zp ;; m32 = ≈ 0.01
  f32.const 0 ;; m33
)

(;========
(func $fmyinfo0offsetinfo (export "fmyinfo0offsetinfo") (result externref)
	global.get $strmyinfo0offsetinfo
	call $getreso
)
--------;)

(func $tesss (export "tesss")
	global.get $strkerennn
	i32.const 0
	call_indirect (param externref)
)

)
