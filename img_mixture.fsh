//precision lowp float;

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

varying vec2 v_alphaCoord;

void main()
{
    vec4 v4Color = texture2D(CC_Texture0,v_texCoord);
    v4Color.a = texture2D(CC_Texture0,v_alphaCoord).r;
    v4Color.xyz = v4Color.xyz * v4Color.a;
    gl_FragColor = v4Color * v_fragmentColor;
    
//    gl_FragColor = vec4(texture2D(CC_Texture0, vec2(v_texCoord.x, v_texCoord.y)).rgb,texture2D(CC_Texture0, vec2(v_texCoord.x, v_texCoord.y - 0.5)).r);

}
