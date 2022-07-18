// VERTEX SHADER

struct VOutput{   
    [[location(0)]] v_color: vec4<f32>;
    [[builtin(position)]] position: vec4<f32>;
};

[[stage(vertex)]]
fn vs_main(
    [[builtin(vertex_index)]] in_vertex_index: u32) -> VOutput {    
    var pos = array<vec2<f32>,3>(  // vertices of our color triangle 
        vec2<f32>(0.0, 0.5),       // vec2 is a 2 dimensional vector
        vec2<f32>(-0.5,-0.5),
        vec2<f32>(0.5,-0.5)
    );
    var color = array<vec3<f32>,3>(  // (R,G,B) color for each of the vertices
        vec3<f32>(1.0, 0.0, 0.0),    // here vec3 is a 3 dimensional vector
        vec3<f32>(0.0, 1.0, 0.0),
        vec3<f32>(0.0, 0.0, 1.0)
    );

    var out: VOutput;
    out.position = vec4<f32>(pos[in_vertex_index], 0.0, 1.0); // wgpu api only accepts 4 dimensional vector
    out.v_color = vec4<f32>(color[in_vertex_index], 1.0);     // so we are making both our position and color 4 dimensional
    return out;
}

// FRAGMENT SHADER

[[stage(fragment)]]
fn fs_main(in: VOutput) -> [[location(0)]] vec4<f32> {
    return in.v_color;  // color that it took from vertex shader
}