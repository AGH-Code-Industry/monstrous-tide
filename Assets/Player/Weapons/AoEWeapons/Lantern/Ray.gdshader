shader_type canvas_item;

void fragment() {
    float time = TIME;
    
    vec2 uv = (UV - vec2(0.5)) * vec2(2.0);
    float dist = length(uv);
    float angle = atan(uv.y, uv.x);
    
    float opacity = sin(angle * 5.0 + time) * 0.5 + 0.5;
    
    opacity *= smoothstep(0.0, 1.0, 1.0 - dist);
    
    COLOR = vec4(1, 0.992, 0.588, opacity);
}