// Shader from http://www.iquilezles.org/apps/shadertoy/
#ifdef GL_ES 
precision mediump float; 
#endif 
varying vec2 v_texCoord;
varying vec4 v_fragmentColor;

void main(void) 
{ 
    // Convert to greyscale using NTSC weightings 
    vec4 col = texture2D(CC_Texture0, v_texCoord); 
    gl_FragColor = v_fragmentColor * vec4(0, 0, 0, col.a);
}