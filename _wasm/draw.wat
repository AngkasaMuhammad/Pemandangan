
(module
	
	;;warna Language: Notepad++ ==>> Ada
	;;(global $str (import "myStrings" "") externref)

;;my info
(import "memory" "myinfo0mem" (memory $myinfo0mem 1))
(global $strmyinfo0mem (import "myStrings" "myinfo0mem") externref)
(table $table0 (import "table" "wasmtable0") 2 funcref)
(global $strpersp (import "myStrings" "persp_array") externref)
(global $strcampos (import "myStrings" "campos_array") externref)
(global $strenvtime (import "myStrings" "envtime_array") externref)
(global $strchara0pos (import "myStrings" "chara0pos_array") externref)
(global $chara0time_offset (import "global" "chara0time_offset") (mut i32))
;;(global $strmonyetinfo (import "myStrings" "monyetinfo_array") externref)
(global $strmonyetstruct (import "myStrings" "monyetstruct") externref)

(global $strmyinfo0uni (import "myStrings" "myinfo0uni") externref)
(global $myinfo0uni_length (import "global" "myinfo0uni_length") (mut i32))
(global $strmyinfo0sto (import "myStrings" "myinfo0sto") externref)
(global $myinfo0sto_offset (import "global" "myinfo0sto_offset") (mut i32))
(global $myinfo0sto_length (import "global" "myinfo0sto_length") (mut i32))
(global $strmyinfo0bind (import "myStrings" "myinfo0bind") externref)

	(import "main" "lihat" (func $lih (param externref)))
(elem (i32.const 0) $lih)
	(import "main" "getreso" (func $getreso (param externref) (result externref)))
	(import "main" "wb" (func $wb (param externref i32 externref i32 i32)))
	(func $rct (export "resize_canvas")(import "main" "rct")(param i32 i32)(result externref))
	
	(import "main" "cce" (func $cce (param externref))) ;;createCommandEncoder
		(import "main" "brp" (func $brp (param externref))) ;;beginRenderPass
			(import "main" "sp" (func $sp (param externref))) ;;setPipeline
			(import "main" "svb" (func $svb (param i32 externref i32 i32))) ;;setVertexBuffer
			(import "main" "sib" (func $sib (param externref externref i32 i32))) ;;setIndexBuffer
			(import "main" "sbg" (func $sbg (param i32 externref))) ;;setBindGroup
			(import "main" "draw" (func $draw (param i32 i32 i32 i32))) ;;draw
			(import "main" "di" (func $di (param externref i32))) ;;drawIndirect
			(import "main" "dii" (func $dii (param externref i32))) ;;drawIndexedIndirect
			(import "main" "end" (func $end)) ;;end
		(import "main" "cttt" (func $cttt (param externref externref))) ;;
		(import "main" "finish" (func $finish)) ;;finish
	(import "main" "submit" (func $submit (result externref))) ;;submit

;;chara0info
(global $berdiristart (import "global" "berdiristart") (mut f32))
(global $berdiriend (import "global" "berdiriend") (mut f32))
(global $laristart (import "global" "laristart") (mut f32))
(global $lariend (import "global" "lariend") (mut f32))
(global $serangstart (import "global" "serangstart") (mut f32))
(global $serangend (import "global" "serangend") (mut f32))

(global $indrberdiri (import "global" "indrberdiri") (mut i32))
(global $indrlari (import "global" "indrlari") (mut i32))
(global $indrserang (import "global" "indrserang") (mut i32))
(global $chara0bonebytelen (import "global" "chara0bonebytelen") (mut i32))



;;monyet
(global $monyetcount_offset (import "global" "monyetcount_offset")  (mut i32))


	;;(global $str (import "myStrings" "") externref)


(global $strsamplerbind (import "myStrings" "samplerbind") externref)
	
	;;enco0
	(global $strenco0 (import "myStrings" "enco0") externref)
		(global $strcamindr (import "myStrings" "camindr") externref)
		(global $strtanahindr (import "myStrings" "tanahindr") externref)
		(global $strchara0indr (import "myStrings" "chara0indr") externref)
		(global $strbungaindr (import "myStrings" "bungaindr") externref)
		(global $strbatangindr (import "myStrings" "batangindr") externref)
		(global $strdaunindr (import "myStrings" "daunindr") externref)
		(global $strrumputindr (import "myStrings" "rumputindr") externref)
		(global $strmonyetindr (import "myStrings" "monyetindr") externref)
		
		;;ani
		(global $stranirp (import "myStrings" "ani rp") externref)
			(global $str_bufkosong (import "myStrings" "_bufkosong") externref)
			(global $struint16 (import "myStrings" "uint16") externref)
			(global $strANIpipe (import "myStrings" "ANIpipe") externref)
			
			;;chara0
				(global $strchara0aniberdiri (import "myStrings" "chara0aniberdiri") externref)
				(global $strchara0anilari (import "myStrings" "chara0anilari") externref)
				(global $strchara0aniserang (import "myStrings" "chara0aniserang") externref)
			(global $strchara0anibind (import "myStrings" "chara0 anibind") externref)
		
		;;arm
		(global $strarmrp (import "myStrings" "arm rp") externref)
			(global $strarmpipe (import "myStrings" "armpipe") externref)
			
			;;chara0
			(global $strchara0armbind (import "myStrings" "chara0 armbind") externref)
		
		;;mesh
		(global $strmeshrp (import "myStrings" "mesh rp") externref)
			
			;;tanah
			(global $strtanahpipe (import "myStrings" "tanahpipe") externref)
			(global $strtanahv (import "myStrings" "tanahv") externref)
			(global $strtanahi (import "myStrings" "tanahi") externref)
			(global $strtanahbind (import "myStrings" "tanahbind") externref)
			
			;;chara0
			(global $strchara0pipe (import "myStrings" "chara0pipe") externref)
			(global $strchara0v (import "myStrings" "chara0v") externref)
			(global $strchara0i (import "myStrings" "chara0i") externref)
			(global $strchara0bind (import "myStrings" "chara0bind") externref)
			
			;;bunga
			(global $strbungapipe (import "myStrings" "bungapipe") externref)
			(global $strbungav (import "myStrings" "bungav") externref)
			(global $strbungainst (import "myStrings" "bungainst") externref)
			(global $strbungai (import "myStrings" "bungai") externref)
			(global $strbungabind (import "myStrings" "bungabind") externref)
			
			;;batang
			(global $strbatangpipe (import "myStrings" "batangpipe") externref)
			(global $strbatangv (import "myStrings" "batangv") externref)
			(global $strbatangi (import "myStrings" "batangi") externref)
			(global $strbatangbind (import "myStrings" "batangbind") externref)
			
			;;daun
			(global $strdaunpipe (import "myStrings" "daunpipe") externref)
			(global $strdaunv (import "myStrings" "daunv") externref)
			(global $strdauninst (import "myStrings" "dauninst") externref)
			(global $strdauni (import "myStrings" "dauni") externref)
			(global $strdaunbind (import "myStrings" "daunbind") externref)
			
			;;rumput
			(global $strrumputpipe (import "myStrings" "rumputpipe") externref)
			(global $strrumputv (import "myStrings" "rumputv") externref)
			(global $strrumputi (import "myStrings" "rumputi") externref)
			(global $strrumputbind (import "myStrings" "rumputbind") externref)
			
			;;monyet
			(global $strmonyetpipe (import "myStrings" "monyetpipe") externref)
			(global $strmonyetv (import "myStrings" "monyetv") externref)
			(global $strmonyeti (import "myStrings" "monyeti") externref)
			(global $strmonyetbind (import "myStrings" "monyetbind") externref)
			
		;;fx
		(global $strfxretakrp (import "myStrings" "fxretak rp") externref)
			(global $strfxretakpipe (import "myStrings" "fxretakpipe") externref)
			(global $strfxretakbind (import "myStrings" "fxretakbind") externref)

	;;copy (canvas) to fxtex
	(global $strcontext (import "myStrings" "(context)") externref)
	(global $strfxtex (import "myStrings" "fxtex") externref)



;;audio
;;(global $straucon2 (import "myStrings" "aucon2") externref)



;;info lain
(;========
  (import "myStrings" "halo\nsemua" (global $str0 externref))
  (export "str0" (global $str0))
--------;)

;;(global $angka0 (export "cobaangka0") (mut i32) (i32.const 55))

;;chara0 pilih ani
(global $strpilihchara0ani (mut externref) (ref.null extern))
;;(global $i32pilihchara0ani (mut i32) (i32.const 1)) ;;SEGERA DIHAPUS
(global $indrbyteoffset (mut i32) (i32.const 1))

	;;audio
(;========
	(global $aucon2belumplay (mut i32) (i32.const 1))
	(global $aucon2belumstop (mut i32) (i32.const 1))
--------;)
	
	;;
	(global $t (mut f32) (f32.const 0.))
	;;(global $aucon (mut externref) (ref.null extern))

(func $inittt
	
		f32.const 0.0
	call $fberdiri
	call $drawobj
	drop
)
(start $inittt)

	(func $drawobj (export "draw") (result externref)
		
		i32.const 128 f32.load $myinfo0mem ;;(2*16)*4
		global.set $t
		
		;;call $chara0updpos
;;`````````````````````````|
		call $enco_enco0
;;_________________________|
		
		call $fmyinfo0
		;;call $cobagantiaucon
		call $submit
	)

(func $fmyinfo0
	;;uni
		global.get $strmyinfo0uni
		i32.const 0
		global.get $strmyinfo0mem
		i32.const 0
		global.get $myinfo0uni_length
	call $wb
	;;sto
		global.get $strmyinfo0sto
		i32.const 0
		global.get $strmyinfo0mem
		global.get $myinfo0sto_offset
		global.get $myinfo0sto_length
	call $wb
)

(;========
(func $cobagantiaucon
	
		f32.const 5.
		global.get $t
	f32.lt
	if
		global.get $straucon0
		call $envab
	end
)
--------;)

(func $persp (export "persp") (result externref)
	global.get $strpersp
	call $getreso
)



(func $cam_transform (export "cam_transform") (result externref)
	global.get $strcampos
	call $getreso
)



(func $envtime (export "envtime") (result externref)
	global.get $strenvtime
	call $getreso
)



(func $monyetstruct (export "monyetstruct") (result externref)
	global.get $strmonyetstruct
	call $getreso
)

(func $monyet_count (export "monyet_count") (param $c i32)
		global.get $monyetcount_offset
		local.get $c
	i32.store $myinfo0mem
		global.get $strmonyetindr
		i32.const 4
		global.get $strmyinfo0mem
		global.get $monyetcount_offset
		i32.const 4 ;;1*4byte
	call $wb
)

	(func $enco_enco0
		;;enco0 +++++++++++++++++++
		global.get $strenco0
		call $cce
		
;;`````````````````````````|
		call $rp_enco0ani
		call $rp_enco0arm
		call $rp_enco0mesh
			global.get $strfxtex
			global.get $strcontext
		call $cttt
		call $rp_enco0fxretak
;;_________________________|
		
		call $finish
	)

	(func $rp_enco0ani
		;;ani +++++++++++++++++++
		global.get $stranirp
		call $brp
		
			global.get $strANIpipe
			call $sp
			
			i32.const 1
			global.get $strmyinfo0bind
			call $sbg
			
;;`````````````````````````|
				global.get $strpilihchara0ani
				global.get $strchara0anibind
				global.get $strchara0indr
				global.get $indrbyteoffset
				global.get $chara0bonebytelen
			call $enco0ani...
;;_________________________|
		
		call $end
	)

	(func $enco0ani...
		(param $str...ani externref)
		(param $str...anibind externref)
		(param $str...indr externref)
		(param $indoff i32) ;;indirect offset
		(param $bonelen i32) ;;jumlah bones
		
		(local $i i32)
		
		i32.const 0
		local.get $str...ani
		i32.const 0
		i32.const -333 ;;omitted
		call $svb
		
		i32.const 1
		local.get $str...ani
		i32.const 68
		i32.const -333 ;;omitted
		call $svb
		
		i32.const 2
		local.get $str...ani
		i32.const 136
		i32.const -333 ;;omitted
		call $svb
		
		i32.const 0
		local.get $str...anibind
		call $sbg
		
		i32.const 0 local.set $i
		(loop $lp
			local.get $str...indr
					local.get $i
					local.get $indoff
				i32.add
			call $di
			
				local.get $i
				i32.const 20
			i32.add
			
				local.tee $i
				local.get $bonelen
			i32.lt_s
			br_if $lp
		)
	)

(func $chara0pos (export "chara0pos") (result externref)
	global.get $strchara0pos
	call $getreso
)
(;=======
(func $monyetinfo (export "monyetinfo") (result externref)
	global.get $strmonyetinfo
	call $getreso
)
--------;)

(func $fberdiri (export "ani_berdiri")
	(param $t f32)
	
	global.get $strchara0aniberdiri global.set $strpilihchara0ani
	;;i32.const 0 global.set $i32pilihchara0ani ;;SEGERA DIHAPUS
	global.get $indrberdiri global.set $indrbyteoffset
		global.get $berdiristart
		local.get $t
		global.get $berdiriend
		global.get $chara0time_offset
	call $anitime
)

(func $flari (export "ani_lari")
	(param $t f32)
	
	global.get $strchara0anilari global.set $strpilihchara0ani
	;;i32.const 1 global.set $i32pilihchara0ani ;;SEGERA DIHAPUS
	global.get $indrlari global.set $indrbyteoffset
		global.get $laristart
		local.get $t
		global.get $lariend
		global.get $chara0time_offset
	call $anitime
)

(func $fserang (export "ani_serang")
	(param $t f32)
	
	global.get $strchara0aniserang global.set $strpilihchara0ani
	;;i32.const 2 global.set $i32pilihchara0ani ;;SEGERA DIHAPUS
	global.get $indrserang global.set $indrbyteoffset
		global.get $serangstart
		local.get $t
		global.get $serangend
		global.get $chara0time_offset
	call $anitime
)

(func $anitime
	(param $t0 f32)
	(param $t f32)
	(param $t1 f32)
	(param $offset i32) ;;byte
	
;;batas time ani
;;value masuk ke wasm dulu
		;;i32.const 24 ;;6*4
		local.get $offset
			
			local.get $t0
			local.get $t
			local.get $t1
			
		call $batas
	f32.store $myinfo0mem
)

;;https://chatgpt.com/share/69789b9b-1c0c-8011-aeab-4e91e0672f19

(func $batas
  (param $min f32)
  (param $val f32)
  (param $max f32)
  (result f32)

  (local $range f32)
  (local $k f32)

  ;; range = max - min
  local.get $max
  local.get $min
  f32.sub
  local.set $range

  ;; k = floor((val - min) / range)
  local.get $val
  local.get $min
  f32.sub
  local.get $range
  f32.div
  f32.floor
  local.set $k

  ;; result = val - range * k
  local.get $val
  local.get $range
  local.get $k
  f32.mul
  f32.sub
)


(func $f32_mod
	(param $t f32)
	(param $d f32)
	(result f32)

	local.get $t
	local.get $t
	local.get $d
	f32.div
	f32.trunc
	local.get $d
	f32.mul
	f32.sub
)

	(func $rp_enco0arm
		;;arm +++++++++++++++++++
		global.get $strarmrp
		call $brp
			
			global.get $strarmpipe
			call $sp
			
			i32.const 0
			global.get $str_bufkosong
			i32.const 0
			i32.const -333 ;;omitted
			call $svb
			
			i32.const 1
			global.get $str_bufkosong
			i32.const 0
			i32.const -333 ;;omitted
			call $svb
			
;;`````````````````````````|
			call $draw_enco0armchara0
;;_________________________|
			
		call $end
	)

	(func $draw_enco0armchara0
		;;chara0 +++++++++++++++++++
		i32.const 0
		global.get $strchara0armbind
		call $sbg
		
		global.get $strchara0indr
		i32.const 20
		call $di
	)

	(func $rp_enco0mesh
		;;mesh +++++++++++++++++++
		global.get $strmeshrp
		call $brp
			
			i32.const 1
			global.get $str_bufkosong
			i32.const 0
			i32.const -333 ;;omitted
			call $svb
		
			i32.const 1
			global.get $strmyinfo0bind
			call $sbg
			
;;`````````````````````````|
			call $draw_enco0meshtanah
			call $draw_enco0meshchara0
			call $draw_enco0meshbunga
			call $draw_enco0meshbatang
			;;call $draw_enco0meshdaun ASLI
			call $draw_enco0meshrumput
			call $draw_enco0meshmonyet
			call $draw_enco0meshdaun ;;BARU
;;_________________________|
			
		call $end
	)

	(func $draw_enco0meshtanah
		;;tanah +++++++++++++++++++
		global.get $strtanahpipe
		call $sp
		
		i32.const 0
		global.get $strtanahv
		i32.const 0
		i32.const -333 ;;omitted
		call $svb
		
		global.get $strtanahi
		global.get $struint16
		i32.const 0
		i32.const -333 ;;omitted
		call $sib
		
		i32.const 0
		global.get $strtanahbind
		call $sbg
		
		global.get $strtanahindr
		i32.const 0
		call $dii
	)

	(func $draw_enco0meshchara0
		;;chara0 +++++++++++++++++++
		global.get $strchara0pipe
		call $sp
		
		i32.const 0
		global.get $strchara0v
		i32.const 0
		i32.const -333 ;;omitted
		call $svb
		
		global.get $strchara0i
		global.get $struint16
		i32.const 0
		i32.const -333 ;;omitted
		call $sib
		
		i32.const 0
		global.get $strchara0bind
		call $sbg
		
		global.get $strchara0indr
		i32.const 0
		call $dii
	)

	(func $draw_enco0meshbunga
		;;bunga +++++++++++++++++++
		global.get $strbungapipe
		call $sp
		
		i32.const 0
		global.get $strbungav
		i32.const 0
		i32.const -333 ;;omitted
		call $svb
		
		i32.const 1
		global.get $strbungainst
		i32.const 0
		i32.const -333 ;;omitted
		call $svb
		
		global.get $strbungai
		global.get $struint16
		i32.const 0
		i32.const -333 ;;omitted
		call $sib
		
		i32.const 0
		global.get $strbungabind
		call $sbg
		
		global.get $strbungaindr
		i32.const 0
		call $dii
	)

	(func $draw_enco0meshbatang
		;;batang +++++++++++++++++++
		global.get $strbatangpipe
		call $sp
		
		i32.const 0
		global.get $strbatangv
		i32.const 0
		i32.const -333 ;;omitted
		call $svb
		
		global.get $strbatangi
		global.get $struint16
		i32.const 0
		i32.const -333 ;;omitted
		call $sib
		
		i32.const 0
		global.get $strbatangbind
		call $sbg
		
		global.get $strbatangindr
		i32.const 0
		call $dii
	)

	(func $draw_enco0meshdaun
		;;daun +++++++++++++++++++
		global.get $strdaunpipe
		call $sp
		
		i32.const 0
		global.get $strdaunv
		i32.const 0
		i32.const -333 ;;omitted
		call $svb
		
		i32.const 1
		global.get $strdauninst
		i32.const 0
		i32.const -333 ;;omitted
		call $svb
		
		global.get $strdauni
		global.get $struint16
		i32.const 0
		i32.const -333 ;;omitted
		call $sib
		
		i32.const 0
		global.get $strdaunbind
		call $sbg
		
		global.get $strdaunindr
		i32.const 0
		call $dii
	)

	(func $draw_enco0meshrumput
		;;rumput +++++++++++++++++++
		
		i32.const 0
		global.get $strrumputv
		i32.const 0
		i32.const -333 ;;omitted
		call $svb
		
		global.get $strrumputi
		global.get $struint16
		i32.const 0
		i32.const -333 ;;omitted
		call $sib
		
		i32.const 0
		global.get $strrumputbind
		call $sbg
		
		global.get $strrumputpipe
		call $sp
		global.get $strrumputindr
		i32.const 0
		call $dii
	)

	(func $draw_enco0meshmonyet
		;;rumput +++++++++++++++++++
		
		i32.const 0
		global.get $strmonyetv
		i32.const 0
		i32.const -333 ;;omitted
		call $svb
		
		global.get $strmonyeti
		global.get $struint16
		i32.const 0
		i32.const -333 ;;omitted
		call $sib
		
		i32.const 0
		global.get $strmonyetbind
		call $sbg
		
		global.get $strmonyetpipe
		call $sp
		global.get $strmonyetindr
		i32.const 0
		call $dii
	)

	(func $rp_enco0fxretak
		global.get $strfxretakrp
		call $brp
			
			i32.const 1
			global.get $str_bufkosong
			i32.const 0
			i32.const -333 ;;omitted
			call $svb
			
			call $draw_fxretak
			
		call $end
	)

	(func $draw_fxretak
		
		global.get $strfxretakpipe
		call $sp
		
		i32.const 0
		global.get $str_bufkosong
		i32.const 0
		i32.const -333 ;;omitted
		call $svb
		
		i32.const 0
		global.get $strfxretakbind
		call $sbg
		
		i32.const 1
		global.get $strmyinfo0bind
		call $sbg
		
		i32.const 99 ;;33*3vertex
		i32.const 1
		i32.const 0
		i32.const 0
		call $draw
			
	)

;;=+=+=+=+=+=+=+=+=+=+=+=+=
)
