//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float sampleSize;
uniform float intensity;

void main()
{
    vec4 sum = vec4(0);
    
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 4.0*sampleSize, v_vTexcoord.y)) * 0.05;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 3.0*sampleSize, v_vTexcoord.y)) * 0.09;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - 2.0*sampleSize, v_vTexcoord.y)) * 0.12;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - sampleSize, v_vTexcoord.y)) * 0.15;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y)) * 0.16;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + sampleSize, v_vTexcoord.y)) * 0.15;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 2.0*sampleSize, v_vTexcoord.y)) * 0.12;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 3.0*sampleSize, v_vTexcoord.y)) * 0.09;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + 4.0*sampleSize, v_vTexcoord.y)) * 0.05;

   // blur in y (vertical)
    // take nine samples, with the distance sampleSize between them
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - 4.0*sampleSize)) * 0.05;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - 3.0*sampleSize)) * 0.09;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - 2.0*sampleSize)) * 0.12;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - sampleSize)) * 0.15;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y)) * 0.16;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + sampleSize)) * 0.15;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + 2.0*sampleSize)) * 0.12;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + 3.0*sampleSize)) * 0.09;
    sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + 4.0*sampleSize)) * 0.05;

    //increase blur with intensity!
    gl_FragColor = sum*intensity + texture2D(gm_BaseTexture, v_vTexcoord); 
}

