// WGSL shader code

struct stmyinfo0sto{//sampe sini
	objpos:mat4x4f,
	seek:f32, //chara0time
}


@group(0) @binding(0) var<storage, read_write> locani : array<mat4x4f>;//output locani
@group(0) @binding(5) var<storage> aniinfo:stmyinfo0sto;


@vertex
fn vertexMain(
	
	@builtin(vertex_index) vi:u32,
	@builtin(instance_index) ii:u32,
	
	//
	@location(0) t0: f32,
	//column
	@location(1) c1: vec4f,
	@location(2) c2: vec4f,
	@location(3) c3: vec4f,
	@location(4) c4: vec4f,
	
	//
	@location(5) t1: f32,
	//column
	/*
	@location(6) c5: vec4f,
	@location(7) c6: vec4f,
	@location(8) c7: vec4f,
	@location(9) c8: vec4f,
	
	//
	@location(10) t2: f32,
	//column
	@location(11) c9: vec4f,
	@location(12) c10: vec4f,
	@location(13) c11: vec4f,
	@location(14) c12: vec4f,
	*/
	//input time & locani
	
) -> stout {
	var mout:mat4x4f;//matrix output
	let t = aniinfo.seek;
	let aktif = t0 < t && t < t1;
	
	if(aktif){
		mout = mat4x4f(c1,c2,c3,c4,);
	}
	return stout(
		vec4f(.0,.0,.99,1.,),
		mout[0],mout[1],mout[2],mout[3],
		u32(aktif),
		ii,
	);
}
struct stout{
	@builtin(position) position : vec4f,
	
	//
	@location(1) c1: vec4f,
	@location(2) c2: vec4f,
	@location(3) c3: vec4f,
	@location(4) c4: vec4f,
	
	@location(0) @interpolate(flat) aktif:u32,
	
	@location(5) @interpolate(flat) ii:u32,
}

@fragment
fn fragmentMain(
	out:stout,
) -> @location(0) vec4f {
	
	//let t = myinfo0.seek;
	if(bool(out.aktif)){
		locani[out.ii] = mat4x4f(out.c1,out.c2,out.c3,out.c4,); //ASLI
		
	}
	return vec4f(.001); // Return red color
}





// Define a function to mix (lerp) two 4x4 matrices based on time
/*
fn matmix(
	m0:mat4x4f,
	m1:mat4x4f,
	lerpFactor:f32,
) -> mat4x4f{
    return mat4x4<f32>(
        mix(m0[0], m1[0], lerpFactor),  // Interpolate row 0
        mix(m0[1], m1[1], lerpFactor),  // Interpolate row 1
        mix(m0[2], m1[2], lerpFactor),  // Interpolate row 2
        mix(m0[3], m1[3], lerpFactor)   // Interpolate row 3
    );
}
fn lerfac(
	t0:f32,
	t1:f32,
	t:f32,
)->f32{
	return (t - t0) / (t1 - t0);
}

*/