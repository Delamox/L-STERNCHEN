#version 460

layout(location = 0) in vec2 fragCoord;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    float time;
    vec2 resolution;
    int pixelSize;
    float barSize;
    float barStrength;
    float shiftStrength;
    float warp;
    float brightness;
} ubuf;

layout(binding = 1) uniform sampler2D iChannel0;

#define iTime ubuf.time
#define iResolution ubuf.resolution
#define pixelSize ubuf.pixelSize
#define barSize ubuf.barSize


void main() {
    //vars
    vec2 uv = fragCoord.xy / iResolution.xy;
    vec2 center = vec2(0.5, 0.5);
    float time = iTime * 2.0;
    float prop = iResolution.x / iResolution.y;
    vec2 off1 = vec2(1.3846153846) * vec2(0.0,1.0);
    vec2 off2 = vec2(3.2307692308) * vec2(1.0,0.0);
    
    // secondary pixelation
    // TODO: average out pixelisation instead of flooring it
    vec2 wuv = round(round(vec2(1) + (fragCoord.xy + (pixelSize / 2))) / (pixelSize * 0.5)) * (pixelSize * 0.5) / iResolution.xy;
    // vec2 uv = floor(fragCoord / iResolution.xy * pixels) / pixels;
    // vec2 wuv = floor(fragCoord /iResolution.xy * (iResolution.x / pixelSize)) / (iResolution.x / pixelSize);
    // fragColor = vec4(0);    
    // vec2 d = 1.0 / iResolution.xy;
    // vec2 uv = (d.xy * pixelSize)) * floor(fragCoord.xy / pixelSize));
    
	// for (int i = 0; i < PIXEL_SIZE; i++)
	// 	for (int j = 0; j < PIXEL_SIZE; j++)
	// 		fragColor += texture(iChannel0, uv.xy + vec2(d.x * float(i), d.y * float(j)));

	// fragColor /= pow(pixelSize), 2.0); 

    // vec2 wuv = fragCoord.xy / iResolution.xy;

    //barrel warp
    uv = wuv;
    float sz = sqrt(pow(uv.x - center.x, 2) + pow(uv.y - center.y, 2));
    float wsz = sz * (1.0 + ubuf.warp * pow(sz, 2));
    float theta = atan(uv.x - center.x, uv.y - center.y);
    float distx = sin(theta) * wsz * 1.0;
    float disty = cos(theta) * wsz * 1.0;
    uv.x = distx + center.x;
    uv.y = disty + center.y;
    vec4 blur = texture(iChannel0, uv) / 2;
    blur += texture(iChannel0, uv + (off1 / iResolution)) * 0.3162162162;
    blur += texture(iChannel0, uv - (off1 / iResolution)) * 0.3162162162;
    blur += texture(iChannel0, uv + (off2 / iResolution)) * 0.0702702703;
    blur += texture(iChannel0, uv - (off2 / iResolution)) * 0.0702702703;
    fragColor.rba = blur.rba;

    //bigger barrel with green channel for abberation effect
    uv = wuv;
    sz = sqrt(pow(uv.x - center.x, 2) + pow(uv.y - center.y, 2));
    wsz = sz * (1.0 + ubuf.warp * 0.9 * pow(sz, 2));
    theta = atan(uv.x - center.x, uv.y - center.y);
    distx = sin(theta) * wsz * 1.0;
    disty = cos(theta) * wsz * 1.0;
    uv.x = distx + center.x;
    uv.y = disty + center.y;
    blur = texture(iChannel0, uv) / 2;
    blur += texture(iChannel0, uv + (off1 / iResolution)) * 0.3162162162;
    blur += texture(iChannel0, uv - (off1 / iResolution)) * 0.3162162162;
    blur += texture(iChannel0, uv + (off2 / iResolution)) * 0.0702702703;
    blur += texture(iChannel0, uv - (off2 / iResolution)) * 0.0702702703;
    fragColor.g = blur.g;

    //bars
    float over = floor(mod(uv.y * iResolution.y, 7.0 * (pixelSize/barSize)) / (pixelSize/barSize));
    if(over == 0.0 || over == 1.0) {
        fragColor.rgb *= 1.0 - ubuf.barStrength / 2;
    } else if (over == 2.0 || over == 4.0 || over == 6.0) {
        fragColor.rgb *= 1.0 - ubuf.barStrength;
    }
    //return
    fragColor.rgb = fragColor.rgb * ubuf.brightness;
}
