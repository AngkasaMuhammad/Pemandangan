
(module

  ;; import memory from JS
  (memory (import "memory" "myinfo0mem") 1)

(;========
1 mat persp
	.9, //fov (rad)
	canv3d.width,//aspect ratio
	canv3d.height, //aspect ratio
	.01, //zNear
	Number.MAX_SAFE_INTEGER, //zFar
1 mat cam pos
	let mycampos0 = m4.identity()
	m4.rotateY(mycampos0,.5,mycampos0,)
	m4.rotateX(mycampos0,-.3,mycampos0,)
	m4.translate(mycampos0,[0,0,22,],mycampos0,)
	m4.invert(mycampos0,mycampos0out,)
--------;)

  ;; initialize imported memory at offset 0
  (data (memory 0) (i32.const 0)
    ;; --- first 16 floats ---
    "\9a\6f\b9\3f" ;;  1.4497694969177246
    "\00\00\00\00" ;;  0
    "\00\00\00\00"
    "\00\00\00\00"

    "\00\00\00\00"
    "\8a\8e\04\40" ;;  2.071099281311035
    "\00\00\00\00"
    "\00\00\00\00"

    "\00\00\00\00"
    "\00\00\00\00"
    "\00\00\00\00"
    "\00\00\80\bf" ;; -1

    "\00\00\00\00"
    "\00\00\00\00"
    "\0a\d7\23\3c" ;;  0.009999999776482582
    "\00\00\00\00"

    ;; --- second 16 floats ---
    "\04\17\60\3f" ;;  0.8775825500488281
    "\4a\0f\11\be" ;; -0.14167994260787964
    "\9d\fa\ea\3e" ;;  0.4580127000808716
    "\00\00\00\00"

    "\5f\34\93\2f" ;;  1.0829381835719687e-9
    "\2c\7d\74\3f" ;;  0.9553364515304565
    "\f4\fd\97\3e" ;;  0.29552021622657776
    "\00\00\00\80" ;; -0

    "\8f\c2\f5\be" ;; -0.4794255495071411
    "\93\2c\84\be" ;; -0.25934338569641113
    "\8e\0f\56\3f" ;;  0.838386595249176
    "\00\00\00\00"

    "\6b\49\c7\31" ;;  2.324409997811472e-8
    "\52\0c\a1\b5" ;; -3.015528022842773e-7
    "\00\00\b0\c1" ;; -22
    "\00\00\80\3f" ;;  1
  )

)
