attribute vec4 a_position;
attribute vec2 a_texCoord;
attribute vec4 a_color;

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

// alpha 坐标
varying vec2 v_alphaCoord;

void main()
{
    // 必须用CC_PMatrix，如果换用CC_MVPMatrix，最终显示将由错位
    gl_Position = CC_PMatrix * a_position;
    v_fragmentColor = a_color;
    
    v_texCoord = a_texCoord * vec2(1.0, 1.0);
    v_alphaCoord = v_texCoord + vec2(0.0, 0.5);
}