#version 300 es

precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

void main() {
	vec4 pixColor = texture(tex, v_texcoord);
	float gray = 0.0;

	// Get gray with luminosity and hdr
	// https://en.wikipedia.org/wiki/Grayscale#Luma_coding_in_video_systems
	gray = dot(pixColor.rgb, vec3(0.2627, 0.6780, 0.0593));

	fragColor = vec4(vec3(gray), pixColor.a);
}
