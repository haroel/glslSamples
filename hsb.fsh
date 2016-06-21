#ifdef GL_ES
precision mediump float;
#endif

varying vec2 v_texCoord;
varying vec4 v_fragmentColor;

uniform float u_h;
uniform float u_s;
uniform float u_b;

float _hue2rgb(float a, float b, float hue)
{
    hue = mod(hue, 1.0);
    if (6.0 * hue < 1.0) return a + (b - a) * 6.0 * hue;
    if (2.0 * hue < 1.0) return b;
    if (3.0 * hue < 2.0) return a + (b - a) * 6.0 * (2.0/3.0 - hue);
    return a;
}
vec3 hsb2rgb(vec3 hsb)
{
    if (hsb.y == 0.0) return vec3(hsb.z);
    float b = (hsb.z < 0.5)? hsb.z * (1.0 + hsb.y) : (hsb.y + hsb.z) - (hsb.y * hsb.z);
    float a = 2.0 * hsb.z - b;
    return vec3(
                _hue2rgb(a, b, hsb.x + (1.0/3.0)),
                _hue2rgb(a, b, hsb.x),
                _hue2rgb(a, b, hsb.x - (1.0/3.0))
                );
}

vec3 rgb2hsb(vec3 rgb) {
    vec3 hsb = vec3(0.0);
    float a = min(min(rgb.r, rgb.g), rgb.b);
    float b = max(max(rgb.r, rgb.g), rgb.b);
    float c = b - a;
    if (c != 0.0) {
        vec3 d = ((vec3(b) - rgb) / 6.0 + c / 2.0) / c;
        if (rgb.r == b) hsb.x = d.b - d.g;
        else if (rgb.g == b) hsb.x = d.r - d.b + 1.0/3.0;
        else if (rgb.b == b) hsb.x = d.g - d.r + 2.0/3.0;
        hsb.x = mod(hsb.x, 1.0);
        hsb.y = (hsb.z < 0.5)? c / (a+b) : c / (2.0 - c);
    }
    hsb.z = (a+b) / 2.0;
    return hsb;
}
void main ()
{
    vec4 col = texture2D(CC_Texture0, v_texCoord);

    vec3 hsb=rgb2hsb(col.rgb);
    
    hsb.x += u_h;
    hsb.y += u_s;
    hsb.z += u_b;
    vec3 trans_color=hsb2rgb(hsb);

    gl_FragColor = v_fragmentColor * vec4(trans_color.r,trans_color.g,trans_color.b, col.a);
}