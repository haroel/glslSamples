// Shader from http://www.iquilezles.org/apps/shadertoy/
#ifdef GL_ES 
precision mediump float; 
#endif 
uniform sampler2D u_texture; 
varying vec2 v_texCoord;
varying vec4 v_fragmentColor;

void main(void) 
{ 
    vec4 col = texture2D(CC_Texture0, v_texCoord); 
    col.r=(1.0 - col.r) * 0.75 ;
    col.g=(1.0 - col.g) * 0.75 ;
    col.b=(1.0 - col.b) * 0.75 ;
    gl_FragColor =v_fragmentColor* col ;
}