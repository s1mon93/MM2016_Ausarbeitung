//precision highp float;
uniform mediump vec4 color;
varying highp vec4 v_AmbientAndDiffuseColor;
varying highp vec4 v_SpecularColor;
varying highp float v_AmbientLightBrightness;
varying highp float v_DiffuseBrightness;
varying highp float v_SpecularBrightness;
varying highp vec2 v_TexCoord;
uniform highp vec2 u_maskCenter;
uniform highp float u_maskDiameterSquare;

uniform bool u_TextureEnabled;
uniform sampler2D s_Texture;

highp vec2 centerVec;


void main(void)
{
    centerVec =  gl_FragCoord.xy - u_maskCenter;
    if(dot(centerVec, centerVec) > u_maskDiameterSquare)
        discard;

    if(u_TextureEnabled)
      gl_FragColor = texture2D(s_Texture, v_TexCoord) * (v_AmbientLightBrightness + v_DiffuseBrightness)
              + v_SpecularBrightness * v_SpecularColor;
    else
      gl_FragColor = v_AmbientAndDiffuseColor * (v_AmbientLightBrightness + v_DiffuseBrightness)
                   + v_SpecularBrightness * v_SpecularColor;
}
